// ---------- Missions ----------

civilian setFriend [west, 1];
civilian setFriend [resistance, 1];
civMissionActive = false;

activeLocations = 0;
concentrations = [];
InA_stronghold = false;
InA_stronghold_Loc = [];
mainLimit = 2500;
givenLoc = "";

compObj = 0;
missionBank = 
[
	"AAAEmplacement"
];

// ---------- Utility/vehicles ----------

playerVehicles = [];
utilityVehicles = [];

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