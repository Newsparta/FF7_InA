/* ----------
Function: InA_fnc_fob

Description:
    A function to add building radius to an area for semi-permanent construction.

Parameters:
    - Position to place radius (Position)

Example:
   
    [[0,0,0]] call InA_fnc_fob

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- PARAMETERS ----------

params ["_command",["_loc",[0,0,0],[[]]]];

// ---------- MAIN ----------

if (fobPlaced) exitWith {["HQ", "Headquarters", "FOB cannot be designated, a previous FOB was designated too recently."] remoteExec ["FF7_fnc_globalHintStruct", 0];};

if (_command == "build") then {

	InA_fob_location = _loc;
	fobPlaced = true;

	deleteMarker "fob_mark";
	deleteMarker "fob_area";

	_mkr = createMarker ["fob_mark", _loc];
	"fob_mark" setMarkerColor "ColorWest";
	"fob_mark" setMarkerShape "ICON";
	"fob_mark" setMarkerType "b_installation";
	"fob_mark" setMarkerText "FOB";
	_mkr = createMarker ["fob_area", _loc];
	"fob_area" setMarkerColor "ColorWEST";
	"fob_area" setMarkerShape "ELLIPSE";
	"fob_area" setMarkerBrush "BDiagonal";
	"fob_area" setMarkerSize [100, 100];

	[] spawn {
		while {true} do {
			scopeName "fobDefence";

			sleep (2 + (random 2));

			if ({_x distance InA_fob_location < 1500} count (allPlayers - entities "HeadlessClient_F") > 0) then {

				_pos = [InA_fob_location, 0, 25, 1, 0, -1, 0] call BIS_fnc_findSafePos;

				_troops = [];
				for "_i" from 1 to (3 + (round random 3)) do {

					_troops pushBack BLU_INF_SINGLE;
				};

				_group = [
					_pos, 
					WEST,
					_troops
				] call BIS_fnc_spawnGroup;
				[_group, _pos] call BIS_fnc_taskDefend;
				[units _group] call InA_fnc_bluCustomize;

				_pos = [InA_fob_location, 0, 25, 1, 0, -1, 0] call BIS_fnc_findSafePos;

				_troops = [];
				for "_i" from 1 to (3 + (round random 3)) do {

					_troops pushBack BLU_INF_SINGLE;
				};

				_group = [
					_pos, 
					WEST,
					_troops
				] call BIS_fnc_spawnGroup;
				[_group, _pos, 50] call BIS_fnc_taskPatrol;
				[units _group] call InA_fnc_bluCustomize;

				while {true} do {
					scopeName "fobEntered";

					sleep (2 + (random 2));

					if ({_x distance InA_fob_location < 1500} count (allPlayers - entities "HeadlessClient_F") < 1) then {
						breakOut "fobEntered";
					};
				};
			};
		};
	};

	["HQ", "Headquarters", "FOB location set."] remoteExec ["FF7_fnc_globalHintStruct", 0];

	sleep (params_fobDelay);

	fobPlaced = false;

} else {

	InA_fob_location = [0,0,0];

	breakOut "fobDefence";

	deleteMarker "fob_mark";
	deleteMarker "fob_area";

	["HQ", "Headquarters", "FOB abandoned."] remoteExec ["FF7_fnc_globalHintStruct", 0];
};