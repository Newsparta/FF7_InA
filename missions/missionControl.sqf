/* ----------
Script:
	Mission Control
Description:
	Handles the spawning of stronghold's and hideouts
Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_regions		= [];
private		_cond			= [];

// wait until faction is selected
waitUntil {
	sleep 20; 
	["HQ", "Headquarters", "Select a base theme to begin."] remoteExec ["FF7_fnc_globalHintStruct", 0]; 
	initialized;
};

// enemy knows about routine
[] spawn InA_fnc_spotCheck;

// basic hideout spawn
[] spawn InA_fnc_majorActivity;

// control loop start
while {true} do {
	
	sleep (5 + (random 5));

	// stronghold spawner
	if !(InA_stronghold) then {
		[] spawn InA_fnc_stronghold;
	};

	// collect region data
	_regions = [] call InA_fnc_regionCheck;
	_cond = [];

	{
		_cond pushBack (_x select 1);
	} forEach _regions; 

	// at least 1 hideout active at all times
	if (activeLocations < 1) then {
		[] spawn InA_fnc_majorActivity;
	};

	sleep 1;

	// conditional for >= 25% regions secured
	if ((({_x < 0.5} count _cond)/ count _regions) >= 0.25) then {
		if (activeLocations < 2) then {
			[] spawn InA_fnc_majorActivity;
		};
	};

	sleep 1;

	// conditional for >= 50% regions secured
	if ((({_x < 0.5} count _cond)/ count _regions) >= 0.50) then {
		if (activeLocations < 3) then {
			[] spawn InA_fnc_majorActivity;
		};
	};

	sleep 1;

	// conditional for >= 75% regions secured
	if ((({_x < 0.5} count _cond)/ count _regions) >= 0.75) then {
		if (activeLocations < 4) then {
			[] spawn InA_fnc_majorActivity;
		};
	};
};