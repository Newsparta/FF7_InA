/* ----------
Function:
	InA_fnc_actionHQMenu

Description:
	Execute HQ menu

Parameters:

Optional:

Example:
	_this call InA_fnc_actionHQMenu;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Check if not the group leader and if restricted
if !(_this select 1 == leader (group (_this select 1))) exitWith {
	[false, "only the squad leader may access the headquarters."] call InA_fnc_formatHint;
};

// Execute HQ script
call compile preprocessFileLineNumbers "functions\InA\Dialogs\menuHQ.sqf";