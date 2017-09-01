// ---------- Arguments ----------

params ["_loc",["_rad", 500,[0]]];
private ["_tPos","_accepted","_pos","_net","_target","_xPos","_yPos","_zDir","_i","_obj"];

// ---------- Main ----------

_tPos = [];
_accepted = false;
while {!_accepted} do {
	_pos = [[[_loc,_rad]],["water","out"]] call BIS_fnc_randomPos;
	_tPos = _pos isFlatEmpty [1, 0, 0.2, 4, 0, false];
	
	_roads = nearestTerrainObjects [_pos, ["ROAD","MAIN ROAD"], 30];

	if (count _tPos > 2) then {
		if (count _roads < 1) then {
			_accepted = true;
		};
	};
};
_net = INS_CAMONET createVehicle _pos;
waitUntil {alive _net};
_net allowDamage false;
_net setDir (random 360);
_net setPos [_pos select 0, _pos select 1, 0];

_target = _net;
_loc = getPosATL _net;

spawnedObj pushBack ["fuel depot", _loc];

_xPos = [-5.309,-5.309,-5.894,-5.748,-5.500,-5.222,-4.373,-3.515,-3.737,-5.309,-4.938,-4.276,-4.709,2.160,2.592,2.769,3.159,3.322,3.731,3.526,3.948,4.346,4.992,4.150];
_yPos = [-2.187,-2.187,-2.476,-1.777,1.655,2.729,2.897,2.826,1.188,-2.187,1.944,1.926,1.250,0.623,1.075,0.462,0.931,0.341,0.808,-0.248,0.234,0.715,0.095,-0.405];

for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
	
	_obj = createVehicle ["Land_MetalBarrel_F",[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-0.5
		]
	];
	detach _obj;
	_obj setDir (random 360);
	sleep 0.1;
};

_obj = createVehicle ["Land_WoodenCrate_01_stack_x5_F",[0,0,0],[],0,"CAN_COLLIDE"];
_obj attachTo [_net, 
	[
		-0.055,
		-2.298,
		-0.25
	]
];
detach _obj;
_obj setDir (direction _net + 352.792);

_obj = createVehicle ["Land_WoodenCrate_01_stack_x3_F",[0,0,0],[],0,"CAN_COLLIDE"];
_obj attachTo [_net, 
	[
		-0.371,
		-0.681,
		-0.5
	]
];
detach _obj;
_obj setDir (direction _net + 265.590);

// ---------- ENEMIES ----------
private ["_pos","_group"];

	// ---------- GENERIC LARGE SPAWN ----------

	for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.1) do {
		_pos = [_net, 0, 50, 1, 0, 50, 0] call BIS_fnc_findSafePos;
		_group = [
			_pos, 
			INDEPENDENT,
			[
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
		[_group, _pos] call BIS_fnc_taskDefend;
		_group setFormDir (random 360);
		[units _group] call InA_fnc_insCustomize;
	};

	for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.1) do {
		_pos = [_net, 0, 75, 1, 0, 50, 0] call BIS_fnc_findSafePos;
		_group = [
				_pos, 
				INDEPENDENT,
				[
					(selectRandom INS_INF_SINGLE),
					(selectRandom INS_INF_SINGLE),
					(selectRandom INS_INF_SINGLE),
					(selectRandom INS_INF_SINGLE),
					(selectRandom INS_INF_SINGLE),
					(selectRandom INS_INF_SINGLE),
					(selectRandom INS_INF_SINGLE),
					(selectRandom INS_INF_SINGLE)
				]
			] call BIS_fnc_spawnGroup;
		[_group, _pos, 250] call BIS_fnc_taskPatrol;
		[units _group] call InA_fnc_insCustomize;
	};
	
	// ---------- SMALL PATROLS ----------

	for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.05) do {
		if (random 100 < random 50) then {
			_pos = [_net, 200, 300, 0, 0, 50, 0] call BIS_fnc_findSafePos;
			_group = [
			_pos, 
			INDEPENDENT,
			[
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
			[_group, _pos, 250] call BIS_fnc_taskPatrol;
			[units _group] call InA_fnc_insCustomize;
		};
	};

	for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.05) do {
		if (random 100 < random 40) then {
			_pos = [_net, 200, 300, 0, 0, 50, 0] call BIS_fnc_findSafePos;
			_group = [
			_pos, 
			INDEPENDENT,
			[
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
			[_group, _pos, 250] call BIS_fnc_taskPatrol;
			[units _group] call InA_fnc_insCustomize;
		};
	};

	for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.05) do {
		if (random 100 < random 30) then {
			_pos = [_net, 200, 300, 0, 0, 50, 0] call BIS_fnc_findSafePos;
			_group = [
			_pos, 
			INDEPENDENT,
			[
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
			[_group, _pos, 250] call BIS_fnc_taskPatrol;
			[units _group] call InA_fnc_insCustomize;
		};
	};

	for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.05) do {
		if (random 100 < random 20) then {
			_pos = [_net, 200, 300, 0, 0, 50, 0] call BIS_fnc_findSafePos;
			_group = [
			_pos, 
			INDEPENDENT,
			[
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
			[_group, _pos, 250] call BIS_fnc_taskPatrol;
			[units _group] call InA_fnc_insCustomize;
		};
	};
	
	// ---------- AMBIENT VEHICLES ----------
	
	for "_i" from 0 to 1 do {
		if (floor (random 100) < 50) then {
			_pos = [_net, 50, 100, 1, 0, 1, 0] call BIS_fnc_findSafePos;
			_car = objNull;
			if (supplier == "BLU") then {
				_car = (selectRandom INS_TRUCK_BLU) createVehicle _pos;
			} else {
				_car = (selectRandom INS_TRUCK_OPF) createVehicle _pos;
			};
			_car setDir (random 360);
		};
	};
	
// ---------- END ----------

[_target] spawn {

	_target = _this select 0;
	
	while {InA_missionActive} do {
	
		sleep (2 + (random 2));
		
		_virgin = false;
		
		if ({_x distance _target < 50} count (allPlayers - entities "HeadlessClient_F") > 0) then {
		
			_virgin = true;
			
			_z = random 1;
			
			while {true} do {
				scopeName format ["target%1",_z];
				
				sleep (2 + (random 2));
				
				if (_virgin && {({alive _x} count (nearestObjects [_target, ["Land_MetalBarrel_F"], 250])) < 12}) then {
					
					signalArray pushBack _target;
					signalType pushBack "fuelDepot";
					_virgin = false;
				};
				
				if ({_x distance _target < 50} count (allPlayers - entities "HeadlessClient_F") < 1) then {
					if !(_virgin) then {
						signalArray = signalArray - [_target];
						signalType = signalType - ["fuelDepot"];
					};
					
					breakOut format ["target%1",_z];
				};
			};
		};
	};
};