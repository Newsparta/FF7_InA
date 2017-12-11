/* ----------
Script:
	Is wiped

Description:
	Check to see if all the players were killed and notify

Author:
	[FF7] Newsparta
---------- */

while {true;} do {

	// Wait until someone joins
	waitUntil {sleep 10; (count (allPlayers - entities "HeadlessClient_F") > 0);};

	// Enter new wait loop
	while {true;} do {
	scopeName "allDead";

		sleep (15 + (random 15));

		// Check if everyone is dead
		if (({alive _x} count (allPlayers - entities "HeadlessClient_F")) < 1) then {

			// Notification
			[false, "all players have been killed"] call InA_fnc_formatHint;
			
			// Wait until somone is alive
			waitUntil {sleep 5; ({alive _x} count (allPlayers - entities "HeadlessClient_F")) > 0;};

			// Break back to main loop
			breakOut "allDead";
		};
	};
};