class blufor: InA_FactionBase
{
	sidename = "blufor";

    class gear: gear
    {
		// Default weapons for this side
		class weapons: weapons 
		{
			class rhs_M252_Bipod_Bag {};
			class rhs_M252_Gun_Bag {};
			class RHS_M2_Gun_Bag {};
			class RHS_M2_Tripod_Bag {};
			class RHS_Mk19_Gun_Bag {};
			class RHS_Mk19_Tripod_Bag {};
			class rhs_Tow_Gun_Bag {};
			class rhs_TOW_Tripod_Bag {};
			class rhs_weap_m4a1_m320 {};
			class rhs_weap_M107_w {};
			class hlc_rifle_m14sopmod {};
			class srifle_DMR_03_F {};
			class LMG_Mk200_F {};
			class rhs_weap_m249_pip_S {};
			class rhs_weap_M320 {};
			class rhs_weap_m72a7 {};
			class tf47_at4_heat {};
			class tf47_at4_HEDP {};
			class tf47_at4_HP {};
			class tf47_m3maaws {};
		};

		// Default magazines for this side
		class magazines: magazines 
		{
			class mag_1Rnd_HE_Grenade_shell {};
			class mag_1Rnd_Smoke_Grenade_shell {};
			class mag_3Rnd_HE_Grenade_shell {};
			class mag_ACE_HuntIR_M203 {};
			class mag_ACE_M14 {};
			class mag_HandGrenade {};
			class mag_MiniGrenade {};
			class mag_30Rnd_556x45_Stanag {};
			class mag_ACE_30Rnd_556x45_Stanag_M995_AP_mag {};
			class mag_ACE_30Rnd_556x45_Stanag_Mk262_mag {};
			class mag_ACE_30Rnd_556x45_Stanag_Mk318_mag {};
			class mag_30Rnd_556x45_Stanag_Tracer_Red {};
			class mag_rhs_200rnd_556x45_M_SAW {};
			class mag_rhsusf_100Rnd_556x45_soft_pouch {};
			class mag_200Rnd_65x39_cased_Box {};
			class mag_200Rnd_65x39_cased_Box_Tracer {};
			class mag_20Rnd_762x51_Mag {};
			class mag_ACE_20Rnd_762x51_Mk319_Mod_0_Mag {};
			class mag_ACE_20Rnd_762x51_M993_AP_Mag {};
			class mag_rhsusf_mag_10Rnd_STD_50BMG_M33 {};
			class mag_SmokeShell {};
			class mag_SmokeShellBlue {};
			class mag_SmokeShellGreen {};
			class mag_tf47_m3maaws_HE {};
			class mag_tf47_m3maaws_HEAT {};
			class mag_tf47_m3maaws_HEDP {};
			class mag_tf47_m3maaws_SMOKE {};
			class mag_UGL_FlareWhite_F {};
		};
		
		// Defaut misc items for this side
		class miscitems: miscitems 
		{
			class ACE_Clacker {};
			class optic_Aco {};
			class optic_ERCO_blk_F {};
			class optic_Hamr {};
			class RH_eotech553 {};
			class RH_eotech553mag {};
			class RH_ta31rmr {};
			class rhsusf_acc_compm4 {};
			class rhsusf_acc_ELCAN {};
			class rhsusf_acc_grip2 {};
			class rhsusf_acc_grip3 {};
			class rhsusf_acc_nt4_black {};
		};
	};
	
    class clothes: clothes
    {
        // Helmet item classes must be defined in helmets.hpp
        // before using them here.
        class helmets: helmets
        {
        };

        // Vest item classes must be defined in vests.hpp
        // before using them here.
        class vests: vests
        {
        };

        // Uniform item classes must be defined in uniforms.hpp
        // before using them here.
        class uniforms: uniforms
        {
        };
    };
    
    class loadout: loadout
	{
        // Weaponry
        class primary: primary {};
        class secondary: secondary {};
        class launcher: launcher {};

        // Containers
        class uniform: uniform {};
        class vest: vest {};
        class backpack: backpack {};
	};

    class vehicles: vehicles
	{
		// Vehicle classes must be defined in vehicles/air.hpp
		// before using them here.
		class air: air {};

		// Vehicle classes must be defined in vehicles/water.hpp
		// before using them here.
		class water: water {};

		// Vehicle classes must be defined in vehicles/land.hpp
		// before using them here.
		class land: land
		{
			class B_Quadbike_01_F: B_Quadbike_01_F
			{
				paint = '["Blufor",1]';
			};
			class B_T_LSV_01_unarmed_F
			{
				paint = '["Olive",1]';
			};
		};
	};
};