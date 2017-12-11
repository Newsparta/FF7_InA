/* ----------
Script:
	Supplier check

Description:
	Checks supplier of vehicles and items at base

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_airArray				= [];
private		_array					= [];
private		_banned					= [];
private		_inv					= [];
private		_landArray				= [];
private		_obj					= ObjNull;
private		_opforVehicles			= [];
private		_vehiclesAtBase			= [];

// Wait until faction selected
waitUntil {sleep 1; initialized};

while {true;} do {

	sleep 60;
	
	// Define all opfor vehicles to look for
	// Check supplier
	if (supplier == "OPF") then {
		_opforVehicles = INS_CAR_OPF + INS_CARU_OPF + INS_TRUCK_OPF;
	} else {
		_opforVehicles = INS_CAR_BLU + INS_CARU_BLU + INS_TRUCK_BLU;
	};
	
	// Find any vehicles at base
	_vehiclesAtBase = nearestObjects [getMarkerPos "respawn_west", _opforVehicles, 750];
	
	// Check if there were vehicles found
	if (count _vehiclesAtBase > 0) then {

		// Notification
		[true, "Your superiors have instructed you to decommission any opfor vehicles at base.", "Headquarters"] remoteExec ["InA_fnc_formatHint", 0];
		
		// Wait for players to do something
		sleep 300;
	
		// Find any vehicles at base
		_vehiclesAtBase = nearestObjects [getMarkerPos "respawn_west", _opforVehicles, 750];
		
		// Check if the vehicles are still there
		if (count _vehiclesAtBase > 0) then {

			// Remove vehicles
			{
				deleteVehicle _x;
			} forEach _vehiclesAtBase;

			// Notification
			[true, "Your superiors have decommissioned the vehicles for you.", "Headquarters"] remoteExec ["InA_fnc_formatHint", 0];
		};
	};
	
	// Find all vehicles and boxes at base
	_landArray = nearestObjects [getMarkerPos "respawn_west",["LandVehicle"],750];
	_airArray = nearestObjects [getMarkerPos "respawn_west",["Air"],750];
	_array = 
	[
		launcherCrate_1,
		launcherCrate_2,
		explosiveCrate_1,
		ammoCrate_1,
		ammoCrate_2,
		weaponCrate_1,
		weaponCrate_2,
		weaponCrate_3,
		grenadeCrate_1,
		grenadeCrate_2,
		equipmentCrate_1,
		medicalCrate_1,
		gearDump
	];

	// Check supplier
	// Add any banned weapons to the list
	if (supplier == "BLU") then {
		{_banned pushBack _x} forEach INS_RIFLE_BLU;
		{_banned pushBack _x} forEach INS_GL_BLU;
		{_banned pushBack _x} forEach INS_MG_BLU;
		{_banned pushBack _x} forEach INS_AT_BLU;
		{_banned pushBack _x} forEach INS_AA_BLU;
		{_banned pushBack _x} forEach INS_SNIPER_BLU;
	} else {
		{_banned pushBack _x} forEach INS_RIFLE_OPF;
		{_banned pushBack _x} forEach INS_GL_OPF;
		{_banned pushBack _x} forEach INS_MG_OPF;
		{_banned pushBack _x} forEach INS_AT_OPF;
		{_banned pushBack _x} forEach INS_AA_OPF;
		{_banned pushBack _x} forEach INS_SNIPER_OPF;
	};

	// For all the vehicles and boxes
	{
		if (isNil "_x") exitWith {};

		// Define cargo
		_inv = ((getMagazineCargo _x) + (getWeaponCargo _x));

		// Define object
		_obj = _x;

		// For all inventories
		{
			// Check if any banned items are inside
			// Remove if banned
			if (_x in _banned) then {
				if (_x isKindOf "CA_Magazine") then {
					_obj removeMagazineGlobal _x;
				} else {
					_obj removeWeaponGlobal _x;
				};
			};
		} forEach _inv;
	} forEach (_landArray + _airArray + _array);
	
};