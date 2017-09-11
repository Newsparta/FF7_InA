class Marines: blufor
{
    name = "United States Marines";

    class gear: gear
    {
        // Item classes must be defined in magazines.hpp
        // before using them here.
        class magazines: magazines
        {
            class mag_rhsusf_mag_15Rnd_9x19_JHP {};
            class mag_30Rnd_556x45_Stanag {};
            class mag_30Rnd_556x45_Stanag_Tracer_Red {};
            class mag_rhs_200rnd_556x45_M_SAW {};
            class mag_rhsusf_100Rnd_556x45_soft_pouch {};
            class mag_rhsusf_100Rnd_762x51_m80a1epr {};
            class mag_rhsusf_50Rnd_762x51_m80a1epr {};
            class mag_rhsusf_20Rnd_762x51_m118_special_Mag {};
            class mag_rhsusf_5Rnd_762x51_m118_special_Mag {};
            class mag_rhsusf_mag_10Rnd_STD_50BMG_M33 {};
            class mag_tf47_m3maaws_HEAT {};
            class mag_tf47_m3maaws_HEDP {};
            class mag_tf47_m3maaws_HE {};
            class mag_tf47_m3maaws_SMOKE {};
            class mag_rhs_fgm148_magazine_AT {};
            class mag_rhs_fim92_mag {};
            class mag_1Rnd_HE_Grenade_shell {};
            class mag_3Rnd_HE_Grenade_shell {};
            class mag_1Rnd_Smoke_Grenade_shell {};
            class mag_UGL_FlareWhite_F {};
            class mag_ACE_HuntIR_M203 {};
            class mag_HandGrenade {};
            class mag_MiniGrenade {};
            class mag_SmokeShell {};
            class mag_SmokeShellBlue {};
            class mag_SmokeShellGreen {};
            class mag_ACE_M14 {};
        };

        // Weapon classes must be defined in weapons.hpp
        // before using them here.
        class weapons: weapons
        {
            class rhsusf_weap_m9 {};
            class rhs_weap_m4a1_carryhandle_pmag { cost = 0; };
            class rhs_weap_m16a4_pmag {};
            class rhs_weap_m27iar {};
            class rhs_weap_m4a1_m320 {};
            class rhs_weap_m16a4_carryhandle_M203 {};
            class rhs_weap_m249_pip_S {};
            class rhs_weap_m240B_CAP {};
            class rhs_weap_m14ebrri {};
            class rhs_weap_sr25 {};
            class rhs_weap_m40a5_wd {};
            class rhs_weap_M107_w {};
            class tf47_at4_heat {};
            class tf47_at4_HEDP {};
            class tf47_at4_HP {};
            class rhs_weap_m72a7 {};
            class tf47_m3maaws {};
            class rhs_weap_fgm148 {};
            class rhs_weap_fim92 {};
            class RHS_M2_Tripod_Bag {};
            class RHS_M2_Gun_Bag {};
            class RHS_Mk19_Tripod_Bag {};
            class RHS_Mk19_Gun_Bag {};
            class rhs_TOW_Tripod_Bag {};
            class rhs_Tow_Gun_Bag {};
            class rhs_M252_Bipod_Bag {};
            class rhs_M252_Gun_Bag {};
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
            class rhsusf_mich_helmet_marpatwd_norotos_arc {};
            class rhsusf_mich_helmet_marpatwd_norotos {};
            class rhsusf_mich_helmet_marpatwd {};
            class rhsusf_mich_helmet_marpatwd_alt {};
        };

        // Vest item classes must be defined in vests.hpp
        // before using them here.
        class vests: vests
        {
            class rhsusf_spc_corpsman {};
            class rhsusf_spc_iar {};
            class rhsusf_spc_light {};
            class rhsusf_spc_mg {};
            class rhsusf_spc_rifleman {};
        };

        // Uniform item classes must be defined in uniforms.hpp
        // before using them here.
        class uniforms: uniforms
        {
            class rhs_uniform_FROG01_wd {};
        };
    };

    class vehicles: vehicles
    {
        // Vehicle classes must be defined in vehicles/air.hpp
        // before using them here.
        class air: air {
			class RHS_UH1Y_UNARMED {};
			class RHS_UH1Y_GS {};
			class rhsusf_CH53E_USMC {};
			class RHS_AH1Z_wd {};
        };

        // Vehicle classes must be defined in vehicles/water.hpp
        // before using them here.
        class water: water {};

        // Vehicle classes must be defined in vehicles/land.hpp
        // before using them here.
        class land: land
        {
            class rhsusf_m1025_w_m2 {};
            class rhsusf_m1025_w_mk19 {};
            class rhsusf_m1025_w {};
            class rhsusf_rg33_m2_usmc_wd {};
            class rhsusf_rg33_usmc_wd {};
            class rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy {};
            class rhsusf_M1083A1P2_B_wd_fmtv_usarmy {};
            class rhsusf_m113_usarmy {};
            class rhsusf_m113_usarmy_MK19 {};
            class rhsusf_m113_usarmy_unarmed {};
            class RHS_M2A3_BUSKI_wd {};
            class RHS_M2A3_BUSKIII_wd {};
            class rhsusf_m1a1hc_wd {};
            class rhsusf_m1a1fep_wd {};
            class rhsusf_M1083A1P2_B_wd_flatbed_fmtv_usarmy {};
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
            classname = "";
            ammo[] = {}; // {"magazine class name", "# num bullets"}
            items[] = {}; // addSecondaryWeaponItem
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
            classname = "";
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