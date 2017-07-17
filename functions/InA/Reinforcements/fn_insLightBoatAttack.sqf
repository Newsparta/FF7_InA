/* ----------
Function: InA_fnc_insLightBoatAttack

Description:
    A function to spawn a boat with crew and passengers to attack an area

Parameters:
    - Center Location (Position)

Optional:
    - Minimum distance from the center to spawn (Number)
    - Maximum distance from center to place move/guard waypoint (Number)
	- Number to spawn (Number)
	- Time to delay the spawning (Number)

Example:
   
    [[0,0,0], 1500, 250, 1, 0] spawn InA_fnc_insLightBoatAttack

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- PARAMETERS ----------

params ["_center",["_min", 1500, [0]], ["_wpMax", 250, [0]], ["_s", 1, [0]], ["_delay", 0, [0]],["_awareness", "SAFE", [""]],["_speed", "LIMITED", [""]]];

// ---------- MAIN ----------
private ["_accepted","_isNear","_pos","_boat","_group","_wp"];

sleep _delay;

	for "_x" from 1 to _s do {
		
		_accepted = false;
		while {!_accepted} do {
		
			_pos = [_center, _min, (_min + 250), 0, 2, 20, 0] call BIS_fnc_findSafePos;
	
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
		_boat = objNull;
		if (supplier == "BLU") then {
			_boat = (selectRandom INS_BOAT_BLU) createVehicle _pos;
			[
				_boat,
				INS_BOAT_BLU_TEX,
				INS_BOAT_BLU_ANI
			] call BIS_fnc_initVehicle;
		} else {
			_boat = (selectRandom INS_BOAT_OPF) createVehicle _pos;
			[
				_boat,
				INS_BOAT_OPF_TEX,
				INS_BOAT_OPF_ANI
			] call BIS_fnc_initVehicle;
		};
		_group = [
			_pos, 
			INDEPENDENT, 
			[
				(selectRandom INS_INF_HELIPILOT)
			]
		] call BIS_fnc_spawnGroup;
			((units _group) select 0) moveInDriver _boat;

		_wp = _group addWaypoint [_center, _wpMax];
		_wp setWaypointType "TR UNLOAD";
		_wp setWaypointSpeed _speed;
		_wp setWaypointBehaviour _awareness;
		[units _group] call InA_fnc_insCustomize;

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
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
			((units _group) select 0) assignAsCargo _boat;
			((units _group) select 1) assignAsCargo _boat;
			((units _group) select 2) assignAsCargo _boat;
			((units _group) select 3) assignAsCargo _boat;
			((units _group) select 4) assignAsCargo _boat;
			((units _group) select 5) assignAsCargo _boat;
			((units _group) select 6) assignAsCargo _boat;
			((units _group) select 0) moveInCargo _boat;
			((units _group) select 1) moveInCargo _boat;
			((units _group) select 2) moveInCargo _boat;
			((units _group) select 3) moveInCargo _boat;
			((units _group) select 4) moveInCargo _boat;
			((units _group) select 5) moveInCargo _boat;
			((units _group) select 6) moveInCargo _boat;
		_wp = _group addWaypoint [_center, _wpMax];
		_wp setWaypointType "GUARD";
		_wp setWaypointSpeed _speed;
		_wp setWaypointBehaviour _awareness;
		[units _group] call InA_fnc_insCustomize;
	};