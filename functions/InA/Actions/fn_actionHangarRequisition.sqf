/* ----------
Function:
	InA_fnc_actionHangarRequisition

Description:
	Execute hangar menu

Parameters:

Optional:

Example:
	_this call InA_fnc_actionHangarRequisition;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Sync server varaible
[clientOwner, "gearRestricted"] remoteExec ["publicVariableClient", 2, false];

// Delay to allow sync
sleep 0.2;

// Check if not the group leader and if restricted
if (!(_this select 1 == leader (group (_this select 1))) && (gearRestricted)) exitWith {
	[false, "only the squad leader may access the hangar."] call InA_fnc_formatHint;
};

// Execute hangar menu
call compile preprocessFileLineNumbers "defines\Vehicles\airVehicleHandles.sqf";