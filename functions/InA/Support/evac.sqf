/* ----------
Script:
	Evac

Description:
	Emergency evac helicopter transport

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_con			= count (call BIS_fnc_listPlayers);
private		_pilots			= "";
private		_wp				= nil;
private		_mkr			= nil;

// Set evac unavailable
FF7_playerEvac = false;
publicVariable "FF7_playerEvac";

// Spawn helicopter(s)
switch (baseType) do 
{
	case "Army":
	{
		if (_con <= 6) then {
			evac = createVehicle ["RHS_UH60M", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
		};
		if ((_con > 6) and (_con <= 12)) then {
			evac = createVehicle ["RHS_UH60M", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
			evac2 = createVehicle ["RHS_UH60M", getMarkerPos "heliSpawn_2", [], 0, "FLY"];
		};
		if (_con >= 13) then {
			evac = createVehicle ["RHS_CH_47F", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
		};
	};
	case "Marines":
	{
		if (_con <= 6) then {
			evac = createVehicle ["RHS_UH1Y_GS", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
		};
		if ((_con > 6) and (_con <= 12)) then {
			evac = createVehicle ["RHS_UH1Y_GS", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
			evac2 = createVehicle ["RHS_UH1Y_GS", getMarkerPos "heliSpawn_2", [], 0, "FLY"];
		};
		if (_con >= 13) then {
			evac = createVehicle ["rhsusf_CH53E_USMC", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
		};
	};
	case "Nato":
	{
		if (_con <= 6) then {
			evac = createVehicle ["B_Heli_Transport_01_camo_F", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
		};
		if ((_con > 6) and (_con <= 12)) then {
			evac = createVehicle ["B_Heli_Transport_01_camo_F", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
			evac2 = createVehicle ["B_Heli_Transport_01_camo_F", getMarkerPos "heliSpawn_2", [], 0, "FLY"];
		};
		if (_con >= 13) then {
			evac = createVehicle ["B_Heli_Transport_03_F", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
		};
	};
	case "AAF":
	{
		if (_con <= 6) then {
			evac = createVehicle ["I_Heli_light_03_unarmed_F", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
		};
		if ((_con > 6) and (_con <= 12)) then {
			evac = createVehicle ["I_Heli_light_03_unarmed_F", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
			evac2 = createVehicle ["I_Heli_light_03_unarmed_F", getMarkerPos "heliSpawn_2", [], 0, "FLY"];
		};
		if (_con >= 13) then {
			evac = createVehicle ["I_Heli_Transport_02_F", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
		};
	};
	case "Russia":
	{
		if (_con <= 6) then {
			evac = createVehicle ["RHS_Mi24V_vvsc", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
		};
		if ((_con > 6) and (_con <= 12)) then {
			evac = createVehicle ["RHS_Mi24V_vvsc", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
			evac2 = createVehicle ["RHS_Mi24V_vvsc", getMarkerPos "heliSpawn_2", [], 0, "FLY"];
		};
		if (_con >= 13) then {
			evac = createVehicle ["RHS_Mi8mt_vvsc", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
		};
	};
	case "CSAT":
	{
		if (_con <= 6) then {
			evac = createVehicle ["O_Heli_Light_02_dynamicLoadout_F", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
		};
		if ((_con > 6) and (_con <= 12)) then {
			evac = createVehicle ["O_Heli_Light_02_dynamicLoadout_F", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
			evac2 = createVehicle ["O_Heli_Light_02_dynamicLoadout_F", getMarkerPos "heliSpawn_2", [], 0, "FLY"];
		};
		if (_con >= 13) then {
			evac = createVehicle ["O_Heli_Transport_04_covered_F", getMarkerPos "heliSpawn_1", [], 0, "FLY"];
		};
	};
};
if ((_con > 6) and (_con <= 12)) then {
	clearBackpackCargoGlobal evac;
	clearMagazineCargoGlobal evac;
	clearWeaponCargoGlobal evac;
	clearItemCargoGlobal evac;
	
	clearBackpackCargoGlobal evac2;
	clearMagazineCargoGlobal evac2;
	clearWeaponCargoGlobal evac2;
	clearItemCargoGlobal evac2;
	} else {
	clearBackpackCargoGlobal evac;
	clearMagazineCargoGlobal evac;
	clearWeaponCargoGlobal evac;
	clearItemCargoGlobal evac;
};

// Select pilots
switch (baseType) do
{
	case "Army":
	{
		_pilots = "B_helicrew_F";
	};
	case "Marines":
	{
		_pilots = "B_helicrew_F";
	};
	case "Nato":
	{
		_pilots = "B_helicrew_F";
	};
	case "AAF":
	{
		_pilots = "I_helicrew_F";
	};
	case "Russia":
	{
		_pilots = "rhs_pilot_combat_heli";
	};
	case "CSAT":
	{
		_pilots = "O_helicrew_F";
	};
};

evacTeam = 
[
	[0,0,0], 
	WEST, 
	[
		_pilots,
		_pilots,
		_pilots,
		_pilots
	]
] call BIS_fnc_spawnGroup;

((units evacTeam) select 0) assignAsDriver evac;
((units evacTeam) select 1) assignAsTurret [evac, [0]];
((units evacTeam) select 2) assignAsTurret [evac, [1]];
((units evacTeam) select 3) assignAsTurret [evac, [2]];
((units evacTeam) select 0) moveInDriver evac;
((units evacTeam) select 1) moveInTurret [evac, [0]];
((units evacTeam) select 2) moveInTurret [evac, [1]];
((units evacTeam) select 3) moveInTurret [evac, [2]];

// Set landing waypoint
_wp = evacTeam addWaypoint [evacLZ, 0];
_wp setWaypointStatements ["true","evac land 'GET IN'"];
((units evacTeam) select 0) setBehaviour "CARELESS";
((units evacTeam) select 1) setBehaviour "CARELESS";
	
evacTeam setGroupIdGlobal ["GHOST - 1"];
publicVariable "evacTeam";

// Set landing waypoint if secondary helicopter
if ((_con > 6) and (_con <= 12)) then {

	evacTeam2 = 
	[
		[0,0,0], 
		WEST, 
		[
			_pilots,
			_pilots,
			_pilots,
			_pilots
		]
	] call BIS_fnc_spawnGroup;

	((units evacTeam2) select 0) assignAsDriver evac2;
	((units evacTeam2) select 1) assignAsTurret [evac2, [0]];
	((units evacTeam2) select 2) assignAsTurret [evac2, [1]];
	((units evacTeam2) select 3) assignAsTurret [evac2, [2]];
	((units evacTeam2) select 0) moveInDriver evac2;
	((units evacTeam2) select 1) moveInTurret [evac2, [0]];
	((units evacTeam2) select 2) moveInTurret [evac2, [1]];
	((units evacTeam2) select 3) moveInTurret [evac2, [2]];
		
	evacTeam2 setGroupIdGlobal ["GHOST - 2"];

	sleep 5;

	_wp = evacTeam2 addWaypoint [[((evacLZ select 0) - 50),((evacLZ select 1) - 50),evacLZ select 2], 0];
	_wp setWaypointStatements ["true","evac2 land 'GET IN'"];
	((units evacTeam2) select 0) setBehaviour "CARELESS";
	((units evacTeam2) select 1) setBehaviour "CARELESS";
};

// Landing zone marker
_mkr = createMarker ["LZ", evacLZ];
"LZ" setMarkerColor "ColorWest";
"LZ" setMarkerShape "ICON";
"LZ" setMarkerType "mil_pickup";
"LZ" setMarkerText "Evac LZ";

// set return order
return = false;

// once order given, return to base
waitUntil {sleep 3; if !(alive evac) exitWith {true}; evac distance evacLZ < 500};

if (alive evac) then {
	[evac, "Evac is in the AO."] remoteExec ["sideChat", 0];
	if ((_con > 6) and (_con <= 12)) then {
		sleep 5;
		[evac2, "Evac is in the AO."] remoteExec ["sideChat", 0];
	};
};

waitUntil {sleep 3; if !(alive evac) exitWith {true}; return};

if (alive evac) then {
	[evac, "Returning to base."] remoteExec ["sideChat", 0];

	_wp = evacTeam addWaypoint [getMarkerPos "heliSpawn_1",0];
	_wp setWaypointStatements ["true","evac land 'LAND'"];
		
	sleep 5;

	if ((_con > 6) and (_con <= 12)) then {
		_wp = evacTeam2 addWaypoint [getMarkerPos "heliSpawn_2",0];
		_wp setWaypointStatements ["true","evac2 land 'LAND'"];
		[evac2, "Returning to base."] remoteExec ["sideChat", 0];
	};
};

deleteMarker "LZ";
	
// Despawn
if ((_con > 6) and (_con <= 12)) then {
	waitUntil {sleep 3; if ((!alive evac) && {!alive evac2}) exitWith {true}; (evac distance (getMarkerPos "heliSpawn_1")) < 300;(evac2 distance (getMarkerPos "heliSpawn_2")) < 300};
} else {
	waitUntil {sleep 3; if !(alive evac) exitWith {true}; (evac distance (getMarkerPos "heliSpawn_1")) < 300};
};

if ((_con > 6) and (_con <= 12)) then {

	if ((alive evac) || {alive evac2}) then {
		sleep 80;
			
		{evac deleteVehicleCrew _x} forEach crew evac;
		deleteVehicle evac;	
		
		{evac2 deleteVehicleCrew _x} forEach crew evac2;
		deleteVehicle evac2;
	};	
} else {

	if (alive evac) then {
		sleep 80;
			
		{evac deleteVehicleCrew _x} forEach crew evac;
		deleteVehicle evac;	
	};
};

if ((_con > 6) and (_con <= 12)) then {

	if ((!alive evac) && {!alive evac2}) then {
		[true, "Air transport has been destroyed ...", "Headquarters"] remoteExec ["InA_fnc_formatHint", 0];
	};
} else {

	if !(alive evac) then {
		[true, "Headquarters", "Air transport has been destroyed ...", "Headquarters"] remoteExec ["InA_fnc_formatHint", 0];
	};
};

// Pause until available next
sleep (params_evacDelay);
	
[true, "Headquarters", "Air transport is now available ...", "Headquarters"] remoteExec ["InA_fnc_formatHint", 0];

FF7_playerEvac = true;
publicVariable "FF7_playerEvac";