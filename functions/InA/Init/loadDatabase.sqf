sleep 5;

// ---------- Load database ----------

_data = ["load", "data"] call FF7_fnc_extSerialize;

if (isNil "_data") exitWith {};

// ---------- Set base type (5) ----------

_baseType = _data select 5 select 0;

if (isNil "_baseType") exitWith {};
if (_baseType == "") exitWith {};

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

// ---------- Region data (0) ----------

_regionData = _data select 0;

{
	call compile format
	[
		"instability%1 = %2",
		(_x select 2),
		(_x select 1)
	];
} forEach _regionData;

// ---------- Armory data (1) ----------

_lI1 = (_data select 1 select 0);
_xI1 = (_data select 1 select 1);
_aI1 = (_data select 1 select 2);
_wI1 = (_data select 1 select 3);
_wI2 = (_data select 1 select 4);
_gI1 = (_data select 1 select 5);
_eI1 = (_data select 1 select 6);
_mI1 = (_data select 1 select 7);
_dI1 = (_data select 1 select 8);
_sI1 = (_data select 1 select 9);

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
		// Special case for backpacks
		if(_x isKindOf "bag_base") then {
			_box addBackpackCargoGlobal [_x, 1];
		} else {
			_box addItemCargoGlobal [_x, 1];
		};
	} forEach _inventory;

} forEach _array;

// ---------- Logistics data (2) ----------

_logisticsData = _data select 2;

LogV = (_logisticsData select 0);
LogM = (_logisticsData select 1);
LogF = (_logisticsData select 2);

// ---------- Vehicle data (3 - 4) ----------

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

// ---------- FOB (6) ----------

if (_data select 6 select 0) then {

	["build", _data select 6 select 1] call InA_fnc_fob;

};

// ---------- Stronghold (7) ----------

if (_data select 7 select 0) then {

	InA_stronghold = true;
	InA_stronghold_Loc = _data select 7 select 1;

};

/////////
// end //
/////////

["LOADED", "Data loaded"] remoteExec ["FF7_fnc_formatHint", 0];

sleep 4;

[] call InA_fnc_save;