// ---------- Arguments ----------

params ["_loc",["_rad", (250 + random 1000),[0]]];
private ["_tPos","_accepted","_pos","_net","_target","_xPos","_yPos","_zDir","_i","_obj"];

// ---------- Main ----------

_tPos = [];
_accepted = false;
while {!_accepted} do {
	_pos = [[[_loc,_rad]],["water","out"]] call BIS_fnc_randomPos;
	_tPos = _pos isFlatEmpty [2, 0, 0.2, 5, 0, false];
	
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

_veh = createVehicle [(selectRandom INS_STATIC_AAA_OPF), [_pos select 0, _pos select 1, 0], [], 0, "CAN_COLLIDE"];
_target = _veh;

_loc = getPosATL _veh;

spawnedObj pushBack ["AAA", _loc];

_xPos = [-7.342,-2.664,2.151,7.149,2.325,-2.221];
_yPos = [-2.929,5.369,5.359,2.651,-5.657,-5.836];
_zDir = [72.986,184.274,170.930,240.171,2.847,353.591];

for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
	
	_obj = createVehicle ["Land_Trench_01_grass_F",[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-1.9
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

_xPos = [-5.805,-1.564,1.734,5.910,1.528,-2.334];
_yPos = [-1.947,3.509,3.535,1.294,-3.848,-4.136];
_zDir = [252.469,184.390,355.182,59.442,181.420,171];

for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
	
	_obj = createVehicle [INS_SANDBAG_LONG,[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-0.8
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

_xPos = [-4.599,4.227];
_yPos = [-3.917,3.351];
_zDir = [32.002,205.769];

for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
	
	_obj = createVehicle [INS_SANDBAG_ROUND,[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-0.8
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

_xPos = [-3.821,3.725];
_yPos = [3.797,-3.934];
_zDir = [189.749,184.830];

for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
	
	_obj = createVehicle [INS_SANDBAG_SHORT,[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-0.8
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

// ---------- ENEMIES ----------
private ["_pos","_group"];
	
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

[_target,_loc] spawn {

	_target = _this select 0;
	_loc = _this select 1;
	
	while {InA_missionActive} do {
	
		sleep (2 + (random 2));
		
		_virgin = false;
		
		if ({_x distance _loc < 50} count (allPlayers - entities "HeadlessClient_F") > 0) then {
		
			_virgin = true;
			
			_z = random 1;
			
			while {true} do {
				scopeName format ["target%1",_z];
				
				sleep (2 + (random 2));
				
				if (_virgin && {!alive _target}) then {
					
					signalArray pushBack _target;
					signalType pushBack "AAAEmplacement";
					_virgin = false;
				};
				
				if ({_x distance _loc < 50} count (allPlayers - entities "HeadlessClient_F") < 1) then {
					if !(_virgin) then {
						signalArray = signalArray - [_target];
						signalType = signalType - ["AAAEmplacement"];
					};
					
					breakOut format ["target%1",_z];
				};
			};
		};
	};
};