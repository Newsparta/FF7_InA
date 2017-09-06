// Reads all InA configs and preloads them into global variables (server-side) 
// for faster access (at cost of few mb of memory)

// TODO: NEXT:		use macros for everything (all global lists and vehicles etc etc), check results
//					Generalize GearToArray and other higher level funs with more data layout macros for the classes.

// Only server has needs the globals (clients only get their selected faction data - nothing if no faction selected)
if !(isServer) exitWith {};
g_cfg_initDone = false;

///////////////////////////////////////////////////////////////////////////////////
// DEBUG FUNCS
_fnc_debug_printlog_fixedwidth_item = {
	params [
		["__itemArray", ["","",-1,""], [[]], 4],
		["__bRemovePrefix", false, [true]]
	];
	
	private _columnWide = 50;
	private _columnThin = 20;

	private _cls = __itemArray select 0;
	private _name = __itemArray select 1;
	private _cost = str (__itemArray select 2);
	private _type = __itemArray select 3;

	if (__bRemovePrefix) then {
		_cls = _cls select [4];
	};

	private _cls_dif = _columnWide - (count _cls);
	private _name_dif = _columnWide - (count _name);
	private _cost_dif = _columnThin - (count _cost);
	private _type_dif = _columnThin - (count _type);

	if (_cls_dif > 0) then {
		for "_i" from 1 to _cls_dif do {
			_cls = _cls + " ";
		};
	};
	if (_name_dif > 0) then {
		for "_i" from 1 to _name_dif do {
			_name = _name + " ";
		};
	};
	if (_cost_dif > 0) then {
		for "_i" from 1 to _cost_dif do {
			_cost = _cost + " ";
		};
	};
	if (_type_dif > 0) then {
		for "_i" from 1 to _type_dif do {
			_type = _type + " ";
		};
	};

	diag_log format ["%1%2%3%4",_cls, _name, _cost, _type];
};

_fnc_debug_printlog_fixedwidth_vehicle = {
	params [
		["__itemArray", ["","",-1,""], [[]], 4],
		["__bRemovePrefix", false, [true]]
	];
	
	private _columnWide = 50;
	private _columnThin = 20;

	private _cls = __itemArray select 0;
	private _name = __itemArray select 1;
	private _cost = str (__itemArray select 2);
	private _type = __itemArray select 3;

	if (__bRemovePrefix) then {
		_cls = _cls select [4];
	};

	private _cls_dif = _columnWide - (count _cls);
	private _name_dif = _columnWide - (count _name);
	private _cost_dif = _columnThin - (count _cost);
	private _type_dif = _columnThin - (count _type);

	if (_cls_dif > 0) then {
		for "_i" from 1 to _cls_dif do {
			_cls = _cls + " ";
		};
	};
	if (_name_dif > 0) then {
		for "_i" from 1 to _name_dif do {
			_name = _name + " ";
		};
	};
	if (_cost_dif > 0) then {
		for "_i" from 1 to _cost_dif do {
			_cost = _cost + " ";
		};
	};
	if (_type_dif > 0) then {
		for "_i" from 1 to _type_dif do {
			_type = _type + " ";
		};
	};

	diag_log format ["%1%2%3%4",_cls, _name, _cost, _type];
};

_fnc_debug_printlog_factiondataarrays = {
	params [
		["__magazines", [], [[]]],
		["__weapons", [], [[]]],
		["__miscItems", [], [[]]],
		["__vehicles", [], [[]]]
	];
	diag_log ["----------------------------------------------------------------[ MAGAZINES ]---------------------------------------------------------------"];
	diag_log ["------------------ [Classname] ------------------|----------------------[Name]---------------------|-------[Cost]------|-------[Type]------|"];
	{ 
		[_x, true] call _fnc_debug_printlog_fixedwidth_item;
	} forEach __magazines;

	diag_log ["-----------------------------------------------------------------[ WEAPONS ]----------------------------------------------------------------"];
	diag_log ["------------------ [Classname] ------------------|----------------------[Name]---------------------|-------[Cost]------|-------[Type]------|"];
	{ 
		[_x] call _fnc_debug_printlog_fixedwidth_item;
	} forEach __weapons;

	diag_log ["---------------------------------------------------------------[ MISC ITEMS ]---------------------------------------------------------------"];
	diag_log ["------------------ [Classname] ------------------|----------------------[Name]---------------------|-------[Cost]------|-------[Type]------|"];
	{ 
		[_x] call _fnc_debug_printlog_fixedwidth_item;
	} forEach __miscItems;

	diag_log ["----------------------------------------------------------------[ VEHICLES ]----------------------------------------------------------------"];
	diag_log ["------------------ [Classname] ------------------|----------------------[Name]---------------------|[Cost: Log/Fue/Sup]|-------[Type]------|"];
	{ 
		[_x] call _fnc_debug_printlog_fixedwidth_vehicle;
	} forEach __vehicles;
};

