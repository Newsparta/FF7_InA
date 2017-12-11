/* ----------
Function:
	InA_fnc_baseWipe

Description:
	Function to clear all munitions and vehicles from the base.

Parameters:

Optional:

Example:
	[] call InA_fnc_baseWipe;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_array				= [];

// Clear armory boxes
_array = nearestObjects [getMarkerPos "respawn_west", 
[
	"ReammoBox_F"
], 750];

{
	clearWeaponCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearBackpackCargoGlobal _x;
	clearItemCargoGlobal _x;
} forEach _array;

// Clear vehicles
_array = (getMarkerPos "respawn_west") nearEntities [["Air","LandVehicle"], 750];

{
	deleteVehicle _x;
} forEach _array;