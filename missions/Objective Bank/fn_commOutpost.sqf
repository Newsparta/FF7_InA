// ---------- Arguments ----------

params ["_loc",["_virgin", true,[true]],["_rad", 500,[0]]];
private ["_tPos","_accepted","_pos","_net","_target","_xPos","_yPos","_zDir","_i","_obj"];

// ---------- Main ----------

_pos = [];

/*
Select objective location, using mission location if virgin or input location if not.
*/

if (_virgin) then {
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
} else {
	_pos = _loc;
};

// ---------- insert spawn into memory ----------

mainObj pushBack ["commOutpost",_pos];

/*
Loop for spawning objective when players are near.
*/

while {!InA_missionCompleted} do {

	sleep (2 + (random 2));

	if ({_x distance mission < mainLimit} count (allPlayers - entities "HeadlessClient_F") > 0) then {

		///////////////////////////
		// objective spawn start //
		///////////////////////////

		_net = "Land_IRMaskingCover_02_F" createVehicle _pos;
		waitUntil {alive _net};
		_net allowDamage false;
		_net setDir (random 360);
		_net setPos [_pos select 0, _pos select 1, 0];

		_loc = getPosATL _net;

		spawnedObj pushBack ["comm outpost", _loc];

		_xPos = [-2.268,1.458,5.474];
		_yPos = [2.518,2.326,0.032];
		_zDir = [266,275,182];

		for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
			
			_obj = createVehicle ["Land_WoodenTable_large_F",[0,0,0],[],0,"CAN_COLLIDE"];
			_obj attachTo [_net, 
				[
					(_xPos select _i),
					(_yPos select _i),
					-0.5
				]
			];
			detach _obj;
			_obj setDir (direction _net + (_zDir select _i));
			sleep 0.1;
		};

		_xPos = [0.979,4.607,-2.491];
		_yPos = [1.423,0.151,-1.349];
		_zDir = [157,263,0];

		for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
			
			_obj = createVehicle ["Land_CampingChair_V2_F",[0,0,0],[],0,"CAN_COLLIDE"];
			_obj attachTo [_net, 
				[
					(_xPos select _i),
					(_yPos select _i),
					-0.5
				]
			];
			detach _obj;
			_obj setDir (direction _net + (_zDir select _i));
			sleep 0.1;
		};

		_obj = createVehicle ["Land_SatelliteAntenna_01_F",[0,0,0],[],0,"CAN_COLLIDE"];
		_obj attachTo [_net, 
			[
				-4.835,
				-1.098,
				-0.25
			]
		];
		detach _obj;
		_obj setDir (direction _net + 279);

		_target = createVehicle ["Land_MetalBarrel_F",[0,0,0],[],0,"CAN_COLLIDE"];
		_target attachTo [_net, 
			[
				-4.835,
				-1.098,
				-0.25
			]
		];
		detach _target;
		_target setDir (direction _net + 279);
		_target enableSimulationGlobal false;
		[_target, true] remoteExec ["hideObject", 0, true];

		_obj = createVehicle ["Land_TripodScreen_01_dual_v1_F",[0,0,0],[],0,"CAN_COLLIDE"];
		_obj attachTo [_net, 
			[
				-4.334,
				-0.703,
				-0.25
			]
		];
		detach _obj;
		_obj setDir (direction _net + 73);

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

		/////////////////////////
		// objective spawn end //
		/////////////////////////

		// ---------- target confirmation ----------

		[_target, _net] spawn {

			_target = _this select 0;
			_net = _this select 1;
			
			while {InA_missionActive} do {
			
				sleep (2 + (random 2));
				
				_virgin = false;
				
				if ({_x distance _net < 50} count (allPlayers - entities "HeadlessClient_F") > 0) then {
				
					_virgin = true;
					
					_z = random 1;
					
					while {true} do {
						scopeName format ["target%1",_z];
						
						sleep (2 + (random 2));
						
						if (_virgin && {!alive _target}) then {
							
							signalArray pushBack _target;
							signalType pushBack "commOutpost";
							_virgin = false;
						};
						
						if ({_x distance _net < 50} count (allPlayers - entities "HeadlessClient_F") < 1) then {
							if !(_virgin) then {
								signalArray = signalArray - [_target];
								signalType = signalType - ["commOutpost"];
							};
							
							breakOut format ["target%1",_z];
						};
					};
				};
			};
		};

		// ---------- near objective pause loop ----------

		while {true} do {
			scopeName "obj_comm";

			sleep (2 + (random 2));

			if ({_x distance mission < mainLimit} count (allPlayers - entities "HeadlessClient_F") < 1) then {
				breakOut "obj_comm";
			};

		};

	};

};