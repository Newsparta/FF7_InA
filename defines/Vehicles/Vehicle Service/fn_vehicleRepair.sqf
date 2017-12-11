////////////////
// DEPRECATED //
////////////////

params ["_parkedVehicle",["_fullService", false, [false]]];

_opforVehicles = INS_CAR_OPF + INS_CARU_OPF + INS_TRUCK_OPF;

if ((typeOf _parkedVehicle) in _opforVehicles) exitWith {["VEHICLE SERVICE", "You do not have the parts required to service this vehicle."] call FF7_fnc_formatHint;};

if (count crew _parkedVehicle > 0) then {
	{
		if (player distance parkedVehicle < 6) then {
			["PLEASE EXIT THE VEHICLE", ""] call FF7_fnc_formatHint;
		};
	} remoteExec ["BIS_fnc_call", 0, false];

	waitUntil {sleep 1; count crew _parkedVehicle < 1};
};

_afford = false;

if (LogM >= repairCost) then {
	_afford = true;
};

if (_afford) then {

	{
		if (player distance parkedVehicle < 12) then {
			["REPAIRING VEHICLE", ""] call FF7_fnc_formatHint;
		};
	} remoteExec ["BIS_fnc_call", 0, false];

	_parkedVehicle setDamage 0;
	
	LogM = LogM - repairCost;
	publicVariable "LogM";

	sleep 5;
	
	if (_fullService) then {
		[parkedVehicle, true] call InA_fnc_vehicleRearm;
	} else {
		{
			if (player distance parkedVehicle < 12) then {
				["VEHICLE READY", ""] call FF7_fnc_formatHint;
			};
		} remoteExec ["BIS_fnc_call", 0, false];
	};
	
} else {
	{
		if (player distance parkedVehicle < 12) then {
			["HQ", "Headquarters", "You do not have the logistical supplies to repair this vehicle."] call FF7_fnc_globalHintStruct;
		};
	} remoteExec ["BIS_fnc_call", 0, false];
	if (_fullService) then {
		[parkedVehicle, true] call InA_fnc_vehicleRearm;
	}
};