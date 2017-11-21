//
// All magazines to be bought/sold/saved etc should be listed here.
// Think of this as a (map agnostic) "Allowed" list. Factions still need to be specified.
//
// ADVISORY: Prefix all magazine class names with mag_ (well, can be any 4 characters [a-zA-Z_]
//     Some magazine classes declared with starting digit, we cannot declare class names that 
//     start with a number. Only required if interacting directly with this system.

class InA_Magazines
{
	// 5.45mm

	class mag_rhs_30Rnd_545x39_7N10_AK
	{
		cost = 0;
		name = "[5.45mm] 30Rnd Magazine";
		type = "magazine";
	};
	class mag_rhs_30Rnd_545x39_AK_green
	{
		cost = 0;
		name = "[5.45mm] 30Rnd Tracer";
		type = "magazine";
	};

	// 5.56mm

	class mag_30Rnd_556x45_Stanag
	{
		cost = 0;
		name = "[5.56mm] 30Rnd Magazine";
		type = "magazine";
	};
	class mag_ACE_30Rnd_556x45_Stanag_M995_AP_mag
<<<<<<< HEAD
	{
		cost = 0.5;
		name = "[5.56mm] EPR 30Rnd Magazine";
		type = "magazine";
	};
	class mag_ACE_30Rnd_556x45_Stanag_Mk262_mag
	{
		cost = 0.55;
		name = "[5.56mm] SPR 30Rnd Magazine";
		type = "magazine";
	};
	class mag_ACE_30Rnd_556x45_Stanag_Mk318_mag
	{
		cost = 0.6;
		name = "[5.56mm] SOST 30Rnd Magazine";
		type = "magazine";
	};
	class mag_30Rnd_556x45_Stanag_Tracer_Red
	{
		cost = 0;
		name = "[5.56mm] 30Rnd Tracer";
		type = "magazine";
	};
	class mag_30Rnd_556x45_Stanag_Tracer_Yellow
	{
		cost = 0;
		name = "[5.56mm] 30Rnd Tracer";
		type = "magazine";
	};
	class mag_hlc_30rnd_556x45_EPR_G36
	{
		cost = 0;
		name = "[5.56mm] 30Rnd (G36)";
=======
	{
		cost = 1;
		name = "[5.56mm] EPR 30Rnd Magazine";
		type = "magazine";
	};
	class mag_ACE_30Rnd_556x45_Stanag_Mk262_mag
	{
		cost = 1;
		name = "[5.56mm] SPR 30Rnd Magazine";
		type = "magazine";
	};
	class mag_ACE_30Rnd_556x45_Stanag_Mk318_mag
	{
		cost = 1.25;
		name = "[5.56mm] SOST 30Rnd Magazine";
>>>>>>> 4b8cf2404fdd63f995dfcbb7da756095d27ac7c1
		type = "magazine";
	};
	class mag_hlc_30rnd_556x45_SOST_G36
	{
<<<<<<< HEAD
		cost = 0.5;
		name = "[5.56mm] SOST 30Rnd (G36)";
=======
		cost = 0;
		name = "[5.56mm] 30Rnd Tracer";
>>>>>>> 4b8cf2404fdd63f995dfcbb7da756095d27ac7c1
		type = "magazine";
	};
	class mag_hlc_30rnd_556x45_Tracers_G36
	{
		cost = 0;
<<<<<<< HEAD
		name = "[5.56mm] 30Rnd Tracer (G36)";
		type = "magazine";
	};
	class mag_rhs_200rnd_556x45_M_SAW
	{
		cost = 2;
		name = "[5.56mm] 200Rnd Belt";
		type = "magazine";
	};
	class mag_rhsusf_100Rnd_556x45_soft_pouch
	{
		cost = 1;
		name = "[5.56mm] 100Rnd Belt";
		type = "magazine";
	};

	// 6.5mm and 6.8mm

	class mag_hlc_30rnd_68x43_FMJ
	{
		cost = 1;
		name = "[6.8mm] 30Rnd Magazine";
		type = "magazine";
	};
	class mag_hlc_30rnd_68x43_Tracer
	{
		cost = 1;
		name = "[6.8mm] 30Rnd Tracer";
		type = "magazine";
	};
	class mag_200Rnd_65x39_cased_Box
	{
		cost = 2;
		name = "[6.5mm] 200Rnd Belt";
		type = "magazine";
	};
	class mag_200Rnd_65x39_cased_Box_Tracer
	{
		cost = 2;
		name = "[6.5mm] 200Rnd Tracer";
		type = "magazine";
	};

