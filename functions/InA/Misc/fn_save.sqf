_export = [];

// ---------- Region stability (0)----------

_export pushBack ([] call InA_fnc_regionCheck);

// ---------- Armory inventory (1) ----------

_lI1 = [];
_lI2 = [];
_aI1 = [];
_aI2 = [];
_wI1 = [];
_wI2 = [];
_wI3 = [];
_gI1 = [];
_gI2 = [];
_eI1 = [];
_mI1 = [];
_dI = [];

_array = 
[
	[launcherCrate_1, _lI1],
	[launcherCrate_2, _lI2],
	[explosiveCrate_1, _eI1],
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

_allItems = [];

_allItems pushBack _lI1;
_allItems pushBack _lI2;
_allItems pushBack _eI1;
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

_buildingArray = nearestObjects [InA_fob_location,["Strategic"],100];

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

// ---------- Main AO (6) ----------

if !(InA_missionCompleted) then {
	_export pushBack [true,mission,mainObj];
} else {
	_export pushBack [false,[],[]];
};

// ---------- Save to database ----------

_null = ["save", "data", _export] call FF7_fnc_extSerialize;

["SAVED", "Map state has been saved to the database."] remoteExec ["FF7_fnc_formatHint", 0];