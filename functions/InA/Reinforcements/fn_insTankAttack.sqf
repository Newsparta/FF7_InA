/* ----------
Function: InA_fnc_insApcTransport

Description:
    A function to spawn a tank with crew to attack an area

Parameters:
    - Center Location (Position)

Optional:
    - Minimum distance from the center to spawn (Number)
    - Maximum distance from center to place move/guard waypoint (Number)
	- Number to spawn (Number)
	- Time to delay the spawning (Number)

Example:
   
    [[0,0,0], 1500, 250, 1, 0] spawn InA_fnc_insApcTransport

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- PARAMETERS ----------

params ["_center",["_min", 1500, [0]], ["_wpMax", 250, [0]], ["_s", 1, [0]], ["_delay", 0, [0]],["_awareness", "SAFE", [""]],["_speed", "LIMITED", [""]]];

// ---------- MAIN ----------
private ["_accepted","_isNear","_pos","_tank","_group","_wp"];

sleep _delay;

	for "_x" from 1 to _s do {
		
		_accepted = false;
		while {!_accepted} do {
		
			_pos = [_center, _min, (_min + 100), 5, 0, 1, 0] call BIS_fnc_findSafePos;
	
			_isNear = false;

			{
				if ((_x distance _pos) < 500) then {
					_isNear = true;
				};
			} forEach (allPlayers - entities "HeadlessClient_F");
			
			if !(_isNear) then {
				_accepted = true;
			};
		};
		
		if (count _pos > 2) exitWith {};
		_tank = objNull;
		if (supplier == "BLU") then {
			_tank = (selectRandom INS_TANK_BLU) createVehicle _pos;
			[
				_tank,
				missionNamespace getVariable ["INS_TANK_BLU_TEX", nil],
				missionNamespace getVariable ["INS_TANK_BLU_ANI", nil]
			] call BIS_fnc_initVehicle;
		} else {
			_tank = (selectRandom INS_TANK_OPF) createVehicle _pos;
			[
				_tank,
				missionNamespace getVariable ["INS_TANK_OPF_TEX", nil],
				missionNamespace getVariable ["INS_TANK_OPF_ANI", nil]
			] call BIS_fnc_initVehicle;
		};
		_tank lock 3;
		_group = [
			_pos, 
			INDEPENDENT, 
			[
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
			((units _group) select 0) assignAsDriver _tank;
			((units _group) select 1) assignAsGunner _tank;
			((units _group) select 2) assignAsCommander _tank;
			((units _group) select 0) moveInDriver _tank;
			((units _group) select 1) moveInGunner _tank;
			((units _group) select 2) moveInCommander _tank;
		_wp = _group addWaypoint [[_center, 0, _wpMax, 1, 0, 20, 0] call BIS_fnc_findSafePos, 0];
		_wp setWaypointType "GUARD";
		_wp setWaypointSpeed _speed;
		_wp setWaypointBehaviour _awareness;
		_wp setWaypointCompletionRadius 25;
		[units _group] call InA_fnc_insCustomize;
	};