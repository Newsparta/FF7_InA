/* ----------
Function: InA_fnc_cleanup

Description:
    A function to cleanup all units and objects in a certain area

Parameters:
    - Center Location (Position)

Optional:
    - Radius to delete all objects (Number)

Example:
   
    [[0,0,0], 2000] call InA_fnc_cleanup

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- PARAMETERS ----------

params ["_cen",["_max", 2000, [0]]];

// ---------- MAIN ----------

{ 
	if ((_x distance _cen) < _max) then {
		deleteVehicle _x;
	};
} forEach allUnits - (allPlayers - entities "HeadlessClient_F"); 
	
{ 
	if (_x distance InA_fob_location > 100) then {
		deleteVehicle _x;
	};
} forEach ((nearestObjects [_cen, 
	[
		"StaticWeapon",
		"THING",
		"BUILDING",
		"CAR",
		"TRUCK",
		"HELICOPTER",
		"TANK",
		"CAManBase"
	], _max]) - playerVehicles);