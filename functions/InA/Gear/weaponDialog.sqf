private ["_value","_itemType","_item","_id","_ctrl","_slider"];
// ---------- Requisition and display updates ----------

gearSliderChange =
{
	disableSerialization;

	_value = _this select 0;

	Amount = round (_value);
	ctrlSetText [1000,(format ["%1",round (_value)])];
	
	Cost = (Amount * Multiplier);
	ctrlSetText [1001,(format ["%1",Cost])];
};
lbSelCost =
{
	disableSerialization;
	
	Cost = (Amount * Multiplier);
	ctrlSetText [1001,(format ["%1",Cost])];
};
weaponCostCheck = 
{
	[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];
	
	sleep 0.2;
	
	if (LogM >= Cost) then {

		switch (_itemType) do
		{
			case "weapon":
			{
				[weaponCrate, [_item, Amount]] remoteExec ["addWeaponCargoGlobal", 2];
			};
			case "launcher":
			{
				[launcherCrate, [_item, Amount]] remoteExec ["addWeaponCargoGlobal", 2];
			};
		};
		
		LogM = (LogM - Cost);
		
		publicVariableServer "LogM";
		
		ctrlSetText [1002, (format ["%1",LogM])];	

		["Headquarters", "item(s) Requisitioned."] call FF7_fnc_formatHint;
	} else {
		["Headquarters", "Not enough Supplies."] call FF7_fnc_formatHint;
	};
};

// ---------- _item information ----------

