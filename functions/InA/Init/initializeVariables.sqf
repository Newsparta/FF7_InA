// ---------- Missions ----------

civilian setFriend [west, 1];
civilian setFriend [resistance, 1];
civMissionActive = false;

activeLocations = 0;
concentrations = [];
InA_stronghold = false;
InA_stronghold_Loc = [];
mainLimit = 2000;
sideMissionTimer = 3600;
givenLoc = "";

compObj = 0;
missionBank = 
[
	"AAAEmplacement",
	"commOutpost",
	"Eliminate",
	"fuelDepot",
	"HVTOfficer",
	"weaponsCache"
];

// ---------- Utility/vehicles ----------

playerVehicles = [];
utilityVehicles = [];
aidDeployed = false;
fortifiedRegions = [];

// ---------- Base ----------

baseType = "";
supplier = "";
gearRestricted = false;

InA_sitrep = true;

InA_fob_location = [0,0,0];
fobPlaced = false;

safehouse = [0,0,0];

// ---------- Civilian ----------

civTol = 1;
responded = false;

// ---------- Resources ----------

LogV = 0;
LogF = 0;
LogM = 0;