	// 7.62mm

	class mag_rhs_10Rnd_762x54mmR_7N1
	{
		cost = 0.5;
		name = "[7.62mm] 10Rnd Magazine";
		type = "magazine";
	};
	class mag_rhsusf_5Rnd_762x51_m118_special_Mag
	{
		cost = 0.25;
		name = "[7.62mm] 5Rnd Magazine";
		type = "magazine";
	};
	class mag_rhsusf_10Rnd_762x51_m118_special_Mag
	{
		cost = 0.5;
		name = "[7.62mm] 10Rnd Magazine";
		type = "magazine";
	};
	class mag_20Rnd_762x51_Mag
	{
		cost = 1;
		name = "[7.62mm] 20Rnd Magazine";
		type = "magazine";
	};
=======
		name = "[5.56mm] 30Rnd Tracer";
		type = "magazine";
	};
	class mag_rhs_200rnd_556x45_M_SAW
	{
		cost = 4;
		name = "[5.56mm] 200Rnd Belt";
		type = "magazine";
	};
	class mag_rhsusf_100Rnd_556x45_soft_pouch
	{
		cost = 2;
		name = "[5.56mm] 100Rnd Belt";
		type = "magazine";
	};

	// 6.5mm and 6.8mm

	class mag_hlc_30rnd_68x43_FMJ
	{
		cost = 1;
		name = "[6.8mm] 30Rnd Magazine";
		type = "magazine";
	};
	class mag_hlc_30rnd_68x43_Tracer
	{
		cost = 1;
		name = "[6.8mm] 30Rnd Tracer";
		type = "magazine";
	};
	class mag_200Rnd_65x39_cased_Box
	{
		cost = 5;
		name = "[6.5mm] 200Rnd Belt";
		type = "magazine";
	};
	class mag_200Rnd_65x39_cased_Box_Tracer
	{
		cost = 5;
		name = "[6.5mm] 200Rnd Tracer";
		type = "magazine";
	};

	// 7.62mm

	class mag_rhs_10Rnd_762x54mmR_7N1
	{
		cost = 0.5;
		name = "[7.62mm] 10Rnd Magazine";
		type = "magazine";
	};
	class mag_rhsusf_5Rnd_762x51_m118_special_Mag
	{
		cost = 0.25;
		name = "[7.62mm] 5Rnd Magazine";
		type = "magazine";
	};
	class mag_rhsusf_10Rnd_762x51_m118_special_Mag
	{
		cost = 0.5;
		name = "[7.62mm] 10Rnd Magazine";
		type = "magazine";
	};
	class mag_20Rnd_762x51_Mag
	{
		cost = 1;
		name = "[7.62mm] 20Rnd Magazine";
		type = "magazine";
	};
>>>>>>> 4b8cf2404fdd63f995dfcbb7da756095d27ac7c1
	class mag_ACE_20Rnd_762x51_Mk319_Mod_0_Mag
	{
		cost = 1.5;
		name = "[7.62mm] SOST 20Rnd Magazine";
		type = "magazine";
	};
	class mag_ACE_20Rnd_762x51_M993_AP_Mag
	{
		cost = 1.5;
		name = "[7.62mm] AP 20Rnd Magazine";
		type = "magazine";
	};
<<<<<<< HEAD
	class mag_hlc_20rnd_762x51_b_G3
	{
		cost = 1;
		name = "[7.62mm] EPR 20Rnd (PSG)";
		type = "magazine";
	};
	class mag_hlc_20rnd_762x51_barrier_G3
	{
		cost = 1.5;
		name = "[7.62mm] SOST 20Rnd (PSG)";
		type = "magazine";
	};
	class mag_rhsusf_100Rnd_762x51_m80a1epr
	{
		cost = 5;
		name = "[7.62mm] 100Rnd Belt";
		type = "magazine";
	};
	class mag_rhsusf_50Rnd_762x51_m80a1epr
	{
		cost = 2.5;
		name = "[7.62mm] 50Rnd Belt";
		type = "magazine";
	};
	class mag_rhs_100Rnd_762x54mmR
	{
		cost = 5;
		name = "[7.62mm] 100Rnd Belt";
		type = "magazine";
	};
	class mag_rhs_100Rnd_762x54mmR_green
	{
		cost = 5;
		name = "[7.62mm] 100Rnd Tracer";
		type = "magazine";
	};

	// Misc special ammo

