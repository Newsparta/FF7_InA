private ["_array","_veh", "_group"];

if !(initialized) then {
	initialized = true;
};

"baseMarker" setMarkerType "rhs_flag_russia";

baseType = "Russia";
publicVariable "baseType";
supplier = "BLU";
publicVariable "supplier";
LogV = 4;
LogM = 150 + (5 * (count (call BIS_fnc_listPlayers)));
LogF = 400;

["HQ", "Headquarters", "Base Theme Selected."] remoteExec ["FF7_fnc_globalHintStruct", 0];

// ---------- GEAR BASICS ----------

call compile preprocessFileLineNumbers "functions\InA\Gear\gearWipe.sqf";

// ---------- Base defence ----------

_veh = createVehicle ["B_AAA_System_01_F", [11127.628,11538.578,1.439], [], 0, "CAN_COLLIDE"];
_veh setDir 3.5;