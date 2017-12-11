/* ----------
Function: InA_fnc_ambientModule

Description:
    A function to manage ambient elements

Parameters:
    - Center Location (Position)
	- Name of the ambient Area (String)
	- Radius of the ambient area (Number)

Optional:


Example:
   
    [[0,0,0], Tanouka, 2000] spawn InA_fnc_ambientModule

Returns:
    Nil

Author:
    [FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_loc"			,[]					,[]					,[]							],
		[	"_name"			,[]					,[]					,[]							],
		[	"_rad"			,1000				,[0]				,[]							],
		[	"_size"			,"small"			,[""]				,[]							]];

// Local declarations
private		_affect				= false;
private		_affectTimer		= 1;
private		_ambMult			= 0.75;
private		_didSomething		= false;
private		_i					= 0;
private		_instability		= (0.5 + (random 0.5));
private		_needAid			= false;
private		_nme				= nil;
private		_reward				= false;

// Create global variable for region spawn
call compile format
[
	"%1Occupied = false",
	_name
];

// Create global variable for instability
call compile format
[
	"instability%1 = %2",
	_name,
	_instability
];

// Spawn instability update function
[_loc,_name,_instability] spawn InA_fnc_instabilityUpdate;

// Main loop
while {true;} do {

	sleep (2 + (random 2));

	// Check if players are near enough to spawn elements
	if ({_x distance _loc < (_rad * 1.25)} count (allPlayers - entities "HeadlessClient_F") > 0) then {
	
		// Execute ambient entrance and set global variable for region spawn
		call compile format
		[
			"
				
				if (!%1Occupied) then {
					
					[%2,%3,'%4',instability%1,'%1'] call InA_fnc_ambientEntrance;
				};
				
				%1Occupied = true;
			",
			_name,
			_loc,
			_rad,
			_size
		];
	
	};

	// Check if players are close enough to have entered
	if ({_x distance _loc < _rad} count (allPlayers - entities "HeadlessClient_F") > 0) then {

		// update instability value incase edited
		_instability = call compile format
		[
			"
				instability%1;
			",
			_name
		];

		// Reset local timer
		_i = 0;
		
		// Check if stable region
		if (_instability < 0.5) then {

			_reward = false;
			_affect = false;
			_needAid = true;
			_didSomething = false;
			_affectTimer = 0.25;
			_ambMult = 0.25;
		};

		// Check if destabalizing
		if ((_instability >= 0.5) && {_instability < 0.9}) then {

			_reward = false;
			_affect = false;
			_needAid = true;
			_didSomething = false;
			_affectTimer = 0.75;
			_ambMult = 1.25;
		};

		// Check if volatile
		if (_instability >= 0.9) then {
			
			_reward = true;
			_affect = false;
			_needAid = false;
			_didSomething = false;
			_affectTimer = 1;
			_ambMult = 1.75;
		};
		
		// Entered loop
		while {true;} do {
		scopeName "entered";
			
			sleep (2 + (random 2));
			
			// Increment local timer
			_i = _i + 1;
			
			// Lower spawn multiplier at time
			if (_i >= 225) then {
				_ambMult = 0.25;
			};
			
			// Check if players are actually still in the region
			if ({_x distance _loc < _rad} count (allPlayers - entities "HeadlessClient_F") > 0) then {

				// Check if the region needs aid and there are aid vehicles
				if ((_needAid) && {count (nearestObjects [_loc, idap_cars, _rad]) > 0}) then {

					// add actions to aid vehicles
					[_loc, _rad, _name] spawn InA_fnc_aidVehicle;

					_needAid = false;
				};

				// RNG check for enemy spawns
				[_loc, _rad, _ambMult] call InA_fnc_ambientEnemies;
			};
			
			// Check if players leave the region
			if ({_x distance _loc < _rad} count (allPlayers - entities "HeadlessClient_F") < 1) then {
					
				// Determine how many independent units are left inside
				_nme = {(side _x == resistance) && ((_x distance _loc) < _rad)} count allUnits;
					
				// Check if the affect timer expired
				if (_affect) then {

					// Check if many insurgents were left
					if (_nme > 15) then {

						// Set instability
						_instability = random 0.5;

						// Check if very many insurgents were left
						if (_nme > 25) then {

							// Set instability
							_instability = (0.5 + (random 0.5));
						};
					// Reset instability value
					} else {
						_instability = 0;
					};
					
					// Update global variable for instability
					call compile format
					[
						"instability%1 = %2",
						_name,
						_instability
					];

					// check if region was made volatile and remove from fortified list
					if (_loc in fortifiedRegions) then {
						if (_instability > 0.5) then {

							private _index = fortifiedRegions find _loc;
							fortifiedRegions set [_index, -1];

							fortifiedRegions = fortifiedRegions - [-1];
						};
					};
				};
				
				// Spawn cleanup protocol
				[_loc,_rad,_name] spawn {
					
					_loc = _this select 0;
					_rad = _this select 1;
					_name = _this select 2;
					
					// Wait until the players are far enough away from region
					waitUntil {sleep (2 + (random 2)); {_x distance _loc < (_rad * 1.5)} count (allPlayers - entities "HeadlessClient_F") < 1};
					
					// Reset the ambient spawn variable and delete any marker
					call compile format
					[
						"
							%1Occupied = false;
							deleteMarker 'flag%1';
						",
						_name
					];

					// Clean up	
					[_loc,_rad] spawn InA_fnc_cleanup;
				};
				
				// Unlock all house doors
				[_loc, _rad, 1,"unlock"] spawn InA_fnc_houseLocks;
					
				// Set global variable
				ambientExited = true;
				
				// Break out of entered loop
				breakOut "entered";
			};

			// Increment affect timer
			_affectTimer = _affectTimer - (0.0034 + (.0001 * ({(side _x == west) && ((_x distance _loc) < _rad)} count allUnits)));
			
			// Check if affect timer expired
			if (_affectTimer < 0) then {
				_affectTimer = 0;
				
				// Check if affect expiration has already been enacted
				if !(_affect) then {

					// Notification
					[true, "The region has been affected by your presence.", format ["%1", _name]] remoteExec ["InA_fnc_formatHint", 0, false];
					
					// Set affect variable
					_affect = true;
					
					// Check if reward was possible
					if (_reward) then {
						LogV = LogV + 1;
						civTol = civTol + 0.1;
						_reward = false;
					};
				};
				
				// Update number of independent units inside area
				_nme = {(side _x == resistance) && ((_x distance _loc) < _rad)} count allUnits;
				
				// Check if didSomething was already enacted and are few enemies
				if ((!_didSomething) and {_nme <= 15}) then {
				
					// Set variable
					_didSomething = true;
					
					sleep 3;

					// Notification
					[true, "The region appears to be pacified.", format ["%1", _name]] remoteExec ["InA_fnc_formatHint", 0, false];
				};
			};
		};
	};
};
