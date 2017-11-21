// ---------- arguments ----------

private ["_accepted","_pos","_blacklist"];

/*
Select location.
*/

_loc = [];
_candidates = [];
_choice = [];
_mark = [];

if !(InA_stronghold) then {

	_regions = [] call InA_fnc_regionCheck;

	{
		if ((_x select 1) >= 0.9) then {
			_candidates pushBack _x
		};
	} forEach _regions;

	if (count _candidates > 0) then {
			
		_choice = selectRandom _candidates;
		_mark = getMarkerPos (_choice select 0);

	};

	if (count _candidates < 1) exitWith {}; 

	_accepted = false;
	_towns = nearestLocations [
		_mark, 
		[
			"NameCity",
			"NameCityCapital",
			"NameVillage"
		], 
		500
	];

	while {!_accepted} do {

		_loc = locationPosition (selectRandom _towns);
			
		_isNearPlayer = false;

		{
			if ((_x distance _loc) < 2000) then {
				_isNearPlayer = true;
			};
		} forEach (allPlayers - entities "HeadlessClient_F");

		_isNearLoc = false;

		if (count concentrations > 0) then {
			{
				if ((_x distance _loc) < 2000) then {
					_isNearLoc = true;
				};
			} forEach concentrations;
		};
				
		if (((getMarkerPos "respawn_west") distance _loc) > 3000) then {
			if !(_isNearPlayer) then {
				if !(_isNearLoc) then {
					_accepted = true;
				};
			};
		};
	};

	InA_stronghold = true;
	InA_stronghold_Loc = _loc;

} else {

	_loc = InA_stronghold_Loc;

};
if (count _candidates < 1 && {!InA_stronghold}) exitWith {};

concentrations pushBack _loc;

/*
Loop for spawning AO when players are near.
*/

_cleared = false;

