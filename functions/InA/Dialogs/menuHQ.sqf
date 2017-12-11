/* ----------
Script:
	Menu HQ

Description:
	Create dialog for the HQ menu

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_baseThemes					= [];
private		_ctrl						= nil;
private		_ETA						= "";
private		_hour						= 0;
private		_minute						= 0;
private		_time						= "";
private		_waitTime					= 0;

// Allow editing of dialog interface
disableSerialization;
	
// Define faction types
_baseThemes =	[
	"US Army",
	"US Marines",
	"NATO",
	"AAF",
	"RU Ground Forces"
];

// Create dialog	
createDialog "InA_HQ_Dialog";

// Wait until the dialog is created
waitUntil {!isNull (findDisplay 9100);};

// Find control for listbox
_ctrl = (findDisplay 9100) displayCtrl 1500;

// Add factions to listbox
{
	_ctrl lbAdd _x;
} forEach _baseThemes;

// Update global variables
[clientOwner, "LogV"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "LogF"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "logiETA"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "logiDaytime"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "initialized"] remoteExec ["publicVariableClient", 2, false];

// Delay to allow sync
sleep 0.3;

// Set resource text
ctrlSetText [1000, (format ["%1",LogV])];
ctrlSetText [1001, (format ["%1",LogF])];
ctrlSetText [1002, (format ["%1",LogM])];

// Set time for supply drop
_waitTime = (logiETA/3600);
_ETA = logiDaytime + _waitTime;
	
_hour = floor _ETA;
_minute = floor ((_ETA - _hour) * 60);

// Display time for supply drop
if ((_minute < 10) && (_hour >= 10)) then {
	_time = format ["%1:0%2", _hour, _minute];
};
if ((_minute >= 10) && (_hour < 10)) then {
	_time = format ["0%1:%2", _hour, _minute];
};
if ((_minute < 10) && (_hour < 10)) then {
	_time = format ["0%1:0%2", _hour, _minute];
};
if ((_minute >= 10) && (_hour >= 10)) then {
	_time = format ["%1:%2", _hour, _minute];
};
	
ctrlSetText [1003, (format ["%1",_time])];