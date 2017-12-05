/*  Function: InA_fnc_handleGearDialog

	Description:
		Handles the purchasing of gear items (magazines/weapons/miscitems)

	Syntax:
		_return = [name (, sortBy (, sortOrder))] call InA_fnc_handleGearDialog

			{ name     : string }    Name of the type of the trade dialog to display (One of: "magazines", "weapons" or "miscitems")
			{ sortBy   : string }    (optional) Which data field to sort by, default is name (One of: "name" or "cost")
			{ sortDesc : bool   }    (optional) Sort in descending order. Default is Ascending order.

	Returns:
		Boolean     true on success, false on error

	Example 1: (Show magazines dialog)
		_successful = ["magazines"] call InA_fnc_handleGearDialog

	Example 2: (Show weapons dialog sorted by supply cost in descending order)
		_successful = ["weapons", "cost", true] call InA_fnc_handleGearDialog

	Author:
		[FF7] Bliss

---------- */

// Input Parameterization
// __name           (String)       Dialog Name
// __sortByField    (String)       Sort Column
// __sortDesc       (Bool)         Sort in reverse
//
//      |  Private Name     | Default Value     | Expected Types    | Expected Array Count |
params [[   "__name"         ,""                 ,[""]               ,[]                   ], 
        [   "__sortByField"  ,"name"             ,[""]               ,[]                   ],
        [   "__sortDesc"     ,false              ,[true]             ,[]                   ]];

// Local Declerations
private     _items                 = nil;
private     _faction_name          = nil;
private     _sortedItems           = nil;
private     _sortByTag             = nil;
private     _ctrl_itemContainer    = nil;
private     _ctrl_slider           = nil;
private     _return                = false;

// Update client global value with server global value
[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "baseType"] remoteExec ["publicVariableClient", 2, false];
	
sleep 0.2;

if (isNil "baseType") exitWith {
	[false, "no theme selected, Equipment unavailable."] call InA_fnc_formatHint;
	nil;
};
if (baseType == "") exitWith {
	[false, "no theme selected, Equipment unavailable."] call FF7_fnc_formatHint;
	nil;
};

// - Get Current Faction
_faction_name = [baseType] call Helpers_fnc_getFactionByClassname;

if (__sortDesc) then {
	_sortByTag = "DESCEND";
} else {
	_sortByTag = "ASCEND";
};

//["success"] remoteExec ["hint", 0];

// Get list of available items
switch (__name) do
{
	// Get all faction weapons
    case "weapons":
    {
		_items = [_faction_name, ["gear", "weapons"]] call Helpers_fnc_getFactionProperty;
    };

	// Get all faction magazines
    case "magazines":
    {
		_items = [_faction_name, ["gear", "magazines"]] call Helpers_fnc_getFactionProperty;
    };

	// Get all faction misc items
    case "miscitems":
    {
		_items = [_faction_name, ["gear", "miscitems"]] call Helpers_fnc_getFactionProperty;
    };
};

// SANITY CHECK -- Exit here if necessary
if (isNil "_items") exitWith {
	hint "ERROR #501: Dialog name not recognized.";
	_return
};
if !(__sortByField == "name" or __sortByField == "cost" or __sortByField == "type") exitWith {
	hint "ERROR #502: Sort field not recognized.";
	_return
};

// Sort appropriately
_sortedItems = [
	_items,
	[
		[__sortByField] call Helpers_fnc_indexOfProp_Weapon
	],
	{_x select _input0}, 
	_sortByTag
] call BIS_fnc_sortBy;

// TODO: More graceful listen/notify system?

// Store sorted list
g_dialog_gear_item_list = _sortedItems;

// Store type of items
g_dialog_gear_items_type = __name;

// Store mutable global num items to buy
g_dialog_gear_num_items = 1;

// Store mutable global cost of selected item
g_dialog_gear_item_cost = -1;

// Store mutable global total cost of selection
g_dialog_gear_selection_cost = -1;

