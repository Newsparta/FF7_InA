if (vehicleParked) exitWith {
	["Headquarters", "Please clear the garage before requisitioning more vehicles."] remoteExec ["FF7_fnc_formatHint", ID, false];
};

_afford = false;

if (LogV >= 1) then {
	if (LogM >= 0) then {
		if (LogF >= 50) then {
			_afford = true;
		};
	};
};

if (_afford) then {

	["VEHICLE REQUSITIONED", ""] remoteExec ["FF7_fnc_formatHint", ID, false];

	_veh = createVehicle ["B_Quadbike_01_F", getMarkerPos "garageSpawn", [], 0, "CAN_COLLIDE"];
	[
		_veh,
		["Indep",1], 
		true
	] call BIS_fnc_initVehicle;
	_veh setDir (markerDir "garageSpawn");
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	
	playerVehicles pushBack _veh;
	
	LogV = LogV - 1;
	LogM = LogM - 0;
	LogF = LogF - 50;

} else {
	["Headquarters", "You do not have the logistical supplies to field this vehicle."] remoteExec ["FF7_fnc_formatHint", ID, false];
};