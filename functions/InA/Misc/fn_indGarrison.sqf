/* ----------
Function: InA_fnc_indGarrison

Description:
    A function to spawn independent units within buildings in an area. Also spawns a trigger loop for 
		each instance that will change the occupants to guard mode when players are within 2x spawn area

Parameters:
    - Center Location (Position)

Optional:
    - Radius to spawn soldiers (Number)
	- Percentage (0 to 1) of building positions to spawn soldiers in (Number)
	- Percentage (0 to 1) to spawn a static on avaliable building position, depending on specific structure (Number)

Example:
   
    [[0,0,0], 100, 0.05] call InA_fnc_indGarrison

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- Parameters ----------

params ["_loc", ["_rad", 100, [0]], ["_garrisonPercent", 0.05, [0]], ["_staticPercent", 0.05, [0]],
["_parkedTrucks", 1, [0]],["_parkedCars", 1, [0]]];

// ---------- Init ----------
private ["_buildings","_array","_bldg","_group","_pos","_dir","_obj","_car"];

_buildings = nearestObjects [
	_loc, 
	[
		"HOUSE",
		"BUNKER",
		"FORTRESS",
		"LIGHTHOUSE"
	], 
	_rad
];

if ((count _buildings) < 1) exitWith {hint "no garrison buildings found";};

// ---------- Spawn in buildings ----------

_array = [];
{
	_bldg = [_x] call BIS_fnc_buildingPositions;
	_array = _array + _bldg;
} forEach _buildings;

{
	if (random 100 < (_garrisonPercent * 100)) then {
		
		_group = [
			_x, 
			INDEPENDENT, 
			[
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
		_group setFormDir (random 360);
		[_group, _x] call BIS_fnc_taskDefend;
		[units _group] call InA_fnc_insCustomize;
		
	};
} forEach _array;

// ---------- Spawn statics ----------

{
	if (random 100 < (_staticPercent * 100)) then {
		
		_pos = [getPosATL _x, 0, 30, 1, 0, 1, 0] call BIS_fnc_findSafePos;
		_dir =  (getPosATL _x) getDir _pos;
		_obj = ObjNull;
		
		if (supplier == "BLU") then {
			_obj = createVehicle [(selectRandom INS_STATIC_HMG_BLU), _pos,[],0,"NONE"];
		} else {
			_obj = createVehicle [(selectRandom INS_STATIC_HMG_OPF), _pos,[],0,"NONE"];
		};
			
		_obj setDir _dir;
		_obj setPos [_pos select 0, _pos select 1, 0];
		
		_group = [
			[0,0,0], 
			INDEPENDENT, 
			[
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
		(units _group select 0) moveInTurret [_obj, [0]];
		[units _group] call InA_fnc_insCustomize;
	};
} forEach _buildings;

// ---------- Spawn ambient vehicles ----------

_allRoads = _loc nearRoads _rad;

{
	_connectedRoads = roadsConnectedTo _x;
	if ((count _connectedRoads) > 2) then {
		_allRoads = _allRoads - [_x];
	};
} forEach _allRoads;

if (count _allRoads < 3) exitWith { /*hint "no roads nearby";*/};

for "_i" from 1 to _parkedTrucks do {
	
		_road = selectRandom _allRoads;
		_connectedTo = ((roadsConnectedTo _road) select 0);
		_dir = 0;
		_car = ObjNull;
		
		if (random 1 < 0.5) then {
			if (count (roadsConnectedTo _road) > 0) then {
				_dir = _road getDir _connectedTo;
			} else {
				_dir = random 360
			};
			
			if (supplier == "BLU") then {
				_car = createVehicle [(selectRandom INS_TRUCK_BLU), _road, [], 0, "CAN_COLLIDE"];
			} else {
				_car = createVehicle [(selectRandom INS_TRUCK_OPF), _road, [], 0, "CAN_COLLIDE"];
			};
			_car setDir _dir;
			_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];
		} else {
			if (count (roadsConnectedTo _road) > 0) then {
				_dir = _road getDir _connectedTo;
			} else {
				_dir = random 360
			};
			_car setDir _dir;
			_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];		
		};
		
		clearBackpackCargoGlobal _car;
		clearMagazineCargoGlobal _car;
		clearWeaponCargoGlobal _car;
		clearItemCargoGlobal _car;
};

for "_i" from 1 to _parkedCars do {
	
		_road = selectRandom _allRoads;
		_connectedTo = ((roadsConnectedTo _road) select 0);
		_dir = 0;
		_car = ObjNull;
		
		if (random 1 < 0.5) then {
			if (count (roadsConnectedTo _road) > 0) then {
				_dir = _road getDir _connectedTo;
			} else {
				_dir = random 360
			};
			
			if (supplier == "BLU") then {
				_car = createVehicle [(selectRandom INS_CARU_BLU), _road, [], 0, "CAN_COLLIDE"];
				[
					_car,
					INS_CARU_OPF_TEX,
					INS_CARU_OPF_ANI
				] call BIS_fnc_initVehicle;
			} else {
				_car = createVehicle [(selectRandom INS_CARU_OPF), _road, [], 0, "CAN_COLLIDE"];
				[
					_car,
					INS_CARU_BLU_TEX,
					INS_CARU_BLU_ANI
				] call BIS_fnc_initVehicle;
			};
			_car setDir _dir;
			_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];
		} else {
			if (count (roadsConnectedTo _road) > 0) then {
				_dir = _road getDir _connectedTo;
			} else {
				_dir = random 360
			};

			_car setDir _dir;
			_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];		
		};
		
		clearBackpackCargoGlobal _car;
		clearMagazineCargoGlobal _car;
		clearWeaponCargoGlobal _car;
		clearItemCargoGlobal _car;
};