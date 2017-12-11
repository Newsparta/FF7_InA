/* ----------
Function:
	InA_fnc_save

Description:
	Saves map state to the database

Parameters:

Optional:

Example:
	[] call InA_fnc_save;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */


// Local declarations
private		_export				= [];
private		_lI1 				= [];
private		_lI2 				= [];
private		_xI1 				= [];
private		_aI1 				= [];
private		_aI2 				= [];
private		_wI1 				= [];
private		_wI2 				= [];
private		_wI3 				= [];
private		_gI1 				= [];
private		_gI2 				= [];
private		_eI1 				= [];
private		_mI1 				= [];
private		_dI 				= [];
private		_airArray			= [];
private		_allItems			= [];
private		_allVehicles		= [];
private		_array				= [];
private		_box				= nil;
private		_buildingArray		= [];
private		_buildVehicles		= [];
private		_inventory			= [];
private		_landArray			= [];
private		_null				= nil;
private		_objCamp			= [];
private		_objFOB				= [];
private		_temp				= [];

// Check if there is no faction selected
if (isNil "baseType") exitWith {
	[false, "No theme selected. Nothing to save."] call InA_fnc_formatHint;
	nil;
};
if (baseType == "") exitWith {
	[false, "No theme selected. Nothing to save."] call InA_fnc_formatHint;
	nil;
};

// Region stability (_data select 0)
_export pushBack ([] call InA_fnc_regionCheck);

// Armory inventory (_data select 1)
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

{
	_box = _x select 0;
	_inventory = _x select 1;

	{
		{ _inventory pushBack _x; } forEach (magazineCargo _x);
		{ _inventory pushBack _x; } forEach (weaponCargo _x);
		{ _inventory pushBack _x; } forEach (itemCargo _x);

	} forEach everyBackpack _box;

	{_inventory pushBack _x;} forEach (backpackCargo _box);
	{_inventory pushBack _x;} forEach (magazineCargo _box);
	{_inventory pushBack _x;} forEach (weaponCargo _box);
	{_inventory pushBack _x;} forEach (itemCargo _box);

} forEach _array;

_allItems pushBack _lI1;
_allItems pushBack _lI2;
_allItems pushBack _xI1;
_allItems pushBack _aI1;
_allItems pushBack _aI2;
_allItems pushBack _wI1;
_allItems pushBack _wI2;
_allItems pushBack _wI3;
_allItems pushBack _gI1;
_allItems pushBack _gI2;
_allItems pushBack _eI1;
_allItems pushBack _mI1;
_allItems pushBack _dI;

_export pushBack _allItems;

// Logistics (_data select 2)
_export pushBack ([LogV, LogM, LogF]);

// Vehicles/strategic (_data select 3)
_landArray = nearestObjects [getMarkerPos "respawn_west",["LandVehicle"],750];

{
	_temp = [];

	_temp pushBack (typeOf _x);
	_temp pushBack (getDir _x);
	_temp pushBack (getPosATL _x);

	_allVehicles pushBack _temp;

} forEach _landArray;

_airArray = nearestObjects [getMarkerPos "respawn_west",["Air"],750];

{
	_temp = [];

	_temp pushBack (typeOf _x);
	_temp pushBack (getDir _x);
	_temp pushBack (getPosATL _x);

	_allVehicles pushBack _temp;

} forEach _airArray;

_objFOB = nearestObjects [InA_fob_location,["Static"],100];
_objCamp = nearestObjects [InA_camp_location,["Static", "Thing"],50];
_buildingArray = _objFOB + _objCamp;

{
	_temp = [];

	_temp pushBack (typeOf _x);
	_temp pushBack (getDir _x);
	_temp pushBack (getPosATL _x);

	_allVehicles pushBack _temp;

} forEach _buildingArray;

_export pushBack _allVehicles;

// Build vehicles (_data select 4)
{
	_buildVehicles pushBack [(typeOf (_x select 0)), _x select 1, _x select 2, _x select 3];
} forEach utilityVehicles;

_export pushBack _buildVehicles;

// Faction (_data select 5)
_export pushBack [baseType];

// FOB (_data select 6)
_export pushBack [fobPlaced, InA_fob_location];

// Stronghold (_data select 7)
_export pushBack [InA_stronghold, InA_stronghold_Loc];

// Camp (_data select 8)
_export pushBack [campPlaced, InA_camp_location];

// Save to database
_null = ["save", "data", _export] call InA_fnc_extSerialize;

// Notification
[true, "Saved.", "Database"] remoteExec ["InA_fnc_formatHint", 0];