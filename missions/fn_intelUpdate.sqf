/* ----------
Function:
	InA_fnc_intelUpdate

Description:
	spawn markers on the map on active AO locations

Parameters:

Optional:

Example:
	[] spawn InA_fnc_intelUpdate;

Returns:
	Nil;

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_quality		= "";
private		_mention		= "";
private		_num			= 0;
private		_size			= 0;
private		_pos			= [];
private		_mkr			= nil;

// Determine quality of intel
if (random 1 <= (0.1 + (0.6 * civTol))) then {
	_quality = "high";
} else {
	_quality = "low";
};

// Check intel quality
if (_quality == "high") then {

	// Spawn markers on the server
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

	// Inform player of intel aquired		
	_mention = "marked on your map to show you where activity was noticed.";
	["INTERACTION",format ["This person %1",_mention]] call FF7_fnc_formatHint;

	sleep 3;

	// Inform everyone who aquired intel
	_name = name player;
	["Intel", (format ["<t color='#30CC21'>%1</t> aquired intel from a civilian</t>", _name])] remoteExec ["FF7_fnc_formatHint", 0];

} else {

	// Spawn markers on server
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
			
	// Inform player of intel aquired
	_mention = "marked on your map to show you where activity was noticed.";
	["INTERACTION",format ["This person %1",_mention]] call FF7_fnc_formatHint;

	sleep 3;

	// Inform everyone who aquired intel
	_name = name player;
	["Intel", (format ["<t color='#30CC21'>%1</t> aquired intel from a civilian</t>", _name])] remoteExec ["FF7_fnc_formatHint", 0];

};