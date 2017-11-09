// ---------- arguments ----------

params ["_loc"];

civMissionActive = true;

_minDist = 1250;
_maxDist = 2500;

_objLoc = [];
_accepted = false;
while {!_accepted} do {
	_pos = [[[_loc,_maxDist]],["water","out"]] call BIS_fnc_randomPos;
	_objLoc = _pos isFlatEmpty [1, 0, 0.4, 4, 0, false];
	
	_roads = nearestTerrainObjects [_pos, ["ROAD","MAIN ROAD"], 30];

	if (count _objLoc > 2) then {
		if (count _roads < 1) then {
			if (_loc distance _objLoc > _minDist) then {
				if (_objLoc distance (getMarkerPos "respawn_west") > 1000) then {
					_accepted = true;
				};
			};
		};
	};
};

// ---------- marker spawn ----------

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
// objective spawn start //
///////////////////////////

_net = INS_CAMONET createVehicle _objLoc;
	waitUntil {alive _net};
	_net allowDamage false;
	_net setDir (random 360);
	_net setPos [_objLoc select 0, _objLoc select 1, 0];
			
_target = (CRATES call BIS_fnc_selectRandom) createVehicle _objLoc;

clearWeaponCargoGlobal _target;

for "_x" from 1 to 10 do {
	_pos2 = [[[_objLoc,5]],["water","out"]] call BIS_fnc_randomPos;
	_crate = (CRATES call BIS_fnc_selectRandom) createVehicle _objLoc;
	waitUntil {alive _crate};
	_crate setPos [_pos2 select 0, _pos2 select 1, 2];
	_crate setDir (random 360);
	clearBackpackCargoGlobal _crate;
	clearWeaponCargoGlobal _crate;
	
};

// ---------- Enemies ----------
private ["_pos","_group"];

_addSome = 0;

if (count (call BIS_fnc_listPlayers) > 10) then {
	_addSome = 2;
};
			
	// ---------- Generic large spawns ----------

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
// objective spawn end //
/////////////////////////

["SIDE MISSION", "This person saw a Weapon Cache nearby that should be destroyed."] remoteExec ["FF7_fnc_formatHint", 0];

// ---------- end condition ----------

_i = 0;

waitUntil {_i = _i + 1; if (_i == 300) exitWith {true;}; sleep (5 + (random 5)); {_x distance _objLoc < 1000} count (allPlayers - entities "HeadlessClient_F") > 0};

if (_i == 300) exitWith {

	civMissionActive = false;

	["SIDE MISSION", "The Weapon Cache has been moved from its known location and is now untraceable."] remoteExec ["FF7_fnc_formatHint", 0];

	waitUntil {sleep (2 + (random 2)); {_x distance _objLoc < _maxDist} count (allPlayers - entities "HeadlessClient_F") < 1};

	[_objLoc,_minDist] spawn InA_fnc_cleanup;
};

while {true} do {
	scopeName "civMission";

	sleep (2 + (random 2));

	if !(alive _target) then {

		compObj = compObj + 1;

		logV = logV + 1;

		["SIDE MISSION", "The Weapon Cache has been destroyed."] remoteExec ["FF7_fnc_formatHint", 0];

		breakOut "civMission";
	};

	if ({_x distance _objLoc < 1500} count (allPlayers - entities "HeadlessClient_F") < 1) then {

		["SIDE MISSION", "The Weapon Cache has been moved from its known location and is now untraceable."] remoteExec ["FF7_fnc_formatHint", 0];

		breakOut "civMission";
	};
};

waitUntil {sleep (2 + (random 2)); {_x distance _objLoc < _maxDist} count (allPlayers - entities "HeadlessClient_F") < 1};

[_objLoc,_minDist] spawn InA_fnc_cleanup;