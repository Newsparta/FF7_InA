if (vehicleParked) exitWith {
	["Headquarters", "Please clear the garage before requisitioning more vehicles."] remoteExec ["FF7_fnc_formatHint", ID, false];
};

_afford = false;

if (LogV >= 1) then {
	if (LogM >= 0) then {
		if (LogF >= 100) then {
			_afford = true;
		};
	};
};

if (_afford) then {

	["VEHICLE REQUSITIONED", ""] remoteExec ["FF7_fnc_formatHint", ID, false];

	_veh = createVehicle ["B_T_LSV_01_unarmed_F", getMarkerPos "garageSpawn", [], 0, "CAN_COLLIDE"];
	[
		_veh,
		["Olive",1], 
		["HideDoor1",1,"HideDoor2",1,"HideDoor3",1,"HideDoor4",1]
	] call BIS_fnc_initVehicle;
	_veh setDir (markerDir "garageSpawn");
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	
	playerVehicles pushBack _veh;
	
	LogV = LogV - 1;
	LogM = LogM - 0;
	LogF = LogF - 100;

} else {
	["Headquarters", "You do not have the logistical supplies to field this vehicle."] remoteExec ["FF7_fnc_formatHint", ID, false];
};