// ---------- Supplier check init ----------

waitUntil {sleep 1; initialized};

// ---------- Control loop ----------
private ["_opforVehicles","_vehiclesAtBase"];

while {true} do {

	sleep 60;
	
	_opforVehicles = INS_CAR_OPF + INS_CARU_OPF + INS_TRUCK_OPF + INS_CAR_BLU + INS_CARU_BLU + INS_TRUCK_BLU;
	
	_vehiclesAtBase = nearestObjects [getMarkerPos "respawn_west", _opforVehicles, 750];
	
	if (count _vehiclesAtBase > 0) then {
		["HQ", "Headquarters", "Your superiors have instructed you to decommission any opfor vehicles at base."] remoteExec ["FF7_fnc_globalHintStruct", 0];
		
		sleep 300;
	
		_vehiclesAtBase = nearestObjects [getMarkerPos "respawn_west", _opforVehicles, 750];
		
		if (count _vehiclesAtBase > 0) then {
			{
				deleteVehicle _x;
			} forEach _vehiclesAtBase;
			["HQ", "Headquarters", "Your superiors have decommissioned the vehicles for you."] remoteExec ["FF7_fnc_globalHintStruct", 0];
		};
	};
};