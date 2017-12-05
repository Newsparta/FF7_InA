/* ----------
Function: InA_fnc_aidVehicle

Description:
    A function to add aid action to vehicle.

Parameters:
    - Center Location of region (Position)
	- Radius of region (number)
	- Name of region (string)

Optional:


Example:
   
    [[0,0,0]] spawn InA_fnc_aidVehicle

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- Parameters ----------

params ["_loc",["_rad", 1000, [0]]];
	
// ---------- Main ----------

_vehicles = nearestObjects [_loc, idap_cars, _rad];

{

	[_x, [["FF9900", "Deploy Aid"] call FF7_fnc_formatText,	{

		_veh = _this select 0;

		if (speed _veh > 0) exitWith {
			[false, "Please stop the vehicle before deploying aid."] call InA_fnc_formatHint;
		};

		[_veh] remoteExec ["InA_fnc_aidProtocol", 2];
		

	}, [], 99, true, true, "", "((_target distance _this) < 8)"]] remoteExec ["addAction", 0, true];

} forEach _vehicles;