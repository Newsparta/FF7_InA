disableSerialization;
	
_baseThemes =	[
	"US Army",
	"US Marines",
	"NATO",
	"AAF",
	"RU Ground Forces"
];
	
createDialog "InA_HQ_Dialog";
	
waitUntil {!isNull (findDisplay 9100);};
	
_ctrl = (findDisplay 9100) displayCtrl 1500;
	
{
	_ctrl lbAdd _x;
} forEach _baseThemes;

[clientOwner, "LogV"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "LogF"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "logiETA"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "logiDaytime"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "initialized"] remoteExec ["publicVariableClient", 2, false];

sleep 0.3;

ctrlSetText [1000, (format ["%1",LogV])];
ctrlSetText [1001, (format ["%1",LogF])];
ctrlSetText [1002, (format ["%1",LogM])];

if (initialized) then {
	_waitTime = (logiETA/3600);
	_ETA = logiDaytime + _waitTime;
	
	_hour = floor _ETA;
	_minute = floor ((_ETA - _hour) * 60);
	_time = "";
	
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
};