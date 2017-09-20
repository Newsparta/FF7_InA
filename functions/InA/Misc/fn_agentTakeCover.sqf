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
    Newsparta
---------- */
// ---------- Parameters ----------

params ["_loc",["_rad", 1000, [0]]];

// ---------- Main ----------

waitUntil {sleep (2 + (random 2)); if (ambientExited) exitWith {true};ambientShotsFired};

if (ambientShotsFired) then {

	["HQ", "DEBUG", "Shots Fired."] call FF7_fnc_globalHintStruct;

	_agents = nearestObjects [_loc, (civ_man_tanoan + civ_man_european + civ_man_asian + civ_man_african), _rad];
	_houses = nearestTerrainObjects [_loc, ["HOUSE"], _rad];
	
	{
		_house = selectRandom _houses;
		_runTo = getPosATL _house;
		
		_x call BIS_fnc_ambientAnim__terminate;
		sleep 0.1;
		_x moveTo _runTo;
		_x forceSpeed (_x getSpeed "FAST");
		_x setUnitPos "MIDDLE";
		_x removeEventHandler ["firedNear",1];
	} forEach _agents;

};