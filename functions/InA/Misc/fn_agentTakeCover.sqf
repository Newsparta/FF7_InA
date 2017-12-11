/* ----------
Function: InA_fnc_agentTakeCover

Description:
    A function that sends agents running to cover if shots are fired

Parameters:
    - Center location of patrol area (Position)
	- radius to search for agents (Number)

Optional:
    - 

Example:
   
    [[0,0,0], 1000] spawn InA_fnc_agentTakeCover

Returns:
    Nil

Author:
    [FF7] Newsparta
---------- */
// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_loc"			,[]					,[]					,[]							],
		[	"_rad"			,1000				,[0]					,[]							]];

// Local declarations
private		_agents				= [];
private		_loc				= [];
private		_houses				= [];
private		_house				= nil;
private		_runTo				= [];

// Wait until someone gets shot at
waitUntil {sleep (2 + (random 2)); if (ambientExited) exitWith {true}; ambientShotsFired;};

// Check if shot at
if (ambientShotsFired) then {

	// Find all nearby civilians
	_agents = nearestObjects [_loc, (civ_man_tanoan + civ_man_european + civ_man_asian + civ_man_african), _rad];

	// Find all nearby houses
	_houses = nearestTerrainObjects [_loc, ["HOUSE"], _rad];
	
	// Make them run
	{
		_house = selectRandom _houses;
		_runTo = getPosATL _house;
		
		_x call BIS_fnc_ambientAnim__terminate;
		sleep 1;
		_x moveTo _runTo;
		_x forceSpeed (_x getSpeed "FAST");
		_x setUnitPos "MIDDLE";
		_x removeEventHandler ["firedNear",1];
	} forEach _agents;

};