_fnc_debug_printlog_factiondata = {
	params [["__index", -1, [0]]];

	if (__index != -1) exitWith {
		diag_log Format ["Faction Classname: %1", (g_cfg_allFactions select __index) select 0];
		diag_log Format ["Faction Name: %1", (g_cfg_allFactions select __index) select 1];
		diag_log Format ["Faction Side: %1", (g_cfg_allFactions select __index) select 2];

		[
			(g_cfg_allFactions select __index) select 3 select 1,
			(g_cfg_allFactions select __index) select 3 select 0,
			(g_cfg_allFactions select __index) select 3 select 2
		] call _fnc_debug_printlog_factiondataarrays;
		diag_log Format ["-----------------------------------------------"];
	};

	diag_log ["================================================================= DATA DUMP ================================================================"];
	{
		diag_log Format ["Faction Classname: %1", _x select 0];
		diag_log Format ["Faction Name: %1", _x select 1];
		diag_log Format ["Faction Side: %1", _x select 2];

		[
			_x select 3 select 1,
			_x select 3 select 0,
			_x select 3 select 2
		] call _fnc_debug_printlog_factiondataarrays;
	diag_log ["============================================================================================================================================"];
	} forEach g_cfg_allFactions;
};

///////////////////////////////////////////////////////////////////////////////////
// Helper funcs

// Takes generic item config
// Returns array of properties
// Assumed properties: name, cost, type
// Output: [classname, name, cost, type]
_fnc_cfg_item_to_array = {
	params [
		["__item", configNull, [configNull]]
	];
	if (!assert(__item != configNull)) exitWith { 
		["", "", -1, ""];
	};

	private _cls = configName __item;
	private _name = "";
	private _cost = -1;
	private _type = "";


	if (__item >> "name" != configNull) then {
		_name = getText (__item >> "name");
	};
	if (__item >> "cost" != configNull) then {
		_cost = getNumber (__item >> "cost");
	};
	if (__item >> "type" != configNull) then {
		_type = getText (__item >> "type");
	};
	
	[
		_cls, 
		_name,
		_cost,
		_type
	];
};

// Takes generic landvehicle config entry
// Returns array of properties
// Assumed properties: name, cost_logistics, cost_munitions, cost_fuel, paint, anim, isUtility
// Output: [classname, name, cost_logistics, cost_munitions, cost_fuel, paint, anim, isUtility]
_fnc_cfg_landvehicle_to_array = {
	params [
		["__item", configNull, [configNull]]
	];
	if (!assert(__item != configNull)) exitWith { 
		diag_log format ["Config item was null (landvehicle): %1", __item];
		["", "", -1.0, -1.0, -1.0, "", false, false];
	};

	private _cls = configName __item;
	private _name = "";
	private _cost_l = -1.0;
	private _cost_f = -1.0;
	private _cost_m = -1.0;
	private _paint = "";
	private _anim = false;
	private _isUtility = false;

	if (__item >> "name" != configNull) then {
		_name = getText (__item >> "name");
	};
	if (__item >> "cost_logistics" != configNull) then {
		_cost = getNumber (__item >> "cost_logistics");
	};
	if (__item >> "cost_munitions" != configNull) then {
		_type = getNumber (__item >> "cost_munitions");
	};
	if (__item >> "cost_fuel" != configNull) then {
		_type = getNumber (__item >> "cost_fuel");
	};
	if (__item >> "paint" != configNull) then {
		_type = getText (__item >> "paint");
	};
	if (__item >> "anim" != configNull) then {
		_type = (__item >> "anim") call BIS_fnc_getCfgDataBool;
	};
	if (__item >> "isUtility" != configNull) then {
		_type = (__item >> "isUtility") call BIS_fnc_getCfgDataBool;
	};
	
	[
		_cls,
		_name,
		_cost_l, 
		_cost_f, 
		_cost_m, 
		_paint,
		_anim,
		_isUtility
	];
};