// Setup control handlers
g_dialog_handler_gear_item_select = {
	private    _cost        = -1;
	private    _itemID      = -1;
	private    _item        = -1;

	disableSerialization;

	// Index of selected item
	_itemID = _this select 0;

	// Get item from selected index
	_item = g_dialog_gear_item_list select _itemID;

	// Get cost of selected item
	switch (g_dialog_gear_items_type) do {
		case "weapons":
		{
			_cost = ([_item, "cost"] call Helpers_fnc_getProperty_FromWeapon);
		};
		case "magazines":
		{
			_cost = ([_item, "cost"] call Helpers_fnc_getProperty_FromMagazine);
		};
		case "miscitems":
		{
			_cost = ([_item, "cost"] call Helpers_fnc_getProperty_FromMiscItem);
		};
	};
	
	// SANITY CHECK - Exit here if necessary
	if (_cost < 0) exitWith {
		hint "ERROR #503: Item Cost could not be calculated.";
		nil;
	};
	
	if (g_dialog_gear_num_items < 0) exitWith {
		hint "ERROR #504: Number of items less than zero.";
		nil;
	};

	// Update mutable globals
	g_dialog_gear_item_cost = _cost;

	// Multiply by num items and store global value
	g_dialog_gear_selection_cost = g_dialog_gear_item_cost * g_dialog_gear_num_items;

	// Update dialog cost display
	ctrlSetText [1001, (format ["%1", g_dialog_gear_selection_cost])];
};
g_dialog_handler_gear_item_purchase = {
	private    _itemID           = nil;
	private    _item             = nil;
	private    _itemType         = nil;
	private    _itemPurchased    = nil;
	private    _itemClassname    = nil;

	// Index of selected item
	_itemID = _this select 0;

	// Get item from selected index
	_item = g_dialog_gear_item_list select _itemID;
	
	// SANITY CHECK - Exit here if necessary
	if (LogM < g_dialog_gear_selection_cost) exitWith {
		[false, "not enough supplies."] call FF7_fnc_formatHint;
	};

	// Get item type
	switch (g_dialog_gear_items_type) do {
		case "weapons":
		{
			_itemType = toLower ([_item, "type"] call Helpers_fnc_getProperty_FromWeapon);
		};
		case "magazines":
		{
			_itemType = toLower ([_item, "type"] call Helpers_fnc_getProperty_FromMagazine);
		};
		case "miscitems":
		{
			_itemType = toLower ([_item, "type"] call Helpers_fnc_getProperty_FromMiscItem);
		};
	};

	// SANITY CHECK - Exit here if necessary
	if (isNil "_itemType") exitWith {
		hint "ERROR #505: Could not get item type.";
		nil;
	};

	// Get item classname so we can spawn it
	// Get item type
	switch (g_dialog_gear_items_type) do {
		case "weapons":
		{
			_itemClassname = ([_item, "config_name"] call Helpers_fnc_getProperty_FromWeapon);
		};
		case "magazines":
		{
			_itemClassname = ([_item, "config_name"] call Helpers_fnc_getProperty_FromMagazine);
		};
		case "miscitems":
		{
			_itemClassname = ([_item, "config_name"] call Helpers_fnc_getProperty_FromMiscItem);
		};
	};
	
	// If it is a magazine, we need to remove the "mag_" prefix
	if (g_dialog_gear_items_type == "magazines") then {
		_itemClassname = _itemClassname select [4];
	};
	
	_itemPurchased = true;
	switch (_itemType) do
	{
		case "weapon":
		{
			[weaponCrate_1, [_itemClassname, g_dialog_gear_num_items]] remoteExec ["addWeaponCargoGlobal", 2];
		};
		case "launcher":
		{
			[launcherCrate_1, [_itemClassname, g_dialog_gear_num_items]] remoteExec ["addWeaponCargoGlobal", 2];
		};
		case "rocket":
		{
			[launcherCrate_1, [_itemClassname, g_dialog_gear_num_items]] remoteExec ["addItemCargoGlobal", 2];
		};
		case "backpack":
		{
			[GearDump, [_itemClassname, g_dialog_gear_num_items]] remoteExec ["addBackpackCargoGlobal", 2];
		};
		case "magazine":
		{
			[ammoCrate_1, [_itemClassname, g_dialog_gear_num_items]] remoteExec ["addMagazineCargoGlobal", 2];
		};
		case "grenade":
		{
			[grenadeCrate_1, [_itemClassname, g_dialog_gear_num_items]] remoteExec ["addItemCargoGlobal", 2];
		};
		case "explosive":
		{
			[explosiveCrate_1, [_itemClassname, g_dialog_gear_num_items]] remoteExec ["addMagazineCargoGlobal", 2];
		};
		case "medical":
		{
			[medicalCrate_1, [_itemClassname, g_dialog_gear_num_items]] remoteExec ["addItemCargoGlobal", 2];
		};
		case "other":
		{
			[GearDump, [_itemClassname, g_dialog_gear_num_items]] remoteExec ["addItemCargoGlobal", 2];
		};
		default
		{
			_itemPurchased = false;
		};
	};

	// SANITY CHECK - Exit here if necessary
	if (!_itemPurchased) exitWith {
		hint "ERROR #506: Could not purchase item.";
		nil;
	};
	
	// Subtract cost from client global
	LogM = (LogM - g_dialog_gear_selection_cost);
	
	// Update server global with client global value
	publicVariableServer "LogM";
	
	// Update new resource display value
	ctrlSetText [1002, (format ["%1",LogM])];	

	// Notify user of success
	[false, "item(s) requisitioned."] call InA_fnc_formatHint;
};
g_dialog_handler_gear_slider_change = {
	private    _numItemsSelected    = nil;
	
	disableSerialization;

	// Get value of slider
	_numItemsSelected = _this select 0;

	// SANITY CHECK - Exit here if necessary
	if (g_dialog_gear_item_cost < 0) exitWith {
		hint "ERROR #507: Item cost is less than zero.";
		nil;
	};
	
	// Update and display new number of items
	g_dialog_gear_num_items = round (_numItemsSelected);
	ctrlSetText [1000,(format ["%1",g_dialog_gear_num_items])];
	
	// Update and display new total cost
	g_dialog_gear_selection_cost = (g_dialog_gear_num_items * g_dialog_gear_item_cost);
	ctrlSetText [1001,(format ["%1",g_dialog_gear_selection_cost])];
};

// Create dialog window
disableSerialization;
createDialog "InA_Gear_Dialog";
waitUntil {!isNull (findDisplay 9200);};

// Populate dialog list
_ctrl_itemContainer = (findDisplay 9200) displayCtrl 1500;
{ _ctrl_itemContainer lbAdd _x; } forEach ([_sortedItems, "name", __name] call InA_fnc_simpleListFromItemArray);

// Select first item in list
_ctrl_itemContainer lbSetCurSel 0;

// Setup slider control
_ctrl_slider = (findDisplay 9200) displayCtrl 1900;
_ctrl_slider sliderSetRange [1, 10];
_ctrl_slider slidersetSpeed [1, 1];

// Update current supplies
ctrlSetText [1002, (format ["%1",LogM])];

_return = true;
_return