/* ----------
Function:
	InA_fnc_commOutpost

Description:
	Radio communications setup with IR net and guards

Parameters:
	- center location to begin spawn search

Optional:

Example:
	[getPosATL player] spawn InA_fnc_commOutpost;

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
private		_net				= ObjNull;
private		_xPos				= [];
private		_yPos				= [];
private		_zDir				= [];
private		_obj				= ObjNull;
private		_i					= 0;
private		_target				= ObjNull;
private		_addSome			= 0;
private		_troops				= [];
private		_group				= [];
private		_car				= ObjNull;

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

	// Accept location if all conditions met
	if (count _objLoc > 2) then {

		// Check if players are near
		_isNearPlayer = false;
		{
			if ((_x distance _objLoc) < 1000) then {
				_isNearPlayer = true;
			};
		} forEach (allPlayers - entities "HeadlessClient_F");
		
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
format ["%1",_mkrName] setMarkerText "OP";

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

///////////////////////////
// BEGIN OBJECTIVE SPAWN //
///////////////////////////

// create camonet
_net = "Land_IRMaskingCover_02_F" createVehicle _objLoc;
waitUntil {alive _net};
_net allowDamage false;
_net setDir (random 360);
_net setPos [_objLoc select 0, _objLoc select 1, 0];

// create tables
_xPos = [-2.268,1.458,5.474];
_yPos = [2.518,2.326,0.032];
_zDir = [266,275,182];
for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
			
	_obj = createVehicle ["Land_WoodenTable_large_F",[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-0.5
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

// create chairs
_xPos = [0.979,4.607,-2.491];
_yPos = [1.423,0.151,-1.349];
_zDir = [157,263,0];
for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
			
	_obj = createVehicle ["Land_CampingChair_V2_F",[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-0.5
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

// create dish
_obj = createVehicle ["Land_SatelliteAntenna_01_F",[0,0,0],[],0,"CAN_COLLIDE"];
_obj attachTo [_net, 
	[
		-4.835,
		-1.098,
		-0.25
	]
];
detach _obj;
_obj setDir (direction _net + 279);

// place invisible target object
_target = createVehicle ["Land_MetalBarrel_F",[0,0,0],[],0,"CAN_COLLIDE"];
_target attachTo [_net, 
	[
		-4.835,
		-1.098,
		-0.25
	]
];
detach _target;
_target setDir (direction _net + 279);
_target enableSimulationGlobal false;
[_target, true] remoteExec ["hideObject", 0, true];

// create TV screens
_obj = createVehicle ["Land_TripodScreen_01_dual_v1_F",[0,0,0],[],0,"CAN_COLLIDE"];
_obj attachTo [_net, 
	[
		-4.334,
		-0.703,
		-0.25
	]
];
detach _obj;
_obj setDir (direction _net + 73);

// Spawn extra enemies if there are more players
if (count (call BIS_fnc_listPlayers) > 10) then {
	_addSome = 2;
};

// Enemies	

	// Large spawns
	for "_i" from 0 to (round random (3 + _addSome)) do {
		_pos = [_objLoc, 0, 100, 1, 0, 1, 0] call BIS_fnc_findSafePos;

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
		[_group, _pos, 500] call BIS_fnc_taskPatrol;
		[units _group] call InA_fnc_insCustomize;
	};
			
	// Ambient vehicles
	for "_i" from 0 to 1 do {
		if (floor (random 100) < 50) then {
			_pos = [_net, 50, 100, 1, 0, 1, 0] call BIS_fnc_findSafePos;
			_car = objNull;
			if (supplier == "BLU") then {
				_car = (selectRandom INS_TRUCK_BLU) createVehicle _pos;
			} else {
				_car = (selectRandom INS_TRUCK_OPF) createVehicle _pos;
			};
			_car setDir (random 360);
		};
	};

/////////////////////////
// END OBJECTIVE SPAWN //
/////////////////////////

// Side mission notification
[true, "This person saw a Communications Outpost nearby that should be destroyed.", "SIDE MISSION"] remoteExec ["InA_fnc_formatHint", 0];

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

	[true, "The Communications Outpost has been dismantled and moved from its known location and is now untraceable.", "SIDE MISSION"] remoteExec ["InA_fnc_formatHint", 0];

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

		[true, "The Communications Outpost has been destroyed.", "SIDE MISSION"] remoteExec ["InA_fnc_formatHint", 0];

		breakOut "civMission";
	};

	// Despawn if players leave
	if ({_x distance _objLoc < 1500} count (allPlayers - entities "HeadlessClient_F") < 1) then {

		[true, "The Communications Outpost has been dismantled and moved from its known location and is now untraceable.", "SIDE MISSION"] remoteExec ["InA_fnc_formatHint", 0];

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