// Takes generic airvehicle config entry
// Returns array of properties
// Assumed properties: name, cost_logistics, cost_munitions, cost_fuel, paint, anim
// Output: [classname, name, cost_logistics, cost_munitions, cost_fuel, paint, anim]
_fnc_cfg_airvehicle_to_array = {
	params [
		["__item", configNull, [configNull]]
	];
	if (!assert(__item != configNull)) exitWith { 
		diag_log format ["Config item was null (airvehicle): %1", __item];
		["", "", -1.0, -1.0, -1.0, "", false];
	};

	private _cls = configName __item;
	private _name = "";
	private _cost_l = -1.0;
	private _cost_f = -1.0;
	private _cost_m = -1.0;
	private _paint = "";
	private _anim = false;

	if (__item >> "name" != configNull) then {
		_name = getText (__item >> "name");
	};
	if (__item >> "cost_logistics" != configNull) then {
		_cost = getNumber (__item >> "cost_logistics");
	};
	if (__item >> "cost_munitions" != configNull) then {
		_type = getNumber (__item >> "cost_munitions");
	};
	if (__item >> "cost_fuel" != configNull) then {
		_type = getNumber (__item >> "cost_fuel");
	};
	if (__item >> "paint" != configNull) then {
		_type = getText (__item >> "paint");
	};
	if (__item >> "anim" != configNull) then {
		_type = (__item >> "anim") call BIS_fnc_getCfgDataBool;
	};
	
	[
		_cls,
		_name,
		_cost_l, 
		_cost_f, 
		_cost_m, 
		_paint,
		_anim
	];
};

// Takes generic watervehicle config entry
// Returns array of properties
// Assumed properties: name, cost_logistics, cost_munitions, cost_fuel, paint, anim
// Output: [classname, name, cost_logistics, cost_munitions, cost_fuel, paint, anim]
_fnc_cfg_watervehicle_to_array = {
	params [
		["__item", configNull, [configNull]]
	];
	if (!assert(__item != configNull)) exitWith { 
		diag_log format ["Config item was null (watervehicle): %1", __item];
		["", "", -1.0, -1.0, -1.0, "", false];
	};

	private _cls = configName __item;
	private _name = "";
	private _cost_l = -1.0;
	private _cost_f = -1.0;
	private _cost_m = -1.0;
	private _paint = "";
	private _anim = false;

	if (__item >> "name" != configNull) then {
		_name = getText (__item >> "name");
	};
	if (__item >> "cost_logistics" != configNull) then {
		_cost = getNumber (__item >> "cost_logistics");
	};
	if (__item >> "cost_munitions" != configNull) then {
		_type = getNumber (__item >> "cost_munitions");
	};
	if (__item >> "cost_fuel" != configNull) then {
		_type = getNumber (__item >> "cost_fuel");
	};
	if (__item >> "paint" != configNull) then {
		_type = getText (__item >> "paint");
	};
	if (__item >> "anim" != configNull) then {
		_type = (__item >> "anim") call BIS_fnc_getCfgDataBool;
	};
	
	[
		_cls,
		_name,
		_cost_l, 
		_cost_f, 
		_cost_m, 
		_paint,
		_anim
	];
};

// true if classname __classname has been defined in array __itemArray (Only useful for g_cfg_all[Weapons,Magazines,MiscItems] arrays)
_fnc_cfg_classNameDefined = {
	params [
		["__classname", "", [""]], 
		["__itemArray", [], [[]]]
	];

	assert (__classname != ""); // Caller didnt give a name
	assert ((count __itemArray) > 0); // Caller didnt give any items to match against
	private _bClassExists = false;

	{
		if ((_x select 0) == __classname) exitWith {
			_bClassExists = true;
		};
	} forEach __itemArray;

	_bClassExists;
};