	class mag_130Rnd_338_Mag
	{
		cost = 6.5;
		name = "[.338] 130Rnd Belt";
		type = "magazine";
	};
	class mag_150Rnd_93x64_Mag
	{
		cost = 12;
		name = "[9.3mm] 150Rnd Belt";
		type = "magazine";
	};
=======
	class mag_rhsusf_100Rnd_762x51_m80a1epr
	{
		cost = 4;
		name = "[7.62mm] 100Rnd Belt";
		type = "magazine";
	};
	class mag_rhsusf_50Rnd_762x51_m80a1epr
	{
		cost = 2;
		name = "[7.62mm] 50Rnd Belt";
		type = "magazine";
	};
	class mag_rhs_100Rnd_762x54mmR
	{
		cost = 4;
		name = "[7.62mm] 100Rnd Belt";
		type = "magazine";
	};
	class mag_rhs_100Rnd_762x54mmR_green
	{
		cost = 4;
		name = "[7.62mm] 100Rnd Tracer";
		type = "magazine";
	};

	// Misc special ammo

	class mag_130Rnd_338_Mag
	{
		cost = 6.5;
		name = "[.338] 130Rnd Belt";
		type = "magazine";
	};
	class mag_150Rnd_93x64_Mag
	{
		cost = 12;
		name = "[9.3mm] 150Rnd Belt";
		type = "magazine";
	};
>>>>>>> 4b8cf2404fdd63f995dfcbb7da756095d27ac7c1
	class mag_16Rnd_9x21_Mag
	{
		cost = 0;
		name = "[9mm] 16Rnd Magazine";
		type = "magazine";
	};
	class mag_rhs_5Rnd_338lapua_t5000
	{
		cost = 0.5;
		name = "[.338] 5Rnd Magazine";
		type = "magazine";
	};
	class mag_rhsusf_5Rnd_300winmag_xm2010
	{
		cost = 0.25;
		name = "[.300] 5Rnd Magazine";
		type = "magazine";
	};
	
	class mag_rhsusf_mag_10Rnd_STD_50BMG_M33
	{
		cost = 5;
		name = "[.50BMG] 10Rnd Magazine";
		type = "magazine";
	};
	class mag_rhsusf_mag_15Rnd_9x19_JHP
	{
		cost = 0;
		name = "[9mm] 15Rnd Magazine";
		type = "magazine";
	};
	class mag_rhs_mag_9x18_8_57N181S
	{
		cost = 0;
		name = "[9mm] 8Rnd Magazine";
		type = "magazine";
	};
	
	// Grenades

	class mag_3Rnd_HE_Grenade_shell
	{
		cost = 1;
		name = "[40mm] 3Rnd HE";
		type = "grenade";
	};
	class mag_1Rnd_HE_Grenade_shell
	{
		cost = 1;
		name = "[40mm] HE";
		type = "grenade";
	};
	class mag_1Rnd_Smoke_Grenade_shell
	{
		cost = 0;
		name = "[40mm] Smoke";
		type = "grenade";
	};
	class mag_ACE_HuntIR_M203
<<<<<<< HEAD
	{
		cost = 1;
		name = "[40mm] HuntIR";
		type = "grenade";
	};
	class mag_HandGrenade
	{
		cost = 0;
=======
	{
		cost = 1;
		name = "[40mm] HuntIR";
		type = "grenade";
	};
	class mag_HandGrenade
	{
		cost = 1;
>>>>>>> 4b8cf2404fdd63f995dfcbb7da756095d27ac7c1
		name = "M67 Frag Grenade";
		type = "grenade";
	};
	class mag_MiniGrenade
	{
<<<<<<< HEAD
		cost = 0;
=======
		cost = 0.5;
>>>>>>> 4b8cf2404fdd63f995dfcbb7da756095d27ac7c1
		name = "RGN Grenade";
		type = "grenade";
	};
	class mag_ACE_M14
	{
		cost = 1;
		name = "M14 Incendiary Grenade";
		type = "grenade";
	};
	class mag_rhs_mag_rdg2_black
	{
		cost = 0;
		name = "Smoke Grenade (Black)";
		type = "grenade";
	};
	class mag_rhs_mag_rdg2_white
	{
		cost = 0;
		name = "Smoke Grenade (White)";
		type = "grenade";
	};
	class mag_rhs_mag_rgn
	{
<<<<<<< HEAD
		cost = 0;
=======
		cost = 0.5;
>>>>>>> 4b8cf2404fdd63f995dfcbb7da756095d27ac7c1
		name = "RGN Grenade";
		type = "grenade";
	};
	class mag_rhs_mag_rgo
	{
<<<<<<< HEAD
		cost = 0;
=======
		cost = 0.5;
>>>>>>> 4b8cf2404fdd63f995dfcbb7da756095d27ac7c1
		name = "RGO Grenade";
		type = "grenade";
	};
	class mag_rhs_VG40MD_White
	{
		cost = 0;
		name = "[40mm] VG-40 MD Smoke";
		type = "grenade";
	};
	class mag_rhs_VG40OP_white
	{
		cost = 0;
		name = "[40mm] VG-40 OP Flare";
		type = "grenade";
	};
	class mag_rhs_VG40TB
	{
		cost = 4;
		name = "[40mm] VG-40 TB";
		type = "grenade";
	};
	class mag_rhs_VOG25
	{
		cost = 1;
		name = "[40mm] VOG-25 HE";
		type = "grenade";
	};
	class mag_SmokeShell
	{
		cost = 0;
		name = "Smoke Grenade (White)";
		type = "grenade";
	};
	class mag_SmokeShellBlue
	{
		cost = 0;
		name = "Smoke Grenade (Blue)";
		type = "grenade";
	};
	class mag_SmokeShellGreen
	{
		cost = 0;
		name = "Smoke Grenade (Green)";
		type = "grenade";
	};
	class mag_UGL_FlareWhite_F
	{
		cost = 0;
		name = "[40mm] Flare";
		type = "grenade";
	};

