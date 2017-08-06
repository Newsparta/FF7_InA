_export = [];

// ---------- Region stability (0)----------

_export pushBack ([] call InA_fnc_regionCheck);

// ---------- Armory inventory (1-10) ----------

_launcherInventory = [];
_explosiveInventory = [];
_ammoInventory = [];
_weaponInventory1 = [];
_weaponInventory2 = [];
_grenadeInventory = [];
_equipmentInventory = [];
_medicalInventory = [];
_miscInventory = [];
_dumpInventory = [];

_array = 
[
	[launcherCrate, _launcherInventory],
	[explosiveCrate, _explosiveInventory],
	[ammoCrate, _ammoInventory],
	[weaponCrate, _weaponInventory1],
	[weaponCrate_2, _weaponInventory2],
	[grenadeCrate, _grenadeInventory],
	[equipmentCrate, _equipmentInventory],
	[medicalCrate, _medicalInventory],
	[miscCrate, _miscInventory],
	[gearDump, _dumpInventory]
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

_export pushBack _launcherInventory;
_export pushBack _explosiveInventory;
_export pushBack _ammoInventory;
_export pushBack _weaponInventory1;
_export pushBack _weaponInventory2;
_export pushBack _grenadeInventory;
_export pushBack _equipmentInventory;
_export pushBack _medicalInventory;
_export pushBack _miscInventory;
_export pushBack _dumpInventory;

// ---------- Logistics (11) ----------

_export pushBack ([LogV, LogM, LogF]);

// ---------- Vehicles/strategic (12) ----------

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

// ---------- Check build vehicles (13) ----------

_buildVehicles = [];

{
	_buildVehicles pushBack (typeOf _x);
} forEach utilityVehicles;

_export pushBack _buildVehicles;

// ---------- Base type (14) ----------

_export pushBack [baseType];

// ---------- Save to database ----------

_null = ["save", "data", _export] call FF7_fnc_extSerialize;

["SAVED", "Map state has been saved to the database."] remoteExec ["FF7_fnc_formatHint", 0];