// True if item classname found in magazines or weapons, false otherwise
_fnc_cfg_itemclass_exists = { 
	params [ 
		["__classname", "", [""]] 
	]; 
	assert(__classname != ""); 

	private _magazine = configName (configFile >> "CfgMagazines" >> __classname); 
	private _weapon = configName (configFile >> "CfgWeapons" >> __classname); 
	private _vehicle = configName (configFile >> "CfgVehicles" >> __classname); 
	
	if (_magazine == __classname) exitWith { true; }; 
	if (_weapon == __classname) exitWith { true; }; 
	if (_vehicle == __classname) exitWith { true; }; 
	false; 
};

// Find item from __array using its class name __classname
// Returns item array if found, else empty array []
_fnc_findItemBySubClassname = {
	params [
		["__classname", "", [""]],
		["__array", [], [[]]]
	];
	private _return = [];

	if (!assert (__classname != "")) exitWith { diag_log "Error: initConfigs.sqf; _fnc_findItemBySubClassname; Empty classname given."; _return;};

	// Find item
	{
		if (__classname == _x select 0) exitWith {
			_return = _x;
		};
	} forEach __array;

	_return;
};

// Slow: O(n^n)
// Sorts items array __array by class name alphabetically
// Returns sorted item array on success, original unsorted array __array on failure
_fnc_sortItemsBySubClassname = {
	params [
		["__array", [], [[]]]
	];
	private _alphabetical = [];

	if (!assert ((count __array) > 1)) exitWith { 
		diag_log format [
			"Error: initConfigs.sqf; _fnc_sortItemsBySubClassname; Nothing to sort! (%1 items).",
			count __array
		];
		__array;
	};

	// Copy names to a new (simple) array
	{
		_alphabetical pushBack (_x select 0);
	} forEach __array;

	// Sort name array
	_alphabetical = _alphabetical call BIS_fnc_sortAlphabetically;

	// Turn name strings into full item arrays
	for "_i" from 0 to ((count _alphabetical)-1) do {
		_item = [_alphabetical select _i, __array] call _fnc_findItemBySubClassname;
		if (!assert (count _item != 0)) exitWith { diag_log "Error: initConfigs.sqf; _fnc_sortItemsBySubClassname; Invariant mutation."; _alphabetical = __array;};
		_alphabetical set [_i, _item];
	};
	_alphabetical;
};


// Scans provided config for vehicle definitions
// returns multi-dim. array of vehicles [land,air,water]
_fnc_cfg_vehicles_to_array = {
	params [
		["__config", configNull, [configNull]]
	];

	// Gather definitions
	private _land = [];
	private _air = [];
	private _water = [];

	{
		assert ([(configName _x), g_cfg_allLandVehicles] call _fnc_cfg_classNameDefined);
		_land pushBack (_x call _fnc_cfg_landvehicle_to_array);
	} forEach configProperties [__config >> "landvehicles", "isClass _x", true];
	if (count _land > 1) then { _land = [_land] call _fnc_sortItemsBySubClassname; };

	{
		assert ([(configName _x), g_cfg_allAirVehicles] call _fnc_cfg_classNameDefined);
		_air pushBack (_x call _fnc_cfg_airvehicle_to_array);
	} forEach configProperties [__config >> "airvehicles", "isClass _x", true];
	if (count _air > 1) then { _air = [_air] call _fnc_sortItemsBySubClassname; };

	{
		assert ([(configName _x), g_cfg_allWaterVehicles] call _fnc_cfg_classNameDefined);
		_water pushBack (_x call _fnc_cfg_watervehicle_to_array);
	} forEach configProperties [__config >> "watervehicles", "isClass _x", true];
	if (count _water > 1) then { _water = [_water] call _fnc_sortItemsBySubClassname; };

	// Return
	[
		_land,
		_air,
		_water
	];
};

// TRUE if values of arrays match
_fnc_arrayValuesMatch = {
	params [
		["__lhs", [], [[]]],
		["__rhs", [], [[]]]
	];
	if ((typeName __lhs) != (typeName __rhs)) exitWith { 
		diag_log format ["ERROR: Type mis-match! (%1) (%2)", typeName __lhs, typeName __rhs]; 
		diag_log format ["       Left Value: %1", __lhs]; 
		diag_log format ["       Right Value: %1", __rhs]; 
		true; 
	};
	if ((count __lhs) != (count __rhs)) exitWith { false; };

	private _bMatch = true;
	for "_i" from 0 to count __lhs do {
		if ((__lhs select _i) != (__rhs select _i)) exitWith {_bMatch = false; false;};
	};
	_bMatch;
};

