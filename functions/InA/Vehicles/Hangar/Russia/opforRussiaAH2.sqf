if (vehicleAirParked) exitWith {
	["Headquarters", "Please clear the hangar before requisitioning more vehicles."] remoteExec ["FF7_fnc_formatHint", ID, false];
};

_afford = false;

if (LogV >= 4) then {
	if (LogM >= 400) then {
		if (LogF >= 600) then {
			_afford = true;
		};
	};
};

if (_afford) then {

	["VEHICLE REQUSITIONED", ""] remoteExec ["FF7_fnc_formatHint", ID, false];

	_veh = createVehicle ["rhs_mi28n_vvsc", getMarkerPos "hangarSpawn", [], 0, "CAN_COLLIDE"];
	_veh setDir (markerDir "hangarSpawn");
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	
	LogV = LogV - 4;
	LogM = LogM - 400;
	LogF = LogF - 600;

} else {
	["Headquarters", "You do not have the logistical supplies to field this vehicle."] remoteExec ["FF7_fnc_formatHint", ID, false];
};