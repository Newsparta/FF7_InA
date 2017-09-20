private ["_iRespawn"];

// ---------- Only on player ----------

if (!hasInterface) exitWith {};

// ---------- Disable chatter ----------

player disableConversation true;
enableSentences false;

// ---------- Respawn time ----------

_iRespawn = "RespawnTime" call BIS_fnc_getParamValue;
setPlayerRespawnTime _iRespawn;

// ---------- Weapon sway ----------

player setCustomAimCoef 0.5;

// ---------- Initial gear ----------

[clientOwner, "baseType"] remoteExec ["publicVariableClient", 2, false];

sleep 1;

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