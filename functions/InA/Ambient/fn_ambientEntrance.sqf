/* ----------
Function:
	InA_fnc_ambientEntrance

Description:
	Spawn ambient elements when players are near enough

Parameters:
	- location of region (Location)
	- Radius of region (Radius)
	- Size of region (String)
	- Instability value (Number)
	- Name of region (String)

Optional:

Example:
	[[0,0,0], 1000, "large", 0.5, "test"] call InA_fnc_ambientEntrance;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_loc"			,[]					,[]					,[]							],
		[	"_rad"			,[]					,[]					,[]							],
		[	"_size"			,[]					,[]					,[]							],
		[	"_instability"	,[]					,[]					,[]							],
		[	"_name"			,[]					,[]					,[]							]];

// Local declarations
private		_car				= ObjNull;
private		_choice				= nil;
private		_group				= [];
private		_groups				= 0;
private		_mkr				= nil;
private		_obj				= ObjNull;
private		_patrols			= 0;
private		_pos				= [];
private		_target				= nil;
private		_troops				= [];
private		_val				= 0;
private		_wp					= nil;

// Check region size
if (_size == "small") then {
	
	_patrols = (6 + (random 4));
	_groups = (1 + (random 2));
};
if (_size == "medium") then {

	_patrols = (8 + (random 5));
	_groups = (3 + (random 2));
};
if (_size == "large") then {

	_patrols = (20 + (random 10));
	_groups = (4 + (random 3));
};

// Spawn ambient civilians
[_loc,_rad, _patrols, _groups] spawn InA_fnc_ambientCivilians;
[_loc, _rad] spawn InA_fnc_agentTakeCover;

// Lock house doors
[_loc, _rad, 0.5,"lock"] spawn InA_fnc_houseLocks;

// Reset exit and firedNear variables
ambientExited = false;
ambientShotsFired = false;

// Check if stable region
if (_instability < 0.5) then {
	_pos = [_loc, 0, ((3 * _rad)/8), 1, 0, -1, 0] call BIS_fnc_findSafePos;
	_obj = createVehicle ["Flag_White_F", _pos, [], 0, "CAN_COLLIDE"];
	_obj setFlagTexture "img\foxforce_flag.jpg";
	[_obj, ["Fast travel",	
		{_this call InA_fnc_actionTeleport;}, 
		[], 
		99,
		true, 
		true, 
		"", 
		"((_target distance _this) < 8)"
	]] remoteExec ["addAction", 0, true];

	call compile format 
	[
		"
			_mkr = createMarker ['flag%1', _pos];
			'flag%1' setMarkerColor 'ColorWEST';
			'flag%1' setMarkerShape 'ICON';
			'flag%1' setMarkerType 'mil_dot';
		",
		_name
	];
};

// Check if destabalizing or greater
if (_instability >= 0.5) then {

  	// Large spawns
	for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.15) do {
		_pos = [_loc, 0, ((3 * _rad)/4), 1, 0, -1, 0] call BIS_fnc_findSafePos;

		_troops = [];
		for "_i" from 1 to (4 + (round random 6)) do {

			_troops pushBack (selectRandom INS_INF_SINGLE);
		};

		_group = [
			_pos, 
			INDEPENDENT,
			_troops
		] call BIS_fnc_spawnGroup;
		[_group, _pos, 500] call BIS_fnc_taskPatrol;
		[units _group] call InA_fnc_insCustomize;
	};
};

// Check if volatile region
if (_instability >= 0.9) then {
	
	// Check if region should have garrison
	if (random 100 < 80) then {
		
		for "_x" from 1 to (floor random 3) do {
			_pos = getPosATL (selectRandom (nearestTerrainObjects [_loc,["HOUSE","HOSPITAL","FUELSTATION"],_rad]));
			[_pos, 50, 0.1] call InA_fnc_indGarrison;
		}
	};

	// Check if has SPAAG
	if (random 100 < 50) then {

		// Select position
		_pos = [_loc, 0, ((3 * _rad)/4), 5, 0, 1, 0] call BIS_fnc_findSafePos;

		// Check supplier and spawn SPAAG
		if (supplier == "BLU") then {
			_car = (selectRandom INS_SPAAG_BLU) createVehicle _pos;
			[
				_car,
				INS_SPAAG_BLU_TEX,
				INS_SPAAG_BLU_ANI
			] call BIS_fnc_initVehicle;
		} else {
			_car = (selectRandom INS_SPAAG_OPF) createVehicle _pos;
			[
				_car,
				INS_SPAAG_OPF_TEX,
				INS_SPAAG_OPF_ANI
			] call BIS_fnc_initVehicle;
		};

		// Create crew
		_group = [
			_pos, 
			INDEPENDENT, 
			[
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
		(units _group select 0) assignAsDriver _car;
		(units _group select 1) assignAsGunner _car;
		_car lock 3;
		clearBackpackCargoGlobal _car;
		clearMagazineCargoGlobal _car;
		clearWeaponCargoGlobal _car;
		clearItemCargoGlobal _car;
		[units _group] call InA_fnc_insCustomize;
		
		// Spawn guard loop 
		[_group,_pos,_car] spawn {
			while {true} do {
				scopeName "guard1";
				if (spotted) then {
					_wp = (_this select 0) addWaypoint [(_this select 1),0];
					_wp waypointAttachVehicle (_this select 3);
					_wp setWaypointType "GETIN";
				
					[(_this select 0), (_this select 1)] call BIS_fnc_taskDefend;
					breakOut "guard2";
				};
			
				if (!alive (_this select 3) || count units (_this select 0) < 2) then {	
					breakOut "guard2";
				};
				sleep 3;
			};
		};
	};

	// Check if has ManPAD
	if (random 100 < 50) then {

		// Select location
		_pos = [_loc, 0, ((3 * _rad)/4), 1, 0, -1, 0] call BIS_fnc_findSafePos;

		// Create group
		_group = [
			_pos, 
			INDEPENDENT, 
			[
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;

		// Assign patrol
		[_group, _pos, 500] call BIS_fnc_taskPatrol;
		[units _group] call InA_fnc_insCustomize;

		// Override customization with AA
		{
			removeBackpackGlobal _x;
			
			if (supplier == "OPF") then {

				_choice = INS_AA_OPF call BIS_fnc_selectRandom;
				_x addBackpack (INS_BACKPACKS call BIS_fnc_selectRandom);
				for "_i" from 1 to 2 do {_x addMagazine (_choice select 1);};
				_x addWeapon (_choice select 0);
			} else {
			
				_choice = INS_AA_BLU call BIS_fnc_selectRandom;
				_x addBackpack (INS_BACKPACKS call BIS_fnc_selectRandom);
				for "_i" from 1 to 2 do {_x addMagazine (_choice select 1);};
				_x addWeapon (_choice select 0);
		
			};
		} forEach (units _group);
	};

	// Check if larger or smaller garrison
	if (random 100 < 50) then {

		// Large spawn
		for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.2) do {

			// Select location
			_pos = [_loc, 0, ((2 * _rad)/4), 1, 0, -1, 0] call BIS_fnc_findSafePos;

			// Create group size
			for "_i" from 1 to (4 + (round random 6)) do {

				_troops pushBack (selectRandom INS_INF_SINGLE);
			};

			// Create group
			_group = [
				_pos, 
				INDEPENDENT,
				_troops
			] call BIS_fnc_spawnGroup;

			// Assign defend
			[_group, _pos] call BIS_fnc_taskDefend;
			[units _group] call InA_fnc_insCustomize;
		};

		// Check if has armor
		if (random 100 < 25) then {

			// Select position
			_pos = [_loc, 0, ((2 * _rad)/4), 1, 0, 1, 0] call BIS_fnc_findSafePos;

			// Check supplier and spawn random armor
			if (supplier == "BLU") then {
				_car = (selectRandom (INS_APC_BLU + INS_IFV_BLU + INS_TANK_BLU)) createVehicle _pos;
				if (typeOf _car in INS_APC_BLU) then {
					[
						_car,
						INS_APC_BLU_TEX,
						INS_APC_BLU_ANI
					] call BIS_fnc_initVehicle;
				};
				if (typeOf _car in INS_IFV_BLU) then {
					[
						_car,
						INS_IFV_BLU_TEX,
						INS_IFV_BLU_ANI
					] call BIS_fnc_initVehicle;
				};
				if (typeOf _car in INS_TANK_BLU) then {
					[
						_car,
						INS_TANK_BLU_TEX,
						INS_TANK_BLU_ANI
					] call BIS_fnc_initVehicle;
				};
			} else {
				_car = (selectRandom (INS_APC_OPF + INS_IFV_OPF + INS_TANK_OPF)) createVehicle _pos;
				if (typeOf _car in INS_APC_OPF) then {
					[
						_car,
						INS_APC_OPF_TEX,
						INS_APC_OPF_ANI
					] call BIS_fnc_initVehicle;
				};
				if (typeOf _car in INS_IFV_OPF) then {
					[
						_car,
						INS_IFV_OPF_TEX,
						INS_IFV_OPF_ANI
					] call BIS_fnc_initVehicle;
				};
				if (typeOf _car in INS_TANK_OPF) then {
					[
						_car,
						INS_TANK_OPF_TEX,
						INS_TANK_OPF_ANI
					] call BIS_fnc_initVehicle;
				};
			};

			// Lock vehicle
			_car lock 3;

			// Clear vehicle inventory
			clearBackpackCargoGlobal _car;
			clearMagazineCargoGlobal _car;
			clearWeaponCargoGlobal _car;
			clearItemCargoGlobal _car;	

			// Create crew
			_group = [
				_pos, 
				INDEPENDENT, 
				[
					(selectRandom INS_INF_SINGLE),
					(selectRandom INS_INF_SINGLE),
					(selectRandom INS_INF_SINGLE)
				]
			] call BIS_fnc_spawnGroup;
				(units _group select 0) assignAsDriver _car;
				(units _group select 1) assignAsGunner _car;
				(units _group select 2) assignAsCommander _car;
			[units _group] call InA_fnc_insCustomize;

			// Spawn guard loop
			[_group,_pos,_car] spawn {
				_val = random 1;
				while {true} do {
					scopeName format ["ambientVeh%1",_val];

					sleep (2 + (random 2));

					if ((behaviour leader (_this select 0)) == "COMBAT") then {
						_wp = (_this select 0) addWaypoint [(_this select 1),0];
						_wp waypointAttachVehicle (_this select 3);
						_wp setWaypointType "GETIN";
					
						[(_this select 0), (_this select 1)] call BIS_fnc_taskDefend;
						breakOut format ["ambientVeh%1",_val];
					};
						
					if (!alive (_this select 3) || count units (_this select 0) < 2) then {
						
						breakOut format ["ambientVeh%1",_val];
					};
				};
			};
		};

	} else {
		
		// Large spawn
		for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.15) do {

			// Select location
			_pos = [_loc, 0, ((3 * _rad)/4), 1, 0, -1, 0] call BIS_fnc_findSafePos;

			// Create group size
			for "_i" from 1 to (4 + (round random 6)) do {
				_troops pushBack (selectRandom INS_INF_SINGLE);
			};

			// Create group
			_group = [
				_pos, 
				INDEPENDENT,
				_troops
			] call BIS_fnc_spawnGroup;
			[_group, _pos, 500] call BIS_fnc_taskPatrol;
			[units _group] call InA_fnc_insCustomize;
		};
	};
};