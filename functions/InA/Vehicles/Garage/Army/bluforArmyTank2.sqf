if (vehicleParked) exitWith {
	["Headquarters", "Please clear the garage before requisitioning more vehicles."] remoteExec ["FF7_fnc_formatHint", ID, false];
};

_afford = false;

if (LogV >= 4) then {
	if (LogM >= 450) then {
		if (LogF >= 400) then {
			_afford = true;
		};
	};
};

if (_afford) then {

	["VEHICLE REQUSITIONED", ""] remoteExec ["FF7_fnc_formatHint", ID, false];

	_veh = createVehicle ["rhsusf_m1a2sep1tuskiiwd_usarmy", getMarkerPos "garageSpawn", [], 0, "CAN_COLLIDE"];
	_veh setDir (markerDir "garageSpawn");
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	
	playerVehicles pushBack _veh;
	
	LogV = LogV - 4;
	LogM = LogM - 450;
	LogF = LogF - 400;

} else {
	["Headquarters", "You do not have the logistical supplies to field this vehicle."] remoteExec ["FF7_fnc_formatHint", ID, false];
};