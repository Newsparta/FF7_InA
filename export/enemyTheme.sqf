// ---------- LAND ----------

	// ---------- INFANTRY ----------

	INS_INF_SINGLE = [
		"I_C_Soldier_Para_1_F",
		"I_C_Soldier_Para_2_F",
		"I_C_Soldier_Para_3_F",
		"I_C_Soldier_Para_4_F",
		"I_C_Soldier_Para_5_F",
		"I_C_Soldier_Para_6_F",
		"I_C_Soldier_Para_7_F",
		"I_C_Soldier_Para_8_F",
		"I_C_Soldier_Bandit_1_F",
		"I_C_Soldier_Bandit_2_F",
		"I_C_Soldier_Bandit_3_F",
		"I_C_Soldier_Bandit_4_F",
		"I_C_Soldier_Bandit_5_F",
		"I_C_Soldier_Bandit_6_F",
		"I_C_Soldier_Bandit_7_F",
		"I_C_Soldier_Bandit_8_F"
	];
	
	INS_INF_HELIPILOT = [
		"I_C_Helipilot_F"
	];
	
	INS_INF_OFFICER = [
		"I_C_Soldier_Camo_F"
	];

	// ---------- STATICS ----------

	INS_STATIC_HMG_OPF = [
		"rhsgref_cdf_DSHKM"
	];
	INS_STATIC_HMG_BLU = [
		"RHS_M2StaticMG_WD"
	];
	
	INS_STATIC_AT_OPF = [
		"rhsgref_cdf_SPG9M",
		"rhs_Kornet_9M133_2_vmf"
	];
	INS_STATIC_AT_BLU = [
		"RHS_TOW_TriPod_WD"
	];

	INS_STATIC_MOR_OPF = [
		"RHS_M252_WD"
	];
	INS_STATIC_MOR_BLU = [
		"RHS_M252_WD"
	];
	
	INS_STATIC_AA_OPF = [
		"rhsgref_cdf_igla_AA_pod",
		"RHSgref_cdf_ZU23"
	];
	INS_STATIC_AA_BLU = [
		"RHS_Stinger_AA_pod_WD"
	];
	
	INS_STATIC_AAA_OPF = [
		"rhsgref_cdf_zsu234"
	];
	INS_STATIC_AAA_BLU = [
		"rhsgref_cdf_zsu234"
	];
	
	// ---------- CAR ----------

	INS_CAR_OPF = [
		"LOP_NAPA_Landrover_M2",
		"I_G_Offroad_01_armed_F"
	];
	INS_CAR_OPF_TEX = true;
	INS_CAR_OPF_ANI = true;
	INS_CAR_BLU = [
		"LOP_NAPA_Landrover_M2",
		"I_G_Offroad_01_armed_F"
	];
	INS_CAR_BLU_TEX = true;
	INS_CAR_BLU_ANI = true;

	// ---------- CAR UNARMED ----------

	INS_CARU_OPF = [
		"LOP_CDF_Offroad"
	];
	INS_CARU_OPF_TEX = ["LOP_CDF",1];
	INS_CARU_OPF_ANI = ["HideBumper1",0,"HideConstruction",0,"Proxy",0,"Destruct",0];
	INS_CARU_BLU = [
		"LOP_CDF_Offroad"
	];
	INS_CARU_BLU_TEX = ["LOP_CDF",1];
	INS_CARU_BLU_ANI = ["HideBumper1",0,"HideConstruction",0,"Proxy",0,"Destruct",0];

	// ---------- MRAP ----------

	INS_MRAP_OPF = [
		"rhsgref_BRDM2",
		"rhsgref_BRDM2_HQ"
	];
	INS_MRAP_OPF_TEX = true;
	INS_MRAP_OPF_ANI = true;
	INS_MRAP_BLU = [
		"rhsusf_m1025_w_m2"
	];
	INS_MRAP_BLU_TEX = ["Olive",1];
	INS_MRAP_BLU_ANI = ["hide_A2_Parts",1];
	
	// ---------- SPAAG ----------

	INS_SPAAG_OPF = [
		"rhsgref_cdf_ural_Zu23"
	];
	INS_SPAAG_OPF_TEX = true;
	INS_SPAAG_OPF_ANI = true;
	INS_SPAAG_BLU = [
		"rhsgref_cdf_ural_Zu23"
	];
	INS_SPAAG_BLU_TEX = true;
	INS_SPAAG_BLU_ANI = true;

	// ---------- APC ----------

	INS_APC_OPF = [
		"rhsgref_cdf_btr60",
		"rhsgref_cdf_btr70"
	];
	INS_APC_OPF_TEX = true;
	INS_APC_OPF_ANI = true;
	INS_APC_BLU = [
		"rhsusf_m113_usarmy"
	];
	INS_APC_BLU_TEX = ["Olive",1];
	INS_APC_BLU_ANI = ["IFF_Panels_Hide",1];

	// ---------- IFV ----------

	INS_IFV_OPF = [
		"rhsgref_cdf_bmp1",
		"rhsgref_cdf_bmp2"
	];
	INS_IFV_OPF_TEX = true;
	INS_IFV_OPF_ANI = ["wood_1_unhide",1,"cargoHandler1",0];
	INS_IFV_BLU = [
		"RHS_M2A2_wd"
	];
	INS_IFV_BLU_TEX = ["Olive",1];
	INS_IFV_BLU_ANI = ["IFF_Panels_Hide",1];

	// ---------- TANK ----------

	INS_TANK_OPF = [
		"rhsgref_cdf_t72ba_tv",
		"rhsgref_cdf_t72bb_tv",
		"rhsgref_cdf_t80bv_tv",
		"rhsgref_cdf_t80b_tv"
	];
	INS_TANK_OPF_TEX = true;
	INS_TANK_OPF_ANI = true;
	INS_TANK_BLU = [
		"rhsusf_m1a1aimwd_usarmy"
	];
	INS_TANK_BLU_TEX = ["Olive",1];
	INS_TANK_BLU_TEX = ["IFF_Panels_Hide",1,"Miles_Hide",1];

	// ---------- TRUCK ----------

	INS_TRUCK_OPF = [
		"rhsgref_cdf_ural_open"
	];
	INS_TRUCK_OPF_TEX = true;
	INS_TRUCK_OPF_ANI = true;
	INS_TRUCK_BLU = [
		"rhsgref_cdf_ural_open"
	];
	INS_TRUCK_BLU_TEX = true;
	INS_TRUCK_BLU_ANI = true;
	
