private ["_missions","_delay","_virgin","_handle","_last","_missionRequested","_missionRequest"];

civilian setFriend [west, 1];
civilian setFriend [resistance, 1];
civMissionActive = false;

mission = [0,0,0];
mainObj = [];
mainLimit = 2500;
InA_missionActive = false;
InA_missionCompleted = false;

givenType = "";
givenLoc = "";
givenMan = "";

compObj = 0;
totalObj = 0;
signalArray = [];
signalType = [];
spawnedObj = [];
placedMarkers = [];
call compile preprocessFileLineNumbers "missions\objectiveRefresh.sqf";

waitUntil {sleep 20; ["HQ", "Headquarters", "Select a base theme to begin."] remoteExec ["FF7_fnc_globalHintStruct", 0]; initialized};

while {true} do {

	["HQ", "Headquarters", "Insurgents seem to have increased their activity in the region."] remoteExec ["FF7_fnc_globalHintStruct", 0];
	
	intelActivity = "increased";
	InA_missionActive = false;
	InA_missionCompleted = false;
	spotted = false;
	afterActionReport = false;
	intelType = ["type", 0];
	intelLoc = ["loc", 0];
	intelMan = ["man", 0];
	
	if !(missionSaved) then {
		[] spawn InA_fnc_missionAO;
	} else {
		call compile format 
		[
			"[%1, false, %2] spawn InA_fnc_missionAO",
			mission,
			mainObj
		];
	};
	
	waitUntil {
		sleep (5 + (random 5));
		
		InA_missionCompleted;
	};

	_virgin = false;
	
	intelActivity = "none";
	spawnedObj = [];
	mainObj = [];
	placedMarkers = [];
	givenType = "";
	givenLoc = "";
	givenMan = "";
	
	sleep (random [params_missionDelay - (params_missionDelay/4), params_missionDelay, params_missionDelay + (params_missionDelay/4)]);
};