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
    [FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_kit"			,[]					,[]					,[]							]];

// Local declarations
private		_ctrl				= nil;
private		_selections			= [];
private		_target				= nil;

// Add action to object
[_kit, ["Build menu",	{
		
	// Allow for editing of dialogs	
	disableSerialization;

	// Update variables with server
	[clientOwner, "InA_fob_location"] remoteExec ["publicVariableClient", 2, false];
	[clientOwner, "safehouse"] remoteExec ["publicVariableClient", 2, false];
	[clientOwner, "utilityVehicles"] remoteExec ["publicVariableClient", 2, false];

	// Delay to allow sync
	sleep 0.2;

	// Define building object
	kitVeh = _this select 0;

	// Find vehicle in utility array
	{

		// Define vehicle and inventory
		if (kitVeh in _x) then {

			veh = _x;
			kitVal = _x select 1;

		};

	} forEach utilityVehicles;

	_selections = [];

	// Check if players are near a safehouse or FOB
	if ((player distance safehouse < 100) || {player distance InA_fob_location < 100}) then {
		_selections =	[
			"Sandbag (long)",
			"Sandbag (round)",
			"Sandbag (end)",
			"Portable Light",
			"HBarrier Wall",
			"Tower",
			"Camonet"
		];
	// Standard options
	} else {
		_selections =	[
			"Sandbag (long)",
			"Sandbag (round)",
			"Sandbag (end)",
			"Portable Light"
		];
	};

	// X translations
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

	// Y translations
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

	// Z translations
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

	// Create dialog
	createDialog "InA_Build_Dialog";

	// Wait until dialog is created
	waitUntil {!isNull (findDisplay 9500);};

	// Find listbox
	_ctrl = (findDisplay 9500) displayCtrl 1500;

	// Populate listbox
	{
		_ctrl lbAdd _x;
	} forEach _selections;
	_ctrl lbSetCurSel 0;
	ctrlSetText [1001, (format ["%1", kitVal])];
}, [], 99, true, true, "", "((_target distance _this) < 8)"]] remoteExec ["addAction", 0, true];
