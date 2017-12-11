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
    [FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_loc"			,[]					,[]					,[]							],
		[	"_rad"			,1000				,[0]				,[]							]];

// Local declarations
private		_veh 				= ObjNull;
private		_vehicles			= [];

// Find all IDAP vehicles
_vehicles = nearestObjects [_loc, idap_cars, _rad];

// Add action to all vehicles
{

	[_x, ["Deploy aid",	{

		_veh = _this select 0;

		if (speed _veh > 0) exitWith {
			[false, "Please stop the vehicle before deploying aid."] call InA_fnc_formatHint;
		};

		[_veh] remoteExec ["InA_fnc_aidProtocol", 2];
		

	}, [], 99, true, true, "", "((_target distance _this) < 8)"]] remoteExec ["addAction", 0, true];

} forEach _vehicles;