gearItemChange = 
{
	_id = _this select 0;

	switch (baseType) do {
		case "Army":
		{
			switch (_id) do {
			
				case 0:
				{
					// M9
					Multiplier = 0;
				};
				case 1:
				{
					// M4A1
					Multiplier = 0;
				};
				
				case 2:
				{
					// M16A4
					Multiplier = 1;
				};
				
				case 3:
				{
					// HK416
					Multiplier = 1;
				};
				
				case 4:
				{
					// M4A1 Block II
					Multiplier = 1;
				};
				
				case 5:
				{
					// M4A1(320)
					Multiplier = 4;
				};
				
				case 6:
				{
					// HK416(320)
					Multiplier = 4;
				};
				
				case 7:
				{
					// HK4A1 Block II(320)
					Multiplier = 4;
				};
				
				case 8:
				{
					// M27 IAR
					Multiplier = 4;
				};
				
				case 9:
				{
					// M249
					Multiplier = 10;
				};
				
				case 10:
				{
					// M240B
					Multiplier = 15;
				};
				
				case 11:
				{
					// M14
					Multiplier = 15;
				};
				
				case 12:
				{
					// M24
					Multiplier = 15;
				};
				
				case 13:
				{
					// Mk 11
					Multiplier = 15;
				};
				
				case 14:
				{
					// M136 HEAT
					Multiplier = 15;
				};
				
				case 15:
				{
					// M136 HEDP
					Multiplier = 15;
				};
				
				case 16:
				{
					// M136 HP
					Multiplier = 15;
				};
				
				case 17:
				{
					// M72A7
					Multiplier = 10;
				};
				
				case 18:
				{
					// M3 MAAWS
					Multiplier = 50;
				};
				
				case 19:
				{
					// FGM-148
					Multiplier = 100;
				};
				
				case 20:
				{
					// FIM-92F
					Multiplier = 100;
				};
			};
		};
		
		case "Marines":
		{
			switch (_id) do {
			
				case 0:
				{
					// M9
					Multiplier = 0;
				};
				case 1:
				{
					// M4A1
					Multiplier = 0;
				};
				
				case 2:
				{
					// M16A4
					Multiplier = 1;
				};
				
				case 3:
				{
					// HK416
					Multiplier = 1;
				};
				
				case 4:
				{
					// M4A1 Block II
					Multiplier = 1;
				};
				
				case 5:
				{
					// M4A1(320)
					Multiplier = 4;
				};
				
				case 6:
				{
					// HK416(320)
					Multiplier = 4;
				};
				
				case 7:
				{
					// HK4A1 Block II(320)
					Multiplier = 4;
				};
				
				case 8:
				{
					// M27 IAR
					Multiplier = 4;
				};
				
				case 9:
				{
					// M249
					Multiplier = 10;
				};
				
				case 10:
				{
					// M240B
					Multiplier = 15;
				};
				
				case 11:
				{
					// M14
					Multiplier = 15;
				};
				
				case 12:
				{
					// M24
					Multiplier = 15;
				};
				
				case 13:
				{
					// Mk 11
					Multiplier = 15;
				};
				
				case 14:
				{
					// M136 HEAT
					Multiplier = 15;
				};
				
				case 15:
				{
					// M136 HEDP
					Multiplier = 15;
				};
				
				case 16:
				{
					// M136 HP
					Multiplier = 15;
				};
				
				case 17:
				{
					// M72A7
					Multiplier = 10;
				};
				
				case 18:
				{
					// M3 MAAWS
					Multiplier = 50;
				};
				
				case 19:
				{
					// FGM-148
					Multiplier = 100;
				};
				
				case 20:
				{
					// FIM-92F
					Multiplier = 100;
				};
			};
		};
		
		case "Nato":
		{
			switch (_id) do {
			
				case 0:
				{
					// P99
					Multiplier = 0;
				};
				
				case 1:
				{
					// MXC
					Multiplier = 0;
				};
				
				case 2:
				{
					// MX
					Multiplier = 1;
				};
				
				case 3:
				{
					// MX (3GL)
					Multiplier = 4;
				};
				
				case 4:
				{
					// Stoner 99 LMG
					Multiplier = 10;
				};
				
				case 5:
				{
					// GD LWMMG
					Multiplier = 15;
				};
				
				case 6:
				{
					// MXM
					Multiplier = 15;
				};
				
				case 7:
				{
					// M14
					Multiplier = 15;
				};
				
				case 8:
				{
					// SIG SG556
					Multiplier = 15;
				};
				
				case 9:
				{
					// M136 HEAT
					Multiplier = 15;
				};
				
				case 10:
				{
					// M136 HEDP
					Multiplier = 15;
				};
				
				case 11:
				{
					// M136 HP
					Multiplier = 15;
				};
				
				case 12:
				{
					// M72A7
					Multiplier = 10;
				};
				
				case 13:
				{
					// TITAN AT
					Multiplier = 100;
				};
				
				case 14:
				{
					// TITAN AA
					Multiplier = 100;
				};
			};
		};
		
		case "AAF":
		{
			switch (_id) do {
			
				case 0:
				{
					// P99
					Multiplier = 0;
				};
				
				case 1:
				{
					// F2000 C
					Multiplier = 0;
				};
				
				case 2:
				{
					// F2000
					Multiplier = 1;
				};
				
				case 3:
				{
					// TAR-21
					Multiplier = 1;
				};
				
				case 4:
				{
					// F2000 (GL)
					Multiplier = 4;
				};
				
				case 5:
				{
					// TAR-21 (GL)
					Multiplier = 4;
				};
				
				case 6:
				{
					// Stoner 99 LMG
					Multiplier = 10;
				};
				
				case 7:
				{
					// HK 121
					Multiplier = 15;
				};
				
				case 8:
				{
					// M14 EBR
					Multiplier = 15;
				};
				
				case 9:
				{
					// GM6 Lynx
					Multiplier = 20;
				};
				
				case 10:
				{
					// M136 HEAT
					Multiplier = 15;
				};
				
				case 11:
				{
					// M136 HEDP
					Multiplier = 15;
				};
				
				case 12:
				{
					// M136 HP
					Multiplier = 15;
				};
				
				case 13:
				{
					// M72A7
					Multiplier = 10;
				};
				
				case 14:
				{
					// TITAN AT
					Multiplier = 100;
				};
				
				case 15:
				{
					// TITAN AA
					Multiplier = 100;
				};
				
				case 16:
				{
					// TITAN AT
					Multiplier = 100;
				};
				
				case 17:
				{
					// TITAN AA
					Multiplier = 100;
				};
			};
		};
		
		case "Russia":
		{
			switch (_id) do {
				
				case 0:
				{
					// PM
					Multiplier = 0;
				};
				case 1:
				{
					//AK 74M
					Multiplier = 0;
				};
				
				case 2:
				{
					// AK 74M B33
					Multiplier = 1;
				};
				
				case 3:
				{
					// AK 74MR
					Multiplier = 1;
				};
				
				case 4:
				{
					// AK 74MR GP-25
					Multiplier = 4;
				};
				
				case 5:
				{
					// PKM
					Multiplier = 15;
				};
				
				case 6:
				{
					// PKP
					Multiplier = 15;
				};
				
				case 7:
				{
					// SVDS
					Multiplier = 10;
				};
				
				case 8:
				{
					// SVDM
					Multiplier = 15;
				};
				
				case 9:
				{
					// T-5000
					Multiplier = 20;
				};
				
				case 10:
				{
					// RPG 26
					Multiplier = 20;
				};
				
				case 11:
				{
					// RShG-2
					Multiplier = 25;
				};
				
				case 12:
				{
					// RPG 7
					Multiplier = 50;
				};
				
				case 13:
				{
					// Igla
					Multiplier = 100;
				};
			};
		};
	};
};
gearRequisition = 
{
	_id = _this select 0;

	switch (baseType) do {
		case "Army":
		{
			switch (_id) do {
				
				case 0:
				{
					_item = "rhsusf_weap_m9";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				case 1:
				{
					_item = "rhs_weap_m4a1_carryhandle_pmag";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 2:
				{
					_item = "rhs_weap_m16a4_pmag";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 3:
				{
					_item = "rhs_weap_hk416d145";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 4:
				{
					_item = "rhs_weap_m4a1_blockII_bk";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 5:
				{
					_item = "rhs_weap_m4a1_m320";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 6:
				{
					_item = "rhs_weap_hk416d145_m320";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 7:
				{
					_item = "rhs_weap_m4a1_blockII_M203_bk";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 8:
				{
					_item = "rhs_weap_m27iar";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 9:
				{
					_item = "rhs_weap_m249_pip_S";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 10:
				{
					_item = "rhs_weap_m240B_CAP";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 11:
				{
					_item = "rhs_weap_m14ebrri";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 12:
				{
					_item = "rhs_weap_m24sws";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 13:
				{
					_item = "rhs_weap_sr25";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 14:
				{
					_item = "tf47_at4_heat";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 15:
				{
					_item = "tf47_at4_HEDP";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 16:
				{
					_item = "tf47_at4_HP";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 17:
				{
					_item = "rhs_weap_m72a7";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 18:
				{
					_item = "tf47_m3maaws";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 19:
				{
					_item = "rhs_weap_fgm148";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 20:
				{
					_item = "rhs_weap_fim92";
					_itemType = "launcher";
					call weaponCostCheck;
				};
			};
		};
		
		case "Marines":
		{
			switch (_id) do {
				
				case 0:
				{
					_item = "rhsusf_weap_m9";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				case 1:
				{
					_item = "rhs_weap_m4a1_carryhandle_pmag";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 2:
				{
					_item = "rhs_weap_m16a4_pmag";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 3:
				{
					_item = "rhs_weap_hk416d145";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 4:
				{
					_item = "rhs_weap_m4a1_blockII_bk";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 5:
				{
					_item = "rhs_weap_m4a1_m320";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 6:
				{
					_item = "rhs_weap_hk416d145_m320";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 7:
				{
					_item = "rhs_weap_m4a1_blockII_M203_bk";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 8:
				{
					_item = "rhs_weap_m27iar";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 9:
				{
					_item = "rhs_weap_m249_pip_S";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 10:
				{
					_item = "rhs_weap_m240B_CAP";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 11:
				{
					_item = "rhs_weap_m14ebrri";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 12:
				{
					_item = "rhs_weap_m24sws";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 13:
				{
					_item = "rhs_weap_sr25";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 14:
				{
					_item = "tf47_at4_heat";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 15:
				{
					_item = "tf47_at4_HEDP";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 16:
				{
					_item = "tf47_at4_HP";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 17:
				{
					_item = "rhs_weap_m72a7";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 18:
				{
					_item = "tf47_m3maaws";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 19:
				{
					_item = "rhs_weap_fgm148";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 20:
				{
					_item = "rhs_weap_fim92";
					_itemType = "launcher";
					call weaponCostCheck;
				};
			};
		};
		
		case "Nato":
		{
			switch (_id) do {
			
				case 0:
				{
					_item = "hgun_P07_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 1:
				{
					_item = "arifle_MXC_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 2:
				{
					_item = "arifle_MX_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 3:
				{
					_item = "arifle_MX_GL_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 4:
				{
					_item = "LMG_Mk200_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 5:
				{
					_item = "MMG_02_sand_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 6:
				{
					_item = "arifle_MXM_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 7:
				{
					_item = "srifle_DMR_06_olive_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 8:
				{
					_item = "srifle_DMR_03_woodland_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 9:
				{
					_item = "tf47_at4_heat";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 10:
				{
					_item = "tf47_at4_HEDP";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 11:
				{
					_item = "tf47_at4_HP";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 12:
				{
					_item = "rhs_weap_m72a7";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 13:
				{
					_item = "launch_B_Titan_short_tna_F";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 14:
				{
					_item = "launch_B_Titan_tna_F";
					_itemType = "launcher";
					call weaponCostCheck;
				};
			};
		};
		case "AAF":
		{
			switch (_id) do {
			
				case 0:
				{
					_item = "hgun_P07_khk_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 1:
				{
					_item = "arifle_Mk20C_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 2:
				{
					_item = "arifle_Mk20_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 3:
				{
					_item = "arifle_TRG21_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 4:
				{
					_item = "arifle_Mk20_GL_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 5:
				{
					_item = "arifle_TRG21_GL_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 6:
				{
					_item = "LMG_Mk200_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 7:
				{
					_item = "MMG_01_tan_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 8:
				{
					_item = "srifle_EBR_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 9:
				{
					_item = "srifle_GM6_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 10:
				{
					_item = "tf47_at4_heat";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 11:
				{
					_item = "tf47_at4_HEDP";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 12:
				{
					_item = "tf47_at4_HP";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 13:
				{
					_item = "rhs_weap_m72a7";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 14:
				{
					_item = "launch_B_Titan_short_tna_F";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 15:
				{
					_item = "launch_B_Titan_tna_F";
					_itemType = "launcher";
					call weaponCostCheck;
				};
			};
		};		
		case "Russia":
		{
			switch (_id) do {
				
				case 0:
				{
					_item = "rhs_weap_makarov_pm";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				case 1:
				{
					_item = "rhs_weap_ak74m_zenitco01";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 2:
				{
					_item = "rhs_weap_ak74m_zenitco01_b33";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 3:
				{
					_item = "rhs_weap_ak74mr";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 4:
				{
					_item = "rhs_weap_ak74mr_gp25";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 5:
				{
					_item = "rhs_weap_pkm";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 6:
				{
					_item = "rhs_weap_pkp";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 7:
				{
					_item = "rhs_weap_svds_npz";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 8:
				{
					_item = "rhs_weap_svdp_npz";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 9:
				{
					_item = "rhs_weap_t5000";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 10:
				{
					_item = "rhs_weap_rpg26";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 11:
				{
					_item = "rhs_weap_rshg2";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 12:
				{
					_item = "rhs_weap_rpg7";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 13:
				{
					_item = "rhs_weap_igla";
					_itemType = "launcher";
					call weaponCostCheck;
				};
			};
		};
	};
};

_items = [];

switch (baseType) do {
	case "Army":
	{
		_items =	[
			"M9",
			"M4A1",
			"M16A4",
			"HK416",
			"M4A1 Block II",
			"M4A1 (M320)",
			"HK416 (M320)",
			"M4A1 Block II (M203)",
			"M27 IAR",
			"M249",
			"M240B",
			"M14",
			"M24",
			"Mk 11 Mod 0",
			"M136 (HEAT)",
			"M136 (HEDP)",
			"M136 (HP)",
			"M72A7",
			"M3 MAAWS",
			"FGM-148 Javelin",
			"FIM-92F Stinger"
		];
	};
	
	case "Marines":
	{
		_items =	[
			"M9",
			"M4A1",
			"M16A4",
			"HK416",
			"M4A1 Block II",
			"M4A1 (M320)",
			"HK416 (M320)",
			"M4A1 Block II (M203)",
			"M27 IAR",
			"M249",
			"M240B",
			"M14",
			"M24",
			"Mk 11 Mod 0",
			"M136 (HEAT)",
			"M136 (HEDP)",
			"M136 (HP)",
			"M72A7",
			"M3 MAAWS",
			"FGM-148 Javelin",
			"FIM-92F Stinger"
		];
	};
	
	case "Nato":
	{
		_items =	[
			"P99",
			"MXC",
			"MX",
			"MX (3GL)",
			"Stoner 99 LMG",
			"GD LWMMG",
			"MXM",
			"M14",
			"SIG SG556",
			"M136 (HEAT)",
			"M136 (HEDP)",
			"M136 (HP)",
			"M72A7",
			"TITAN AT",
			"TITAN AA"
		];	
	};
	
	case "AAF":
	{
		_items =	[
			"P99",
			"F2000 C",
			"F2000",
			"TAR-21",
			"F2000 (GL)",
			"TAR-21 (GL)",
			"Stoner 99 LMG",
			"HK121",
			"Mk14 Mod 1 EBR",
			"GM6 Lynx",
			"M136 (HEAT)",
			"M136 (HEDP)",
			"M136 (HP)",
			"M72A7",
			"TITAN AT",
			"TITAN AA"
		];	
	};
	
	case "Russia":
	{
		_items =	[
			"PM",
			"AK-74M",
			"AK-74M (B-33)",
			"AK-74MR",
			"AK-74MR (GP-25)",
			"PKM",
			"PKP",
			"SDVS",
			"SVDM",
			"T-5000",
			"RPG-26",
			"RShG-2",
			"RPG-7",
			"Igla"
		];	
	};
};

// ---------- Create dialog ----------

disableSerialization;

createDialog "InA_Gear_Dialog";

waitUntil {!isNull (findDisplay 9200);};

_ctrl = (findDisplay 9200) displayCtrl 1500;

{
	_ctrl lbAdd _x;
} forEach _items;

_slider = (findDisplay 9200) displayCtrl 1900;
_slider sliderSetRange [1, 10];
_slider slidersetSpeed [1, 1];
Amount = 1;
_ctrl lbSetCurSel 0;