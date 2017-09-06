sleep 5;

// ---------- Load database ----------

_data = ["load", "data"] call FF7_fnc_extSerialize;

if ((count (_data select 0)) < 1) exitWith {};

// ---------- Set base type ----------


_baseType = _data select 5 select 0;

switch (_baseType) do {
	case "Army": 
	{
		_handle = [0] execVM "defines\baseHandler.sqf";
		waitUntil {scriptDone _handle;};
	};
	case "Marines": 
	{
		_handle = [1] execVM "defines\baseHandler.sqf";
		waitUntil {scriptDone _handle;};
	};
	case "Nato": 
	{
		_handle = [2] execVM "defines\baseHandler.sqf";
		waitUntil {scriptDone _handle;};
	};
	case "AAF": 
	{
		_handle = [3] execVM "defines\baseHandler.sqf";
		waitUntil {scriptDone _handle;};
	};
	case "Russia": 
	{
		_handle = [4] execVM "defines\baseHandler.sqf";
		waitUntil {scriptDone _handle;};
	};
	default 
	{

	};
};


// ---------- Region data ----------

_regionData = _data select 0;

{
	call compile format
	[
		"instability%1 = %2",
		(_x select 2),
		(_x select 1)
	];
} forEach _regionData;

// ---------- Armory data ----------

_lI1 = (_data select 1 select 0);
_lI2 = (_data select 1 select 1);
_aI1 = (_data select 1 select 2);
_aI2 = (_data select 1 select 3);
_wI1 = (_data select 1 select 4);
_wI2 = (_data select 1 select 5);
_wI3 = (_data select 1 select 6);
_gI1 = (_data select 1 select 7);
_gI2 = (_data select 1 select 8);
_eI1 = (_data select 1 select 9);
_mI1 = (_data select 1 select 10);
_dI = (_data select 1 select 11);

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
		// Special case for backpacks
		if(_x isKindOf "bag_base") then {
			_box addBackpackCargoGlobal [_x, 1];
		} else {
			_box addItemCargoGlobal [_x, 1];
		};
	} forEach _inventory;

} forEach _array;

// ---------- Logistics data ----------

_logisticsData = _data select 2;

LogV = (_logisticsData select 0);
LogM = (_logisticsData select 1);
LogF = (_logisticsData select 2);

// ---------- Vehicle data ----------

_vehicleData = _data select 3;
_utilityVehicles = _data select 4;

{
	_veh = createVehicle [(_x select 0), (_x select 2), [], 0, "CAN_COLLIDE"];
	_veh setDir (_x select 1);
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;

	if ((_x select 0) in _utilityVehicles) then {
		utilityVehicles pushBack _veh;
	};
	
	playerVehicles pushBack _veh;
} forEach _vehicleData;

["LOADED", "Data loaded"] remoteExec ["FF7_fnc_formatHint", 0];