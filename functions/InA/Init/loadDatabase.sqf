
waitUntil { sleep 1; initialized;};

// ---------- Load database ----------

_data = ["load"] call FF7_fnc_extSerialize;

// ---------- Region data ----------

_regionData = _data select 0;

if (count _regionData < 1) exitWith {};

{
	call compile format
	[
		"instability%1 = %2",
		(_x select 2),
		(_x select 1)
	];
} forEach _regionData;

// ---------- Armory data ----------

_launcherInventory = (_data select 1);
_explosiveInventory = (_data select 2);
_ammoInventory = (_data select 3);
_weaponInventory1 = (_data select 4);
_weaponInventory2 = (_data select 5);
_grenadeInventory = (_data select 6);
_equipmentInventory = (_data select 7);
_medicalInventory = (_data select 8);
_miscInventory = (_data select 9);
_dumpInventory = (_data select 10);

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

	{_box addItemCargoGlobal [_x, 1];} forEach _inventory;

} forEach _array;

// ---------- Logistics data ----------

_logisticsData = _data select 11;

LogV = (_logisticsData select 0);
LogM = (_logisticsData select 1);
LogF = (_logisticsData select 2);

// ---------- Vehicle data ----------

_vehicleData = _data select 12;

{
	_veh = createVehicle [(_x select 0), (_x select 2), [], 0, "CAN_COLLIDE"];
	_veh setDir (_x select 1);
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	
	playerVehicles pushBack _veh;
} forEach _vehicleData;

["LOADED", "Data loaded"] remoteExec ["FF7_fnc_formatHint", 0];