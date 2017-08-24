_id = _this select 0;

switch (_id) do
{
	case 0:
	{
		themeFlag = "flag_USA";
		themeType = "Army";
		themeSupplier = "OPF";

		BLU_INF_SINGLE = 
		[
			"B_Soldier_F"
		];
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
	};
	
	case 1:
	{
		themeFlag = "flag_USA";
		themeType = "Marines";
		themeSupplier = "OPF";

		BLU_INF_SINGLE = 
		{
			"B_Soldier_F"
		};
		BLU_RIFLE =
		{
			["",""]
		};
		BLU_GL =
		{
			["",""]
		};
		BLU_MG =
		{
			["",""]
		};
		BLU_AT =
		{
			["tf47_m3maaws","tf47_m3maaws_HEAT"]
		};
		BLU_AA =
		{
			["rhs_weap_fim92","rhs_fim92_mag"]
		};

		call themeSelect;
	};
	
	case 2:
	{
		themeFlag = "flag_NATO";
		themeType = "Nato";
		themeSupplier = "OPF";

		BLU_INF_SINGLE = 
		{
			"B_Soldier_F"
		};
		BLU_RIFLE =
		{
			["",""]
		};
		BLU_GL =
		{
			["",""]
		};
		BLU_MG =
		{
			["",""]
		};
		BLU_AT =
		{
			["",""]
		};
		BLU_AA =
		{
			["",""]
		};

		call themeSelect;
	};
	
	case 3:
	{
		themeFlag = "flag_AAF";
		themeType = "AAF";
		themeSupplier = "OPF";

		BLU_INF_SINGLE = 
		{
			"B_Soldier_F"
		};
		BLU_RIFLE =
		{
			["",""]
		};
		BLU_GL =
		{
			["",""]
		};
		BLU_MG =
		{
			["",""]
		};
		BLU_AT =
		{
			["",""]
		};
		BLU_AA =
		{
			["",""]
		};

		call themeSelect;
	};
	
	case 4:
	{
		themeFlag = "rhs_flag_russia";
		themeType = "Russia";
		themeSupplier = "BLU";

		BLU_INF_SINGLE = 
		{
			"B_Soldier_F"
		};
		BLU_RIFLE =
		{
			["",""]
		};
		BLU_GL =
		{
			["",""]
		};
		BLU_MG =
		{
			["",""]
		};
		BLU_AT =
		{
			["",""]
		};
		BLU_AA =
		{
			["",""]
		};

		call themeSelect;
	};
};