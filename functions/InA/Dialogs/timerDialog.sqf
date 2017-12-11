/* ----------
Script:
	Timer dialog

Description:
	Set dialog for timer 

Author:
---------- */

// Local declarations
private		_ctrl				= nil;
private		_selections			= [];

// Allow editing of dialog box
disableSerialization;

// Fill listbox
_selections =	[
	"Morning",
	"Day",
	"Evening",
	"Night"
];

// Create dialog
createDialog "InA_Timer_Dialog";

// Wait until the dialog is created
waitUntil {!isNull (findDisplay 7999);};

// Populate listbox
_ctrl = (findDisplay 7999) displayCtrl 1500;
{
	_ctrl lbAdd _x;
} forEach _selections;
lbSetCurSel [1500, 0];