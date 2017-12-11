/* ----------
Function:
	InA_fnc_shelterHelicopter

Description:
	Bring in or take out a helicopter from the hangar

Parameters:
	- Command (String)

Optional:

Example:
	["shelter"] call InA_fnc_shelterHelicopter;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_phase"		,"remove"			,[""]				,[]							]];

// Local declarations
private		_airArray			= [];
private		_array				= [];
private		_veh				= ObjNull;

// Find all air vehicles
_array = nearestObjects [getPosATL resupplyPad1,["Air"],100];

// Check if logi transport is not alive and there are air vehicles found
if ((!alive logiVeh) && {(count _array) > 0}) then {

	// Find helicopter nearest to the hangar
	_airArray = nearestObjects [getPosATL hangarStructure,["Air"],10];
	
	// Check if command was to remove
	if (_phase == "remove") exitWith {
	
		// Check if the main pad is blocked
		if (vehicleAirParked) exitWith {
			["Headquarters", "Please clear the hangar before bringing out the sheltered helicopter."] remoteExec ["FF7_fnc_formatHint", ID, false];
		};
		
		// Define the vehicle to move
		_veh = _airArray select 0;
		
		// Remove from hangar
		_veh setPos (getMarkerPos "hangarSpawn");
		_veh setDir (markerDir "hangarSpawn");
		
		[false, "Helicopter brought out."] call InA_fnc_formatHint;
	};

	// Check if there is already a helicopter sheltered
	if ((count _airArray) > 0) exitWith {
		["Headquarters", "There is already a helicopter sheltered."] remoteExec ["FF7_fnc_formatHint", ID, false];
	};

	// Check if command was to shelter
	if (_phase == "shelter") exitWith {
		
		// Define vehicle to be moved
		_veh = _array select 0;
		
		// Shelter in hangar
		_veh setPos (getPosATL hangarStructure);
		_veh setDir (getDir hangarStructure);
		
		[false, "Helicopter sheltered."] call InA_fnc_formatHint;
	};

} else {
	[false, "There is no helicopter to shelter or it cannot be done at this time."] call FF7_fnc_formatHint;
};