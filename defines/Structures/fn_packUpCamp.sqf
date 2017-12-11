/* ----------
Function:
	InA_fnc_packUpCamp

Description:
	Removes camp from the map and resets all variables

Parameters:

Optional:

Example:
	[] call InA_fnc_packUpCamp;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_objCamp				= [];

// Find all objects
_objCamp = nearestObjects [InA_camp_location,["Static", "Thing"],50];

// Delete all objects
{
	deleteVehicle _x;
} forEach _objCamp;

// Reset variables
campTimeout = false;
campPlaced = false;
InA_camp_location = [0,0,0];

// Delete marker
deleteMarker "camp_mark";

// Skip time
[0.5] remoteExec ["skipTime", 0, false];

// Notification
[false, "Camp has been packed up."] remoteExec ["InA_fnc_formatHint", 0];