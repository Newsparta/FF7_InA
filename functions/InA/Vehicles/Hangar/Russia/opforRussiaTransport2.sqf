if (vehicleAirParked) exitWith {
	["Headquarters", "Please clear the hangar before requisitioning more vehicles."] remoteExec ["FF7_fnc_formatHint", ID, false];
};

_afford = false;

if (LogV >= 3) then {
	if (LogM >= 300) then {
		if (LogF >= 400) then {
			_afford = true;
		};
	};
};

if (_afford) then {

	["VEHICLE REQUSITIONED", ""] remoteExec ["FF7_fnc_formatHint", ID, false];

	_veh = createVehicle ["RHS_Mi24P_CAS_vvsc", getMarkerPos "hangarSpawn", [], 0, "CAN_COLLIDE"];
	_veh setDir (markerDir "hangarSpawn");
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	
	LogV = LogV - 3;
	LogM = LogM - 300;
	LogF = LogF - 400;

} else {
	["Headquarters", "You do not have the logistical supplies to field this vehicle."] remoteExec ["FF7_fnc_formatHint", ID, false];
};