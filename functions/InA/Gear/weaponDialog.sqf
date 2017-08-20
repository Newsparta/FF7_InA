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
					// ACR-E Carbine
					Multiplier = 0;
				};
				
				case 2:
				{
					// ACR-E SBR
					Multiplier = 10;
				};
				
				case 3:
				{
					// ACR-E Mid
					Multiplier = 10;
				};
				
				case 4:
				{
					// ACR-E Long
					Multiplier = 15;
				};
				
				case 5:
				{
					// ACR-E 6.8mm Mid
					Multiplier = 10;
				};
				
				case 6:
				{
					// ACR-E 6.8mm Long
					Multiplier = 15;
				};
				
				case 7:
				{
					// M4A1 (320)
					Multiplier = 15;
				};
				
				case 8:
				{
					// M249
					Multiplier = 20;
				};
				
				case 9:
				{
					// M240B
					Multiplier = 20;
				};
				
				case 10:
				{
					// M14
					Multiplier = 20;
				};
				
				case 11:
				{
					// SR-25
					Multiplier = 20;
				};
				
				case 12:
				{
					// M2010
					Multiplier = 20;
				};

				case 13:
				{
					// M107
					Multiplier = 100;
				};
				
				case 14:
				{
					// M136 HEAT
					Multiplier = 10;
				};
				
				case 15:
				{
					// M136 HEDP
					Multiplier = 10;
				};
				
				case 16:
				{
					// M136 HP
					Multiplier = 10;
				};
				
				case 17:
				{
					// M72A7
					Multiplier = 5;
				};
				
				case 18:
				{
					// M3 MAAWS
					Multiplier = 75;
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
					Multiplier = 10;
				};

				case 3:
				{
					// M27 IAR
					Multiplier = 10;
				};
				
				case 4:
				{
					// M4A1 (320)
					Multiplier = 15;
				};
				
				case 5:
				{
					// M16A4 (203)
					Multiplier = 15;
				};
				
				case 6:
				{
					// M249
					Multiplier = 20;
				};
				
				case 7:
				{
					// M240B
					Multiplier = 20;
				};
				
				case 8:
				{
					// M14
					Multiplier = 20;
				};
				
				case 9:
				{
					// SR-25
					Multiplier = 20;
				};
				
				case 10:
				{
					// M40A5
					Multiplier = 20;
				};

				case 11:
				{
					// M107
					Multiplier = 100;
				};
				
				case 12:
				{
					// M136 HEAT
					Multiplier = 10;
				};
				
				case 13:
				{
					// M136 HEDP
					Multiplier = 10;
				};
				
				case 14:
				{
					// M136 HP
					Multiplier = 10;
				};
				
				case 15:
				{
					// M72A7
					Multiplier = 5;
				};
				
				case 16:
				{
					// M3 MAAWS
					Multiplier = 75;
				};
				
				case 17:
				{
					// FGM-148
					Multiplier = 100;
				};
				
				case 18:
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
					// M4A1
					Multiplier = 0;
				};
				
				case 2:
				{
					// HK416 D10
					Multiplier = 10;
				};

				case 3:
				{
					// HK416 D14.5
					Multiplier = 10;
				};

				case 4:
				{
					// ACR-E Carbine
					Multiplier = 10;
				};

				case 5:
				{
					// ACR-E Mid
					Multiplier = 10;
				};

				case 6:
				{
					// ACR-E Long
					Multiplier = 15;
				};
				
				case 7:
				{
					// M4A1 (M320)
					Multiplier = 15;
				};

				case 8:
				{
					// HK416 (M320)
					Multiplier = 15;
				};
				
				case 9:
				{
					// M249 LMG
					Multiplier = 20;
				};
				
				case 10:
				{
					// GD LWMMG
					Multiplier = 20;
				};
				
				case 11:
				{
					// M14
					Multiplier = 20;
				};
				
				case 12:
				{
					// M40A5
					Multiplier = 20;
				};
				
				case 13:
				{
					// M107 Barret
					Multiplier = 100;
				};
				
				case 14:
				{
					// M136 HEAT
					Multiplier = 10;
				};
				
				case 15:
				{
					// M136 HEDP
					Multiplier = 10;
				};
				
				case 16:
				{
					// M136 HP
					Multiplier = 10;
				};
				
				case 17:
				{
					// M72A7
					Multiplier = 5;
				};

				case 18:
				{
					// M3 MAAWS
					Multiplier = 75;
				};
				
				case 19:
				{
					// TITAN AT
					Multiplier = 100;
				};
				
				case 20:
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
					// HK416 D10
					Multiplier = 0;
				};
				
				case 2:
				{
					// HK416 D14.5
					Multiplier = 10;
				};
				
				case 3:
				{
					// HK416 (M320)
					Multiplier = 10;
				};
				
				case 4:
				{
					// Stoner 99 LMG
					Multiplier = 20;
				};
				
				case 5:
				{
					// HK 121
					Multiplier = 20;
				};
				
				case 6:
				{
					// M14 EBR
					Multiplier = 20;
				};
				
				case 7:
				{
					// M107 Barret
					Multiplier = 100;
				};
				
				case 8:
				{
					// M136 HEAT
					Multiplier = 10;
				};
				
				case 9:
				{
					// M136 HEDP
					Multiplier = 10;
				};
				
				case 10:
				{
					// M136 HP
					Multiplier = 10;
				};
				
				case 11:
				{
					// M72A7
					Multiplier = 5;
				};
				
				case 12:
				{
					// TITAN AT
					Multiplier = 100;
				};
				
				case 13:
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
					Multiplier = 10;
				};
				
				case 11:
				{
					// RShG-2
					Multiplier = 10;
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
					_item = "hlc_rifle_ACR_Carb_tan";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 2:
				{
					_item = "hlc_rifle_ACR_SBR_tan";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 3:
				{
					_item = "hlc_rifle_ACR_mid_tan";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 4:
				{
					_item = "hlc_rifle_ACR_full_tan";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 5:
				{
					_item = "hlc_rifle_ACR68_mid_tan";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 6:
				{
					_item = "hlc_rifle_ACR68_full_tan";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 7:
				{
					_item = "rhs_weap_m4a1_m320";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 8:
				{
					_item = "rhs_weap_m249_pip_S";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 9:
				{
					_item = "rhs_weap_m240B_CAP";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 10:
				{
					_item = "rhs_weap_m14ebrri";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 11:
				{
					_item = "rhs_weap_sr25";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 12:
				{
					_item = "rhs_weap_XM2010_sa";
					_itemType = "weapon";
					call weaponCostCheck;
				};

				case 13:
				{
					_item = "rhs_weap_M107_w";
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
					_item = "rhs_weap_m27iar";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 4:
				{
					_item = "rhs_weap_m4a1_m320";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 5:
				{
					_item = "rhs_weap_m16a4_carryhandle_M203";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 6:
				{
					_item = "rhs_weap_m249_pip_S";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 7:
				{
					_item = "rhs_weap_m240B_CAP";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 8:
				{
					_item = "rhs_weap_m14ebrri";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 9:
				{
					_item = "rhs_weap_sr25";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 10:
				{
					_item = "rhs_weap_m40a5_wd";
					_itemType = "weapon";
					call weaponCostCheck;
				};

				case 11:
				{
					_item = "rhs_weap_m16a4_carryhandle_M203";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 12:
				{
					_item = "tf47_at4_heat";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 13:
				{
					_item = "tf47_at4_HEDP";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 14:
				{
					_item = "tf47_at4_HP";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 15:
				{
					_item = "rhs_weap_m72a7";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 16:
				{
					_item = "tf47_m3maaws";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 17:
				{
					_item = "rhs_weap_fgm148";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 18:
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
					_item = "rhs_weap_m4a1_carryhandle_pmag";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 2:
				{
					_item = "rhs_weap_hk416d10";
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
					_item = "hlc_rifle_ACR_Carb_tan";
					_itemType = "weapon";
					call weaponCostCheck;
				};

				case 5:
				{
					_item = "hlc_rifle_ACR_mid_tan";
					_itemType = "weapon";
					call weaponCostCheck;
				};

				case 6:
				{
					_item = "hlc_rifle_ACR_full_tan";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 7:
				{
					_item = "rhs_weap_m4a1_m320";
					_itemType = "weapon";
					call weaponCostCheck;
				};

				case 8:
				{
					_item = "rhs_weap_hk416d145_m320";
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
					_item = "MMG_02_sand_F";
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
					_item = "rhs_weap_m40a5_wd";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 13:
				{
					_item = "rhs_weap_M107_w";
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
					_item = "launch_B_Titan_short_tna_F";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 20:
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
					_item = "hgun_P07_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 1:
				{
					_item = "rhs_weap_hk416d10";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 2:
				{
					_item = "rhs_weap_hk416d145";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 3:
				{
					_item = "rhs_weap_hk416d145_m320";
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
					_item = "MMG_01_tan_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 6:
				{
					_item = "srifle_EBR_F";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 7:
				{
					_item = "rhs_weap_M107_w";
					_itemType = "weapon";
					call weaponCostCheck;
				};
				
				case 8:
				{
					_item = "tf47_at4_heat";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 9:
				{
					_item = "tf47_at4_HEDP";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 10:
				{
					_item = "tf47_at4_HP";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 11:
				{
					_item = "rhs_weap_m72a7";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 12:
				{
					_item = "launch_B_Titan_short_tna_F";
					_itemType = "launcher";
					call weaponCostCheck;
				};
				
				case 13:
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
			"ACR-E Carbine",
			"ACR-E SBR",
			"ACR-E (mid)",
			"ACR-E (long)",
			"ACR-E 6.8mm (mid)",
			"ACR-E 6.8mm (long)",
			"M4A1 (M320)",
			"M249",
			"M240B",
			"M14",
			"SR-25",
			"M2010 ESR",
			"M107 Barret",
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
			"M27 IAR",
			"M4A1 (M320)",
			"M16A4 (M203)",
			"M249",
			"M240B",
			"M14",
			"SR-25",
			"M40A5",
			"M107 Barret",
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
			"M4A1",
			"HK416 D10",
			"HK416 D14.5",
			"ACR-E Carbine",
			"ACR-E (mid)",
			"ACR-E (long)",
			"M4A1 (M320)",
			"HK416 (M320)",
			"M249 LMG",
			"GD LWMMG",
			"M14",
			"M40A5",
			"M107 Barret",
			"M136 (HEAT)",
			"M136 (HEDP)",
			"M136 (HP)",
			"M72A7",
			"M3 MAAWS",
			"TITAN AT",
			"TITAN AA"
		];	
	};
	
	case "AAF":
	{
		_items =	[
			"P99",
			"HK416 D10",
			"HK416 D14.5",
			"HK416 (M320)",
			"Stoner 99 LMG",
			"HK121",
			"M14",
			"M107 Barret",
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