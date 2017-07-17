if (vehicleAirParked) exitWith {
	["Headquarters", "Please clear the hangar before requisitioning more vehicles."] remoteExec ["FF7_fnc_formatHint", ID, false];
};

_afford = false;

if (LogV >= 6) then {
	if (LogM >= 0) then {
		if (LogF >= 600) then {
			_afford = true;
		};
	};
};

if (_afford) then {

	["VEHICLE REQUSITIONED", ""] remoteExec ["FF7_fnc_formatHint", ID, false];

	_veh = createVehicle ["rhsusf_CH53E_USMC", getMarkerPos "hangarSpawn", [], 0, "CAN_COLLIDE"];
	_veh setDir (markerDir "hangarSpawn");
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	
	LogV = LogV - 6;
	LogM = LogM - 0;
	LogF = LogF - 600;

} else {
	["Headquarters", "You do not have the logistical supplies to field this vehicle."] remoteExec ["FF7_fnc_formatHint", ID, false];
};