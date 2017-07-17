private ["_location","_i","_type","_number"];

if (afterActionReport) then {

	waitUntil {sleep 1; ({_x distance mission < 2500} count (allPlayers - entities "HeadlessClient_F") < 1)};

	// ---------- Cleanup ----------
	
	_location = text (nearestLocations [mission, 
	[
		"NameCity",
		"NameVillage",
		"NameCityCapital"
		
	], 2000] select 0);

	[mission,2500] call InA_fnc_cleanup;

	{deleteMarker _x} forEach placedMarkers;
	
	mission = [0,0,0];

	InA_missionActive = false;
	publicVariable "InA_missionActive";
	
	["HQ", "Headquarters", "After action report has been filed."] remoteExec ["FF7_fnc_globalHintStruct", 0];
	afterActionReport = false;
	
	sleep 5;
	
	if (compObj > 0) then {
		
		if (mainObjective select 1 > 0) then {
		
			["HQ", "Headquarters", format ["You neutralized an insurgent presence near %1.",_location]] remoteExec ["FF7_fnc_globalHintStruct", 0];
			
			sleep 5;
		} else {
		
			["HQ", "Headquarters", format ["You failed to neutralize the insurgents near %1.",_location]] remoteExec ["FF7_fnc_globalHintStruct", 0];
			
			sleep 5;		
		};
	
		for "_i" from 0 to ((count Objectives) - 1) do {
		
			_type = Objectives select _i select 0;
			_number = Objectives select _i select 1;
			
			if (_number > 0) then {
				
				["HQ", "Headquarters", format ["You neutralized %2 %1.",_type, _number]] remoteExec ["FF7_fnc_globalHintStruct", 0];
				
				sleep 5;
			};
		
		};
		
		totalObj = totalObj + compObj;
		
		if (totalObj > 3) then {
			
			["HQ", "Headquarters", "You have made significant progress against the insurgents and your superiors have taken notice. Expect more supplies to be directed to your sector."] remoteExec ["FF7_fnc_globalHintStruct", 0];
			
			totalObj = 0;
			extraSupplies = random [100,150,200];
			
			sleep 5;
		};
		
		LogV = LogV + 2;
		["HQ", "Headquarters", "You have been commended for your success against the insurgents."] remoteExec ["FF7_fnc_globalHintStruct", 0];
	} else {
	
		["HQ", "Headquarters", "You seem to have not had any effect on insurgent operations."] remoteExec ["FF7_fnc_globalHintStruct", 0];
	};
	
	compObj = 0;
	signalArray = [];
	signalType = [];
	
	call compile preprocessFileLineNumbers "missions\objectiveRefresh.sqf";
	
} else {

	["HQ", "Headquarters", "You have not completed any major operations against the enemy."] remoteExec ["FF7_fnc_globalHintStruct", 0];

};