/* ----------
Script:
	Timer

Description:
	Skip day time based on selection

Author:
	[FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_id"			,[]					,[]					,[]							]];

// Local declarations
private		_hour				= 0;
private		_minute				= 0;
private		_time				= 0;

// Switch based on selection
switch (_id) do
{
	case 0:
	{
		_time = 6 + (random 1);
	};

	case 1:
	{
		_time = 8 + (random 8);
	};

	case 2:
	{
		_time = 17 + (random 1);
	};
	
	case 3:
	{
		_time = 19 + (random 8);
	};
};

// Black out
[["","BLACK OUT",4]] remoteExec ["titleCut", 0, false];
sleep 4.5;

// Set time
logiDaytime = logiDaytime + (_time - daytime);
(_time - daytime) remoteExec ["skipTime", 0, false];

// Fade in
sleep 0.5;
[["","BLACK IN",4]] remoteExec ["titleCut", 0, false];
sleep 4;

// Display time to player
_hour = floor daytime;
_minute = floor ((daytime - _hour) * 60);
if ((_minute < 10) && (_hour >= 10)) then {

	//[[format ["%1:0%2", _hour, _minute], "PLAIN", 1]] remoteExec ["titleText", 0];
	[
		[
			[format ["%1:0%2 hours", _hour, _minute]]
		] , 0, 0.5, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
	] remoteExec ["BIS_fnc_typeText", 0];

};
if ((_minute >= 10) && (_hour < 10)) then {

	//[[format ["0%1:%2", _hour, _minute], "PLAIN", 1]] remoteExec ["titleText", 0];
	[
		[
			[format ["0%1:%2 hours", _hour, _minute]]
		] , 0, 0.5, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
	] remoteExec ["BIS_fnc_typeText", 0];

};
if ((_minute < 10) && (_hour < 10)) then {

	//[[format ["0%1:0%2", _hour, _minute], "PLAIN", 1]] remoteExec ["titleText", 0];
	[
		[
			[format ["0%1:0%2 hours", _hour, _minute]]
		] , 0, 0.5, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
	] remoteExec ["BIS_fnc_typeText", 0];

};
if ((_minute >= 10) && (_hour >= 10)) then {

	//[[format ["%1:%2", _hour, _minute], "PLAIN", 1]] remoteExec ["titleText", 0];
	[
		[
			[format ["%1:%2 hours", _hour, _minute]]
		] , 0, 0.5, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
	] remoteExec ["BIS_fnc_typeText", 0];

};