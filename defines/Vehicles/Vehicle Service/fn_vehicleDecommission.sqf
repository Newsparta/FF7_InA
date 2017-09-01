params ["_parkedVehicle"];
private ["_fMulti","_fuelReturn"];

if (count crew _parkedVehicle > 0) then {

	sleep 1;
	{
		if (player distance _parkedVehicle < 6) then {
			["PLEASE EXIT THE VEHICLE", ""] call FF7_fnc_formatHint;
		};
	} remoteExec ["BIS_fnc_call", 0, false];
						
	waitUntil {sleep 1; count crew _parkedVehicle < 1};
};

_fMulti = nil;

if (_parkedVehicle isKindOf "Helicopter") then {
	_fMulti = 4;
};
if (_parkedVehicle isKindOf "Tank") then {
	_fMulti = 3;
};
if (_parkedVehicle isKindOf "Car") then {
	_fMulti = 1;
};
	
_fuelReturn = (((fuel _parkedVehicle) * 100) * _fMulti);

LogF = LogF + _fuelReturn;

if (count magazines _parkedVehicle > 0) then {
	LogM = LogM + 25;
	
	if (count magazines _parkedVehicle > 3) then {
		LogM = LogM + 25;
		
		if (count magazines _parkedVehicle > 6) then {
			LogM = LogM + 25;
		};
	};
};

deleteVehicle _parkedVehicle;