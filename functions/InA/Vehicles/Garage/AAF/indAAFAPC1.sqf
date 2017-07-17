if (vehicleParked) exitWith {
	["Headquarters", "Please clear the garage before requisitioning more vehicles."] remoteExec ["FF7_fnc_formatHint", ID, false];
};

_afford = false;

if (LogV >= 3) then {
	if (LogM >= 300) then {
		if (LogF >= 350) then {
			_afford = true;
		};
	};
};

if (_afford) then {

	["VEHICLE REQUSITIONED", ""] remoteExec ["FF7_fnc_formatHint", ID, false];

	_veh = createVehicle ["I_APC_Wheeled_03_cannon_F", getMarkerPos "garageSpawn", [], 0, "CAN_COLLIDE"];
	_veh setDir (markerDir "garageSpawn");
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	
	playerVehicles pushBack _veh;
	
	LogV = LogV - 3;
	LogM = LogM - 300;
	LogF = LogF - 350;

} else {
	["Headquarters", "You do not have the logistical supplies to field this vehicle."] remoteExec ["FF7_fnc_formatHint", ID, false];
};