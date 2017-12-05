// ---------- Supplier check init ----------

waitUntil {sleep 1; initialized};

// ---------- Control loop ----------
private ["_opforVehicles","_vehiclesAtBase"];

while {true} do {

	sleep 60;
	
	_opforVehicles = INS_CAR_OPF + INS_CARU_OPF + INS_TRUCK_OPF + INS_CAR_BLU + INS_CARU_BLU + INS_TRUCK_BLU;
	
	_vehiclesAtBase = nearestObjects [getMarkerPos "respawn_west", _opforVehicles, 750];
	
	if (count _vehiclesAtBase > 0) then {
		[true, "Your superiors have instructed you to decommission any opfor vehicles at base.", "Headquarters"] remoteExec ["InA_fnc_formatHint", 0];
		
		sleep 300;
	
		_vehiclesAtBase = nearestObjects [getMarkerPos "respawn_west", _opforVehicles, 750];
		
		if (count _vehiclesAtBase > 0) then {
			{
				deleteVehicle _x;
			} forEach _vehiclesAtBase;
			[true, "Your superiors have decommissioned the vehicles for you.", "Headquarters"] remoteExec ["InA_fnc_formatHint", 0];
		};
	};
	
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

	_banned = [];
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

	{
		if (isNil "_x") exitWith {};

		_inv = ((getMagazineCargo _x) + (getWeaponCargo _x));
		_obj = _x;
		{
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