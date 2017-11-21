/////////////////////////////////////////////
// ---------- Begin server init ---------- //
/////////////////////////////////////////////

FF7_Global_Debug = true;
initialized = false;

// ---------- initialize variables ----------
_null = execVM "functions\InA\Init\initConfigs.sqf";

_handle = execVM "functions\InA\Init\initializeVariables.sqf";

waitUntil {scriptDone _handle;};

// ---------- Fog/mist controller ----------

_null = [900, 0.2] execVM "functions\FF7\Generic\fn_weatherMan.sqf";

// ---------- Ambient modules ----------

_null = execVM "defines\ambientModules.sqf";

// ---------- TFAR setup ----------

if (("task_force_radio" in activatedAddons)) then
{
	call FF7_fnc_TFARsetup;
}
else
{
	["initServer", "TFAR not active ...."] call FF7_fnc_debugLog;
};

#include "\task_force_radio\functions\common.sqf";

// ---------- Base init ----------

_null = execVM "functions\InA\Init\isGarageClear.sqf";
_null = execVM "functions\InA\Init\resourceHandler.sqf";
_null = execVM "functions\InA\Init\logisticsTransport.sqf";
_null = execVM "functions\InA\Init\civilianTolerance.sqf";
_null = execVM "functions\InA\Init\supplierCheck.sqf";

[
	[
		getMarkerPos "groundResupply_1",
		getMarkerPos "airResupply_1",
		getMarkerPos "airResupply_2"
	]
] spawn InA_fnc_vehicleService;

// ---------- Autosave ----------

[] spawn {

	while {true} do {

		waitUntil {sleep 1; (count (allPlayers - entities "HeadlessClient_F") > 0)};

		sleep (30 + (random 30));

		if (count (allPlayers - entities "HeadlessClient_F") < 1) then {

			[] call InA_fnc_save;
		};
	};
};

// ---------- Parameters ----------
	
for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do {
	call compile format
	[
		"params_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};

call compile preprocessFileLineNumbers "defines\civilianTheme.sqf";
call compile preprocessFileLineNumbers "defines\enemyTheme.sqf";

// ---------- Missions ----------

_null = execVM "missions\missionControl.sqf";
_null = execVM "missions\eventsHandler.sqf";

// ---------- Map wipe ----------

_null = execVM "functions\InA\Init\mapWipe.sqf";

// ---------- Vehicle Spawn init ----------

vehicleSpawn = 
{
	if (vehicleParked) exitWith {
		["Headquarters", "Please clear the garage before requisitioning more vehicles."] remoteExec ["FF7_fnc_formatHint", ID, false];
	};

	_afford = false;

	if (LogV >= vCost) then {
		if (LogM >= mCost) then {
			if (LogF >= fCost) then {
				_afford = true;
			};
		};
	};

	if (_afford) then {

		["VEHICLE REQUSITIONED", ""] remoteExec ["FF7_fnc_formatHint", ID, false];

		_veh = createVehicle [vehicleType, getMarkerPos "garageSpawn", [], 0, "CAN_COLLIDE"];
		[
			_veh,
			vehiclePaint, 
			vehicleAnim
		] call BIS_fnc_initVehicle;
		_veh setDir (markerDir "garageSpawn");
		clearBackpackCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearItemCargoGlobal _veh;
			
		playerVehicles pushBack _veh;
		
		if (isUtility) then {
			utilityVehicles pushBack [_veh, capacity, capacity, false];
		};
			
		LogV = LogV - vCost;
		LogM = LogM - mCost;
		LogF = LogF - fCost;

	} else {
		["Headquarters", "You do not have the logistical supplies to field this vehicle."] remoteExec ["FF7_fnc_formatHint", ID, false];
	};
};

airSpawn = 
{
	if (vehicleAirParked) exitWith {
		["Headquarters", "Please clear the hangar before requisitioning more vehicles."] remoteExec ["FF7_fnc_formatHint", ID, false];
	};

	_afford = false;

	if (LogV >= vCost) then {
		if (LogM >= mCost) then {
			if (LogF >= fCost) then {
				_afford = true;
			};
		};
	};

	if (_afford) then {

		["VEHICLE REQUSITIONED", ""] remoteExec ["FF7_fnc_formatHint", ID, false];

		_veh = createVehicle [vehicleType, getMarkerPos "hangarSpawn", [], 0, "CAN_COLLIDE"];
		[
			_veh,
			vehiclePaint, 
			vehicleAnim
		] call BIS_fnc_initVehicle;
		_veh setDir (markerDir "hangarSpawn");
		clearBackpackCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearItemCargoGlobal _veh;
			
		playerVehicles pushBack _veh;
			
		LogV = LogV - vCost;
		LogM = LogM - mCost;
		LogF = LogF - fCost;

	} else {
		["Headquarters", "You do not have the logistical supplies to field this vehicle."] remoteExec ["FF7_fnc_formatHint", ID, false];
	};
};

// ---------- Base Theme ----------

themeSelect = 
{
	private ["_array","_veh", "_group"];

	if !(initialized) then {
		initialized = true;
	};

	"baseMarker" setMarkerType themeFlag;

	baseType = themeType;
	publicVariable "baseType";
	supplier = themeSupplier;
	publicVariable "supplier";
	LogV = 4;
	LogM = 200;
	LogF = 400;

	["HQ", "Headquarters", "Base Theme Selected."] remoteExec ["FF7_fnc_globalHintStruct", 0];

	// ---------- GEAR BASICS ----------

	call compile preprocessFileLineNumbers "defines\Gear\gearWipe.sqf";
};

// ---------- Load database ----------

_null = execVM "functions\InA\Init\loadDatabase.sqf";

///////////////////////////////////////////
// ---------- END SERVER INIT ---------- //
///////////////////////////////////////////