while {!_cleared} do {

	sleep (2 + (random 2));

	if ({_x distance _loc < mainLimit} count (allPlayers - entities "HeadlessClient_F") > 0) then {

		/////////////////////////
		// mission spawn start //
		/////////////////////////

		// ---------- MG nests ----------

		for "_i" from 1 to (1 + (round random 2)) do {

			_pos = [_loc, 0, 500, 5, 0, 0.2, 0] call BIS_fnc_findSafePos;

			[_pos] spawn InA_fnc_MGNest;

		};

		// ---------- Flags ----------

		for "_i" from 1 to (2 + (round random 5)) do {

			_pos = [_loc, 0, 500, 5, 0, 0.2, 0] call BIS_fnc_findSafePos;

			_obj = createVehicle [INS_FLAG, _pos, [], 0, "CAN_COLLIDE"];

		};

		// ---------- Find roads ----------

		_allRoads = _loc nearRoads 500;

		{
			_connectedRoads = roadsConnectedTo _x;
			if ((count _connectedRoads) > 2) then {
				_allRoads = _allRoads - [_x];
			};
		} forEach _allRoads;

		// ---------- Ambient truck spawns ----------

		for "_i" from 1 to (floor random 5) do {
			
				_road = selectRandom _allRoads;
				_connectedTo = ((roadsConnectedTo _road) select 0);
				_dir = 0;
				_car = ObjNull;
				
				if (random 1 < 0.5) then {
					if (count (roadsConnectedTo _road) > 0) then {
						_dir = _road getDir _connectedTo;
					} else {
						_dir = random 360
					};

					if (supplier == "BLU") then {
						_car = createVehicle [(selectRandom INS_TRUCK_BLU), _road, [], 0, "CAN_COLLIDE"];
					} else {
						_car = createVehicle [(selectRandom INS_TRUCK_OPF), _road, [], 0, "CAN_COLLIDE"];
					};
					_car setDir _dir;
					_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];

				} else {
					
					if (count (roadsConnectedTo _road) > 0) then {
						_dir = _road getDir _connectedTo;
					} else {
						_dir = random 360
					};

					if (supplier == "BLU") then {
						_car = createVehicle [(selectRandom INS_TRUCK_BLU), _road, [], 0, "CAN_COLLIDE"];
					} else {
						_car = createVehicle [(selectRandom INS_TRUCK_OPF), _road, [], 0, "CAN_COLLIDE"];
					};
					_car setDir _dir;
					_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];

				};
				
				clearBackpackCargoGlobal _car;
				clearMagazineCargoGlobal _car;
				clearWeaponCargoGlobal _car;
				clearItemCargoGlobal _car;
				if (damage _car > 0.2) then {
					deleteVehicle _car;
				};
		};

		// ---------- Ambient car spawns ----------

		for "_i" from 1 to (floor random 5) do {
			
				_road = selectRandom _allRoads;
				_connectedTo = ((roadsConnectedTo _road) select 0);
				_dir = 0;
				_car = ObjNull;
				
				if (random 1 < 0.5) then {
					if (count (roadsConnectedTo _road) > 0) then {
						_dir = _road getDir _connectedTo;
					} else {
						_dir = random 360
					};

					if (supplier == "BLU") then {
						_car = createVehicle [(selectRandom INS_CARU_BLU), _road, [], 0, "CAN_COLLIDE"];
						[
							_car,
							INS_CARU_OPF_TEX,
							INS_CARU_OPF_ANI
						] call BIS_fnc_initVehicle;
					} else {
						_car = createVehicle [(selectRandom INS_CARU_OPF), _road, [], 0, "CAN_COLLIDE"];
						[
							_car,
							INS_CARU_BLU_TEX,
							INS_CARU_BLU_ANI
						] call BIS_fnc_initVehicle;
					};
					_car setDir _dir;
					_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];

				} else {
					
					if (count (roadsConnectedTo _road) > 0) then {
						_dir = _road getDir _connectedTo;
					} else {
						_dir = random 360
					};

					if (supplier == "BLU") then {
						_car = createVehicle [(selectRandom INS_CARU_BLU), _road, [], 0, "CAN_COLLIDE"];
						[
							_car,
							INS_CARU_OPF_TEX,
							INS_CARU_OPF_ANI
						] call BIS_fnc_initVehicle;
					} else {
						_car = createVehicle [(selectRandom INS_CARU_OPF), _road, [], 0, "CAN_COLLIDE"];
						[
							_car,
							INS_CARU_BLU_TEX,
							INS_CARU_BLU_ANI
						] call BIS_fnc_initVehicle;
					};
					_car setDir _dir;
					_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];

				};
				
				clearBackpackCargoGlobal _car;
				clearMagazineCargoGlobal _car;
				clearWeaponCargoGlobal _car;
				clearItemCargoGlobal _car;
				if (damage _car > 0.2) then {
					deleteVehicle _car;
				};
		};

		_addSome = 0;

		if (count (call BIS_fnc_listPlayers) > 10) then {
			_addSome = 2;
		};

		// ---------- Enemies ----------
		private ["_pos","_group","_car","_wp"];

			// ---------- Generic large spawns ----------

			for "_i" from 0 to (round random (3 + _addSome)) do {
				_pos = [_loc, 0, 500, 1, 0, 1, 0] call BIS_fnc_findSafePos;

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

			for "_i" from 0 to (round random (3 + _addSome)) do {
				_pos = [_loc, 0, 500, 1, 0, 1, 0] call BIS_fnc_findSafePos;

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

			// ---------- AA ----------
			
			for "_i" from 0 to ((count (call BIS_fnc_listPlayers)) * 0.05) do {
				_pos = [_loc, 0, 500, 0, 0, -1, 0] call BIS_fnc_findSafePos;
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
					_pos = [_loc, 0, 250, 1, 0, 1, 0] call BIS_fnc_findSafePos;
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
					_pos = [_loc, 0, 250, 1, 0, 1, 0] call BIS_fnc_findSafePos;
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
					_pos = [_loc, 0, 250, 1, 0, 1, 0] call BIS_fnc_findSafePos;
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

			for "_i" from 0 to (round random 4) do {
				if (random 100 < random 50) then {
					_pos = [_loc, 0, 500, 0, 0, 50, 0] call BIS_fnc_findSafePos;

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

			// ---------- House spawns ----------

			_buildings = nearestTerrainObjects [
				_loc, 
				[
					"HOUSE",
					"HOSPITAL",
					"FUELSTATION"
				], 
				500
			];

			// ---------- Spawn in buildings ----------

			_array = [];
			{
				_bldg = [_x] call BIS_fnc_buildingPositions;
				_array = _array + _bldg;
			} forEach _buildings;

			{
				if (random 100 < 10) then {
					
					_group = [
						_x, 
						INDEPENDENT, 
						[
							(selectRandom INS_INF_SINGLE)
						]
					] call BIS_fnc_spawnGroup;
					_group setFormDir (random 360);
					[_group, _x] call BIS_fnc_taskDefend;
					[units _group] call InA_fnc_insCustomize;
					
				};
			} forEach _array;

		///////////////////////
		// mission spawn end //
		///////////////////////

		// ---------- enemies cleared trigger ----------

		_nme = createTrigger ["EmptyDetector",_loc];
		_nme setTriggerArea [1000,1000, 0, false];
		_nme setTriggerActivation ["GUER", "NOT PRESENT", false];
		_nme setTriggerStatements ["this","",""];

		// ---------- near mission pause loop ----------

		_called = false;

		while {true} do {
			scopeName "activity";

			sleep (2 + (random 2));

			if ({_x distance _loc < mainLimit} count (allPlayers - entities "HeadlessClient_F") > 0) then {

				if ((spotted) && {!_called}) then {
					[_loc] call InA_fnc_reinforcementCall;
					_called = true;
				};

				if (count list _nme < 20) then {

					deleteVehicle _nme;
					_cleared = true;
					compObj = compObj + 1;
					LogV = LogV + 6;
					LogM = LogM + (50 + (round random 100));
					concentrations = concentrations - _loc;

					[] spawn {

						sleep 172800;

						InA_stronghold = false;

					};
				
					["INSURGENT STRONGHOLD", "The insurgents concentrated here have been mostly routed."] remoteExec ["FF7_fnc_formatHint", 0];

					breakOut "activity";

					sleep 10;

					["INSURGENT STRONGHOLD", "Supplies have been appropriated from the insurgent stronghold."] remoteExec ["FF7_fnc_formatHint", 0];
				};
			};

			if ({_x distance _loc < mainLimit} count (allPlayers - entities "HeadlessClient_F") < 1) then {

				[_loc, (mainLimit - 500)] spawn InA_fnc_cleanup;

				deleteVehicle _nme;

				_active = false;

				breakOut "activity";
			};

		};
	};
};