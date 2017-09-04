// ---------- Arguments ----------

params ["_loc",["_virgin", true,[true]],["_rad",750,[0]]];
private ["_tPos","_accepted","_pos","_obj","_target","_xPos","_yPos","_zDir","_i","_obj"];

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
		_tPos = _pos isFlatEmpty [10, 0, 0.1, 10, 0, false];
		
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

mainObj pushBack ["barracksStructure",_pos];

/*
Loop for spawning objective when players are near.
*/

while {!InA_missionCompleted} do {

	sleep (2 + (random 2));

	if ({_x distance mission < mainLimit} count (allPlayers - entities "HeadlessClient_F") > 0) then {

		///////////////////////////
		// objective spawn start //
		///////////////////////////

		_obj = "Land_Barracks_01_dilapidated_F" createVehicle _pos;
		waitUntil {alive _obj};
		_obj setDir (random 360);
		_obj setPos [_pos select 0, _pos select 1, 0];
		_loc = getPosATL _obj;

		spawnedObj pushBack ["barracks", _loc];

		// ---------- ENEMIES ----------
		private ["_pos","_group"];

			// ---------- GENERIC LARGE SPAWN ----------

			for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.1) do {
				_pos = [_obj, 0, 75, 1, 0, 50, 0] call BIS_fnc_findSafePos;
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
				[_group, _pos, 100] call BIS_fnc_taskPatrol;
				[units _group] call InA_fnc_insCustomize;
			};
			
		[_loc, 20, 0.25] call InA_fnc_indGarrison;

		/////////////////////////
		// objective spawn end //
		/////////////////////////

		// ---------- target confirmation ----------

		[_loc] spawn {

			_loc = _this select 0;
			
			while {InA_missionActive} do {
			
				sleep (2 + (random 2));
				
				_virgin = false;
				
				if ({_x distance _loc < 100} count (allPlayers - entities "HeadlessClient_F") > 0) then {
				
					_virgin = true;
					
					_z = random 1;
					
					while {true} do {
						scopeName format ["target%1",_z];
						
						sleep (2 + (random 2));
						
						_array = nearestObjects [_loc, ["Land_Barracks_ruins_F"], 100];
						_obj = ObjNull;
						
						if (_virgin && {count _array > 0}) then {
							
							_obj = _array select 0;
							signalArray pushBack _obj;
							signalType pushBack "barracksStructure";
							_virgin = false;
						};
						
						if ({_x distance _loc < 50} count (allPlayers - entities "HeadlessClient_F") < 1) then {
							if !(_virgin) then {
								signalArray = signalArray - [_obj];
								signalType = signalType - ["barracksStructure"];
							};
							
							breakOut format ["target%1",_z];
						};
					};
				};
			};
		};

		// ---------- near objective pause loop ----------

		while {true} do {
			scopeName "obj_BS";

			sleep (2 + (random 2));

			if ({_x distance mission < mainLimit} count (allPlayers - entities "HeadlessClient_F") < 1) then {
				breakOut "obj_BS";
			};

		};
	};
};