	// Explosives

	class mag_APERSMine_Range_Mag
	{
		cost = 5;
		name = "VS-50 AP Mine";
		type = "explosive";
	};
	class mag_ATMine_Range_Mag
	{
		cost = 10;
		name = "M15 AT Mine";
		type = "explosive";
	};
	class mag_ClaymoreDirectionalMine_Remote_Mag
	{
		cost = 5;
		name = "M18A1 Claymore Mine";
		type = "explosive";
	};
	class mag_DemoCharge_Remote_Mag
	{
<<<<<<< HEAD
		cost = 0.1;
=======
		cost = 0.25;
>>>>>>> 4b8cf2404fdd63f995dfcbb7da756095d27ac7c1
		name = "M112 Demolition Block";
		type = "explosive";
	};
	class mag_SLAMDirectionalMine_Wire_Mag
	{
		cost = 5;
		name = "M4A1 Slam Mine";
		type = "explosive";
	};
	
	// Rockets
	
	class mag_rhs_fgm148_magazine_AT
	{
		cost = 10;
		name = "Javelin AT";
		type = "rocket";
	};
	class mag_rhs_fim92_mag
	{
		cost = 10;
		name = "Stinger AA";
		type = "rocket";
	};
	class mag_rhs_mag_9k38_rocket
	{
		cost = 10;
		name = "9k38 Igla";
		type = "rocket";
	};
	class mag_rhs_rpg7_OG7V_mag
	{
		cost = 3;
		name = "OG-7V Rocket";
		type = "rocket";
	};
	class mag_rhs_rpg7_PG7V_mag
	{
		cost = 3;
		name = "PG-7VL Rocket";
		type = "rocket";
	};
	class mag_rhs_rpg7_PG7VR_mag
	{
		cost = 5;
		name = "PG-7VR Rocket";
		type = "rocket";
	};
	class mag_rhs_rpg7_TBG7V_mag
	{
		cost = 5;
		name = "TBG-7V Rocket";
		type = "rocket";
	};
	class mag_tf47_m3maaws_HE
	{
		cost = 5;
		name = "FFV441 HE";
		type = "rocket";
	};
	class mag_tf47_m3maaws_HEAT
	{
		cost = 5;
		name = "FFV751 HEAT";
		type = "rocket";
	};
	class mag_tf47_m3maaws_HEDP
	{
		cost = 5;
		name = "FFV502 HEDP";
		type = "rocket";
	};
	class mag_tf47_m3maaws_SMOKE
	{
		cost = 0;
		name = "FFV469 SMOKE";
		type = "rocket";
	};
	class mag_Titan_AA
	{
		cost = 10;
		name = "Titan AA";
		type = "rocket";
	};
	class mag_Titan_AP
	{
		cost = 10;
		name = "Titan AP";
		type = "rocket";
	};
	class mag_Titan_AT
	{
		cost = 10;
		name = "Titan AT";
		type = "rocket";
	};
};