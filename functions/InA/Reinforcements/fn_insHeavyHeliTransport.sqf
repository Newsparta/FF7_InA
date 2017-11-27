/* ----------
Function: InA_fnc_insHeavyHeliTransport

Description:
    A function to spawn a helicopter with crew and passengers to attack an area

Parameters:
    - Center Location (Position)

Optional:
    - Minimum distance from the center to spawn (Number)
    - Maximum distance from center to place move/guard waypoint (Number)
	- Number to spawn (Number)
	- Time to delay the spawning (Number)

Example:
   
    [[0,0,0], 3000, 250, 1, 0] spawn InA_fnc_insHeavyHeliTransport

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- PARAMETERS ----------

params ["_center",["_min", 3000, [0]], ["_wpMax", 250, [0]], ["_s", 1, [0]], ["_delay", 0, [0]],["_awareness", "SAFE", [""]],["_speed", "LIMITED", [""]]];

// ---------- MAIN ----------
private ["_pos","_heli","_group","_wp","_fill"];

sleep _delay;

	for "_x" from 1 to _s do {
		
		_accepted = false;
		while {!_accepted} do {
		
			_pos = [_center, _min, (_min + 250), 3, 0, 20, 0] call BIS_fnc_findSafePos;
	
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
		_heli = objNull;
		if (supplier == "BLU") then {
			_heli = createVehicle [(selectRandom INS_HEAVY_HELI_TR_BLU), _pos, [], 0, "FLY"];
			[
				_heli,
				missionNamespace getVariable ["INS_HEAVY_HELI_TR_BLU_TEX", nil],
				missionNamespace getVariable ["INS_HEAVY_HELI_TR_BLU_ANI", nil]
			] call BIS_fnc_initVehicle;
		} else {
			_heli = createVehicle [(selectRandom INS_HEAVY_HELI_TR_OPF), _pos, [], 0, "FLY"];
			[
				_heli,
				missionNamespace getVariable ["INS_HEAVY_HELI_TR_OPF_TEX", nil],
				missionNamespace getVariable ["INS_HEAVY_HELI_TR_OPF_ANI", nil]
			] call BIS_fnc_initVehicle;
		};
		_group = [
			_pos,
			INDEPENDENT, 
			[
				(selectRandom INS_INF_HELIPILOT)
			]
		] call BIS_fnc_spawnGroup;
		((units _group) select 0) assignAsDriver _heli;
		((units _group) select 0) moveInDriver _heli;
		{
			_fill = [
				_pos,
				INDEPENDENT, 
				[
					(selectRandom INS_INF_HELIPILOT)
				]
			] call BIS_fnc_spawnGroup;
				((units _fill) select 0) assignAsTurret [_heli, _x];
				((units _fill) select 0) moveInTurret [_heli, _x];
				(units _fill) join _group;
		} forEach (allTurrets _heli);

		_wp = _group addWaypoint [_center, _wpMax];
		_wp setWaypointType "TR UNLOAD";
		_wp setWaypointSpeed _speed;
		_wp setWaypointBehaviour _awareness;
		_wp = _group addWaypoint [_center, _wpMax];
		_wp setWaypointType "GUARD";
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
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
			((units _group) select 0) assignAsCargo _heli;
			((units _group) select 1) assignAsCargo _heli;
			((units _group) select 2) assignAsCargo _heli;
			((units _group) select 3) assignAsCargo _heli;
			((units _group) select 4) assignAsCargo _heli;
			((units _group) select 5) assignAsCargo _heli;
			((units _group) select 6) assignAsCargo _heli;
			((units _group) select 7) assignAsCargo _heli;
			((units _group) select 0) moveInCargo _heli;
			((units _group) select 1) moveInCargo _heli;
			((units _group) select 2) moveInCargo _heli;
			((units _group) select 3) moveInCargo _heli;
			((units _group) select 4) moveInCargo _heli;
			((units _group) select 5) moveInCargo _heli;
			((units _group) select 6) moveInCargo _heli;
			((units _group) select 7) moveInCargo _heli;
		_wp = _group addWaypoint [_center, _wpMax];
		_wp setWaypointType "GUARD";
		_wp setWaypointSpeed _speed;
		_wp setWaypointBehaviour _awareness;
		[units _group] call InA_fnc_insCustomize;
	};