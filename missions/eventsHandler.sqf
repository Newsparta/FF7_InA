waitUntil {sleep 1; initialized};

// ---------- Region defence ----------

[] spawn {
	private ["_regions","_candidates","_choice","_handle"];

	while {true} do {

		sleep (7200 + (random 7200));

		_regions = [] call InA_fnc_regionCheck;
		_candidates = [];

		{
			if ((_x select 1) < 0.9) then {
				_candidates pushBack _x
			};
		} forEach _regions;

		if (count (allPlayers - entities "HeadlessClient_F") > 0) then {
			if (count _candidates > 0) then {
				
				_choice = selectRandom _candidates;
				_handle = [getMarkerPos (_choice select 0),1500,_choice] execVM "missions\defendRegion.sqf";

				waitUntil {sleep (5 + (random 5)); scriptDone _handle;};

				sleep 21600;
			};
		};
	};
};