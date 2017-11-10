

if (isNil "baseType") exitWith {
	["Headquarters", "No theme selected. Nothing to save."] call FF7_fnc_formatHint;
	nil;
};
if (baseType == "") exitWith {
	["Headquarters", "No theme selected. Nothing to save."] call FF7_fnc_formatHint;
	nil;
};

_export = [];

// ---------- Region stability (0)----------

_export pushBack ([] call InA_fnc_regionCheck);

// ---------- Armory inventory (1) ----------

_lI1 = [];
_xI1 = [];
_aI1 = [];
_wI1 = [];
_wI2 = [];
_gI1 = [];
_eI1 = [];
_mI1 = [];
_dI1  = [];
_sI1  = [];

_array = 
[
	[launcherCrate, _lI1],
	[explosiveCrate, _xI1],
	[ammoCrate, _aI1],
	[weaponCrate, _wI1],
	[weaponCrate_2, _wI2],
	[grenadeCrate, _gI1],
	[equipmentCrate, _eI1],
	[medicalCrate, _mI1],
	[miscCrate, _dI1],
	[GearDump, _sI1]
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

_allItems = [];

_allItems pushBack _lI1;
_allItems pushBack _xI1;
_allItems pushBack _aI1;
_allItems pushBack _wI1;
_allItems pushBack _wI2;
_allItems pushBack _gI1;
_allItems pushBack _eI1;
_allItems pushBack _mI1;
_allItems pushBack _dI1;
_allItems pushBack _sI1;

_export pushBack _allItems;

// ---------- Logistics (2) ----------

_export pushBack ([LogV, LogM, LogF]);

// ---------- Vehicles/strategic (3) ----------

_allVehicles = [];

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

_buildingArray = nearestObjects [InA_fob_location,["Static"],100];

{
	_temp = [];

	_temp pushBack (typeOf _x);
	_temp pushBack (getDir _x);
	_temp pushBack (getPosATL _x);

	_allVehicles pushBack _temp;

} forEach _buildingArray;

_export pushBack _allVehicles;

// ---------- Check build vehicles (4) ----------

_buildVehicles = [];

{
	_buildVehicles pushBack (typeOf _x);
} forEach utilityVehicles;

_export pushBack _buildVehicles;

// ---------- Base type (5) ----------

_export pushBack [baseType];

// ---------- FOB (6) ----------

_export pushBack [fobPlaced, InA_fob_location];

// ---------- Stronghold (7) ----------

_export pushBack [InA_stronghold, InA_stronghold_Loc];

// ---------- Save to database ----------

_null = ["save", "data", _export] call FF7_fnc_extSerialize;

["SAVED", "Map state has been saved to the database."] remoteExec ["FF7_fnc_formatHint", 0];