/* ----------
Script:
	Build handler

Description:
	Controls the addition of build actions to objects

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_added				= false;
private		_index				= 0;
private		_obj				= ObjNull;

while {true;} do {
		
	sleep (5 + (random 5));

	// For all utility vehicles
	{
		// Select object
		_obj = _x select 0;

		// Determine if building options were added
		_added = _x select 3;

		// Check if away from base and no options added
		if ((_obj distance (getMarkerPos "respawn_west") > 750) && {!_added}) then {
			
			// Add build options
			[_obj] call InA_fnc_buildKit;

			// Mark building options as added
			_x set [3, true];
		};
		
		// Check if near base and options were added
		if ((_obj distance (getMarkerPos "respawn_west") < 750) && {_added}) then {
			
			// Remove all actions
			[_obj] remoteExec ["removeAllActions", 0];

			// Mark building options as not added
			_x set [3, false];

			// Reset current resource value to max value
			_x set [1,(_x select 2)];
		};
		
		// Check if not alive or isNull
		if ((!alive _obj) || {isNull _obj}) then {

			// Find index of object
			_index = utilityVehicles find _x;

			// set index of object to -1 (to delete)
			utilityVehicles set [_index, -1];

			// Remove the -1 from the array
			utilityVehicles = utilityVehicles - [-1];

			// Check if in player vehicles
			if (_obj in playerVehicles) then {

				// Remove from player vehicles
				playerVehicles = playerVehicles - [_obj];
			}
		};
			
	} forEach utilityVehicles;

	// For all player vehicles
	{

		// Check if not alive or isNull
		if ((!alive _x) || {isNull _x}) then {

			// Remove from player vehicles
			playerVehicles = playerVehicles - [_x];
		};

	} forEach playerVehicles;
};