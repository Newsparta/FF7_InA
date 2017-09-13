private ["_mags"];

_magType = _this select 0;
_magCount = _this select 1;

switch (_magType) do {

	// ---------- B_RHS ----------

	case "rhs_mag_100rnd_127x99_mag_Tracer_Red":
	{
		munitionCost = (munitionCost - (10 * (_magCount/100)));
	};
	
	case "RHS_48Rnd_40mm_MK19":
	{
		munitionCost = (munitionCost - (30 * (_magCount/48)));
	};
	
	case "rhs_mag_1100Rnd_762x51_M240":
	{
		munitionCost = (munitionCost - (50 * (_magCount/1100)));
	};
	
	case "rhs_mag_230Rnd_25mm_M242_HEI":
	{
		munitionCost = (munitionCost - (50 * (_magCount/230)));
	};
	
	case "rhs_mag_70Rnd_25mm_M242_APFSDS":
	{
		munitionCost = (munitionCost - (50 * (_magCount/70)));
	};
	
	case "rhs_mag_2Rnd_TOW2A":
	{
		munitionCost = (munitionCost - (25 * (_magCount/2)));
	};
	
	case "rhs_mag_2Rnd_TOW2BB":
	{
		munitionCost = (munitionCost - (25 * (_magCount/2)));
	};
	
	case "rhs_mag_762x51_M240_1200":
	{
		munitionCost = (munitionCost - (20 * (_magCount/1200)));
	};
	
	case "rhs_mag_M829A3":
	{
		munitionCost = (munitionCost - (75 * (_magCount/28)));
	};
	
	case "rhs_mag_M830A1":
	{
		munitionCost = (munitionCost - (25 * (_magCount/8)));
	};
	
	case "rhs_pod_hellfire_4":
	{
		munitionCost = (munitionCost - (50 * (_magCount/4)));
	};
	
	case "rhs_pod_FFAR_19":
	{
		munitionCost = (munitionCost - (50 * (_magCount/19)));
	};
	
	case "rhs_mag_30x113mm_M789_HEDP_1200":
	{
		munitionCost = (munitionCost - (200 * (_magCount/1200)));
	};
	
	case "5000Rnd_762x51_Belt":
	{
		munitionCost = (munitionCost - (100 * (_magCount/5000)));
	};
	
	// ---------- B_NATO ----------
	
	case "100Rnd_127x99_mag_Tracer_Red":
	{
		munitionCost = (munitionCost - (10 * (_magCount/100)));
	};
	
	case "130Rnd_338_Mag":
	{
		munitionCost = (munitionCost - (5 * (_magCount/130)));
	};
	
	case "200Rnd_127x99_mag_Tracer_Red":
	{
		munitionCost = (munitionCost - (25 * (_magCount/200)));
	};
	
	case "96Rnd_40mm_G_Belt":
	{
		munitionCost = (munitionCost - (150 * (_magCount/96)));
	};
	
	case "60Rnd_40mm_GPR_Tracer_Red_shells":
	{
		munitionCost = (munitionCost - (50 * (_magCount/60)));
	};
	
	case "40Rnd_40mm_APFSDS_Tracer_Red_shells":
	{
		munitionCost = (munitionCost - (50 * (_magCount/40)));
	};
	
	case "2000Rnd_762x51_Belt_Red":
	{
		munitionCost = (munitionCost - (100 * (_magCount/2000)));
	};
	
	case "500Rnd_127x99_mag_Tracer_Red":
	{
		munitionCost = (munitionCost - (50 * (_magCount/500)));
	};
	
	case "40Rnd_105mm_APFSDS_T_Red":
	{
		munitionCost = (munitionCost - (100 * (_magCount/40)));
	};
	
	case "20Rnd_105mm_HEAT_MP_T_Red":
	{
		munitionCost = (munitionCost - (50 * (_magCount/20)));
	};
	
	case "1000Rnd_20mm_shells":
	{
		munitionCost = (munitionCost - (150 * (_magCount/1000)));
	};
	
	case "PylonMissile_1Rnd_AAA_missiles":
	{
		munitionCost = (munitionCost - 10);
	};
	
	case "PylonRack_12Rnd_PG_missiles":
	{
		munitionCost = (munitionCost - (75 * (_magCount/12)));
	};
	
	case "5000Rnd_762x51_Belt":
	{
		munitionCost = (munitionCost - (100 * (_magCount/5000)));
	};
	
	case "PylonRack_12Rnd_missiles":
	{
		munitionCost = (munitionCost - (50 * (_magCount/12)));
	};
	
	// ---------- I_AAF ----------
	
	case "200Rnd_127x99_mag_Tracer_Yellow":
	{
		munitionCost = (munitionCost - (25 * (_magCount/200)));
	};
	
	case "140Rnd_30mm_MP_shells_Tracer_Yellow":
	{
		munitionCost = (munitionCost - (175 * (_magCount/140)));
	};
	
	case "60Rnd_30mm_APFSDS_shells_Tracer_Yellow":
	{
		munitionCost = (munitionCost - (75 * (_magCount/60)));
	};
	
	case "2Rnd_GAT_missiles":
	{
		munitionCost = (munitionCost - (40 * (_magCount/2)));
	};
	
	case "1000Rnd_762x51_Belt_Yellow":
	{
		munitionCost = (munitionCost - (50 * (_magCount/1000)));
	};
	
	case "2000Rnd_762x51_Belt_Yellow":
	{
		munitionCost = (munitionCost - (100 * (_magCount/2000)));
	};
	
	case "500Rnd_127x99_mag_Tracer_Yellow":
	{
		munitionCost = (munitionCost - (50 * (_magCount/500)));
	};
	
	case "28Rnd_120mm_APFSDS_shells_Tracer_Yellow":
	{
		munitionCost = (munitionCost - (150 * (_magCount/28)));
	};
	
	case "14Rnd_120mm_HE_shells_Tracer_Yellow":
	{
		munitionCost = (munitionCost - (50 * (_magCount/14)));
	};
	
	case "5000Rnd_762x51_Yellow_Belt":
	{
		munitionCost = (munitionCost - (100 * (_magCount/5000)));
	};
	
	// ---------- O_RHS ----------
	
	case "rhs_mag_762x54mm_100":
	{
		munitionCost = (munitionCost - (5 * (_magCount/100)));
	};
	
	case "RHS_mag_VOG30_30":
	{
		munitionCost = (munitionCost - (50 * (_magCount/30)));
	};
	
	case "rhs_mag_145x115mm_50":
	{
		munitionCost = (munitionCost - (5 * (_magCount/50)));
	};
	
	case "rhs_mag_762x54mm_250":
	{
		munitionCost = (munitionCost - (10 * (_magCount/250)));
	};
	
	case "rhs_mag_3uof8_340":
	{
		munitionCost = (munitionCost - (150 * (_magCount/340)));
	};
	
	case "rhs_mag_3ubr11_160":
	{
		munitionCost = (munitionCost - (50 * (_magCount/160)));
	};
	
	case "rhs_mag_9m113M":
	{
		munitionCost = (munitionCost - 10);
	};
	
	case "rhs_mag_762x54mm_2000":
	{
		munitionCost = (munitionCost - (100 * (_magCount/2000)));
	};
	
	case "rhs_mag_3UOF17_22":
	{
		munitionCost = (munitionCost - (50 * (_magCount/22)));
	};
	
	case "rhs_mag_3uof8_305":
	{
		munitionCost = (munitionCost - (130 * (_magCount/305)));
	};
	
	case "rhs_mag_3ubr11_195":
	{
		munitionCost = (munitionCost - (60 * (_magCount/195)));
	};
	
	case "rhs_mag_3bm42_7":
	{
		munitionCost = (munitionCost - (25 * (_magCount/7)));
	};
	
	case "rhs_mag_3bk18m_6":
	{
		munitionCost = (munitionCost - (25 * (_magCount/6)));
	};
	
	case "rhs_mag_3of26_5":
	{
		munitionCost = (munitionCost - (25 * (_magCount/5)));
	};
	
	case "rhs_mag_9m119_4":
	{
		munitionCost = (munitionCost - (25 * (_magCount/4)));
	};
	
	case "rhs_mag_3bm46_8":
	{
		munitionCost = (munitionCost - (25 * (_magCount/8)));
	};
	
	case "rhs_mag_3bk31_3":
	{
		munitionCost = (munitionCost - (25 * (_magCount/3)));
	};
	
	case "rhs_mag_3of26_7":
	{
		munitionCost = (munitionCost - (25 * (_magCount/7)));
	};
	
	case "rhs_mag_3bm42_7":
	{
		munitionCost = (munitionCost - (25 * (_magCount/7)));
	};
	
	case "rhs_mag_3bk18m_6":
	{
		munitionCost = (munitionCost - (25 * (_magCount/6)));
	};
	
	case "rhs_mag_b8v20a_pod":
	{
		munitionCost = (munitionCost - 50);
	};
	
	case "rhs_mag_3uor6_230":
	{
		munitionCost = (munitionCost - (50 * (_magCount/230)));
	};
	
	case "rhs_mag_3ubr8_230":
	{
		munitionCost = (munitionCost - (50 * (_magCount/230)));
	};
	
	case "rhs_mag_vikhr_12":
	{
		munitionCost = (munitionCost - (100 * (_magCount/12)));
	};
	
	case "rhs_mag_shturm_tube":
	{
		munitionCost = (munitionCost - 25);
	};
	
	case "rhs_mag_9k114":
	{
		munitionCost = (munitionCost - 50);
	};
	
	case "rhs_mag_b8v20a_pod":
	{
		munitionCost = (munitionCost - 50);
	};
	
	case "rhs_mag_s8_40":
	{
		munitionCost = (munitionCost - (50 * (_magCount/40)));
	};
	
	case "rhs_mag_ataka_pylon_8":
	{
		munitionCost = (munitionCost - (25 * (_magCount/8)));
	};
	
	case "rhs_mag_9M120m_16":
	{
		munitionCost = (munitionCost - (50 * (_magCount/16)));
	};
	
	case "rhs_mag_3ubr11_125":
	{
		munitionCost = (munitionCost - (40 * (_magCount/125)));
	};
	
	case "rhs_mag_3uof8_125":
	{
		munitionCost = (munitionCost - (40 * (_magCount/125)));
	};
};