/* ----------
Function: InA_fnc_agentUrbanPatrol

Description:
    A function that spawns a thread for an agent that patrols an urban area

Parameters:
    - Agent (Object)
	- Center location of patrol area (Position)

Optional:
    - Radius to patrol (Number)

Example:
   
    [bunny, [0,0,0]] spawn InA_fnc_agentUrbanPatrol

Returns:
    Nil

Author:
    Newsparta
---------- */
// ---------- PARAMETERS ----------

params ["_agent", "_loc", ["_rad", 500, [0]]];

// ---------- MAIN ----------
private ["_wp","_accepted","_pos"];

while {(alive _agent) && (!ambientShotsFired)} do {

	_wp = [];
	_accepted = false;
	while {!_accepted} do {
		_pos = [[[_loc,_rad]],["water","out"]] call BIS_fnc_randomPos;
		_wp = _pos isFlatEmpty [1, 0, 1, 1, 0, false];
		
		if (count _wp > 2) then {
			if ((((nearestTerrainObjects [_wp, ["HOUSE"], _rad]) select 0) distance _wp) < 200) then {
				_accepted = true;
			};
		};
	};
	
	_agent moveTo _wp;
	_agent forceSpeed (_agent getSpeed "SLOW");
	sleep (5 + (random 5));
};