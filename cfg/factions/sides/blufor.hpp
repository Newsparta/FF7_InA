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
			class rhs_weap_M107_w {};
			class rhs_weap_m14ebrri {};
			class rhs_weap_m249_pip_S {};
			class rhs_weap_m4a1_m320 {};
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
			class mag_30Rnd_556x45_Stanag {};
			class mag_30Rnd_556x45_Stanag_Tracer_Red {};
			class mag_3Rnd_HE_Grenade_shell {};
			class mag_ACE_HuntIR_M203 {};
			class mag_ACE_M14 {};
			class mag_HandGrenade {};
			class mag_MiniGrenade {};
			class mag_rhs_200rnd_556x45_M_SAW {};
			class mag_rhsusf_100Rnd_556x45_soft_pouch {};
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
			class optic_ACO_grn {};
			class optic_Arco_blk_F {};
			class optic_MRCO {};
			class rhs_acc_1p63 {};
			class rhs_acc_dtk4short {};
			class rhs_acc_grip_ffg2 {};
			class rhs_acc_rakursPM {};
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