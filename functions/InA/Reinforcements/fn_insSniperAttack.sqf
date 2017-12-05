/* ----------
Function: InA_fnc_insSniperAttack

Description:
    A function to spawn a sniper squad to attack an area

Parameters:
    - Center Location (Position)

Optional:
    - Minimum distance from the center to spawn (Number)
    - Maximum distance from center to place move/guard waypoint (Number)
	- Number to spawn (Number)
	- Time to delay the spawning (Number)

Example:
   
    [[0,0,0], 1500, 250, 1, 0] spawn InA_fnc_insSniperAttack

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
private		_group			= [];
private		_wp				= nil;

sleep _delay;

	for "_x" from 1 to _s do {
		
		_accepted = false;
		while {!_accepted} do {
		
			_pos = [_center, _min, (_min + 100), 1, 0, 1, 0] call BIS_fnc_findSafePos;
	
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

		_troops = [];
		for "_i" from 1 to 2 do {

			_troops pushBack (selectRandom INS_INF_SINGLE);
		};

		_group = [
			_pos, 
			INDEPENDENT, 
			_troops
		] call BIS_fnc_spawnGroup;

		_wp = _group addWaypoint [[_center, 0, _wpMax, 1, 0, 20, 0] call BIS_fnc_findSafePos, 0];
		_wp setWaypointType "GUARD";
		_wp setWaypointSpeed _speed;
		_wp setWaypointBehaviour _awareness;
		_wp setWaypointFormation "STAG COLUMN";
		_wp setWaypointCompletionRadius 25;
		[[(units _group) select 0]] call InA_fnc_insSniper;
		[[(units _group) select 1]] call InA_fnc_insCustomize;
	};