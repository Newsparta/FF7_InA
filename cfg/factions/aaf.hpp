class AAF: blufor
{
    name = "Altis Armed Forces";

    class gear: gear
    {
        // Item classes must be defined in magazines.hpp
        // before using them here.
		class magazines: magazines 
		{
			class mag_16Rnd_9x21_Mag {};
<<<<<<< HEAD
            class mag_hlc_20rnd_762x51_b_G3 {};
            class mag_hlc_20rnd_762x51_barrier_G3 {};
			class mag_hlc_30rnd_556x45_EPR_G36 {};
			class mag_hlc_30rnd_556x45_SOST_G36 {};
            class mag_hlc_30rnd_556x45_Tracers_G36 {};
=======
			class mag_1Rnd_HE_Grenade_shell {};
			class mag_1Rnd_Smoke_Grenade_shell {};
			class mag_200Rnd_65x39_cased_Box {};
			class mag_200Rnd_65x39_cased_Box_Tracer {};
			class mag_20Rnd_762x51_Mag {};
			class mag_ACE_20Rnd_762x51_Mk319_Mod_0_Mag {};
			class mag_ACE_20Rnd_762x51_M993_AP_Mag {};
			class mag_30Rnd_556x45_Stanag {};
			class mag_ACE_30Rnd_556x45_Stanag_M995_AP_mag {};
			class mag_ACE_30Rnd_556x45_Stanag_Mk262_mag {};
			class mag_ACE_30Rnd_556x45_Stanag_Mk318_mag {};
            class mag_30Rnd_556x45_Stanag_Tracer_Yellow {};
            class mag_rhs_200rnd_556x45_M_SAW {};
			class mag_rhsusf_100Rnd_556x45_soft_pouch {};
			class mag_3Rnd_HE_Grenade_shell {};
			class mag_ACE_HuntIR_M203 {};
			class mag_ACE_M14 {};
			class mag_HandGrenade {};
			class mag_MiniGrenade {};
			class mag_rhsusf_mag_10Rnd_STD_50BMG_M33 {};
			class mag_SmokeShell {};
			class mag_SmokeShellBlue {};
			class mag_SmokeShellGreen {};
			class mag_Titan_AA {};
			class mag_Titan_AP {};
			class mag_Titan_AT {};
			class mag_UGL_FlareWhite_F {};
>>>>>>> 4b8cf2404fdd63f995dfcbb7da756095d27ac7c1
		};

        // Weapon classes must be defined in weapons.hpp
        // before using them here.
		class weapons: weapons 
		{
			class hgun_P07_F {};
<<<<<<< HEAD
            class hlc_rifle_G36CV {};
            class hlc_rifle_G36KV {};
            class hlc_rifle_G36V {};
            class hlc_rifle_G36VAG36 {};
            class hlc_lmg_mk48mod1 {};
            class rhs_weap_m240B_CAP {};
            class hlc_rifle_PSG1A1_RIS {};
=======
            class rhs_weap_m16a4_pmag {};
            class rhs_weap_m4a1 {};
            class rhs_weap_mk18 {};
            class rhs_weap_mk18_m320 {};
            class hlc_lmg_mk48mod1 {};
            class rhs_weap_m240B_CAP {};
            class rhs_weap_M320 {};
            class rhs_weap_XM2010_sa {};
>>>>>>> 4b8cf2404fdd63f995dfcbb7da756095d27ac7c1
            class rhs_weap_fgm148 {};
            class rhs_weap_fim92 {};
		};

        // Misc item classes must be defined in misc.hpp
        // before using them here.
        class miscitems: miscitems {};
    };

    class clothes: clothes
    {
        // Helmet item classes must be defined in helmets.hpp
        // before using them here.
        class helmets: helmets
        {
            class H_HelmetIA {};
            class H_MilCap_dgtl {};
        };

        // Vest item classes must be defined in vests.hpp
        // before using them here.
        class vests: vests
        {
            class V_PlateCarrierIA1_dgtl {};
            class V_PlateCarrierIA2_dgtl {};
            class V_PlateCarrierIAGL_dgtl {};
        };

        // Uniform item classes must be defined in uniforms.hpp
        // before using them here.
        class uniforms: uniforms
        {
            class U_I_CombatUniform {};
            class U_I_CombatUniform_shortsleeve {};
        };
    };

    class vehicles: vehicles
    {
        // Vehicle classes must be defined in vehicles/air.hpp
        // before using them here.
        class air: air {
			class I_Heli_light_03_unarmed_F {};
			class I_Heli_Transport_02_F {};
			class I_Heli_light_03_dynamicLoadout_f {};
        };

        // Vehicle classes must be defined in vehicles/water.hpp
        // before using them here.
        class water: water {};

        // Vehicle classes must be defined in vehicles/land.hpp
        // before using them here.
        class land: land
        {
            class B_Quadbike_01_F: B_Quadbike_01_F 
            {
                paint = '["Indep",1]';
            };
            class B_T_LSV_01_unarmed_F {};
            class I_MRAP_03_hmg_F {};
            class I_MRAP_03_gmg_F {};
            class I_MRAP_03_F {};
            class I_Truck_02_covered_F {};
            class I_APC_Wheeled_03_cannon_F {};
            class I_APC_tracked_03_cannon_F {};
            class I_MBT_03_cannon_F {};
            class I_Truck_02_box_F {};
        };
    };

    // Define starting/spawn loadout for this faction
    class loadout: loadout
    {
        // Weaponry
        class primary
        {
            classname = "";
            ammo[] = {}; // {"magazine class name", "# num bullets"}
            items[] = {}; // addPrimaryWeaponItem
        };
        class secondary
        {
            classname = "hgun_P07_F";
            ammo[] = {"rhsusf_mag_15Rnd_9x19_JHP", ""}; // {"magazine class name", "# num bullets"}
            items[] = {"rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP"}; // addSecondaryWeaponItem
        };
        class launcher
        {
            classname = "";
            ammo = ""; // {"magazine class name"} (leave blank for empty launcher if not single-use launcher)
        };

        // Containers
        class helmet
        {
            classname = "";
        };
        class uniform
        {
            classname = "U_I_CombatUniform";
            items[] = {}; // addItemToUniform
        };
        class vest 
        {
            classname = "";
            items[] = {}; // addItemToVest
        };
        class backpack 
        {
            classname = "";
            items[] = {}; // addItemToBackpack
        };

        // Equipment & Accessories (Assigned to slot)
        equipment[] = {}; // {"ItemGPS","NVGoggles", ...}
    };
};