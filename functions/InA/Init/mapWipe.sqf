/* ----------
Script:
	Map wipe

Description:
	Periodically clean the map 

Author:
	[FF7] Newsparta
---------- */

// Check if is the server
if (!isServer) exitWith {};

// Local declarations
private		_excludedObjects			= allMissionObjects "";

// Wait until faction initialized
waitUntil {sleep 1; initialized;};

[] spawn {

	while {true} do {
		
		sleep 600;
		
		{
			if ((_x distance (getMarkerPos "respawn_west")) < 750) then {
				deleteVehicle _x;
			};
		} forEach allDeadMen;
	};
};

while {true;} do {

	sleep (10 + (random 10));

	// Check if players are all at base
	if ({_x distance (getMarkerPos "respawn_west") > 750} count (allPlayers - entities "HeadlessClient_F") < 1) then {
		// Check if logi transport is not alive
		if !(alive logiVeh) then {

			// Delete all units not at base
			{ 
				if ((_x distance (getMarkerPos "respawn_west")) > 750) then {
					if ((_x distance InA_fob_location > 100) && {_x distance InA_camp_location > 50}) then {
						deleteVehicle _x;
					};
				};
			} forEach allUnits - (allPlayers - entities "HeadlessClient_F"); 
			
			// Delete all Objects
			{ 
				if ((_x distance (getMarkerPos "respawn_west")) > 750) then {
					if ((_x distance InA_fob_location > 100) && {_x distance InA_camp_location > 50}) then {
						deleteVehicle _x;
					};
				};
			} forEach (allMissionObjects "" - _excludedObjects - playerVehicles);

			// Delay next wipe
			sleep params_mapWipe;
		};
	};
};