/* ----------
Function: InA_fnc_fob

Description:
    A function to add building radius to an area for semi-permanent construction.

Parameters:
    - Position to place radius (Position)

Example:
   
    ["build",[0,0,0]] call InA_fnc_fob

Returns:
    Nil

Author:
    Newsparta
---------- */
// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_command"		,[]					,[]					,[]							],
		[	"_loc"			,[0,0,0]			,[[]]				,[]							]];

// Local declarations
private		_group				= [];
private		_mkr				= nil;
private		_obj				= ObjNull;
private		_pos				= [];
private		_target				= nil;
private		_troops				= [];

// Check if near the base
if (_loc distance (getMarkerPos "respawn_west") < 1000) exitWith {[false, "FOB cannot be designated, you are too close to the main HQ."] remoteExec ["InA_fnc_formatHint", 0];};

// Check if command was to build
if (_command == "build") then {

	// Check if FOB was already placed
	if (fobPlaced) exitWith {[false, "FOB cannot be designated, you must abandon the previous FOB."] remoteExec ["InA_fnc_formatHint", 0];};

	// Set FOB active at location
	InA_fob_location = _loc;
	fobPlaced = true;

	// Create FOB markers
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

	// Create teleport flag
	_obj = createVehicle ["Flag_White_F", _loc, [], 0, "CAN_COLLIDE"];
	_obj setFlagTexture "img\foxforce_flag.jpg";
	[_obj, ["Fast travel",	
		{_this call InA_fnc_actionTeleport;}, 
		[], 
		99,
		true, 
		true, 
		"", 
		"((_target distance _this) < 8)"
	]] remoteExec ["addAction", 0, true];

	// Spawn defence force loop
	[] spawn {
		while {true;} do {
			scopeName "fobDefence";

			sleep (2 + (random 2));

			// Check if players are near the FOB
			if ({_x distance InA_fob_location < 1500} count (allPlayers - entities "HeadlessClient_F") > 0) then {

				// Find a location
				_pos = [InA_fob_location, 0, 25, 1, 0, -1, 0] call BIS_fnc_findSafePos;

				// Set group size
				_troops = [];
				for "_i" from 1 to (3 + (round random 3)) do {

					_troops pushBack BLU_INF_SINGLE;
				};

				// Spawn group
				_group = [
					_pos, 
					WEST,
					_troops
				] call BIS_fnc_spawnGroup;
				[_group, _pos] call BIS_fnc_taskDefend;
				[units _group] call InA_fnc_bluCustomize;

				// Find a location
				_pos = [InA_fob_location, 0, 25, 1, 0, -1, 0] call BIS_fnc_findSafePos;

				// Set group size
				_troops = [];
				for "_i" from 1 to (3 + (round random 3)) do {

					_troops pushBack BLU_INF_SINGLE;
				};

				// Spawn group
				_group = [
					_pos, 
					WEST,
					_troops
				] call BIS_fnc_spawnGroup;
				[_group, _pos, 50] call BIS_fnc_taskPatrol;
				[units _group] call InA_fnc_bluCustomize;

				// Entered loop
				while {true;} do {
					scopeName "fobEntered";

					sleep (2 + (random 2));

					// Check if players leave the FOB
					if ({_x distance InA_fob_location < 1500} count (allPlayers - entities "HeadlessClient_F") < 1) then {

						// Cleanup units
						{
							if (_x distance InA_fob_location <= 100) then {
								deleteVehicle _x;
							};
						} forEach allUnits;

						// Break out of entered loop
						breakOut "fobEntered";
					};

					// Check if the FOB is no longer active
					if !(fobPlaced) then {
						breakOut "fobDefence";
					};
				};
			};
		};
	};

	// Notification
	[true, "FOB location set.", "Headquarters"] remoteExec ["InA_fnc_formatHint", 0];

} else {

	// Reset FOB location and set inactive
	InA_fob_location = [0,0,0];
	fobPlaced = false;

	// Delete markers
	deleteMarker "fob_mark";
	deleteMarker "fob_area";

	[true, "FOB abandoned.", "Headquarters"] remoteExec ["InA_fnc_formatHint", 0];
};