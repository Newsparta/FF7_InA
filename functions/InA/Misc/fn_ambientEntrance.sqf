["HQ", "DEBUG", "Entered Ambient Area."] call FF7_fnc_globalHintStruct;

_loc = _this select 0;
_rad = _this select 1;
_size = _this select 2;
_insability = _this select 3;

_patrols = 0;
_groups = 0;

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

[_loc,_rad, _patrols, _groups] spawn InA_fnc_ambientCivilians;
[_loc, _rad] spawn InA_fnc_agentTakeCover;

[_loc, _rad, 0.5,"lock"] spawn InA_fnc_houseLocks;

ambientExited = false;
ambientShotsFired = false;

if (_instability >= 0.5) then {

// ---------- GENERIC LARGE SPAWN ----------
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

if (_instability >= 0.9) then {
	
	_pos = getPosATL (selectRandom (nearestObjects [_loc, ["building"], _rad]));
	[_pos, 50, 0.05] call InA_fnc_indGarrison;

	// ---------- SPAAG ----------
	
	if (random 100 < 50) then {
		_pos = [_loc, 0, ((3 * _rad)/4), 5, 0, 1, 0] call BIS_fnc_findSafePos;
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

	// ---------- AA ----------

	if (random 100 < 50) then {
		_pos = [_loc, 0, ((3 * _rad)/4), 1, 0, -1, 0] call BIS_fnc_findSafePos;
		_group = [
			_pos, 
			INDEPENDENT, 
			[
				(selectRandom INS_INF_SINGLE),
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;

		[_group, _pos, 500] call BIS_fnc_taskPatrol;
		[units _group] call InA_fnc_insCustomize;
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

	if (random 100 < 50) then {
		// ---------- GENERIC LARGE SPAWN ----------
		for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.2) do {
			_pos = [_loc, 0, ((2 * _rad)/4), 1, 0, -1, 0] call BIS_fnc_findSafePos;

			_troops = [];
			for "_i" from 1 to (4 + (round random 6)) do {

				_troops pushBack (selectRandom INS_INF_SINGLE);
			};

			_group = [
				_pos, 
				INDEPENDENT,
				_troops
			] call BIS_fnc_spawnGroup;
			[_group, _pos] call BIS_fnc_taskDefend;
			[units _group] call InA_fnc_insCustomize;
		};
		if (random 100 < 25) then {
			_pos = [_loc, 0, ((2 * _rad)/4), 1, 0, 1, 0] call BIS_fnc_findSafePos;
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
			_car lock 3;
			clearBackpackCargoGlobal _car;
			clearMagazineCargoGlobal _car;
			clearWeaponCargoGlobal _car;
			clearItemCargoGlobal _car;	
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
			[_group,_pos,_car] spawn {
				_val = random 1;
				while {true} do {
					scopeName format ["ambientVeh%1",_val];

					sleep (2 + (random 2));

					if ((behavior leader (_this select 0)) == "COMBAT") then {
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
		// ---------- GENERIC LARGE SPAWN ----------
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
};