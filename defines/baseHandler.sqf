_id = _this select 0;

switch (_id) do
{
	case 0:
	{
		themeFlag = "flag_USA";
		themeType = "Army";
		themeSupplier = "OPF";

		BLU_INF_SINGLE = "B_Soldier_F";
		BLU_RIFLE =
		[
			["hlc_rifle_ACR_Carb_black","30Rnd_556x45_Stanag"],
			["hlc_rifle_ACR_SBR_black","30Rnd_556x45_Stanag"]
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
			"VSM_MulticamTropic_Camo",
			"VSM_MulticamTropic_od_shirt_Camo",
			"VSM_MulticamTropic_od_pants_Camo"
		];
		BLU_VESTS =
		[
			"VSM_FAPC_Breacher_MulticamTropic",
			"VSM_FAPC_MG_MulticamTropic",
			"VSM_FAPC_Operator_MulticamTropic",
			"VSM_LBT6094_breacher_multicamTropic",
			"VSM_LBT6094_operator_multicamTropic",
			"VSM_RAV_Breacher_MulticamTropic",
			"VSM_RAV_MG_MulticamTropic",
			"VSM_RAV_operator_MulticamTropic"
		];
		BLU_HELMETS =
		[
			"VSM_Mich2000_MulticamTropic",
			"VSM_Mich2000_2_MulticamTropic",
			"VSM_MulticamTropic_OPS",
			"VSM_MulticamTropic_OPS_2",
			"VSM_MulticamTropic_Boonie"
		];

		call themeSelect;

		[] call InA_fnc_defaultDB;
	};
	
	case 1:
	{
		themeFlag = "flag_USA";
		themeType = "Marines";
		themeSupplier = "OPF";

		BLU_INF_SINGLE = "B_Soldier_F";
		BLU_RIFLE =
		[
			["rhs_weap_m4a1_carryhandle_pmag","30Rnd_556x45_Stanag"],
			["rhs_weap_mk18","30Rnd_556x45_Stanag"],
			["rhs_weap_m16a4_pmag","30Rnd_556x45_Stanag"]
		];
		BLU_GL =
		[
			["rhs_weap_m4a1_m320","30Rnd_556x45_Stanag","1Rnd_HE_Grenade_shell"],
			["rhs_weap_mk18_m320","30Rnd_556x45_Stanag","1Rnd_HE_Grenade_shell"]
		];
		BLU_MG =
		[
			["rhs_weap_m249_pip_S","rhs_200rnd_556x45_M_SAW"],
			["LMG_Mk200_F","200Rnd_65x39_cased_Box"],
			["hlc_lmg_mk48mod1","rhsusf_100Rnd_762x51_m80a1epr"]
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
			"TRYK_U_B_MARPAT_Wood_Tshirt",
			"TRYK_U_B_MARPAT_Wood"
		];
		BLU_VESTS =
		[
			"MNP_Vest_USMC",
			"MNP_Vest_USMC_2"
		];
		BLU_HELMETS =
		[
			"TRYK_H_Helmet_MARPAT_Wood",
			"TRYK_H_Booniehat_MARPAT_WOOD"
		];

		call themeSelect;

		[] call InA_fnc_defaultDB;
	};
	
	case 2:
	{
		themeFlag = "flag_NATO";
		themeType = "Nato";
		themeSupplier = "OPF";

		BLU_INF_SINGLE = "B_Soldier_F";
		BLU_RIFLE =
		[
			["rhs_weap_m4a1_carryhandle_pmag","30Rnd_556x45_Stanag"],
			["rhs_weap_mk18","30Rnd_556x45_Stanag"],
			["rhs_weap_m16a4_pmag","30Rnd_556x45_Stanag"]
		];
		BLU_GL =
		[
			["rhs_weap_m4a1_m320","30Rnd_556x45_Stanag","1Rnd_HE_Grenade_shell"],
			["rhs_weap_mk18_m320","30Rnd_556x45_Stanag","1Rnd_HE_Grenade_shell"]
		];
		BLU_MG =
		[
			["rhs_weap_m249_pip_S","rhs_200rnd_556x45_M_SAW"],
			["LMG_Mk200_F","200Rnd_65x39_cased_Box"],
			["hlc_lmg_mk48mod1","rhsusf_100Rnd_762x51_m80a1epr"]
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
			"U_B_T_Soldier_F",
			"U_B_T_Soldier_SL_F",
			"U_B_T_Soldier_AR_F"
		];
		BLU_VESTS =
		[
			"V_PlateCarrier1_tna_F",
			"V_PlateCarrier2_tna_F",
			"V_PlateCarrierGL_tna_F"
		];
		BLU_HELMETS =
		[
			"H_HelmetB_Light_tna_F",
			"H_HelmetB_tna_F",
			"H_HelmetB_Enh_tna_F",
			"H_Booniehat_tna_F"
		];

		call themeSelect;

		[] call InA_fnc_defaultDB;
	};
	
	case 3:
	{
		themeFlag = "flag_AAF";
		themeType = "AAF";
		themeSupplier = "OPF";

		BLU_INF_SINGLE = "B_Soldier_F";
		BLU_RIFLE =
		[
			["hlc_rifle_G36CV","hlc_30rnd_556x45_EPR_G36"],
			["hlc_rifle_G36KV","hlc_30rnd_556x45_EPR_G36"],
			["hlc_rifle_G36V","hlc_30rnd_556x45_EPR_G36"]
		];
		BLU_GL =
		[
			["hlc_rifle_G36VAG36","hlc_30rnd_556x45_EPR_G36","1Rnd_HE_Grenade_shell"]
		];
		BLU_MG =
		[
			["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
			["hlc_lmg_mk48mod1","rhsusf_100Rnd_762x51_m80a1epr"]
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
		themeType = "Russia";
		themeSupplier = "BLU";

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