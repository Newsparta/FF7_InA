// ---------- arguments ----------

params ["_loc"];

civMissionActive = true;

_objLoc = [_loc, 1000, 1500, 1, 0, 1, 0] call BIS_fnc_findSafePos;

// ---------- marker spawn ----------

_mkrName = random 1;
_mkr = createMarker [format ["%1",_mkrName], _objLoc];
format ["%1",_mkrName] setMarkerColor "ColorBlack";
format ["%1",_mkrName] setMarkerShape "ICON";
format ["%1",_mkrName] setMarkerType "mil_warning";
format ["%1",_mkrName] setMarkerText "Eliminate";

_mkrName2 = random 1;
_mkr = createMarker [format ["%1",_mkrName2], _objLoc];
format ["%1",_mkrName2] setMarkerColor "ColorGUER";
format ["%1",_mkrName2] setMarkerShape "ELLIPSE";
format ["%1",_mkrName2] setMarkerBrush "Border";
format ["%1",_mkrName2] setMarkerSize [150, 150];
					
[_mkrName,_mkrName2] spawn {
	private ["_i"];
							
	_mkrName = _this select 0;
	_mkrName2 = _this select 1;
								
	_i = 1;

	while {_i = _i - (1/240); _i > 0} do {
								
		format ["%1",_mkrName] setMarkerAlpha _i;
		format ["%1",_mkrName2] setMarkerAlpha _i;
									
		sleep 1;
	};

	sleep 240;

	deleteMarker format ["%1",_mkrName];
};

// ---------- objective spawn ----------
_group = [];
if (random 1 <= 0.5) then {
	_pos = [_objLoc, 0, 100, 1, 0, 1, 0] call BIS_fnc_findSafePos;

	_troops = [];
	for "_i" from 1 to (6 + (round random 6)) do {

		_troops pushBack (selectRandom INS_INF_SINGLE);
	};

	_group = [
		_pos, 
		INDEPENDENT,
		_troops
	] call BIS_fnc_spawnGroup;
	[_group, _pos] call BIS_fnc_taskDefend;
	_group setFormDir (random 360);
	[units _group] call InA_fnc_insCustomize;
} else {
	_pos = [_objLoc, 0, 100, 1, 0, 1, 0] call BIS_fnc_findSafePos;

	_troops = [];
	for "_i" from 1 to (6 + (round random 6)) do {

		_troops pushBack (selectRandom INS_INF_SINGLE);
	};

	_group = [
		_pos, 
		INDEPENDENT,
		_troops
	] call BIS_fnc_spawnGroup;
	[_group, _pos, 50] call BIS_fnc_taskPatrol;
	[units _group] call InA_fnc_insCustomize;
};

["SIDE MISSION", "This person wants you to eliminate some insurgents they saw nearby that have threatened them."] remoteExec ["FF7_fnc_formatHint", 0];

// ---------- end condition ----------

_i = 0;

waitUntil {_i = _i + 1; if (_i == 300) exitWith {true;}; sleep (5 + (random 5)); {_x distance _objLoc < 750} count (allPlayers - entities "HeadlessClient_F") > 0};

if (_i == 300) exitWith {civMissionActive = false;};

while {true} do {
	scopeName "civMission";

	sleep (2 + (random 2));

	if ({alive _x} count (units _group) < 1) then {

		compObj = compObj + 1;

		logV = logV + 1;

		["SIDE MISSION", "The insurgents have been dealt with."] remoteExec ["FF7_fnc_formatHint", 0];

		breakOut "civMission";
	};

	if ({_x distance _objLoc < 1500} count (allPlayers - entities "HeadlessClient_F") < 1) then {

		["SIDE MISSION", "The insurgents have moved on from their known location and are now untraceable."] remoteExec ["FF7_fnc_formatHint", 0];

		breakOut "civMission";
	};

};