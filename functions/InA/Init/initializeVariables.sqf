// ---------- missions ----------

missionSaved = false;

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

// ---------- base ----------

baseType = "";

InA_sitrep = true;

InA_fob_location = [0,0,0];
fobPlaced = false;

// ---------- civilian ----------

civTol = 1;
responded = false;

// ---------- resources ----------

LogV = 0;
LogF = 0;
LogM = 0;