/* ----------
Script:
	Is garage clear

Description:
	Monitors garage/hangar spawn locations and checks for obstructions

Author:
	[FF7] Newsparta
---------- */

while {true;} do {
	
	sleep (2 + (random 2));

	// Find all land vehicles
	_landArray = nearestObjects [getMarkerPos "garageSpawn",["LandVehicle"],5];
	
	// Check if spawn obstructed
	if ((count _landArray) > 0) then {
		vehicleParked = true; 
		publicVariable "vehicleParked";
	} else {
		vehicleParked = false;
		publicVariable "vehicleParked";
	};
	
	// Find all air vehicles
	_airArray = nearestObjects [getMarkerPos "hangarSpawn",["Air"],10];
	
	// Check if spawn obstructed
	if ((count _airArray) > 0) then {
		vehicleAirParked = true; 
		publicVariable "vehicleAirParked";
	} else {
		vehicleAirParked = false;
		publicVariable "vehicleAirParked";
	};
};
