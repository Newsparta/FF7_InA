private ["_fuelArray","_fuelCount","_obj","_munitionsArray","_munitionsCount"];
// ---------- Resource Visuals init ----------

waitUntil {sleep 1; initialized};

[] spawn {

	while {true} do {
		
		sleep (5 + (random 5));

		// ---------- build kit ----------
		
		{
			_veh = _x select 0;
			_added = _x select 3;

			if ((_veh distance (getMarkerPos "respawn_west") > 750) && {!_added}) then {
				
				[_veh] call InA_fnc_buildKit;
				_x set [3, true];
			};
			
			if ((_veh distance (getMarkerPos "respawn_west") < 750) && {_added}) then {

				[_veh] remoteExec ["removeAllActions", 0];
				_x set [3, false];

				_x set [1,(_x select 2)];
			};
			
			if ((!alive _veh) || {isNull _veh}) then {

				_index = utilityVehicles find _x;

				utilityVehicles set [_index, -1];

				utilityVehicles = utilityVehicles - [-1];

				if (_x in playerVehicles) then {
					playerVehicles = playerVehicles - [_veh];
				}
			};
			
		} forEach utilityVehicles;

		{
			if ((!alive _x) || {isNull _x}) then {
				playerVehicles = playerVehicles - [_x];
			};

		} forEach playerVehicles;
	};
};

// ---------- Resource control loop ----------

sleep 2;
[] spawn {
	while {true} do {

		sleep (2 + (random 2));

		if (LogF > 1000) then {
			LogF = 1000;
		};
		if (LogM > 600) then {
			LogM = 600;
		};
		if (LogV > 10) then {
			LogV = 10;
		};
	};
};