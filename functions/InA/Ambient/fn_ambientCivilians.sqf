/* ----------
Function: InA_fnc_ambientCivilians

Description:
    A function to spawn civilians/vehicles.

Parameters:
    - Center Location (Position)

Optional:
    - Radius to spawn (Number)
    - Total number of men to spawn (Number)
	- Total number of groups to spawn (Number)
	- Percentage (0 to 1) of building positions to spawn civilians in (Number)
	- Total number of parked cars (Number)

Example:
   
    [[0,0,0], 1500, 20, 1, 5] call InA_fnc_ambientCivilians

Returns:
    Nil

Author:
    [FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_loc"			,[]					,[]					,[]							],
		[	"_rad"			,1200				,[0]				,[]							],
		[	"_patrol"		,10					,[0]				,[]							],
		[	"_groups"		,4					,[0]				,[]							],
		[	"_dwellers"		,0.01				,[0]				,[]							],
		[	"_carsParked" 	,3					,[0]				,[]							]];

// Local declarations
private		_accepted			= false;
private		_agent				= nil;
private		_allRoads			= [];
private		_bldg				= nil;
private		_buildings			= [];
private		_car				= ObjNull;
private		_connectedRoads		= [];
private		_connectedTo		= nil;
private		_dir				= 0;
private		_diversity			= nil;
private		_hPos				= [];
private		_men				= [];
private		_nameTheif			= "";
private		_pos				= [];
private		_positions			= [];
private		_road				= nil;
private		_target				= nil;
private		_tempPos			= [];
private		_theif				= nil;
private		_towns				= [];
private		_val				= 0;

// Define animations to be used
#define ambientAnim "STAND_U1","STAND_U2","STAND_U3","SIT_LOW","SIT_LOW_U","BRIEFING"

// Civilian patrol
for "_i" from 1 to _patrol do {
	
	// Aquire diversity of ethnicities
	_men = [] call InA_fnc_diversity;

	// Create agent
	_pos = [_loc, 0, _rad, 1, 0, 1, 0] call BIS_fnc_findSafePos;
	_agent = createAgent [(selectRandom _men), _pos, [], 0, "NONE"];
	_agent disableAI "FSM";
	_agent setBehaviour "CARELESS";
	removeAllAssignedItems _agent;
	
	// assign patrol route
	[_agent, _loc, _rad] spawn InA_fnc_agentUrbanPatrol;

	// Add actions
	[_agent, [
			"Converse", 
			{
				[_this select 0] spawn InA_fnc_civEngage;
			}, [], 99, true, true, "", "((_target distance _this) < 4)"]] remoteExec ["addAction", 0];
	[_agent, [
			"Ask for directions", 
			{
				if ("ItemMap" in (assignedItems player)) exitWith {[false, "You already have a map to look at."] call InA_fnc_formatHint;};
				(_this select 1) linkItem "ItemMap";
				openMap true;
				waitUntil {sleep 1; !visibleMap};
				(_this select 1) unlinkItem "ItemMap";
			}, [], 99, true, true, "", "((_target distance _this) < 4)"]] remoteExec ["addAction", 0];
	
	// Add event handlers
	_agent addEventHandler ["killed",{[_this select 0,_this select 1] spawn InA_fnc_civKilled;}];
	_agent addEventHandler ["firedNear",{ambientShotsFired = true;}];
};

// Crowds
for "_i" from 1 to _groups do {
	
	// Find suitable location
	_accepted = false;
	while {!_accepted;} do {
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
	
	// Crowd members
	for "_i" from 0 to (2 + (random 4)) do {
	
		// Aquire diversity of ethnicities
		_men = [] call InA_fnc_diversity;
	
		// Create agent
		_tempPos = _pos getPos [3, (random 360)];
		_agent = createAgent [(selectRandom _men), _tempPos, [], 0, "CAN_COLLIDE"];
		_agent disableAI "FSM";
		_agent setBehaviour "CARELESS";
		_agent setDir (_tempPos getDir _pos);
		removeAllAssignedItems _agent;
		
		// Assign animation
		[_agent] spawn {
			sleep (random 5);
			[_this select 0, [ambientAnim] call BIS_fnc_selectRandom,"NONE"] call BIS_fnc_ambientAnim;
		};

		// Add actions
		[_agent, [
			"Converse", 
			{
				[_this select 0] spawn InA_fnc_civEngage;
			}, [], 99, true, true, "", "((_target distance _this) < 4)"]] remoteExec ["addAction", 0];
		[_agent, [
			"Ask for directions", 
			{
				if ("ItemMap" in (assignedItems player)) exitWith {[false, "You already have a map to look at."] call InA_fnc_formatHint;};
				(_this select 1) linkItem "ItemMap";
				openMap true;
				waitUntil {sleep 1; !visibleMap};
				(_this select 1) unlinkItem "ItemMap";
			}, [], 99, true, true, "", "((_target distance _this) < 4)"]] remoteExec ["addAction", 0];
		
		// Add event handlers
		_agent addEventHandler ["killed",{[_this select 0,_this select 1] spawn InA_fnc_civKilled;}];
		_agent addEventHandler ["firedNear",{ambientShotsFired = true;}];
	};
};

// Home dwellers
// Find buildings
_buildings = nearestTerrainObjects [_loc, ["HOUSE"], _rad];

// Get all positions
{
	_bldg = [_x] call BIS_fnc_buildingPositions;
	_positions = _positions + _bldg;
} forEach _buildings;

// Execute on each position
{
	// Check if value is less than set percentage
	if ((floor random 100) < (_dwellers * 100)) then {
	
		// Aquire diversity of ethnicities
		_men = [] call InA_fnc_diversity;

		// Create agent
		_agent = createAgent [(selectRandom _men), _x, [], 0, "CAN_COLLIDE"];
		_agent disableAI "FSM";
		_agent setBehaviour "CARELESS";
		removeAllAssignedItems _agent;
		_agent setDir (random 360);

		// Assign animation
		[_agent] spawn {
			sleep (random 5);
			[_this select 0, [ambientAnim] call BIS_fnc_selectRandom,"NONE"] call BIS_fnc_ambientAnim;
		};

		// Add actions
		[_agent, [
			"Converse", 
			{
				[_this select 0] spawn InA_fnc_civEngage;
			}, [], 99, true, true, "", "((_target distance _this) < 4)"]] remoteExec ["addAction", 0];
		[_agent, [
			"Ask for directions", 
			{
				if ("ItemMap" in (assignedItems player)) exitWith {[false, "You already have a map to look at."] call InA_fnc_formatHint;};
				(_this select 1) linkItem "ItemMap";
				openMap true;
				[(_this select 0),"MOVE"] remoteExec ["disableAI", 2];
				waitUntil {sleep 1; !visibleMap};
				(_this select 1) unlinkItem "ItemMap";
				[(_this select 0),"MOVE"] remoteExec ["enableAI", 2];
			}, [], 99, true, true, "", "((_target distance _this) < 4)"]] remoteExec ["addAction", 0];
		
		// Add event handlers
		_agent addEventHandler ["killed",{[_this select 0,_this select 1] spawn InA_fnc_civKilled;}];
		_agent addEventHandler ["firedNear",{ambientShotsFired = true;}];
	};
} forEach _positions;

// Parked cars
// Find nearest roads
_allRoads = _loc nearRoads _rad;

// Subtract out intersections
{
	_connectedRoads = roadsConnectedTo _x;
	if ((count _connectedRoads) > 2) then {
		_allRoads = _allRoads - [_x];
	};
} forEach _allRoads;

for "_i" from 1 to _carsParked do {
	
		// Select a road
		_road = selectRandom _allRoads;
		_connectedTo = ((roadsConnectedTo _road) select 0);

		// Choose a direction to face
		if (random 1 < 0.5) then {
			if (count (roadsConnectedTo _road) > 0) then {
				_dir = _road getDir _connectedTo;
			} else {
				_dir = random 360
			};

			// Create road
			_car = createVehicle [(selectRandom civ_cars), _road, [], 0, "CAN_COLLIDE"];
			_car setDir _dir;
			_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];

			// Spawn thief loop
			[_car] spawn {
				_car = _this select 0;
				_val = random 1;
				while {true;} do {
					scopeName format ["civCar%1",_val];

					sleep (2 + (random 2));

					// Check if car has a driver
					if (!isNull (driver _car)) then {

						_theif = driver _car;

						// If driver is a player, bag things happen
						if (isPlayer _theif) then {

							_nameTheif = name _theif;

							civTol = civTol - 0.2;

							[false, (format ["<t color='#CC2222'>%1</t> just stole a civilian vehicle.</t>", _nameTheif])] remoteExec ["InA_fnc_formatHint", 0];

						};

						breakOut format ["civCar%1",_val];
					};

					// Check if car is alive
					if (!alive _car) then {
						breakOut format ["civCar%1",_val];
					};
				};
			};

		} else {
			
			if (count (roadsConnectedTo _road) > 0) then {
				_dir = _road getDir _connectedTo;
			} else {
				_dir = random 360
			};

			// Create car
			_car = createVehicle [(selectRandom civ_cars), _road, [], 0, "CAN_COLLIDE"];
			_car setDir _dir;
			_car setPos [(getPosASL _car select 0) + 4.5, getPosASL _car select 1, 0];

			// Spawn theif loop
			[_car] spawn {
				_car = _this select 0;
				_val = random 1;
				while {true;} do {
					scopeName format ["civCar%1",_val];

					sleep (2 + (random 2));

					// Check if car has a driver
					if (!isNull (driver _car)) then {

						_theif = driver _car;

						// If driver is a player, bad thigns happen
						if (isPlayer _theif) then {

							_nameTheif = name _theif;

							civTol = civTol - 0.1;

							[false, (format ["<t color='#CC2222'>%1</t> just stole a civilian vehicle.</t>", _nameTheif])] remoteExec ["InA_fnc_formatHint", 0];

						};

						breakOut format ["civCar%1",_val];
					};

					// Check if the car is alive
					if (!alive _car) then {
						breakOut format ["civCar%1",_val];
					};
				};
			};		
		};
		
		// Clear car inventory
		clearBackpackCargoGlobal _car;
		clearMagazineCargoGlobal _car;
		clearWeaponCargoGlobal _car;
		clearItemCargoGlobal _car;

		// Check if car is badly damaged on spawn
		if (damage _car > 0.2) then {
			deleteVehicle _car;
		};
};