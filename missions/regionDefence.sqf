/* ----------
Script:
	Region Defence

Description:
	Control region defence

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_regions		= [];
private		_candidates		= [];
private		_instability	= 0;
private		_marker			= nil;
private		_isNearLoc		= false;
private		_choice			= [];
private		_handle			= nil;

// Wait until faction is selected
waitUntil {
	sleep 1; 
	initialized;
};

	while {true;} do {

		sleep (7200 + (random 7200));

		// Collect region data
		_regions = [] call InA_fnc_regionCheck;
		_candidates = [];

		{
			_instability = (_x select 1);
			_marker = (getMarkerPos (_x select 0));
			_isNearLoc = false;

			// Check if region is not volatile
			if (_instability < 0.9) then {

				// Check if region is near any AO
				{
					if (_x distance _marker < 3000) then {
						_isNearLoc = true;
					};
				} forEach concentrations;

				// Accept location if conditions are met
				if !(_isNearLoc) then {
					_candidates pushBack _x;
				};
			};
		} forEach _regions;

		// Check if players are online
		if (count (allPlayers - entities "HeadlessClient_F") > 0) then {
			
			// Check if there are valid locations
			if (count _candidates > 0) then {
				
				// Select region
				_choice = selectRandom _candidates;

				// Execute defence script
				_handle = [getMarkerPos (_choice select 0),1500,_choice] execVM "missions\defendRegion.sqf";

				waitUntil {sleep (5 + (random 5)); scriptDone _handle;};

				sleep 21600;
			};
		};
	};