/* ----------
Function:
	InA_fnc_AAAEmplacement

Description:
	AAA vehicle with camonet and guards

Parameters:
	- center location to begin spawn search

Optional:

Example:
	[getPosATL player] spawn InA_fnc_AAAEmplacement;

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
private		_veh				= ObjNull;
private		_xPos				= [];
private		_yPos				= [];
private		_zDir				= [];
private		_obj				= ObjNull;
private		_i					= 0;
private		_target				= ObjNull;
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
format ["%1",_mkrName] setMarkerText "AAA";

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
_net = INS_CAMONET createVehicle _objLoc;
waitUntil {alive _net};
_net allowDamage false;
_net setDir (random 360);
_net setPos [_objLoc select 0, _objLoc select 1, 0];

// create target vehicle
_veh = createVehicle [(selectRandom INS_STATIC_AAA_OPF), [_objLoc select 0, _objLoc select 1, 0], [], 0, "CAN_COLLIDE"];
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearItemCargoGlobal _veh;

// designate target
_target = _veh;

// create target vehicle crew
_pos = [_objLoc, 0, 25, 1, 0, 1, 0] call BIS_fnc_findSafePos;
_group = [
	_pos, 
	INDEPENDENT, 
	[
		(selectRandom INS_INF_SINGLE),
		(selectRandom INS_INF_SINGLE)
	]
] call BIS_fnc_spawnGroup;
		(units _group select 0) assignAsDriver _veh;
		(units _group select 1) assignAsGunner _veh;
[units _group] call InA_fnc_insCustomize;
[_group,_objLoc,_veh] spawn {
	while {true} do {
		scopeName "guardAAA";
		if (spotted) then {
			_wp = (_this select 0) addWaypoint [(_this select 1),0];
			_wp waypointAttachVehicle (_this select 3);
			_wp setWaypointType "GETIN";
		
			[(_this select 0), (_this select 1)] call BIS_fnc_taskDefend;
			breakOut "guardAAA";
		};
				
		if (!alive (_this select 3) || count units (_this select 0) < 2) then {
			
			breakOut "guardAAA";
		};
	sleep 3;
	};
};

// create trenches
_xPos = [-7.342,-2.664,2.151,7.149,2.325,-2.221];
_yPos = [-2.929,5.369,5.359,2.651,-5.657,-5.836];
_zDir = [72.986,184.274,170.930,240.171,2.847,353.591];
for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
			
	_obj = createVehicle ["Land_Trench_01_grass_F",[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-1.9
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

// create long sandbags
_xPos = [-5.805,-1.564,1.734,5.910,1.528,-2.334];
_yPos = [-1.947,3.509,3.535,1.294,-3.848,-4.136];
_zDir = [252.469,184.390,355.182,59.442,181.420,171];
for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
			
	_obj = createVehicle [INS_SANDBAG_LONG,[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-0.8
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

// create round sandbags
_xPos = [-4.599,4.227];
_yPos = [-3.917,3.351];
_zDir = [32.002,205.769];
for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
	
	_obj = createVehicle [INS_SANDBAG_ROUND,[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-0.8
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

// create short sandbags
_xPos = [-3.821,3.725];
_yPos = [3.797,-3.934];
_zDir = [189.749,184.830];
for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
			
	_obj = createVehicle [INS_SANDBAG_SHORT,[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-0.8
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

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

/////////////////////////
// END OBJECTIVE SPAWN //
/////////////////////////

// Side mission notification
["SIDE MISSION", "This person saw an Anti-Aircraft Artillery battery nearby that should be destroyed."] remoteExec ["FF7_fnc_formatHint", 0];

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

	["SIDE MISSION", "The Anti-Aircraft Artillery has moved from their known location and are now untraceable."] remoteExec ["FF7_fnc_formatHint", 0];

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

		["SIDE MISSION", "The Anti-Aircraft Artillery has been destroyed."] remoteExec ["FF7_fnc_formatHint", 0];

		breakOut "civMission";
	};

	// Despawn if players leave
	if ({_x distance _objLoc < 1500} count (allPlayers - entities "HeadlessClient_F") < 1) then {

		["SIDE MISSION", "The Anti-Aircraft Artillery has moved from their known location and are now untraceable."] remoteExec ["FF7_fnc_formatHint", 0];

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