// Fills missing item properties of __inheritor with properties of __parent
_fnc_inheritItemValues = {
	params [
		["__parent", ["","",-1,""], [[]], 4],
		["__inheritor", ["","",-1,""], [[]], 4]
	];
	private _p_cls = __parent select 0;
	private _p_name = __parent select 1;
	private _p_cost = __parent select 2;
	private _p_type = __parent select 3;

	private _i_cls = __inheritor select 0;
	private _i_name = __inheritor select 1;
	private _i_cost = __inheritor select 2;
	private _i_type = __inheritor select 3;

	// class name must match
	if (!assert(_p_cls == _i_cls)) exitWith {
		diag_log "Error: Classnames mis-match!";
		__inheritor;
	};

	// Gather any missing properties from parent
	private _bMatched = [__parent, __inheritor] call _fnc_arrayValuesMatch;
	if (!_bMatched) then {
		if (_i_name == "") then {
			_i_name = _p_name;
		};
		if (_i_cost == -1) then {
			_i_cost = _p_cost;
		};
		if (_i_type == "") then {
			_i_type = _p_type;
		};
	};

	// return
	[_i_cls, _i_name, _i_cost, _i_type];
};

///////////////////////////////////////////////////////////////////////////////////
// Initialize/Clear globals
g_cfg_allWeapons = [];
g_cfg_allMagazines = [];
g_cfg_allMiscItems = [];

g_cfg_allLandVehicles = [];
g_cfg_allAirVehicles = [];
g_cfg_allWaterVehicles = [];

g_cfg_allFactions = [];

///////////////////////////////////////////////////////////////////////////////////
// BASE ITEM CONFIGS

{ // WEAPONS
//	assert([configName _x] call _fnc_cfg_itemclass_exists);
	g_cfg_allWeapons pushBack (_x call _fnc_cfg_item_to_array);
} forEach configProperties [(getMissionConfig "InA_Weapons"), "isClass _x", true];
g_cfg_allWeapons = [g_cfg_allWeapons] call _fnc_sortItemsBySubClassname;
diag_log format ["Config: Loaded %1 weapons", count g_cfg_allWeapons];

{ // MAGAZINES
//	assert([(configName _x) select [4]] call _fnc_cfg_itemclass_exists);
	g_cfg_allMagazines pushBack (_x call _fnc_cfg_item_to_array);
} forEach configProperties [(getMissionConfig "InA_Magazines"), "isClass _x", true];
g_cfg_allMagazines = [g_cfg_allMagazines] call _fnc_sortItemsBySubClassname;
diag_log format ["Config: Loaded %1 magazines", count g_cfg_allMagazines];

{ // MISC ITEMS
//	assert([configName _x] call _fnc_cfg_itemclass_exists);
	g_cfg_allMiscItems pushBack (_x call _fnc_cfg_item_to_array);
} forEach configProperties [(getMissionConfig "InA_MiscItems"), "isClass _x", true];
g_cfg_allMiscItems = [g_cfg_allMiscItems] call _fnc_sortItemsBySubClassname;
diag_log format ["Config: Loaded %1 misc items", count g_cfg_allMiscItems];

{ // LAND VEHICLES
//	assert([configName _x] call _fnc_cfg_itemclass_exists);
	g_cfg_allLandVehicles pushBack (_x call _fnc_cfg_landvehicle_to_array);
} forEach configProperties [(getMissionConfig "InA_Vehicles") >> "land", "isClass _x", true];
g_cfg_allLandVehicles = [g_cfg_allLandVehicles] call _fnc_sortItemsBySubClassname;
diag_log format ["Config: Loaded %1 land vehicles", count g_cfg_allLandVehicles];

