/* ----------
Script:
	Logistics transport

Description:
	Control supply transport flights

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_delayScale				= 0;
private		_door					= "";
private		_pilots					= [];
private		_team					= [];
private		_wp						= nil;

// Wait until faction has been initialized
waitUntil {sleep 1; initialized;};

while {true;} do {

	// Check if no one is on server
	if (count (allPlayers - entities "HeadlessClient_F") < 1) then {

		// Reset scaling delay
		_delayScale = 0;
	};
	
	// Set next supply drop time
	logiETA = ((5400 + (random 3600)) + _delayScale);

	// Find out what time of day it is (for HQ supply drop timer)
	logiDaytime = daytime;

	// Delay supply drop 
	sleep logiETA;

	// Check if players are still on
	if (count (allPlayers - entities "HeadlessClient_F") > 0) then {

		// increase timer for next drop
		_delayScale = _delayScale + 3600;
	
		// Transport spawn
		// Switch based on faction
		switch (baseType) do 
		{
			case "Army":
			{
				logiVeh = createVehicle ["rhsusf_CH53E_USMC", getMarkerPos "logisticsEntry", [], 0, "FLY"];
				_door = "Ramp";
			};
			case "Marines":
			{
				logiVeh = createVehicle ["rhsusf_CH53E_USMC", getMarkerPos "logisticsEntry", [], 0, "FLY"];
				_door = "Ramp";
			};
			case "Nato":
			{
				logiVeh = createVehicle ["rhsusf_CH53E_USMC", getMarkerPos "logisticsEntry", [], 0, "FLY"];
				_door = "Ramp";
			};
			case "AAF":
			{
				logiVeh = createVehicle ["I_Heli_Transport_02_F", getMarkerPos "logisticsEntry", [], 0, "FLY"];
				_door = "CargoRamp_Open";
			};
			case "Russia":
			{
				logiVeh = createVehicle ["RHS_Mi8mt_Cargo_vvsc", getMarkerPos "logisticsEntry", [], 0, "FLY"];
				_door = "RearDoors";
			};
		};
		clearBackpackCargoGlobal logiVeh;
		clearMagazineCargoGlobal logiVeh;
		clearWeaponCargoGlobal logiVeh;
		clearItemCargoGlobal logiVeh;
		
		// Crew assignment
		// Switch based on faction
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
		};
		
		// Spawn group
		_team = 
		[
			[0,0,0], 
			WEST, 
			[
				_pilots,
				_pilots
			]
		] call BIS_fnc_spawnGroup;

		((units _team) select 0) assignAsDriver logiVeh;
		((units _team) select 1) assignAsTurret [logiVeh, [0]];
		((units _team) select 0) moveInDriver logiVeh;
		((units _team) select 1) moveInTurret [logiVeh, [0]];
	
		// Set waypoint for base
		_wp = _team addWaypoint [getPosATL largePad_1, 0];
		_wp setWaypointStatements ["true","logiVeh land 'GET IN'"];
		_team setSpeedMode "NORMAL";
		logiVeh flyInHeight 250;
		((units _team) select 0) setBehaviour "CARELESS";
		((units _team) select 1) setBehaviour "CARELESS";
		
		// Set ID
		_team setGroupIdGlobal ["DEVIL - 1"];
		
		// Notification
		[true, "A Logistics transport has been dispatched with supplies.", "Headquarters"] remoteExec ["InA_fnc_formatHint", 0];
		
		// Wait until destroyed or has landed
		waitUntil {sleep 3; if !(alive logiVeh) exitWith {true;}; ((getPosATL logiVeh) select 2) < 3;};
		
		// Check if transport is alive
		if (alive logiVeh) then {
		
			[logiVeh, "Unloading supplies."] remoteExec ["sideChat", 0];
			
			logiVeh animateSource [_door, 1];
		};

		// Check if transport was destroyed
		if !(alive logiVeh) then {
			[true, "Logistics transport has been destroyed ...", "Headquarters"] remoteExec ["InA_fnc_formatHint", 0];
		};
		
		// Check if transport is alive
		if (alive logiVeh) then {
		
			sleep 60;

			// Check if completed objectives is above threshhold
			if (compObj >= 3) then {

				// Reset completed objectives
				compObj = 0;

				// Add extra supplies
				_addSup = round random 200;
				[true, "You have been allocated additional supplies due to successful operations in the theatre.", "Headquarters"] remoteExec ["InA_fnc_formatHint", 0];

				sleep 4;
			};

			// Drop off supplies
			LogF = LogF + (floor random [150,200,250]);
			LogM = LogM + (floor random [100,125,150]) + _addSup;
			
			// Check if extra supplies were given
			if (_addSup > 0) then {

				// Reset extra supplies
				_addSup = 0;
			};
			
			// Notification
			[logiVeh, "Supplies have been offloaded."] remoteExec ["sideChat", 0];

			sleep 4;

			// Add return waypoint
			_wp = _team addWaypoint [getMarkerPos "logisticsEntry", 0];
			_team setSpeedMode "NORMAL";

			// Notification
			[logiVeh, "Returning to ship."] remoteExec ["sideChat", 0];
			logiVeh animateSource [_door, 0];
		};
		
		// Wait until
		waitUntil {sleep 3; if !(alive logiVeh) exitWith {true;}; (logiVeh distance (getMarkerPos "logisticsEntry")) < 500;};
	
		// Check if transport is alive
		if (alive logiVeh) then {
			
			// Clear vehicle and crew
			{logiVeh deleteVehicleCrew _x} forEach crew logiVeh;
			deleteVehicle logiVeh;
		
		};
	};
};