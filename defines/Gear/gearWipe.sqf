private ["_array"];
// ---------- Restrict init ----------

gearRestricted = false;

// ---------- Empty players and base armory ----------

{
	// ---------- Initial gear ----------

	[clientOwner, "baseType"] remoteExec ["publicVariableClient", 2, false];

	sleep 0.2;

	switch (baseType) do {
		case "Army":
		{
			removeAllWeapons player;
			removeAllItems player;
			removeBackpack player;
			removeAllAssignedItems player;
			removeVest player;
			removeUniform player;
			removeHeadgear player;

			player forceAddUniform "VSM_Multicam_Crye_Camo";
			player addMagazine "rhsusf_mag_15Rnd_9x19_JHP";
			player addWeapon "rhsusf_weap_m9",
		};
		case "Marines":
		{
			removeAllWeapons player;
			removeAllItems player;
			removeBackpack player;
			removeAllAssignedItems player;
			removeVest player;
			removeUniform player;
			removeHeadgear player;

			player forceAddUniform "rhs_uniform_FROG01_wd";
			player addMagazine "rhsusf_mag_15Rnd_9x19_JHP";
			player addWeapon "rhsusf_weap_m9",
		};
		case "Nato":
		{
			removeAllWeapons player;
			removeAllItems player;
			removeBackpack player;
			removeAllAssignedItems player;
			removeVest player;
			removeUniform player;
			removeHeadgear player;

			player forceAddUniform "MNP_CombatUniform_Scorpion_A";
			player addMagazine "16Rnd_9x21_Mag";
			player addWeapon "hgun_P07_F",
		};
		case "AAF":
		{
			removeAllWeapons player;
			removeAllItems player;
			removeBackpack player;
			removeAllAssignedItems player;
			removeVest player;
			removeUniform player;
			removeHeadgear player;

			player forceAddUniform "U_I_CombatUniform";
			player addMagazine "rhsusf_mag_15Rnd_9x19_JHP";
			player addWeapon "hgun_P07_F",
		};
		case "Russia":
		{
			removeAllWeapons player;
			removeAllItems player;
			removeBackpack player;
			removeAllAssignedItems player;
			removeVest player;
			removeUniform player;
			removeHeadgear player;

			player forceAddUniform "rhs_uniform_emr_patchless";
			player addMagazine "rhs_mag_9x18_8_57N181S";
			player addWeapon "rhs_weap_makarov_pm",
		};
		default
		{
			removeAllWeapons player;
			removeAllItems player;
			removeBackpack player;
			removeAllAssignedItems player;
			removeVest player;
			removeUniform player;
			removeHeadgear player;
		};
	};
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