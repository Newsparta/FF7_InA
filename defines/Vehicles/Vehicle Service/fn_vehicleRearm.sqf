////////////////
// DEPRECATED //
////////////////

params ["_parkedVehicle",["_fullService", false, [false]]];

_opforVehicles = INS_CAR_OPF + INS_CARU_OPF + INS_TRUCK_OPF;

if ((typeOf _parkedVehicle) in _opforVehicles) exitWith {["VEHICLE SERVICE", "You do not have the munitions required to service this vehicle."] call FF7_fnc_formatHint;};

if (count crew _parkedVehicle > 0) then {
	{
		if (player distance parkedVehicle < 6) then {
			["PLEASE EXIT THE VEHICLE", ""] call FF7_fnc_formatHint;
		};
	} remoteExec ["BIS_fnc_call", 0, false];

	waitUntil {sleep 1; count crew _parkedVehicle < 1};
};

_afford = false;

if (LogM >= munitionCost) then {
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
			["REARMING VEHICLE", ""] call FF7_fnc_formatHint;
		};
	} remoteExec ["BIS_fnc_call", 0, false];

	// ---------- x_reload script start ----------

	{
		_parkedVehicle = parkedVehicle;
	
		_type = typeOf _parkedVehicle;
		
		_parkedVehicle setVehicleAmmo 1;

		_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");
		
		if (count _magazines > 0) then {
			_removed = [];
			{
				if (!(_x in _removed)) then {
					_parkedVehicle removeMagazines _x;
					_removed = _removed + [_x];
				};
			} forEach _magazines;
			{
				_parkedVehicle addMagazine _x;
			} forEach _magazines;
		};

		_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");

		if (_count > 0) then {
			for "_i" from 0 to (_count - 1) do {
			
				_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
				_magazines = getArray(_config >> "magazines");
				_removed = [];
				{
					if (!(_x in _removed)) then {
						_parkedVehicle removeMagazines _x;
						_removed = _removed + [_x];
					};
				} forEach _magazines;
				{
					_parkedVehicle addMagazine _x;
				} forEach _magazines;
				_count_other = count (_config >> "Turrets");
				if (_count_other > 0) then {
					for "_i" from 0 to (_count_other - 1) do {
						_config2 = (_config >> "Turrets") select _i;
						_magazines = getArray(_config2 >> "magazines");
						_removed = [];
						{
							if (!(_x in _removed)) then {
								_parkedVehicle removeMagazines _x;
								_removed = _removed + [_x];
							};
						} forEach _magazines;
						{
							_parkedVehicle addMagazine _x;
						} forEach _magazines;
					};
				};
			};
		};
		
		_parkedVehicle setVehicleAmmo 1;
	} remoteExec ["BIS_fnc_call", ID];
	
	// ---------- x_reload script end ----------
	
	LogM = LogM - munitionCost;
	publicVariable "LogM";
	
	sleep 5;
	
	if (_fullService) then {
		[parkedVehicle, true] call InA_fnc_vehicleRefuel;
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
			["HQ", "Headquarters", "You do not have the logistical supplies to rearm this vehicle."] call FF7_fnc_globalHintStruct;
		};
	} remoteExec ["BIS_fnc_call", 0, false];
	if (_fullService) then {
		[parkedVehicle, true] call InA_fnc_vehicleRefuel;
	}
};