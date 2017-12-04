/* ----------
Function:
	InA_fnc_weaponsCache

Description:
	weapon crates and camonet with accompanying guards

Parameters:
	- center location to begin spawn search (array)

Optional:

Example:
	[getPosATL player] spawn InA_fnc_weaponsCache;

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
private		_net				= ObjNull;
private		_target				= ObjNull;
private		_crate				= ObjNull;
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

// Create objective markers
_mkrName = random 1;
_mkr = createMarker [format ["%1",_mkrName], _objLoc];
format ["%1",_mkrName] setMarkerColor "ColorBlack";
format ["%1",_mkrName] setMarkerShape "ICON";
format ["%1",_mkrName] setMarkerType "mil_warning";
format ["%1",_mkrName] setMarkerText "Cache";
_mkrName2 = random 1;
_mkr = createMarker [format ["%1",_mkrName2], _objLoc];
format ["%1",_mkrName2] setMarkerColor "ColorGUER";
format ["%1",_mkrName2] setMarkerShape "ELLIPSE";
format ["%1",_mkrName2] setMarkerBrush "Border";
format ["%1",_mkrName2] setMarkerSize [150, 150];

// spawn marker deletion		
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

///////////////////////////
// BEGIN OBJECTIVE SPAWN //
///////////////////////////

// create camonet
_net = INS_CAMONET createVehicle _objLoc;
	waitUntil {alive _net};
	_net allowDamage false;
	_net setDir (random 360);
	_net setPos [_objLoc select 0, _objLoc select 1, 0];

// create target
_target = (CRATES call BIS_fnc_selectRandom) createVehicle _objLoc;
clearWeaponCargoGlobal _target;

// create other crates
for "_x" from 1 to 10 do {
	_pos2 = [[[_objLoc,5]],["water","out"]] call BIS_fnc_randomPos;
	_crate = (CRATES call BIS_fnc_selectRandom) createVehicle _objLoc;
	waitUntil {alive _crate};
	_crate setPos [_pos2 select 0, _pos2 select 1, 2];
	_crate setDir (random 360);
	clearBackpackCargoGlobal _crate;
	clearWeaponCargoGlobal _crate;
};

// add extra spawns if there are more players
if (count (call BIS_fnc_listPlayers) > 10) then {
	_addSome = 2;
};

// Enemies
			
	// Large spawns
	for "_i" from 0 to (round random (3 + _addSome)) do {
		_pos = [_objLoc, 0, 250, 1, 0, 1, 0] call BIS_fnc_findSafePos;

		_troops = [];
		for "_i" from 1 to (4 + (round random 6)) do {

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
	};

	for "_i" from 0 to (round random (3 + _addSome)) do {
		_pos = [_objLoc, 0, 500, 1, 0, 1, 0] call BIS_fnc_findSafePos;

		_troops = [];
		for "_i" from 1 to (4 + (round random 6)) do {

			_troops pushBack (selectRandom INS_INF_SINGLE);
		};

		_group = [
				_pos, 
				INDEPENDENT,
				_troops
			] call BIS_fnc_spawnGroup;
		[_group, _pos, 500] call BIS_fnc_taskPatrol;
		[units _group] call InA_fnc_insCustomize;
	};

/////////////////////////
// END OBJECTIVE SPAWN //
/////////////////////////

// Side mission notification
["SIDE MISSION", "This person saw a Weapon Cache nearby that should be destroyed."] remoteExec ["FF7_fnc_formatHint", 0];

// wait timer for objective despawn
waitUntil {
	_i = _i + 1; 
	if (_i == (sideMissionTimer * 5)) exitWith {true;}; 
	sleep (5 + (random 5)); 
	({_x distance _objLoc < 1000} count (allPlayers - entities "HeadlessClient_F") > 0);
};

// Check if objective should despawn
if (_i == (sideMissionTimer * 5)) exitWith {

	civMissionActive = false;

	["SIDE MISSION", "The Weapon Cache has been moved from its known location and is now untraceable."] remoteExec ["FF7_fnc_formatHint", 0];

	waitUntil {sleep (2 + (random 2)); {_x distance _objLoc < _maxDist} count (allPlayers - entities "HeadlessClient_F") < 1};

	[_objLoc,_minDist] spawn InA_fnc_cleanup;
};

// End condition loop
while {true;} do {
scopeName "civMission";

	sleep (2 + (random 2));

	// Objective completion check
	if !(alive _target) then {

		compObj = compObj + 1;

		logV = logV + 1;

		["SIDE MISSION", "The Weapon Cache has been destroyed."] remoteExec ["FF7_fnc_formatHint", 0];

		breakOut "civMission";
	};

	// Despawn if players leave
	if ({_x distance _objLoc < 1500} count (allPlayers - entities "HeadlessClient_F") < 1) then {

		["SIDE MISSION", "The Weapon Cache has been moved from its known location and is now untraceable."] remoteExec ["FF7_fnc_formatHint", 0];

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