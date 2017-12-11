/* ----------
Script:
	Load database

Description:
	Loads all saved data

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_aI1				= nil;
private		_aI2				= nil;
private		_array				= [];
private		_baseType			= "";
private		_box				= nil;
private		_data				= nil;
private		_dI					= nil;
private		_eI1				= nil;
private		_gI1				= nil;
private		_gI2				= nil;
private		_handle				= nil;
private		_inventory			= [];
private		_lI1				= nil;
private		_lI2				= nil;
private		_logisticsData		= [];
private		_mI1				= nil;
private		_mkr				= nil;
private		_obj				= ObjNull;
private		_regionData			= [];
private		_target				= nil;
private		_utiVeh				= [];
private		_objData			= [];
private		_wI1				= nil;
private		_wI2				= nil;
private		_wI3				= nil;
private		_xI1				= nil;

// Delay to ensure server init is not disrupted
sleep 5;

/////////////////////////
// BEGIN DATABASE LOAD //
/////////////////////////

// Load database
_data = ["load", "data"] call InA_fnc_extSerialize;
if (isNil "_data") exitWith {};

// Set faction (_data select 5)
_baseType = _data select 5 select 0;

	// Check if no faction
	if (isNil "_baseType") exitWith {};
	if (_baseType == "") exitWith {};

	// Switch on base type
	switch (_baseType) do {
		case "Army": 
		{
			_handle = [0]execVM "defines\baseHandler.sqf";
			waitUntil {scriptDone _handle;};
		};
		case "Marines": 
		{
			_handle = [1]execVM "defines\baseHandler.sqf";
			waitUntil {scriptDone _handle;};
		};
		case "Nato": 
		{
			_handle = [2]execVM "defines\baseHandler.sqf";
			waitUntil {scriptDone _handle;};
		};
		case "AAF": 
		{
			_handle = [3]execVM "defines\baseHandler.sqf";
			waitUntil {scriptDone _handle;};
		};
		case "Russia": 
		{
			_handle = [4]execVM "defines\baseHandler.sqf";
			waitUntil {scriptDone _handle;};
		};
		default 
		{

		};
	};

// Region data (_data select 0) 
_regionData = _data select 0;

	// Assign instability of each region
	{
		call compile format
		[
			"instability%1 = %2",
			(_x select 2),
			(_x select 1)
		];
	} forEach _regionData;

// Armory data (_data select 1)
_lI1 = (_data select 1 select 0);
_lI2 = (_data select 1 select 1);
_xI1 = (_data select 1 select 2);
_aI1 = (_data select 1 select 3);
_aI2 = (_data select 1 select 4);
_wI1 = (_data select 1 select 5);
_wI2 = (_data select 1 select 6);
_wI3 = (_data select 1 select 7);
_gI1 = (_data select 1 select 8);
_gI2 = (_data select 1 select 9);
_eI1 = (_data select 1 select 10);
_mI1 = (_data select 1 select 11);
_dI = (_data select 1 select 12);

	// Define array of boxes 
	_array = 
	[
		[launcherCrate_1, _lI1],
		[launcherCrate_2, _lI2],
		[explosiveCrate_1, _xI1],
		[ammoCrate_1, _aI1],
		[ammoCrate_2, _aI2],
		[weaponCrate_1, _wI1],
		[weaponCrate_2, _wI2],
		[weaponCrate_3, _wI3],
		[grenadeCrate_1, _gI1],
		[grenadeCrate_2, _gI2],
		[equipmentCrate_1, _eI1],
		[medicalCrate_1, _mI1],
		[gearDump, _dI]
	];

	// Add inventories back to boxes
	{
		_box = _x select 0;
		_inventory = _x select 1;

		{
			// Special case for backpacks
			if(_x isKindOf "bag_base") then {
				_box addBackpackCargoGlobal [_x, 1];
			} else {
				_box addItemCargoGlobal [_x, 1];
			};
		} forEach _inventory;

	} forEach _array;

// Logistics (_data select 2)
_logisticsData = _data select 2;

	// Assign values
	LogV = (_logisticsData select 0);
	LogM = (_logisticsData select 1);
	LogF = (_logisticsData select 2);

// Object data (_data select 3)
// Utility data (_data select 4)
_objData = _data select 3;
_utiVeh = _data select 4;

	// For all objects
	{
		// Create objects
		_obj = createVehicle [(_x select 0), (_x select 2), [], 0, "CAN_COLLIDE"];
		_obj setDir (_x select 1);
		clearBackpackCargoGlobal _obj;
		clearMagazineCargoGlobal _obj;
		clearWeaponCargoGlobal _obj;
		clearItemCargoGlobal _obj;
		
		// Check if vehicle
		if ((_obj isKindOf "LandVehicle") || {_obj isKindOf "Air"}) then {
			playerVehicles pushBack _obj;
		};

		// Check if utility
		{
			if ((typeOf _obj) in _x) then {
				utilityVehicles pushBack [_obj, _x select 1, _x select 2, false];
			};
		} forEach _utiVeh;
	} forEach _objData;

// FOB (_data select 6)
if (_data select 6 select 0) then {

	// Activate FOB
	["build", _data select 6 select 1] call InA_fnc_fob;

	// Add action for fast travel
	_obj = (nearestObjects [InA_fob_location,["Flag_White_F"],100] select 0);
	[_obj, ["Fast travel",	
		{_this call InA_fnc_actionTeleport;}, 
		[], 
		99,
		true, 
		true, 
		"", 
		"((_target distance _this) < 8)"
	]] remoteExec ["addAction", 0, true];

};

// Stronghold (_data select 7)
if (_data select 7 select 0) then {

	// Activate stronghold and set location
	InA_stronghold = true;
	InA_stronghold_Loc = _data select 7 select 1;

};

// Camp (_data select 8)
if (_data select 8 select 0) then {

	// Activate camp and set location
	campPlaced = true;
	InA_camp_location = _data select 8 select 1;

	// Add camp marker
	private _mkr = createMarker ["camp_mark", InA_camp_location];
	"camp_mark" setMarkerColor "ColorWest";
	"camp_mark" setMarkerShape "ICON";
	"camp_mark" setMarkerType "b_installation";
	"camp_mark" setMarkerText "Camp";

	// Add actions to camp tent
	_obj = (nearestObjects [InA_camp_location,["Land_TentDome_F"],50] select 0);
	[_obj, ["Fast travel",	
		{_this call InA_fnc_actionTeleport;}, 
		[], 
		99,
		true, 
		true, 
		"", 
		"((_target distance _this) < 8)"
	]] remoteExec ["addAction", 0, true];
		[_obj, [
		"Pack up camp",
		{_this call InA_fnc_packUpCamp;},
		[], 
		97, 
		true, 
		true, 
		"", 
		"((_target distance _this) < 8)"
	]] remoteExec ["addAction", 0, true];
	{
		if ((typeOf _obj) in _x) then {
			_x set [0, _obj];
		};
	} forEach utilityVehicles;

	// Add actions to map
	_obj = (nearestObjects [InA_camp_location,["Land_Map_blank_F"],50] select 0);
	[_obj, ["Look at map",	
		{_this call InA_fnc_actionHQLookAtMap;}, 
		[], 
		99,
		true, 
		true, 
		"", 
		"((_target distance _this) < 8)"
	]] remoteExec ["addAction", 0, true];

};

///////////////////////
// END DATABASE LOAD //
///////////////////////

// Notification
[true, "loaded", "Database"] remoteExec ["InA_fnc_formatHint", 0];

// Delay for saving after load
sleep 4;

// Save once load complete
[] call InA_fnc_save;