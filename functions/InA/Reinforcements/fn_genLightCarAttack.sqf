/* ----------
Function: InA_fnc_genLightCarAttack

Description:
    A function to spawn a car with crew and passengers to attack an area

Parameters:
    - Center Location (Position)

Optional:
    - Minimum distance from the center to spawn (Number)
    - Maximum distance from center to place move/guard waypoint (Number)
	- Number to spawn (Number)
	- Time to delay the spawning (Number)

Example:
   
    [[0,0,0], 1500, 250, 1, 0] spawn InA_fnc_genLightCarAttack

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- PARAMETERS ----------

params ["_center",["_min", 1500, [0]], ["_wpMax", 250, [0]], ["_s", 1, [0]], ["_delay", 0, [0]]];

// ---------- MAIN ----------
private ["_pos","_car","_group","_wp"];

sleep _delay;

	for "_x" from 1 to _s do {
		_pos = [_center, _min, (_min + 100), 5, 0, 1, 0] call BIS_fnc_findSafePos;
		_car = "B_GEN_Offroad_01_gen_F" createVehicle _pos;
		_group = [
			_pos, 
			WEST, 
			[
				"B_GEN_Commander_F",
				"B_GEN_Soldier_F",
				"B_GEN_Soldier_F"
			]
		] call BIS_fnc_spawnGroup;
			((units _group) select 0) assignAsDriver _car;
			((units _group) select 1) assignAsCargo _car;
			((units _group) select 2) assignAsCargo _car;
			((units _group) select 0) moveInDriver _car;
			((units _group) select 1) moveInCargo _car;
			((units _group) select 2) moveInCargo _car;
		
	_wp = _group addWaypoint [[_center, 0, _wpMax, 1, 0, 20, 0] call BIS_fnc_findSafePos, 0];
	_wp setWaypointType "GUARD";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointCompletionRadius 25;
	[units _group] call InA_fnc_setSkill;
	};