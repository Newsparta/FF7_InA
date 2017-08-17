/* ----------
Function: InA_fnc_ambientCivilians

Description:
    A function to look for nearby towns or villages and spawn civilians/vehicles.

Parameters:
    - Center Location (Position)

Optional:
    - Radius to find towns (Number)
    - Total number of men to spawn (Number)
	- Total number of cars to spawn (Number)
	- Total number of parked cars (Number)
	- Percentage (0 to 1) of building positions to spawn civilians in (Number)

Example:
   
    [[0,0,0], 1500, 20, 1, 5] call InA_fnc_ambientCivilians

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- PARAMETERS ----------

params ["_loc",["_rad", 1200, [0]],["_patrol", 10, [0]],["_groups", 4, [0]],["_dwellers", 0.01, [0]],["_carsParked", 3, [0]]];
	
// ---------- MAIN ----------
private ["_towns","_diversity","_pos","_agent","_men","_accepted","_tempPos","_buildings","_positions",
"_bldg","_hPos"];
#define ambientAnim "STAND_U1","STAND_U2","STAND_U3","SIT_LOW","SIT_LOW_U","BRIEFING"

// ---------- Create patrol civilians ----------

for "_i" from 1 to _patrol do {
	
	_men = [] call InA_fnc_diversity;

	_pos = [_loc, 0, _rad, 1, 0, 1, 0] call BIS_fnc_findSafePos;
	_agent = createAgent [(selectRandom _men), _pos, [], 0, "NONE"];
	_agent disableAI "FSM";
	_agent setBehaviour "CARELESS";
	removeAllAssignedItems _agent;
	
	[_agent, _loc, _rad] spawn InA_fnc_agentUrbanPatrol;
	[_agent, [["FF9900", "Converse"] call FF7_fnc_formatText, 
	{
		[_this select 0] spawn InA_fnc_civEngage;
	}, [], 99, true, true, "", "((_target distance _this) < 4)"]] remoteExec ["addAction", 0];
	
	_agent addEventHandler ["killed",{[_this select 0,_this select 1] spawn InA_fnc_civKilled;}];
	_agent addEventHandler ["firedNear",{ambientShotsFired = true;}];
};

// ---------- Create crowds ----------

for "_i" from 1 to _groups do {
	
	_pos = [];
	_accepted = false;
	while {!_accepted} do {
		_tempPos = [[[_loc,_rad]],["water","out"]] call BIS_fnc_randomPos;
		_pos = _tempPos isFlatEmpty [1, 0, 1, 1, 0, false];
		
		if (count _pos > 2) then {
			if ((((nearestTerrainObjects [_pos, ["HOUSE"], _rad]) select 0) distance _pos) < 200) then {
				if (count (_pos nearRoads 10) < 1) then {
					_accepted = true;
				};
			};
		};
	};
	
	for "_i" from 0 to (2 + (random 4)) do {
	
		_men = [] call InA_fnc_diversity;
	
		_tempPos = _pos getPos [3, (random 360)];
		_agent = createAgent [(selectRandom _men), _tempPos, [], 0, "CAN_COLLIDE"];
		_agent disableAI "FSM";
		_agent setBehaviour "CARELESS";
		_agent setDir (_tempPos getDir _pos);
		removeAllAssignedItems _agent;
		
		[_agent] spawn {
			sleep (random 5);
			[_this select 0, [ambientAnim] call BIS_fnc_selectRandom,"NONE"] call BIS_fnc_ambientAnim;
		};

		[_agent, [["FF9900", "Converse"] call FF7_fnc_formatText, 
		{
			[_this select 0] spawn InA_fnc_civEngage;
		}, [], 99, true, true, "", "((_target distance _this) < 4)"]] remoteExec ["addAction", 0];
		
		_agent addEventHandler ["killed",{[_this select 0,_this select 1] spawn InA_fnc_civKilled;}];
		_agent addEventHandler ["firedNear",{ambientShotsFired = true;}];
	};
};

// ---------- House dwellers ----------

_buildings = nearestTerrainObjects [_loc, ["HOUSE"], _rad];

_positions = [];
{
	_bldg = [_x] call BIS_fnc_buildingPositions;
	_positions = _positions + _bldg;
} forEach _buildings;

{
	if ((floor random 100) < (_dwellers * 100)) then {
	
		_men = [] call InA_fnc_diversity;

		_agent = createAgent [(selectRandom _men), _x, [], 0, "CAN_COLLIDE"];
		_agent disableAI "FSM";
		_agent setBehaviour "CARELESS";
		removeAllAssignedItems _agent;
		_agent setDir (random 360);
		[_agent] spawn {
			sleep (random 5);
			[_this select 0, [ambientAnim] call BIS_fnc_selectRandom,"NONE"] call BIS_fnc_ambientAnim;
		};
		[_agent, [["FF9900", "Converse"] call FF7_fnc_formatText, 
		{
			[_this select 0] spawn InA_fnc_civEngage;
		}, [], 99, true, true, "", "((_target distance _this) < 4)"]] remoteExec ["addAction", 0];
		
		_agent addEventHandler ["killed",{[_this select 0,_this select 1] spawn InA_fnc_civKilled;}];
		_agent addEventHandler ["firedNear",{ambientShotsFired = true;}];
	};
} forEach _positions;

// ---------- Parked cars ----------

_allRoads = _loc nearRoads _rad;

{
	_connectedRoads = roadsConnectedTo _x;
	if ((count _connectedRoads) > 2) then {
		_allRoads = _allRoads - [_x];
	};
} forEach _allRoads;

for "_i" from 1 to _carsParked do {
	
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

			_car = createVehicle [(selectRandom civ_cars), _road, [], 0, "CAN_COLLIDE"];
			_car setDir _dir;
			_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];
		} else {
			if (count (roadsConnectedTo _road) > 0) then {
				_dir = _road getDir _connectedTo;
			} else {
				_dir = random 360
			};

			_car = createVehicle [(selectRandom civ_cars), _road, [], 0, "CAN_COLLIDE"];
			_car setDir _dir;
			_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];

			[_car] spawn {
				_car = _this select 0;
				_val = random 1;
				while {true} do {
					scopeName format ["civCar%1",_val];

					sleep (2 + (random 2));

					if (!isNull (driver _car)) then {

						_theif = driver _car;

						if (isPlayer _theif) then {

							_nameTheif = name _theif;

							civTol = civTol - 0.1;

							["Civility", (format ["<t color='#CC2222'>%1</t> just stole a civilian vehicle.</t>", _nameTheif])] remoteExec ["FF7_fnc_formatHint", 0];

						};

						breakOut format ["civCar%1",_val];
					};
					if (!alive _car) then {
						breakOut format ["civCar%1",_val];
					};
				};
			};		
		};
		
		clearBackpackCargoGlobal _car;
		clearMagazineCargoGlobal _car;
		clearWeaponCargoGlobal _car;
		clearItemCargoGlobal _car;
		if (damage _car > 0.2) then {
			deleteVehicle _car;
		};
};