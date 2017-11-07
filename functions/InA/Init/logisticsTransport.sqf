private ["_door","_pilots","_wp","_team","_delayScale"];
// ---------- Logistics transport init ----------

waitUntil {sleep 1; initialized};

logiVeh = ObjNull;
ordnanceDisposedOf = 0;
extraSupplies = 0;
_delayScale = 0;

// ---------- Control loop ----------

while {true} do {

	if (count (allPlayers - entities "HeadlessClient_F") < 1) then {
		_delayScale = 0;
	};
	
	logiETA = ((5400 + (random 3600)) + _delayScale);
	logiDaytime = daytime;
	sleep logiETA;

	if (count (allPlayers - entities "HeadlessClient_F") > 0) then {

		// ---------- Time Delay ----------

		_delayScale = _delayScale + 3600;
	
		// ---------- Helicopter spawns ----------
		
		_door = "";
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
		
		// ---------- TEAM ASSIGNMENTS ----------

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
	
		_wp = _team addWaypoint [getPosATL largePad_1, 0];
		_wp setWaypointStatements ["true","logiVeh land 'GET IN'"];
		_team setSpeedMode "NORMAL";
		logiVeh flyInHeight 250;
		((units _team) select 0) setBehaviour "CARELESS";
		((units _team) select 1) setBehaviour "CARELESS";
		
		_team setGroupIdGlobal ["DEVIL - 1"];
		
		["HQ", "Headquarters", "A Logistics transport has been dispatched with supplies."] remoteExec ["FF7_fnc_globalHintStruct", 0];
		
		waitUntil {sleep 3; if !(alive logiVeh) exitWith {true}; ((getPosATL logiVeh) select 2) < 3};
		
		if (alive logiVeh) then {
		
			[logiVeh, "Unloading supplies."] remoteExec ["sideChat", 0];
			
			logiVeh animateSource [_door, 1];
		};
		if !(alive logiVeh) then {
			["HQ", "Headquarters", "Logistics transport has been destroyed ..."] remoteExec ["FF7_fnc_globalHintStruct", 0];
		};
		
		if (alive logiVeh) then {
		
			sleep 60;

			if (compObj >= 3) then {
				compObj = 0;
				extraSupplies = round random 100;
				["HQ", "Headquarters", "You have been allocated additional supplies due to successful operations in the theatre."] remoteExec ["FF7_fnc_globalHintStruct", 0];

				sleep 4;
			};
			
			LogF = LogF + (floor random [150,200,250]);
			LogM = LogM + (floor random [75,100,125]) + extraSupplies;
			
			if (extraSupplies > 0) then {
				extraSupplies = 0;
			};
			
			[logiVeh, "Supplies have been offloaded."] remoteExec ["sideChat", 0];
		};
		
		if (alive logiVeh) then {
		
			sleep 2;
		
			[logiVeh, "Loading any WAD cargo."] remoteExec ["sideChat", 0];
		
			sleep 28;
			
			[WAD] spawn InA_fnc_WAD;
			
			_wp = _team addWaypoint [getMarkerPos "logisticsEntry", 0];
			_team setSpeedMode "NORMAL";
			
			[logiVeh, "Returning to ship."] remoteExec ["sideChat", 0];
			
			logiVeh animateSource [_door, 0];
		};
		
		waitUntil {sleep 3; if !(alive logiVeh) exitWith {true}; (logiVeh distance (getMarkerPos "logisticsEntry")) < 500};
	
		if (alive logiVeh) then {
				
			{logiVeh deleteVehicleCrew _x} forEach crew logiVeh;
			deleteVehicle logiVeh;
		
		};
	};
};