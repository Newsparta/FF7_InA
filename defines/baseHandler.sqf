_id = _this select 0;

switch (_id) do
{
	case 0:
	{
		themeFlag = "flag_USA";
		baseType = "Army";
		supplier = "OPF";

		BLU_INF_SINGLE = "B_Soldier_F";
		BLU_RIFLE =
		[
			["hlc_rifle_ACR_Carb_tan","30Rnd_556x45_Stanag"],
			["hlc_rifle_ACR_mid_tan","30Rnd_556x45_Stanag"],
			["hlc_rifle_ACR_full_tan","30Rnd_556x45_Stanag"]
		];
		BLU_GL =
		[
			["rhs_weap_m4a1_m320","30Rnd_556x45_Stanag","1Rnd_HE_Grenade_shell"]
		];
		BLU_MG =
		[
			["rhs_weap_m249_pip_S","rhs_200rnd_556x45_M_SAW"]
		];
		BLU_AT =
		[
			["tf47_m3maaws","tf47_m3maaws_HEAT"]
		];
		BLU_AA =
		[
			["rhs_weap_fim92","rhs_fim92_mag"]
		];
		BLU_BACKPACKS =
		[
			"VSM_OGA_OD_Backpack_Kitbag"
		];
		BLU_UNIFORMS =
		[
			"VSM_Multicam_Crye_Camo",
			"VSM_Multicam_Crye_od_shirt_Camo",
			"VSM_Multicam_Crye_od_pants_Camo"
		];
		BLU_VESTS =
		[
			"VSM_FAPC_Breacher_Multicam",
			"VSM_FAPC_MG_Multicam",
			"VSM_FAPC_Operator_Multicam",
			"VSM_LBT6094_breacher_multicam",
			"VSM_LBT6094_operator_multicam",
			"VSM_RAV_Breacher_Multicam",
			"VSM_RAV_MG_Multicam",
			"VSM_RAV_operator_Multicam"
		];
		BLU_HELMETS =
		[
			"VSM_Mich2000_Multicam",
			"VSM_OPS_multicam"
		];

		call themeSelect;

		[] call InA_fnc_defaultDB;
	};
	
	case 1:
	{
		themeFlag = "flag_USA";
		baseType = "Marines";
		supplier = "OPF";

		BLU_INF_SINGLE = "B_Soldier_F";
		BLU_RIFLE =
		[
			["rhs_weap_m4a1_carryhandle_pmag","30Rnd_556x45_Stanag"],
			["rhs_weap_m16a4_pmag","30Rnd_556x45_Stanag"]
		];
		BLU_GL =
		[
			["rhs_weap_m4a1_m320","30Rnd_556x45_Stanag","1Rnd_HE_Grenade_shell"],
			["rhs_weap_m16a4_carryhandle_M203","30Rnd_556x45_Stanag","1Rnd_HE_Grenade_shell"]
		];
		BLU_MG =
		[
			["rhs_weap_m249_pip_S","rhs_200rnd_556x45_M_SAW"]
		];
		BLU_AT =
		[
			["tf47_m3maaws","tf47_m3maaws_HEAT"]
		];
		BLU_AA =
		[
			["rhs_weap_fim92","rhs_fim92_mag"]
		];
		BLU_BACKPACKS =
		[
			"VSM_OGA_OD_Backpack_Kitbag"
		];
		BLU_UNIFORMS =
		[
			"rhs_uniform_FROG01_wd"
		];
		BLU_VESTS =
		[
			"rhsusf_spc_corpsman",
			"rhsusf_spc_iar",
			"rhsusf_spc_light",
			"rhsusf_spc_mg",
			"rhsusf_spc_rifleman"
		];
		BLU_HELMETS =
		[
			"rhsusf_mich_helmet_marpatwd_norotos_arc",
			"rhsusf_mich_helmet_marpatwd_norotos",
			"rhsusf_mich_helmet_marpatwd",
			"rhsusf_mich_helmet_marpatwd_alt"
		];

		call themeSelect;

		[] call InA_fnc_defaultDB;
	};
	
	case 2:
	{
		themeFlag = "flag_NATO";
		baseType = "Nato";
		supplier = "OPF";

		BLU_INF_SINGLE = "B_Soldier_F";
		BLU_RIFLE =
		[
			["hlc_rifle_ACR_Carb_tan","30Rnd_556x45_Stanag"],
			["hlc_rifle_ACR_mid_tan","30Rnd_556x45_Stanag"],
			["hlc_rifle_ACR_full_tan","30Rnd_556x45_Stanag"]
		];
		BLU_GL =
		[
			["rhs_weap_m4a1_m320","30Rnd_556x45_Stanag","1Rnd_HE_Grenade_shell"]
		];
		BLU_MG =
		[
			["rhs_weap_m249_pip_S","rhs_200rnd_556x45_M_SAW"]
		];
		BLU_AT =
		[
			["tf47_m3maaws","tf47_m3maaws_HEAT"]
		];
		BLU_AA =
		[
			["rhs_weap_fim92","rhs_fim92_mag"]
		];
		BLU_BACKPACKS =
		[
			"VSM_OGA_OD_Backpack_Kitbag"
		];
		BLU_UNIFORMS =
		[
			"MNP_CombatUniform_Scorpion_A",
			"MNP_CombatUniform_Scorpion_B"
		];
		BLU_VESTS =
		[
			"MNP_Vest_Scorpion_1",
			"MNP_Vest_Scorpion_2"
		];
		BLU_HELMETS =
		[
			"MNP_Helmet_Scorpion"
		];

		call themeSelect;

		[] call InA_fnc_defaultDB;
	};
	
	case 3:
	{
		themeFlag = "flag_AAF";
		baseType = "AAF";
		supplier = "OPF";

		BLU_INF_SINGLE = "B_Soldier_F";
		BLU_RIFLE =
		[
			["rhs_weap_hk416d10","30Rnd_556x45_Stanag"],
			["rhs_weap_hk416d145","30Rnd_556x45_Stanag"]
		];
		BLU_GL =
		[
			["rhs_weap_hk416d145_m320","30Rnd_556x45_Stanag","1Rnd_HE_Grenade_shell"]
		];
		BLU_MG =
		[
			["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"]
		];
		BLU_AT =
		[
			["launch_B_Titan_short_tna_F","Titan_AT"]
		];
		BLU_AA =
		[
			["launch_B_Titan_tna_F","Titan_AA"]
		];
		BLU_BACKPACKS =
		[
			"VSM_OGA_OD_Backpack_Kitbag"
		];
		BLU_UNIFORMS =
		[
			"U_I_CombatUniform",
			"U_I_CombatUniform_shortsleeve"
		];
		BLU_VESTS =
		[
			"V_PlateCarrierIA1_dgtl",
			"V_PlateCarrierIA2_dgtl",
			"V_PlateCarrierIAGL_dgtl"
		];
		BLU_HELMETS =
		[
			"H_HelmetIA"
		];

		call themeSelect;

		[] call InA_fnc_defaultDB;
	};
	
	case 4:
	{
		themeFlag = "rhs_flag_russia";
		baseType = "Russia";
		supplier = "BLU";

		BLU_INF_SINGLE = "rhs_vdv_rifleman";
		BLU_RIFLE =
		[
			["rhs_weap_ak74m_zenitco01","rhs_30Rnd_545x39_7N10_AK"],
			["rhs_weap_ak74m_zenitco01_b33","rhs_30Rnd_545x39_7N10_AK"],
			["rhs_weap_ak74mr","rhs_30Rnd_545x39_7N10_AK"]
		];
		BLU_GL =
		[
			["rhs_weap_ak74mr_gp25","rhs_30Rnd_545x39_7N10_AK","rhs_VOG25"]
		];
		BLU_MG =
		[
			["rhs_weap_pkp","rhs_100Rnd_762x54mmR_green"]
		];
		BLU_AT =
		[
			["rhs_weap_rpg7","rhs_rpg7_PG7V_mag"]
		];
		BLU_AA =
		[
			["rhs_weap_igla","rhs_mag_9k38_rocket"]
		];
		BLU_BACKPACKS =
		[
			"VSM_OGA_OD_Backpack_Kitbag"
		];
		BLU_UNIFORMS =
		[
			"rhs_uniform_emr_patchless"
		];
		BLU_VESTS =
		[
			"rhs_6b23_6sh116",
			"rhs_6b23_digi_6sh92",
			"rhs_6b23_digi_6sh92_spetsnaz2",
			"rhs_6b23_digi_6sh92_Vog_Spetsnaz"
		];
		BLU_HELMETS =
		[
			"rhs_6b47",
			"rhs_6b47_ess"
		];

		call themeSelect;

		[] call InA_fnc_defaultDB;
	};
};