_loc = getMarkerPos "respawn_west";
_rad = 500;

while {true} do {

	sleep (2 + (random 2));

	if ({_x distance _loc < _rad} count (allPlayers - entities "HeadlessClient_F") > 0) then {

		if (random 100 < (0.8 + (0.8  * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
			[
				_loc, 
				_rad + 500, 
				(_rad/2), 
				1,
				"COMBAT",
				"FULL"
			] spawn InA_fnc_insLightInfantryAttack;
		};
	};
};