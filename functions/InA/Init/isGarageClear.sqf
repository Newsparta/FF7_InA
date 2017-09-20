private ["_landArray","_airArray"];
// ---------- Check vehicle spawns for obstruction ----------

while {true} do {
	
	sleep (2 + (random 2));

	_landArray = nearestObjects [getMarkerPos "garageSpawn",["LandVehicle"],5];
	
	if ((count _landArray) > 0) then {
		vehicleParked = true; 
		publicVariable "vehicleParked";
	} else {
		vehicleParked = false;
		publicVariable "vehicleParked";
	};
	
	_airArray = nearestObjects [getMarkerPos "hangarSpawn",["Air"],10];
	
	if ((count _airArray) > 0) then {
		vehicleAirParked = true; 
		publicVariable "vehicleAirParked";
	} else {
		vehicleAirParked = false;
		publicVariable "vehicleAirParked";
	};
};
