/* ----------
Function: InA_fnc_insMediumTruckTransport

Description:
    A function to spawn a truck with crew and passengers to drop off reinforcements in an area

Parameters:
    - Center Location (Position)

Optional:
    - Minimum distance from the center to spawn (Number)
    - Maximum distance from center to place move/guard waypoint (Number)
	- Number to spawn (Number)
	- Time to delay the spawning (Number)

Example:
   
    [[0,0,0], 1500, 250, 1, 0] spawn InA_fnc_insMediumTruckTransport

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- PARAMETERS ----------

params ["_center",["_min", 1500, [0]], ["_wpMax", 250, [0]], ["_s", 1, [0]], ["_delay", 0, [0]],["_awareness", "SAFE", [""]],["_speed", "LIMITED", [""]]];

// ---------- MAIN ----------
private ["_accepted","_isNear","_pos","_truck","_group","_wp"];

sleep _delay;

	for "_x" from 1 to _s do {
		
		_accepted = false;
		while {!_accepted} do {
		
			_pos = [_center, _min, (_min + 250), 5, 0, 1, 0] call BIS_fnc_findSafePos;
	
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
		_truck = objNull;
		if (supplier == "BLU") then {
			_truck = (selectRandom INS_TRUCK_BLU) createVehicle _pos;
			[
				_truck,
				INS_TRUCK_BLU_TEX,
				INS_TRUCK_BLU_ANI
			] call BIS_fnc_initVehicle;
		} else {
			_truck = (selectRandom INS_TRUCK_OPF) createVehicle _pos;
			[
				_truck,
				INS_TRUCK_OPF_TEX,
				INS_TRUCK_OPF_ANI
			] call BIS_fnc_initVehicle;
		};
		clearBackpackCargoGlobal _truck;
		clearMagazineCargoGlobal _truck;
		clearWeaponCargoGlobal _truck;
		clearItemCargoGlobal _truck;
		
		_group = [
			_pos, 
			INDEPENDENT, 
			[
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
			((units _group) select 0) assignAsDriver _truck;
			((units _group) select 0) moveInDriver _truck;

		_wp = _group addWaypoint [_center, _wpMax];
		_wp setWaypointType "TR UNLOAD";
		_wp setWaypointSpeed _speed;
		_wp setWaypointBehaviour _awareness;
		_wp setWaypointCompletionRadius 25;
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
			((units _group) select 0) assignAsCargo _truck;
			((units _group) select 1) assignAsCargo _truck;
			((units _group) select 2) assignAsCargo _truck;
			((units _group) select 3) assignAsCargo _truck;
			((units _group) select 4) assignAsCargo _truck;
			((units _group) select 5) assignAsCargo _truck;
			((units _group) select 6) assignAsCargo _truck;
			((units _group) select 7) assignAsCargo _truck;
			((units _group) select 0) moveInCargo _truck;
			((units _group) select 1) moveInCargo _truck;
			((units _group) select 2) moveInCargo _truck;
			((units _group) select 3) moveInCargo _truck;
			((units _group) select 4) moveInCargo _truck;
			((units _group) select 5) moveInCargo _truck;
			((units _group) select 6) moveInCargo _truck;
			((units _group) select 7) moveInCargo _truck;
		_wp = _group addWaypoint [_center, _wpMax];
		_wp setWaypointType "GUARD";
		_wp setWaypointSpeed _speed;
		_wp setWaypointBehaviour _awareness;
		[units _group] call InA_fnc_insCustomize;
	};