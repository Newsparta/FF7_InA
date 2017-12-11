/* ----------
Script:
	Autosave

Description:
	Automatically save the game when all players leave

Author:
---------- */

while {true;} do {

	// Wait for someone to join the server
	waitUntil {sleep 10; (count (allPlayers - entities "HeadlessClient_F") > 0)};

	// Enter new wait loop
	while {true;} do {
	scopeName "save";

		sleep (30 + (random 30));

		// Check if players have left yet
		if (count (allPlayers - entities "HeadlessClient_F") < 1) then {

			// Save the game
			[] call InA_fnc_save;

			// Break back to initial loop
			breakOut "save";
		};
	};
};