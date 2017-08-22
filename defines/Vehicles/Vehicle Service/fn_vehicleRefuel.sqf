params ["_parkedVehicle",["_fullService", false, [false]]];

if (count crew _parkedVehicle > 0) then {
	{
		if (player distance parkedVehicle < 6) then {
			["PLEASE EXIT THE VEHICLE", ""] call FF7_fnc_formatHint;
		};
	} remoteExec ["BIS_fnc_call", 0, false];

	waitUntil {sleep 1; count crew _parkedVehicle < 1};
};

_afford = false;

if (LogF >= fuelCost) then {
	_afford = true;
};

if (_afford) then {
	
	VehCommander = effectiveCommander _parkedVehicle;
	publicVariable "VehCommander";
	
	sleep 1;
	
	{
		if (player == VehCommander) then {
		
			ID = clientOwner;
			publicVariableServer "ID";
		};
	} remoteExec ["BIS_fnc_call", 0];
	
	{
		if (player distance parkedVehicle < 12) then {
			["REFUELING VEHICLE", ""] call FF7_fnc_formatHint;
		};
	} remoteExec ["BIS_fnc_call", 0, false];

	[_parkedVehicle, 1] remoteExec ["setFuel", ID];
	
	LogF = LogF - fuelCost;
	publicVariable "LogF";
	
	sleep 5;

	{
		if (player distance parkedVehicle < 12) then {
			["VEHICLE READY", ""] call FF7_fnc_formatHint;
		};
	} remoteExec ["BIS_fnc_call", 0, false];

} else {{
	if (player distance parkedVehicle < 12) then {
		["HQ", "Headquarters", "You do not have the logistical supplies to refuel this vehicle."] call FF7_fnc_globalHintStruct;
	};
} remoteExec ["BIS_fnc_call", 0, false];};