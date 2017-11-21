// get parameters
_rad = _this select 0;
_dir = _this select 1;
_cardinal = _this select 2;

// get spawn location
_loc = [(getMarkerPos "respawn_west"), _rad, _dir] call BIS_fnc_relPos;

// create number of enemies alive trigger
_nme = createTrigger ["EmptyDetector", (getMarkerPos "respawn_west")];
_nme setTriggerArea [1000,1000, 0, false];
_nme setTriggerActivation ["GUER", "NOT PRESENT", false];
_nme setTriggerStatements ["this","",""];

// create marker for spotted enemies
_mkr = createMarker ['attack', _loc];
'attack' setMarkerColor 'ColorRed';
'attack' setMarkerShape 'ICON';
'attack' setMarkerType 'mil_warning';
'attack' setMarkerText '';

// spawn enemy attackers
_troops = [];
_pos = [_loc, 0, 50, 1, 0, -1, 0] call BIS_fnc_findSafePos;
for "_i" from 1 to (10 + (round random 10)) do {
	_troops pushBack (selectRandom INS_INF_SINGLE);
};
_group = [
	_pos, 
	INDEPENDENT,
	_troops
] call BIS_fnc_spawnGroup;
[units _group] call InA_fnc_insCustomize;
[_group, (getMarkerPos "respawn_west")] call BIS_fnc_taskAttack;
_group setBehaviour "COMBAT";

// spawn friendly defenders
_pos = [barracks, 0, 25, 1, 0, -1, 0] call BIS_fnc_findSafePos;
_troops = [];
for "_i" from 1 to (5 + (round random 5)) do {
	_troops pushBack BLU_INF_SINGLE;
};
_ally = [
	_pos, 
	WEST,
	_troops
] call BIS_fnc_spawnGroup;
[units _ally] call InA_fnc_bluCustomize;
[_ally, _loc] call BIS_fnc_taskAttack;
_ally setBehaviour "COMBAT";

// alarm loop
[_nme,_ally] spawn {
	_nme = _this select 0;
	_ally = _this select 1;
	while {count list _nme > 5} do {
		sleep 2;
		playSound3D ["A3\Sounds_F\sfx\alarm.wss", menuHQ];
	};
	deleteVehicle _nme;
	{deleteVehicle _x} forEach (units _ally);
};

sleep 10;

["HQ", "Headquarters", format ["Movement has been spotted %1 of the base!", _cardinal]] remoteExec ["FF7_fnc_globalHintStruct", 0];