// FACTION CONFIGS
{
	diag_log format ["Loading Faction Config: %1", _x];
	_clsname = configName _x;
	_name = getText (_x >> "name");
	_sidename = getText (_x >> "sidename");
	_gear = _x call Helpers_fnc_GearToArray;
	_vehicles = _x call _fnc_cfg_vehicles_to_array;
	diag_log format ["_clsname = %1", _clsname];
	diag_log format ["_name = %1", _name];
	diag_log format ["_sidename = %1", _sidename];
	diag_log format ["_gear = %1", _gear];
	diag_log format ["_vehicles = %1", _vehicles];
	diag_log "-----------------------------------";

	g_cfg_allFactions pushBack ([
		_clsname, 
		_name,
		_sidename,
		_gear,
		_vehicles
	]);
} forEach configProperties [(getMissionConfig "InA_Factions"), "isClass _x", true];
diag_log format ["Config: Loaded %1 factions", count g_cfg_allFactions];

///////////////////////////////////////////////////////////////////////////////////
// Run through all factions and gather missing property data from gear/vehicle base definitions
for "_i_fac" from 0 to ((count g_cfg_allFactions)-1) do {

	// Get current faction array
	private _fac = g_cfg_allFactions select _i_fac;
	diag_log format ["Config: Parsing faction: %1 (%2) (%3)", _fac select 0, _fac select 1, _fac select 2];

	// Get current faction declared items
	private _fac_mags = _fac select 3 select 0;
	private _fac_weps = _fac select 3 select 1;
	private _fac_miscItems = _fac select 3 select 2;

	private _fac_landVehicles = _fac select 4 select 0;
	private _fac_airVehicles = _fac select 4 select 1;
	private _fac_waterVehicles = _fac select 4 select 2;

	diag_log format ["        Loaded %1 magazines", count _fac_mags];
	diag_log format ["        Loaded %1 weapons", count _fac_weps];
	diag_log format ["        Loaded %1 misc items", count _fac_miscItems];
	diag_log format ["        Loaded %1 land vehicles", count _fac_landVehicles];
	diag_log format ["        Loaded %1 air vehicles", count _fac_airVehicles];
	diag_log format ["        Loaded %1 water vehicles", count _fac_waterVehicles];

	// Fill in the blanks (from Base definition)
	{
		// Inherit values for each match
		for "_i_fac_wep" from 0 to ((count _fac_weps) -1) do {
			if ((_x select 0) == ((_fac_weps select _i_fac_wep) select 0)) exitWith {
				_item = [_x, _fac_weps select _i_fac_wep] call _fnc_inheritItemValues;
				_fac_weps set [_i_fac_wep, _item];
			};
		};
		
	} forEach g_cfg_allWeapons;

	// Fill in the blanks (from Base definition)
	{
		// Inherit values for each match
		for "_i_fac_mag" from 0 to ((count _fac_mags) -1) do {
			if ((_x select 0) == ((_fac_mags select _i_fac_mag) select 0)) exitWith {
				_item = [_x, _fac_mags select _i_fac_mag] call _fnc_inheritItemValues;
				_fac_mags set [_i_fac_mag, _item];
			};
		};
		
	} forEach g_cfg_allMagazines;

	// Fill in the blanks (from Base definition)
	{
		// Inherit values for each match
		for "_i_fac_miscItem" from 0 to ((count _fac_miscItems) -1) do {
			if ((_x select 0) == ((_fac_miscItems select _i_fac_miscItem) select 0)) exitWith {
				_item = [_x, _fac_miscItems select _i_fac_miscItem] call _fnc_inheritItemValues;
				_fac_miscItems set [_i_fac_miscItem, _item];
			};
		};
		
	} forEach g_cfg_allMiscItems;

	// ================================================================================
	//  Update global faction array with modified data (sorts all data alphabetically)
	// ================================================================================
	_fac_weps = [_fac_weps] call _fnc_sortItemsBySubClassname;
	_fac_mags = [_fac_mags] call _fnc_sortItemsBySubClassname;
	_fac_miscItems = [_fac_miscItems] call _fnc_sortItemsBySubClassname;
	_fac set [3, [_fac_weps, _fac_mags, _fac_miscItems]];
	g_cfg_allFactions set [_i_fac, _fac];
};

diag_log "8. FINISHED FACTIONS";
	
g_cfg_initDone = true;
true;