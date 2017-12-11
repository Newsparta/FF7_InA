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
    [FF7] Newsparta
---------- */
// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_agent"		,[]					,[]					,[]							],
		[	"_loc"			,[]					,[]					,[]							],
		[	"_rad"			,500				,[0]				,[]							]];

// Local declarations
private		_accepted			= false;
private		_pos				= [];
private		_wp					= [];

// Run only if alive and not running away
while {(alive _agent) && (!ambientShotsFired);} do {

	sleep (5 + (random 5));

	// Find a valid waypoint location
	while {!_accepted;} do {
		_pos = [[[_loc,_rad]],["water","out"]] call BIS_fnc_randomPos;
		_wp = _pos isFlatEmpty [1, 0, 1, 1, 0, false];
		
		if (count _wp > 2) then {
			if ((((nearestTerrainObjects [_wp, ["HOUSE"], _rad]) select 0) distance _wp) < 200) then {
				_accepted = true;
			};
		};
	};
	
	// Move to location
	_agent moveTo _wp;
	_agent forceSpeed (_agent getSpeed "SLOW");

	// wait until at location
	waitUntil {sleep 5; _agent distance _wp < 10;};
};