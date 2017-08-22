
_loc = _this select 0;
_rad = _this select 1;
_choice = _this select 2;

_location = text (nearestLocations [_loc, 
[
	"NameLocal",
	"NameCity",
	"NameVillage",
	"NameCityCapital"

], 500] select 0);

["HQ", "Headquarters", format ["Intel aquired suggests the insurgents may be preparing to move on %1.", _location]] remoteExec ["FF7_fnc_globalHintStruct", 0];

_i = 0;

_mkr = createMarker ["defend", _loc];
"defend" setMarkerColor "ColorWest";
"defend" setMarkerShape "ICON";
"defend" setMarkerType "mil_objective";
"defend" setMarkerText "Imminent Incursion";

waitUntil {_i = _i + 1; if (_i == 720) exitWith {true;}; sleep (5 + (random 5)); {_x distance _loc < 750} count (allPlayers - entities "HeadlessClient_F") > 0};

deleteMarker "defend";

if (_i == 720) exitWith {
	["HQ", "Headquarters", format ["Enemy insurgents have secured %1.", _location]] remoteExec ["FF7_fnc_globalHintStruct", 0];

	call compile format
	[
		"
		instability%1 = (0.9 + (random 0.1));
		",
		_choice select 2
	];
};

["HQ", "Headquarters", format ["Insurgents around %1 will likely begin their assault in the next few minutes.", _location]] remoteExec ["FF7_fnc_globalHintStruct", 0];

sleep 300;

["HQ", "Headquarters", format ["Maintain control of %1 until enemy activity subsides.", _location]] remoteExec ["FF7_fnc_globalHintStruct", 0];

spawnCenter = _loc;
spawnBorderLand = _rad;
spawnWaypointMax = 250;

// ---------- ATTACK LOOP ----------
private ["_i","_pos","_group"];

_i = 0;

while {_i = _i + 60; _i <= 900} do {
	scopeName "attackLoop";

	if (({(side _x) == resistance} count allUnits) < 150) then {
		_accepted = false;
		while {!_accepted} do {

			_pos = [_loc, 500, _rad, 0, 0, 1, 0] call BIS_fnc_findSafePos;

			_isNear = false;

			{
				if ((_x distance _pos) < 500) then {
					_isNear = true;
				};
			} forEach (allPlayers - entities "HeadlessClient_F");
			
			if !(_isNear) then {
				_accepted = true;
			};
		};

		_troops = [];
		for "_i" from 1 to (4 + (round random 6)) do {
			_troops pushBack (selectRandom INS_INF_SINGLE);
		};
		
		_group = [
			_pos, 
			INDEPENDENT,
			_troops
		] call BIS_fnc_spawnGroup;
		_wp = _group addWaypoint [_loc, 250];
		_wp setWaypointType "GUARD";
		_wp setWaypointCompletionRadius 25;
		_group setSpeedMode "FULL";
		_group setBehaviour "COMBAT";
		[units _group] call InA_fnc_insCustomize;
	};
	
	if (random 100 < random ((count (call BIS_fnc_listPlayers)) * 0.25)) then {
		[spawnCenter, spawnBorderLand, spawnWaypointMax, 1, 0,"COMBAT","FULL"] spawn InA_fnc_insLightCarAttack;
	};
	if (random 100 < random ((count (call BIS_fnc_listPlayers)) * 0.25)) then {
		[spawnCenter, spawnBorderLand, spawnWaypointMax, 1, 0,"COMBAT","FULL"] spawn InA_fnc_insMediumCarAttack;
	};
	if (random 100 < random ((count (call BIS_fnc_listPlayers)) * 0.25)) then {
		[spawnCenter, spawnBorderLand, spawnWaypointMax, 1, 0,"COMBAT","FULL"] spawn InA_fnc_insMediumTruckTransport;
	};
	if (random 100 < random ((count (call BIS_fnc_listPlayers)) * 0.1)) then {
		[spawnCenter, spawnBorderLand, spawnWaypointMax, 1, 0,"COMBAT","FULL"] spawn InA_fnc_insApcTransport;
	};
	if (random 100 < random ((count (call BIS_fnc_listPlayers)) * 0.0625)) then {
		[spawnCenter, spawnBorderLand, spawnWaypointMax, 1, 0,"COMBAT","FULL"] spawn InA_fnc_insTankAttack;
	};
	if (random 100 < random ((count (call BIS_fnc_listPlayers)) * 0.0625)) then {
		[spawnCenter, spawnBorderLand, spawnWaypointMax, 1, 0,"COMBAT","FULL"] spawn InA_fnc_insIfvTransport;
	};
	if (random 100 < random ((count (call BIS_fnc_listPlayers)) * 0.0625)) then {
		[spawnCenter, spawnBorderLand, spawnWaypointMax, 1, 0,"COMBAT","FULL"] spawn InA_fnc_insLightHeliAttack;
	};
	
	if ({_x distance _loc < 750} count (allPlayers - entities "HeadlessClient_F") < 1) then {
		["HQ", "Headquarters", format ["Enemy insurgents have secured %1.", _location]] remoteExec ["FF7_fnc_globalHintStruct", 0];

		call compile format
		[
			"
			instability%1 = (0.9 + (random 0.1));
			",
			_choice select 2
		];

		breakOut "attackLoop";
	};
	
	if (_i == 900) then {
		
		compObj = compObj + 1;

		LogV = LogV + 1;

		civTol = civTol + 0.1;
		
		["HQ", "Headquarters", "Enemy activity appears to be subsiding."] remoteExec ["FF7_fnc_globalHintStruct", 0];
	};
	
	sleep 60;
};