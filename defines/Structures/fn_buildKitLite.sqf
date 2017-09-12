/* ----------
Function: InA_fnc_buildKit

Description:
    A function to add building options to an object in order to place fortifications.

Parameters:
    - Object to add building options to (Object)

Example:
   
    [object] call InA_fnc_buildKit

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- PARAMETERS ----------

params ["_kit"];

// ---------- MAIN ----------

[_kit, [["FF9900", "Open Build Menu"] call FF7_fnc_formatText,	{
		
	disableSerialization;

	_selections =	[
		"Sandbag (long)",
		"Sandbag (round)",
		"Sandbag (end)",
		"Portable Light"
	];
	plusX = 
	{
		transX = transX + 0.05;
		if (transX > 0.4) then {
			transX = 0.4;
		};
		obj attachTo [player, [(xPos + transX),(yPos + transY),(zPos + transZ)]];
	};
	minusX = 
	{
		transX = transX - 0.05;
		if (transX < -0.4) then {
			transX = -0.4;
		};
		obj attachTo [player, [(xPos + transX),(yPos + transY),(zPos + transZ)]];
	};
	plusY = 
	{
		transY = transY + 0.05;
		if (transY > 0.4) then {
			transY = 0.4;
		};
		obj attachTo [player, [(xPos + transX),(yPos + transY),(zPos + transZ)]];
	};
	minusY = 
	{
		transY = transY - 0.05;
		if (transY < -0.4) then {
			transY = -0.4;
		};
		obj attachTo [player, [(xPos + transX),(yPos + transY),(zPos + transZ)]];
	};
	plusZ = 
	{
		transZ = transZ + 0.05;
		if (transZ > 0.8) then {
			transZ = 0.8;
		};
		obj attachTo [player, [(xPos + transX),(yPos + transY),(zPos + transZ)]];
	};
	minusZ = 
	{
		transZ = transZ - 0.05;
		if (transZ < -0.8) then {
			transZ = -0.8;
		};
		obj attachTo [player, [(xPos + transX),(yPos + transY),(zPos + transZ)]];
	};

	[clientOwner, "buildInventory"] remoteExec ["publicVariableClient", 2, false];

	sleep 0.2;

	createDialog "InA_Build_Dialog";

	waitUntil {!isNull (findDisplay 9500);};

	_ctrl = (findDisplay 9500) displayCtrl 1500;

	{
		_ctrl lbAdd _x;
	} forEach _selections;
	_ctrl lbSetCurSel 0;
	ctrlSetText [1001, (format ["%1",buildInventory])];
}, [], 99, true, true, "", "((_target distance _this) < 8)"]] remoteExec ["addAction", 0, true];
