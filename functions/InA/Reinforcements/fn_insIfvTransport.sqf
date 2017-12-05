/* ----------
Function: InA_fnc_insIfvTransport

Description:
    A function to spawn an IFV with crew and passengers to attack an area

Parameters:
    - Center Location (Position)

Optional:
    - Minimum distance from the center to spawn (Number)
    - Maximum distance from center to place move/guard waypoint (Number)
	- Number to spawn (Number)
	- Time to delay the spawning (Number)

Example:
   
    [[0,0,0], 1500, 250, 1, 0] spawn InA_fnc_insIfvTransport

Returns:
    Nil

Author:
    Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_center"		,[]					,[]					,[]							],
		[	"_min"			,1500				,[0]				,[]							],
		[	"_wpMax"		,250				,[0]				,[]							],
		[	"_s"			,1					,[0]				,[]							],
		[	"_delay"		,0					,[0]				,[]							],
		[	"_awareness"	,"SAFE"				,[""]				,[]							],
		[	"_speed"		,"LIMITED"			,[""]				,[]							]];

// Local declarations
private		_accepted		= false;
private		_pos			= [];
private		_isNear			= false;
private		_obj			= ObjNull;
private		_group			= [];
private		_wp				= nil;

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
		_obj = objNull;
		if (supplier == "BLU") then {
			_obj = (selectRandom INS_IFV_BLU) createVehicle _pos;
			[
				_obj,
				missionNamespace getVariable ["INS_IFV_BLU_TEX", nil],
				missionNamespace getVariable ["INS_IFV_BLU_ANI", nil]
			] call BIS_fnc_initVehicle;
		} else {
			_obj = (selectRandom INS_IFV_OPF) createVehicle _pos;
			[
				_obj,
				missionNamespace getVariable ["INS_IFV_OPF_TEX", nil],
				missionNamespace getVariable ["INS_IFV_OPF_ANI", nil]
			] call BIS_fnc_initVehicle;
		};
		_obj lock 3;
		_group = [
			_pos, 
			INDEPENDENT, 
			[
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
			((units _group) select 0) assignAsDriver _obj;
			((units _group) select 1) assignAsGunner _obj;
			((units _group) select 2) assignAsCommander _obj;
			((units _group) select 0) moveInDriver _obj;
			((units _group) select 1) moveInGunner _obj;
			((units _group) select 2) moveInCommander _obj;

		_wp = _group addWaypoint [_center, _wpMax];
		_wp setWaypointType "TR UNLOAD";
		_wp setWaypointSpeed _speed;
		_wp setWaypointBehaviour _awareness;
		_wp setWaypointCompletionRadius 25;
		_wp = _group addWaypoint [_center, _wpMax];
		_wp setWaypointType "GUARD";
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
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
			((units _group) select 0) assignAsCargo _obj;
			((units _group) select 1) assignAsCargo _obj;
			((units _group) select 2) assignAsCargo _obj;
			((units _group) select 3) assignAsCargo _obj;
			((units _group) select 4) assignAsCargo _obj;
			((units _group) select 5) assignAsCargo _obj;
			((units _group) select 0) moveInCargo _obj;
			((units _group) select 1) moveInCargo _obj;
			((units _group) select 2) moveInCargo _obj;
			((units _group) select 3) moveInCargo _obj;
			((units _group) select 4) moveInCargo _obj;
			((units _group) select 5) moveInCargo _obj;
		_wp = _group addWaypoint [_center, _wpMax];
		_wp setWaypointType "GUARD";
		_wp setWaypointSpeed _awareness;
		_wp setWaypointBehaviour _speed;
		[units _group] call InA_fnc_insCustomize;
	};