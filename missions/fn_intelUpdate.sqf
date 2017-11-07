_quality = "";

[clientOwner, "concentrations"] remoteExec ["publicVariableClient", 2];

sleep 0.2;

if (random 1 <= (0.1 + (0.6 * civTol))) then {
	_quality = "high";
} else {
	_quality = "low";
};

// ---------- activity Locations ----------

_loc = "";

if (_quality == "high") then {

	{
		{
			_num = random 1;

			_size = (500 + (random 500));
			_pos = [_x, 0, (_size - 100), 0, 0, 0, 0] call BIS_fnc_findSafePos;
			_mkr = createMarker [format ["AO%1", _num], _pos];
			format ["AO%1", _num] setMarkerColor "ColorGUER";
			format ["AO%1", _num] setMarkerShape "ELLIPSE";
			format ["AO%1", _num] setMarkerBrush "BDiagonal";
			format ["AO%1", _num] setMarkerSize [_size, _size];
			
			[_num] spawn {
				private ["_x"];
				_x = 1;
				while {_x = _x - (1/120); _x > 0} do {
					
					format ["AO%1", _this select 0] setMarkerAlpha _x;
					
					sleep 1;
				};

				sleep 120;

				deleteMarker format ["AO%1", _this select 0];
			};

		} forEach concentrations;

	} remoteExec ["BIS_fnc_call", 2];
			
	_loc = "marked on your map to show you where activity was noticed.";
	["INTERACTION",format ["This person %1",_loc]] call FF7_fnc_formatHint;

	sleep 3;

	_name = name player;
	["Intel", (format ["<t color='#30CC21'>%1</t> aquired intel from a civilian</t>", _name])] remoteExec ["FF7_fnc_formatHint", 0];

} else {

	{
		{
			_num = random 1;

			_size = (1000 + (random 500));
			_pos = [_x, 0, (_size - 100), 0, 0, 0, 0] call BIS_fnc_findSafePos;
			_mkr = createMarker [format ["AO%1", _num], _pos];
			format ["AO%1", _num] setMarkerColor "ColorGUER";
			format ["AO%1", _num] setMarkerShape "ELLIPSE";
			format ["AO%1", _num] setMarkerBrush "BDiagonal";
			format ["AO%1", _num] setMarkerSize [_size, _size];
			
			[_num] spawn {
				private ["_x"];
				_x = 1;
				while {_x = _x - (1/120); _x > 0} do {
					
					format ["AO%1", _this select 0] setMarkerAlpha _x;
					
					sleep 1;
				};

				sleep 120;

				deleteMarker format ["AO%1", _this select 0];
			};

		} forEach concentrations;

	} remoteExec ["BIS_fnc_call", 2];
			
	_loc = "marked on your map to show you where activity was noticed.";
	["INTERACTION",format ["This person %1",_loc]] call FF7_fnc_formatHint;

	sleep 3;

	_name = name player;
	["Intel", (format ["<t color='#30CC21'>%1</t> aquired intel from a civilian</t>", _name])] remoteExec ["FF7_fnc_formatHint", 0];

};