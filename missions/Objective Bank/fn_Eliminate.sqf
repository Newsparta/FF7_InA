/* ----------
Function:
	InA_fnc_Eliminate

Description:
	Group of idle soldiers

Parameters:
	- center locatin to begin spawn search

Optional:

Example:
	[getPosATL player] spawn InA_fnc_Eliminate;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_loc"			,[]					,[]					,[]							]];

// Local declarations
private		_minDist			= 1250;
private		_maxDist			= 2500;
private		_objLoc				= [];
private		_accepted			= false;
private		_pos				= [];
private		_roads				= nil;
private		_isNearPlayer		= false;
private		_mkrName			= "";
private		_mkr				= nil;
private		_mkrName2			= "";
private		_i					= 0;
private		_addSome			= 0;
private		_troops				= [];
private		_group				= [];

// Declare side mission active
civMissionActive = true;

/////////////////////////////////////////////////
// ---------- BEGIN LOCATION FINDER ---------- //
/////////////////////////////////////////////////

// Location selection loop
while {!_accepted;} do {

	// Select random position
	_pos = [[[_loc,_maxDist]],["water","out"]] call BIS_fnc_randomPos;
	_objLoc = _pos isFlatEmpty [1, 0, 0.4, 4, 0, false];
	
	// find nearby roads
	_roads = nearestTerrainObjects [_pos, ["ROAD","MAIN ROAD"], 30];

	// Check if players are near
	_isNearPlayer = false;
	{
		if ((_x distance _loc) < 1000) then {
			_isNearPlayer = true;
		};
	} forEach (allPlayers - entities "HeadlessClient_F");

	// Accept location if all conditions met
	if (count _objLoc > 2) then {
		if (count _roads < 1) then {
			if (_loc distance _objLoc > _minDist) then {
				if (_objLoc distance (getMarkerPos "respawn_west") > 1000) then {
					if !(_isNearPlayer) then {
						_accepted = true;
					};
				};
			};
		};
	};
};

///////////////////////////////////////////////
// ---------- END LOCATION FINDER ---------- //
///////////////////////////////////////////////

// Marker spawn
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

// Spawn marker fade out		
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

// Target soldiers
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

// Side mission notification
["SIDE MISSION", "This person wants you to eliminate some insurgents that have threatened them recently."] remoteExec ["FF7_fnc_formatHint", 0];

// wait timer for objective despawn
waitUntil {
	_i = _i + 1; 
	if (_i == (sideMissionTimer * 5)) exitWith {true;}; 
	sleep (5 + (random 5)); 
	{_x distance _objLoc < 1000} count (allPlayers - entities "HeadlessClient_F") > 0;
};

// Check if objective should despawn
if (_i == (sideMissionTimer * 5)) exitWith {

	civMissionActive = false;

	["SIDE MISSION", "The insurgents have moved on from their known location and are now untraceable."] remoteExec ["FF7_fnc_formatHint", 0];

	waitUntil {sleep (2 + (random 2)); {_x distance _objLoc < _maxDist} count (allPlayers - entities "HeadlessClient_F") < 1};

	[_objLoc,_minDist] spawn InA_fnc_cleanup;	
};

// End condition loop
while {true;} do {
	scopeName "civMission";

	sleep (2 + (random 2));

	// Objective completion check
	if ({alive _x} count (units _group) < 1) then {

		compObj = compObj + 1;

		logV = logV + 1;

		["SIDE MISSION", "The insurgents have been dealt with."] remoteExec ["FF7_fnc_formatHint", 0];

		breakOut "civMission";
	};

	// Despawn if players leave
	if ({_x distance _objLoc < 1500} count (allPlayers - entities "HeadlessClient_F") < 1) then {

		["SIDE MISSION", "The insurgents have moved on from their known location and are now untraceable."] remoteExec ["FF7_fnc_formatHint", 0];

		breakOut "civMission";
	};
};

// Wait until players leave area
waitUntil {
	sleep (2 + (random 2)); 
	{_x distance _objLoc < _maxDist} count (allPlayers - entities "HeadlessClient_F") < 1;
};

// Clean up
[_objLoc,_minDist] spawn InA_fnc_cleanup;