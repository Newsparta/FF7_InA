/* ----------
Function:
	InA_fnc_actionGearRequisition

Description:
	Execute garage menu

Parameters:

Optional:

Example:
	_this call InA_fnc_actionGearRequisition;

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
	[false, "only the squad leader may access gear requisition."] call InA_fnc_formatHint;
};

// Create dialog
disableSerialization;
createDialog "InA_Gear_Open_Dialog";

// Sync server variable
[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];

// Delay to allow sync
sleep 0.2;

// Set logistics point text
ctrlSetText [1002, (format ["%1",LogM])];	