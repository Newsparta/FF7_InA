// ---------- Arguments ----------

params ["_loc",["_virgin", true,[true]],["_rad", 500,[0]]];
private ["_tPos","_accepted","_pos","_net","_target","_xPos","_yPos","_zDir","_i","_obj"];

// ---------- Main ----------

_pos = [];

/*
Select objective location, using mission location if virgin or input location if not.
*/

if (_virgin) then {
	_pos = [_loc, 0, _rad, 0, 0, 1, 0] call BIS_fnc_findSafePos;
} else {
	_pos = _loc;
};

// ---------- insert spawn into memory ----------

mainObj pushBack ["HVTOfficer",_pos];

/*
Loop for spawning objective when players are near.
*/

while {!InA_missionCompleted} do {

	sleep (2 + (random 2));

	if ({_x distance mission < mainLimit} count (allPlayers - entities "HeadlessClient_F") > 0) then {

		///////////////////////////
		// objective spawn start //
		///////////////////////////

		_group = 
		[
			_pos, 
			INDEPENDENT,
			[
				INS_INF_OFFICER select 0,
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;

		_target = (units _group) select 0;
		_loc = getPosATL _target;

		spawnedObj pushBack ["officer", _loc];

		[_group, _pos, 50] call BIS_fnc_taskPatrol;
		[units _group] call InA_fnc_insCustomize;
		_group setBehaviour "SAFE";

		/////////////////////////
		// objective spawn end //
		/////////////////////////

		// ---------- target confirmation ----------

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
						
						if (_virgin && {!alive _target}) then {
							signalArray pushBack _target;
							signalType pushBack "HVTOfficer";
							_virgin = false;
						};
						
						if ({_x distance _target < 50} count (allPlayers - entities "HeadlessClient_F") < 1) then {
							if !(_virgin) then {
								signalArray = signalArray - [_target];
								signalType = signalType - ["HVTOfficer"];
							};
							
							breakOut format ["target%1",_z];
						};
					};
				};
			};
		};

		// ---------- near objective pause loop ----------

		while {true} do {
			scopeName "obj_off";

			sleep (2 + (random 2));

			if ({_x distance mission < mainLimit} count (allPlayers - entities "HeadlessClient_F") < 1) then {
				breakOut "obj_off";
			};

		};

	};

};