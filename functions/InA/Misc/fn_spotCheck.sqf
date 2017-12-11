/* ----------
Function: InA_fnc_spotCheck

Description:
    A function to check whether independent or opfor know about any of the players and are
		within a certain AO.

Parameters:
    - Center Location (Position)

Optional:
    - Radius players must be in (Number)

Example:
   
    [[0,0,0], 1500] call InA_fnc_spotCheck

Returns:
    spotted = (true if spotted, nil if not)

Author:
    [FF7] Newsparta
---------- */

// Local declarations
private		_players			= [];
private		_val				= 0;

// Set global variable
spotted = false;

// Loop start
while {true;} do {
		
	sleep (5 + (random 5));
	
	// Execute on all players
	{
		// Find out if enemy knows about 
		_val = (independent knowsAbout _x);

		// Check if enemy knows enough
		if (_val > 3) then {

			// Set spotted
			spotted = true;

			// Reset player array
			_players = [];
			
		} else {

			// Add player to array
			_players pushBack _x;

			// Check if all players are in unknown array
			if (count _players == count (allPlayers - entities "HeadlessClient_F")) then {

				// Reset spotted variable
				spotted = false;

			};
		};
	} forEach (allPlayers - entities "HeadlessClient_F");
};