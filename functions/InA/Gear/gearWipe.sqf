private ["_array"];
// ---------- Restrict init ----------

gearRestricted = false;

// ---------- Empty players and base armory ----------

{
	removeAllWeapons player;
	removeAllItems player;
	removeBackpack player;
	removeAllAssignedItems player;
	removeVest player;
	removeUniform player;
	removeHeadgear player;
} remoteExec ["BIS_fnc_call", 0];

_array = nearestObjects [getMarkerPos "respawn_west", 
[
	"Box_NATO_WpsLaunch_F",
	"Box_NATO_Support_F",
	"Box_NATO_AmmoOrd_F",
	"Box_NATO_Ammo_F",
	"Box_NATO_Wps_F",
	"Box_NATO_Grenades_F",
	"Box_NATO_Equip_F",
	"B_supplyCrate_F",
	"Box_NATO_Uniforms_F",
	"B_CargoNet_01_ammo_F",
	"ACE_medicalSupplyCrate"
], 750];

{
	clearWeaponCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearBackpackCargoGlobal _x;
	clearItemCargoGlobal _x;
} forEach _array;

// ---------- Delete any vehicles or support boxes ----------

_array = (getMarkerPos "respawn_west") nearEntities [["Air","LandVehicle"], 750];

{
	deleteVehicle _x;
} forEach _array;

_array = (getMarkerPos "respawn_west") nearEntities [["Box_NATO_Support_F"], 750];

{
	deleteVehicle _x;
} forEach _array;