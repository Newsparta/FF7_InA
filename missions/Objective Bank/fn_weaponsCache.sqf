// ---------- Arguments ----------

params ["_loc",["_virgin", true,[true]],["_rad", (250 + random 1000),[0]]];
private ["_tPos","_accepted","_pos","_net","_target","_xPos","_yPos","_zDir","_i","_obj"];
#define CRATES "Box_Syndicate_WpsLaunch_F","Box_Syndicate_Wps_F","Box_IED_Exp_F","Box_Syndicate_Ammo_F"

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
		_tPos = _pos isFlatEmpty [-1, 0, 0.6, 4, 0, false];
		
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

mainObj pushBack ["weaponsCache",_pos];

/*
Loop for spawning objective when players are near.
*/

while {!InA_missionCompleted} do {

	sleep (2 + (random 2));

	if ({_x distance mission < mainLimit} count (allPlayers - entities "HeadlessClient_F") > 0) then {

		///////////////////////////
		// objective spawn start //
		///////////////////////////

		_net = INS_CAMONET createVehicle _pos;
			waitUntil {alive _net};
			_net allowDamage false;
			_net setDir (random 360);
			_net setPos [_pos select 0, _pos select 1, 0];
			
		_target = ([CRATES] call BIS_fnc_selectRandom) createVehicle _pos;
		_loc = getPosATL _net;

		spawnedObj pushBack ["weapons cache", _loc];

		clearWeaponCargoGlobal _target;

		for "_x" from 1 to 10 do {
			_pos2 = [[[_pos,5]],["water","out"]] call BIS_fnc_randomPos;
			_crate = ([CRATES] call BIS_fnc_selectRandom) createVehicle _pos;
			waitUntil {alive _crate};
			_crate setPos [_pos2 select 0, _pos2 select 1, 2];
			_crate setDir (random 360);
			clearBackpackCargoGlobal _crate;
			clearWeaponCargoGlobal _crate;
			
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
							signalType pushBack "weaponsCache";
							_virgin = false;
						};
						
						if ({_x distance _net < 50} count (allPlayers - entities "HeadlessClient_F") < 1) then {
							if !(_virgin) then {
								signalArray = signalArray - [_target];
								signalType = signalType - ["weaponsCache"];
							};
							
							breakOut format ["target%1",_z];
						};
					};
				};
			};
		};

		// ---------- near objective pause loop ----------

		while {true} do {
			scopeName "obj_wea";

			sleep (2 + (random 2));

			if ({_x distance mission < mainLimit} count (allPlayers - entities "HeadlessClient_F") < 1) then {
				breakOut "obj_wea";
			};

		};

	};

};