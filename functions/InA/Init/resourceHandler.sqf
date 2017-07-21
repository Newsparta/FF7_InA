private ["_fuelArray","_fuelCount","_obj","_munitionsArray","_munitionsCount"];
// ---------- Resource Visuals init ----------
	
LogV = 0;
LogF = 0;
LogM = 0;
buildInventory = 60;
utilityVehicles = [];
utilitySmallVehicles = [];

waitUntil {sleep 1; initialized};

[] spawn {
private ["_added"];

_added = false;

	while {true} do {
		
		sleep (5 + (random 5));

		// ---------- Large build kit ----------
		
		{
			if ((_x distance (getMarkerPos "respawn_west") > 750) && {!_added}) then {
				
				[_x] call InA_fnc_buildKitLite;
				_added = true;
			};
			
			if ((_x distance (getMarkerPos "respawn_west") < 750) && {_added}) then {
				[_x] remoteExec ["removeAllActions", 0];
				_added = false;
				buildInventory = 60;
			};
			
			if ((!alive _x) || {isNull _x}) then {
				utilityVehicles = utilityVehicles - [_x];
			};
			
		} forEach utilityVehicles;

		// ---------- Small build kit ----------
		/*
		{
			if ((_x distance (getMarkerPos "respawn_west") > 750) && {!_added}) then {
				
				[_x] call InA_fnc_buildKitLite;
				_added = true;
			};
			
			if ((_x distance (getMarkerPos "respawn_west") < 750) && {_added}) then {
				[_x] remoteExec ["removeAllActions", 0];
				_added = false;
				buildInventory = 3;
			};
			
			if ((!alive _x) || {isNull _x}) then {
				utilitySmallVehicles = utilitySmallVehicles - [_x];
			};
			
		} forEach utilitySmallVehicles;*/
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
		if (LogM > 1000) then {
			LogM = 1000;
		};
		if (LogV > 10) then {
			LogV = 10;
		};
	};
};