// ---------- AIR ----------

	// ---------- HEAVY TRANSPORT HELICOPTER ----------
	
	INS_HEAVY_HELI_TR_OPF = [
		"rhsgref_cdf_reg_Mi17Sh"
	];
	INS_HEAVY_HELI_TR_OPF_TEX = true;
	INS_HEAVY_HELI_TR_OPF_ANI = ["LeftDoor",0,"hide_door_hatch",0,"AddCargoHook_COver",0];
	INS_HEAVY_HELI_TR_BLU = [
		"RHS_UH60M"
	];
	INS_HEAVY_HELI_TR_BLU_TEX = true;
	INS_HEAVY_HELI_TR_BLU_ANI = true;
	
	// ---------- MEDIUM TRANSPORT HELICOPTER ----------
	
	INS_MEDIUM_HELI_TR_OPF = [
		"B_Heli_Light_01_F"
	];
	INS_MEDIUM_HELI_TR_OPF_TEX = true;
	INS_MEDIUM_HELI_TR_OPF_ANI = true;
	INS_MEDIUM_HELI_TR_BLU = [
		"B_Heli_Light_01_F"
	];
	INS_MEDIUM_HELI_TR_BLU_TEX = true;
	INS_MEDIUM_HELI_TR_BLU_ANI = true;
	
	// ---------- LIGHT ATTACK HELICOPTER ----------
	
	INS_LIGHT_HELI_AH_OPF = [
		"B_Heli_Light_01_F"
	];
	INS_LIGHT_HELI_AH_OPF_TEX = true;
	INS_LIGHT_HELI_AH_OPF_ANI = true;
	INS_LIGHT_HELI_AH_BLU = [
		"B_Heli_Light_01_F"
	];
	INS_LIGHT_HELI_AH_BLU_TEX = true;
	INS_LIGHT_HELI_AH_BLU_ANI = true;
	
	// ---------- HEAVY ATTACK HELICOPTER ----------
	
	INS_HEAVY_HELI_AH_OPF = [
		"rhsgref_cdf_Mi24D"
	];
	INS_HEAVY_HELI_AH_OPF_TEX = true;
	INS_HEAVY_HELI_AH_OPF_ANI = true;
	INS_HEAVY_HELI_AH_BLU = [
		"RHS_AH64D_noradar"
	];
	INS_HEAVY_HELI_AH_BLU_TEX = ["Grey",1];
	INS_HEAVY_HELI_AH_BLU_ANI = true;
	
