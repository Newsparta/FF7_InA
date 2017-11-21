waitUntil {sleep 1; initialized};

// ---------- Region defence ----------

[] spawn {
	private ["_regions","_candidates","_choice","_handle"];

	while {true} do {

		sleep (7200 + (random 7200));

		_regions = [] call InA_fnc_regionCheck;
		_candidates = [];

		{
			_instability = (_x select 1);
			_marker = (getMarkerPos (_x select 0));
			_isNearLoc = false;

			if (_instability < 0.9) then {
				{
					if (_x distance _marker < 3000) then {
						_isNearLoc = true;
					};
				} forEach concentrations;

				if !(_isNearLoc) then {
					_candidates pushBack _x;
				};
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

// ---------- Base attack ----------
/*
[] spawn {

	_rad = 300;

	while {true} do {

		sleep (16200 + (random 27000));

		if ({_x distance _loc < _rad} count (allPlayers - entities "HeadlessClient_F") > 0) then {

			_dir = (round random 360);
			_cardinal = "";

			if (_dir >= 337.5 && {_dir < 22.5}) then {
				_cardinal = "North";
			};
			if (_dir >= 22.5 && {_dir < 67.5}) then {
				_cardinal = "North-East";
			};
			if (_dir >= 67.5 && {_dir < 112.5}) then {
				_cardinal = "East";
			};
			if (_dir >= 112.5 && {_dir < 157.5}) then {
				_cardinal = "South-East";
			};
			if (_dir >= 157.5 && {_dir < 202.5}) then {
				_cardinal = "South";
			};
			if (_dir >= 202.5 && {_dir < 247.5}) then {
				_cardinal = "South-West";
			};
			if (_dir >= 247.5 && {_dir < 295.5}) then {
				_cardinal = "West";
			};
			if (_dir >= 295.5 && {_dir < 337.5}) then {
				_cardinal = "North-West";
			};
			
			_handle = [_rad,_dir,_cardinal] execVM "missions\baseAttack.sqf";

			waitUntil {sleep (5 + (random 5)); scriptDone _handle;};

			sleep 21600;

		};
	};
};*/