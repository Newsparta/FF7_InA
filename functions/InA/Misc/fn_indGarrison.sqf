/* ----------
Function: InA_fnc_indGarrison

Description:
    A function to spawn independent units within buildings in an area. Also spawns a trigger loop for 
		each instance that will change the occupants to guard mode when players are within 2x spawn area

Parameters:
    - Center Location (Position)

Optional:
    - Radius to spawn soldiers (Number)
	- Percentage (0 to 1) of building positions to spawn soldiers in (Number)
	- Percentage (0 to 1) to spawn a static on avaliable building position, depending on specific structure (Number)

Example:
   
    [[0,0,0], 100, 0.05] call InA_fnc_indGarrison

Returns:
    Nil

Author:
    Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_loc"			,[]					,[]					,[]							],
		[	"_rad"			,100				,[0]				,[]							],
		[	"_garPct"		,0.05				,[0]				,[]							],
		[	"_staPct"		,0.05				,[0]				,[]							],
		[	"_trucks"		,1					,[0]				,[]							],
		[	"_cars"			,1					,[0]				,[]							]];

// Local declarations
private		_allRoads			= [];
private		_array				= [];
private		_bldg				= [];
private		_buildings			= [];
private		_car				= ObjNull;
private		_connectedRoads		= nil;
private		_connectedTo		= nil;
private		_dir				= 0;
private		_group				= [];
private		_i					= 0;
private		_obj				= ObjNull;
private		_pos				= [];
private		_road				= nil;

// Find buildings
_buildings = nearestTerrainObjects [
	_loc, 
	[
		"HOUSE",
		"HOSPITAL",
		"FUELSTATION"
	], 
	_rad
];

// Exit if there are no buildings found
if ((count _buildings) < 1) exitWith {};

// Find all the positions in the buildings
_array = [];
{
	_bldg = [_x] call BIS_fnc_buildingPositions;
	_array = _array + _bldg;
} forEach _buildings;

// Spawn men
{
	if (random 100 < (_garPct * 100)) then {
		
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

// Spawn statics
{
	if (random 100 < (_staPct * 100)) then {
		
		_pos = [getPosATL _x, 0, 30, 1, 0, 1, 0] call BIS_fnc_findSafePos;
		_dir =  (getPosATL _x) getDir _pos;
		
		if (supplier == "BLU") then {
			_obj = createVehicle [(selectRandom INS_STATIC_HMG_BLU), _pos,[],0,"NONE"];
		} else {
			_obj = createVehicle [(selectRandom INS_STATIC_HMG_OPF), _pos,[],0,"NONE"];
		};
			
		_obj setDir _dir;
		_obj setPos [_pos select 0, _pos select 1, 0];
		
		_group = [
			[0,0,0], 
			INDEPENDENT, 
			[
				(selectRandom INS_INF_SINGLE)
			]
		] call BIS_fnc_spawnGroup;
		(units _group select 0) moveInTurret [_obj, [0]];
		[units _group] call InA_fnc_insCustomize;
	};
} forEach _buildings;

// Find all roads
_allRoads = _loc nearRoads _rad;

// Remove duplicate roads
{
	_connectedRoads = roadsConnectedTo _x;
	if ((count _connectedRoads) > 2) then {
		_allRoads = _allRoads - [_x];
	};
} forEach _allRoads;

// Exit if not enough roads found
if (count _allRoads < 3) exitWith {};

// Spawn trucks
for "_i" from 1 to _trucks do {
	
		// Select a road
		_road = selectRandom _allRoads;
		_connectedTo = ((roadsConnectedTo _road) select 0);

		// Spawn the truck
		if (supplier == "BLU") then {
			_car = createVehicle [(selectRandom INS_TRUCK_BLU), _road, [], 0, "CAN_COLLIDE"];
			[
				_car,
				missionNamespace getVariable ["INS_TRUCK_BLU_TEX", nil],
				missionNamespace getVariable ["INS_TRUCK_BLU_ANI", nil]
			] call BIS_fnc_initVehicle;
		} else {
			_car = createVehicle [(selectRandom INS_TRUCK_OPF), _road, [], 0, "CAN_COLLIDE"];
			[
				_car,
				missionNamespace getVariable ["INS_TRUCK_OPF_TEX", nil],
				missionNamespace getVariable ["INS_TRUCK_OPF_ANI", nil]
			] call BIS_fnc_initVehicle;
		};
		
		// Check which direction the car will face
		if (random 1 < 0.5) then {

			// Get the road direction
			if (count (roadsConnectedTo _road) > 0) then {
				_dir = _road getDir _connectedTo;
			} else {
				_dir = random 360
			};

			// Confirm position
			_car setDir _dir;
			_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];
		} else {

			// Get the road direction
			if (count (roadsConnectedTo _road) > 0) then {
				_dir = _road getDir _connectedTo;
			} else {
				_dir = random 360
			};

			// Confirm position
			_car setDir _dir;
			_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];		
		};

		// Clear vehicle cargo
		clearBackpackCargoGlobal _car;
		clearMagazineCargoGlobal _car;
		clearWeaponCargoGlobal _car;
		clearItemCargoGlobal _car;
};

// Spawn cars
for "_i" from 1 to _cars do {
	
		// Select a road
		_road = selectRandom _allRoads;
		_connectedTo = ((roadsConnectedTo _road) select 0);
		
		// Spawn the car
		if (supplier == "BLU") then {
			_car = createVehicle [(selectRandom INS_CARU_BLU), _road, [], 0, "CAN_COLLIDE"];
			[
				_car,
				missionNamespace getVariable ["INS_CARU_OPF_TEX", nil],
				missionNamespace getVariable ["INS_CARU_OPF_ANI", nil]
			] call BIS_fnc_initVehicle;
		} else {
			_car = createVehicle [(selectRandom INS_CARU_OPF), _road, [], 0, "CAN_COLLIDE"];
			[
				_car,
				missionNamespace getVariable ["INS_CARU_BLU_TEX", nil],
				missionNamespace getVariable ["INS_CARU_BLU_ANI", nil]
			] call BIS_fnc_initVehicle;
		};

		// Check which direction the car will face
		if (random 1 < 0.5) then {

			// Get the road direction
			if (count (roadsConnectedTo _road) > 0) then {
				_dir = _road getDir _connectedTo;
			} else {
				_dir = random 360
			};
			
			// Confirm position
			_car setDir _dir;
			_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];
		
		} else {

			// Get the road direction
			if (count (roadsConnectedTo _road) > 0) then {
				_dir = _road getDir _connectedTo;
			} else {
				_dir = random 360
			};

			// Confirm position
			_car setDir _dir;
			_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];		
		};
		
		// Clear vehicle cargo
		clearBackpackCargoGlobal _car;
		clearMagazineCargoGlobal _car;
		clearWeaponCargoGlobal _car;
		clearItemCargoGlobal _car;
};