// ---------- SEA ----------

	// ---------- SMALL BOAT ----------
	
	INS_BOAT_OPF = [
		"I_C_Boat_Transport_02_F"
	];
	INS_BOAT_OPF_TEX = true;
	INS_BOAT_OPF_ANI = true;
	INS_BOAT_BLU = [
		"I_C_Boat_Transport_02_F"
	];
	INS_BOAT_BLU_TEX = true;
	INS_BOAT_BLU_ANI = true;
	
// ---------- Equipment ----------
	
	// ---------- Weapons ----------
	
	INS_RIFLE_OPF = 
	[
		["rhs_weap_akm","rhs_30Rnd_762x39mm"],
		["rhs_weap_akms","rhs_30Rnd_762x39mm"],
		["rhs_weap_ak74_2","rhs_30Rnd_545x39_AK"],
		["rhs_weap_ak74m","rhs_30Rnd_545x39_AK"],
		["rhs_weap_aks74_2","rhs_30Rnd_545x39_AK"],
		["rhs_weap_aks74u","rhs_30Rnd_545x39_AK"]
	];
	INS_RIFLE_BLU = 
	[
		["rhs_weap_m16a4_carryhandle","rhs_mag_30Rnd_556x45_Mk318_Stanag"],
		["rhs_weap_m4_carryhandle","rhs_mag_30Rnd_556x45_Mk318_Stanag"],
		["rhs_weap_m4a1_carryhandle","rhs_mag_30Rnd_556x45_Mk318_Stanag"]
	];
	
	INS_GL_OPF =
	[
		["rhs_weap_ak74_gp25","rhs_30Rnd_545x39_AK","rhs_VOG25"],
		["rhs_weap_akms_gp25","rhs_30Rnd_762x39mm","rhs_VOG25"],
		["rhs_weap_aks74_gp25","rhs_30Rnd_545x39_AK","rhs_VOG25"]
	];
	INS_GL_BLU =
	[
		["rhs_weap_m16a4_carryhandle_M203","rhs_mag_30Rnd_556x45_Mk318_Stanag","1Rnd_HE_Grenade_shell"],
		["rhs_weap_m4_m203","rhs_mag_30Rnd_556x45_Mk318_Stanag","1Rnd_HE_Grenade_shell"]
	];
	
	INS_MG_OPF =
	[
		["rhs_weap_pkm","rhs_100Rnd_762x54mmR"]
	];
	INS_MG_BLU =
	[
		["rhs_weap_m249","rhs_200rnd_556x45_M_SAW"]
	];
	
	INS_AT_OPF = 
	[
		["rhs_weap_rpg7","rhs_rpg7_PG7V_mag"]
	];
	INS_AT_BLU = 
	[
		["rhs_weap_smaw_green","rhs_mag_smaw_HEAA"]
	];
	
	INS_AA_OPF =
	[
		["rhs_weap_igla","rhs_mag_9k38_rocket"]
	];
	INS_AA_BLU =
	[
		["rhs_weap_fim92","rhs_fim92_mag"]
	];
	
	// ---------- Backpacks ----------
	
	INS_BACKPACKS =
	[
		"B_Kitbag_cbr",
		"B_Kitbag_rgr"
	];
	
// ---------- Buildings ----------
	
	INS_SANDBAG_LONG = "Land_BagFence_01_long_green_F";
	INS_SANDBAG_SHORT = "Land_BagFence_01_short_green_F";
	INS_SANDBAG_ROUND = "Land_BagFence_01_round_green_F";
	
	INS_CAMONET = "CamoNet_ghex_open_F";