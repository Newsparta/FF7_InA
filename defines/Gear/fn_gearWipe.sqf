/* ----------
Function:
	InA_fnc_gearWipe

Description:
	Clears the gear off of selected unit and replaces with basic gear based on faction.

Parameters:
	- Unit to clear (Object)
	- time to wait (Number)

Optional:

Example:
	[player] call InA_fnc_gearWipe;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_unit"			,player				,[ObjNull]			,[]							],
		[	"_wait"			,0.2				,[0]				,[]							]];

// update client value
[clientOwner, "baseType"] remoteExec ["publicVariableClient", 2, false];

// wait for server updates
sleep _wait;

// reset gear
switch (baseType) do {
	case "Army":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeBackpack _unit;
		removeAllAssignedItems _unit;
		removeVest _unit;
		removeUniform _unit;
		removeHeadgear _unit;

		_unit forceAddUniform "VSM_MulticamTropic_Camo";
		_unit addMagazine "rhsusf_mag_15Rnd_9x19_JHP";
		_unit addWeapon "rhsusf_weap_m9";
	};
	case "Marines":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeBackpack _unit;
		removeAllAssignedItems _unit;
		removeVest _unit;
		removeUniform _unit;
		removeHeadgear _unit;

		_unit forceAddUniform "TRYK_U_B_MARPAT_Wood_Tshirt";
		_unit addMagazine "rhsusf_mag_15Rnd_9x19_JHP";
		_unit addWeapon "rhsusf_weap_m9";
	};
	case "Nato":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeBackpack _unit;
		removeAllAssignedItems _unit;
		removeVest _unit;
		removeUniform _unit;
		removeHeadgear _unit;

		_unit forceAddUniform "U_B_T_Soldier_F";
		_unit addMagazine "16Rnd_9x21_Mag";
		_unit addWeapon "hgun_P07_F";
	};
	case "AAF":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeBackpack _unit;
		removeAllAssignedItems _unit;
		removeVest _unit;
		removeUniform _unit;
		removeHeadgear _unit;

		_unit forceAddUniform "U_I_CombatUniform";
		_unit addMagazine "16Rnd_9x21_Mag";
		_unit addWeapon "hgun_P07_F";
	};
	case "Russia":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeBackpack _unit;
		removeAllAssignedItems _unit;
		removeVest _unit;
		removeUniform _unit;
		removeHeadgear _unit;

		_unit forceAddUniform "rhs_uniform_emr_patchless";
		_unit addMagazine "rhs_mag_9x18_8_57N181S";
		_unit addWeapon "rhs_weap_makarov_pm";
	};
	default
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeBackpack _unit;
		removeAllAssignedItems _unit;
		removeVest _unit;
		removeUniform _unit;
		removeHeadgear _unit;
	};
};

// Sleep to remove any stray radio's
sleep 1;
removeAllAssignedItems _unit;