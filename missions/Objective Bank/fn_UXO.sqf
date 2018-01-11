/* ----------
Function:	InA_fnc_UXO

Description:
	Field of unexploded ordnance

Parameters:
	- center location to begin spawn search

Optional:

Example:
	[getPosATL player] spawn InA_fnc_UXO;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */
// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_loc"			,[]					,[]					,[]							]];

// Local declarations
private		_accepted				= false;
private		_allUXO					= [];
private		_isNearPlayer			= false;
private		_maxDist				= 2500;
private		_minDist				= 1250;
private		_mkr					= nil;
private		_mkrName				= "";
private		_mkrName2				= "";
private		_objLoc					= [];
private		_ord					= nil;
private		_pos					= [];
private		_size					= (50 + (random 50));
private		_uxo					= nil;

// Declare side mission active
civMissionActive = true;

/////////////////////////////////////////////////
// ---------- BEGIN LOCATION FINDER ---------- //
/////////////////////////////////////////////////

hint "before";

// Location selection loop
while {!_accepted;} do {

	// Select random position
	_pos = [[[_loc,_maxDist]],["water","out"]] call BIS_fnc_randomPos;
	_objLoc = _pos isFlatEmpty [1, 0, -1, 1, 0, false];

	// Accept location if all conditions met
	if (count _objLoc > 2) then {

		// Check if players are near
		_isNearPlayer = false;
		{
			if ((_x distance _objLoc) < 1000) then {
				_isNearPlayer = true;
			};
		} forEach (allPlayers - entities "HeadlessClient_F");

		if (_loc distance _objLoc > _minDist) then {
			if (_objLoc distance (getMarkerPos "respawn_west") > 1000) then {
				if !(_isNearPlayer) then {
					_accepted = true;
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
format ["%1",_mkrName] setMarkerType "mil_marker";
format ["%1",_mkrName] setMarkerText "Unexploded Ordnance";

_mkrName2 = random 1;
_mkr = createMarker [format ["%1",_mkrName2], _objLoc];
format ["%1",_mkrName2] setMarkerColor "ColorRED";
format ["%1",_mkrName2] setMarkerShape "ELLIPSE";
format ["%1",_mkrName2] setMarkerBrush "BDiagonal";
format ["%1",_mkrName2] setMarkerSize [_size, _size];

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

///////////////////////////
// BEGIN OBJECTIVE SPAWN //
///////////////////////////

// Define all UXO's
_allUXO = 
[
	"BombCluster_01_UXO1_F",
	"BombCluster_02_UXO1_F",
	"BombCluster_03_UXO1_F",
	"BombCluster_01_UXO2_F",
	"BombCluster_02_UXO2_F",
	"BombCluster_03_UXO2_F",
	"BombCluster_01_UXO3_F",
	"BombCluster_02_UXO3_F",
	"BombCluster_03_UXO3_F",
	"BombCluster_01_UXO4_F",
	"BombCluster_02_UXO4_F",
	"BombCluster_03_UXO4_F"
];

// Spawn ordnance
for "_i" from 1 to (10 + (random 10)) do {
	_pos = [_objLoc, 0, _size, 1, 0, 0] call BIS_fnc_findSafePos;
	_uxo = (selectRandom _allUXO) createVehicle _pos;
	_uxo setDir (random 360);
	_uxo setPos [_pos select 0,_pos select 1, 0];
};

/////////////////////////
// END OBJECTIVE SPAWN //
/////////////////////////

// Side mission notification
[true, "This person knows of unexploded ordnace that should be dealt with.", "SIDE MISSION"] remoteExec ["InA_fnc_formatHint", 0];

// End condition loop
while {true;} do {
	scopeName "civMission";

	sleep (2 + (random 2));

	_ord = nearestObjects [_objLoc, _allUXO, 250];

	// Objective completion check
	if (count _ord < 1) then {

		compObj = compObj + 1;

		logV = logV + 1;

		[true, "The unexploded ordnance field has been dealt with.", "SIDE MISSION"] remoteExec ["InA_fnc_formatHint", 0];

		breakOut "civMission";
	};
};

civMissionActive = false;

// Wait until players leave area
waitUntil {
	sleep (2 + (random 2)); 
	{_x distance _objLoc < _maxDist} count (allPlayers - entities "HeadlessClient_F") < 1;
};

// Clean up
[_objLoc,_minDist] spawn InA_fnc_cleanup;