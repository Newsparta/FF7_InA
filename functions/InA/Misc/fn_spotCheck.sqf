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
    Newsparta
---------- */

// ---------- PARAMETERS ----------

params [];

// ---------- MAIN ----------
private ["_q"];

spotted = false;
_players = [];

while {true} do {
		
	sleep (5 + (random 5));
	
	{
		_q = (independent knowsAbout _x);

		if (_q > 3) then {

			spotted = true;
			_players = [];
			hint "you have been spotted"; //debug
			
		} else {

			_players pushBack _x;

			if (count _players == count (allPlayers - entities "HeadlessClient_F")) then {

				spotted = false;

			};
		};
	} forEach (allPlayers - entities "HeadlessClient_F");
};