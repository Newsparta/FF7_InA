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

params ["_cen", ["_rad", 2000, [0]]];

// ---------- MAIN ----------
private ["_q","_w"];

spotted = false;

while {true} do {
	scopeName "spotted";
	
	sleep (4 + (random 4));
	
	{
		_q = (independent knowsAbout _x);
		_w = (east knowsAbout _x);
		if ({_x distance _cen < _rad} count (allPlayers - entities "HeadlessClient_F") > 0) then  {
			if (_q > 3) then {
				spotted = true;
				hint "you have been spotted"; //debug
				breakOut "spotted";
			};
			if (_w > 3) then {
				spotted = true;
				hint "you have been spotted"; //debug
				breakOut "spotted";
			};
		};
	} forEach (allPlayers - entities "HeadlessClient_F");
	
	if !(InA_missionActive) then {
		breakOut "spotted";
	};
};