private ["_id","_time"];
// ---------- Skip time based on selection ----------

_id = _this select 0;
_time = nil;

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

[["","BLACK OUT",4]] remoteExec ["titleCut", 0, false];
sleep 4.5;

logiDaytime = logiDaytime + (_time - daytime);
(_time - daytime) remoteExec ["skipTime", 0, false];

sleep 0.5;
[["","BLACK IN",4]] remoteExec ["titleCut", 0, false];
sleep 4;

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