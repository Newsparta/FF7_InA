// ---------- Initialize ----------
private ["_accepted","_pos","_blacklist"];

InA_missionActive = true;
publicVariable "InA_missionActive";

_accepted = false;
while {!_accepted} do {
	_pos = [[[mapCenter,mapSize]],["water","out"]] call BIS_fnc_randomPos;
	mission = _pos isFlatEmpty [5, 0, 0.6, 5, 0, false];
	
	if (count mission > 2) then {
		
		_isNear = false;

		{
			if ((_x distance mission) < 2000) then {
				_isNear = true;
			};
		} forEach (allPlayers - entities "HeadlessClient_F");
		
		if (((getMarkerPos "respawn_west") distance mission) > 3000) then {
			if !(_isNear) then {
				_accepted = true;
			};
		};
	};
};

// ---------- Objective Spawns ----------
private ["_bank"];

_bank = 
[
	"commOutpost",
	"fuelDepot",
	"HVTOfficer",
	"MGNest",
	"weaponsCache",
	"supplyOutpost",
	"barracksStructure"
];

for "_i" from 0 to (random 3) do {

	_selection = selectRandom _bank;

	call compile format 
	[
		"[mission] call InA_fnc_%1",
		_selection
	];
};

// ---------- Enemies ----------
private ["_pos","_group","_car","_wp"];

	// ---------- Generic large spawns ----------

	for "_i" from 0 to (round random 3) do {
		_pos = [mission, 0, 1000, 1, 0, 1, 0] call BIS_fnc_findSafePos;

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
		_group setFormDir (random 360);
		[units _group] call InA_fnc_insCustomize;
	};

	for "_i" from 0 to (round random 3) do {
		_pos = [mission, 0, 500, 1, 0, 1, 0] call BIS_fnc_findSafePos;

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
	
	// ---------- Convoy ----------
/*	
	if (random 100 < 50) then {
	
		_vehicles = [];
		if (supplier == "BLU") then {
			_vehicles = INS_CAR_OPF + INS_MRAP_OPF + INS_SPAAG_OPF + INS_APC_OPF + INS_IFV_OPF + INS_TANK_OPF + INS_TRUCK_OPF;
		} else {
			_vehicles = INS_CAR_BLU + INS_MRAP_BLU + INS_SPAAG_BLU + INS_APV_BLU + INS_IFV_BLU + INS_TANK_BLU + INS_TRUCK_BLU;
		};
		
		_pos = [mission, 0, 1000, 5, 0, 1, 0] call BIS_fnc_findSafePos;
		
		for "_i" from 0 to (1 + random 3) do {
			_veh = (selectRandom _vehicles) createVehicle _pos;
		};
	
	};
	*/
	// ---------- AA ----------
	
	for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.05) do {
		_pos = [mission, 0, 500, 0, 0, -1, 0] call BIS_fnc_findSafePos;
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
	
	// ---------- Vehicle guards ----------
	
	for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.1) do {
		if (random 100 < 50) then {
			_pos = [mission, 0, 750, 1, 0, 1, 0] call BIS_fnc_findSafePos;
			if (supplier == "BLU") then {
				_car = (selectRandom INS_CAR_BLU) createVehicle _pos;
				[
					_car,
					INS_CAR_BLU_TEX,
					INS_CAR_BLU_ANI
				] call BIS_fnc_initVehicle;
			} else {
				_car = (selectRandom INS_CAR_OPF) createVehicle _pos;
				[
					_car,
					INS_CAR_OPF_TEX,
					INS_CAR_OPF_ANI
				] call BIS_fnc_initVehicle;
			};
			clearBackpackCargoGlobal _car;
			clearMagazineCargoGlobal _car;
			clearWeaponCargoGlobal _car;
			clearItemCargoGlobal _car;	
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
	};

	for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.067) do {
		if (random 100 < 50) then {
			_pos = [mission, 0, 750, 1, 0, 1, 0] call BIS_fnc_findSafePos;
			if (supplier == "BLU") then {
				_car = (selectRandom INS_MRAP_BLU) createVehicle _pos;
				[
					_car,
					INS_MRAP_BLU_TEX,
					INS_MRAP_BLU_ANI
				] call BIS_fnc_initVehicle;
			} else {
				_car = (selectRandom INS_MRAP_OPF) createVehicle _pos;
				[
					_car,
					INS_MRAP_OPF_TEX,
					INS_MRAP_OPF_ANI
				] call BIS_fnc_initVehicle;
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
					(selectRandom INS_INF_SINGLE)
				]
			] call BIS_fnc_spawnGroup;
				(units _group select 0) assignAsDriver _car;
				(units _group select 1) assignAsGunner _car;
			[units _group] call InA_fnc_insCustomize;
			[_group,_pos,_car] spawn {
				while {true} do {
					scopeName "guard1";
					if (spotted) then {
						_wp = (_this select 0) addWaypoint [(_this select 1),0];
						_wp waypointAttachVehicle (_this select 3);
						_wp setWaypointType "GETIN";
					
						[(_this select 0), (_this select 1)] call BIS_fnc_taskDefend;
						breakOut "guard1";
					};
					
					if (!alive (_this select 3) || count units (_this select 0) < 2) then {
						
						breakOut "guard1";
					};
				sleep 3;
				};
			};
		};
	};

	for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.067) do {
		if (random 100 < 50) then {
			_pos = [mission, 0, 750, 1, 0, 1, 0] call BIS_fnc_findSafePos;
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
				while {true} do {
					scopeName "guard3";
					if (spotted) then {
						_wp = (_this select 0) addWaypoint [(_this select 1),0];
						_wp waypointAttachVehicle (_this select 3);
						_wp setWaypointType "GETIN";
					
						[(_this select 0), (_this select 1)] call BIS_fnc_taskDefend;
						breakOut "guard3";
					};
					
					if (!alive (_this select 3) || count units (_this select 0) < 2) then {
						
						breakOut "guard3";
					};
					
				sleep 3;
				};
			};
		};
	};

	// ---------- Small patrols ----------

	for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.1) do {
		if (random 100 < random 50) then {
			_pos = [mission, 0, 750, 0, 0, 50, 0] call BIS_fnc_findSafePos;

			_troops = [];
			for "_i" from 1 to (round random 4) do {

				_troops pushBack (selectRandom INS_INF_SINGLE);
			};

			_group = [
			_pos, 
			INDEPENDENT,
			_troops
		] call BIS_fnc_spawnGroup;
			[_group, _pos, 450] call BIS_fnc_taskPatrol;
			[units _group] call InA_fnc_insCustomize;
		};
	};
	
[] spawn {

	// ---------- basic objective ----------
	private ["_nme"];

	_nme = createTrigger ["EmptyDetector",mission];
	_nme setTriggerArea [1000,1000, 0, false];
	_nme setTriggerActivation ["GUER", "NOT PRESENT", false];
	_nme setTriggerStatements ["this","",""];
	
	while {true} do {
		scopeName "end";
		
		sleep (5 + (random 5));
		
		if !(InA_missionActive) then {breakOut "end";};
		
		if (count list _nme < 20) then {
			
			compObj = compObj + 1;
			
			mainObjective = ["enemies near",1];
		
			breakOut "end";
		};
	};
};

// ---------- After action trigger ----------

waitUntil {sleep (2 + (random 2)); ({_x distance mission < 2500} count (allPlayers - entities "HeadlessClient_F") > 0)};

afterActionReport = true;