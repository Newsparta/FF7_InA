class Army: blufor
{
    name = "United States Army";

    class gear: gear
    {
        // Item classes must be defined in magazines.hpp
        // before using them here.
        class magazines: magazines
        {
            class mag_rhsusf_mag_15Rnd_9x19_JHP {};
            class mag_30Rnd_556x45_Stanag {};
            class mag_30Rnd_556x45_Stanag_Tracer_Red {};
            class mag_hlc_30rnd_68x43_FMJ {};
            class mag_hlc_30rnd_68x43_Tracer {};
            class mag_rhs_200rnd_556x45_M_SAW {};
            class mag_rhsusf_100Rnd_556x45_soft_pouch {};
            class mag_rhsusf_100Rnd_762x51_m80a1epr {};
            class mag_rhsusf_50Rnd_762x51_m80a1epr {};
            class mag_rhsusf_20Rnd_762x51_m118_special_Mag {};
            class mag_rhsusf_5Rnd_300winmag_xm2010 {};
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
            class hlc_rifle_ACR_Carb_tan { cost = 0; };
            class hlc_rifle_ACR_SBR_tan {};
            class hlc_rifle_ACR_mid_tan {};
            class hlc_rifle_ACR_full_tan {};
            class hlc_rifle_ACR68_mid_tan {};
            class hlc_rifle_ACR68_full_tan {};
            class rhs_weap_m4a1_m320 {};
            class rhs_weap_m249_pip_S {};
            class rhs_weap_m240B_CAP {};
            class rhs_weap_m14ebrri {};
            class rhs_weap_sr25 {};
            class rhs_weap_XM2010_sa {};
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
            class VSM_OPS_multicam {};
            class VSM_Mich2000_Multicam {};
        };

        // Vest item classes must be defined in vests.hpp
        // before using them here.
        class vests: vests
        {
            class VSM_FAPC_Breacher_Multicam {};
            class VSM_FAPC_MG_Multicam {};
            class VSM_FAPC_Operator_Multicam {};
            class VSM_LBT6094_breacher_multicam {};
            class VSM_LBT6094_operator_multicam {};
            class VSM_RAV_Breacher_Multicam {};
            class VSM_RAV_MG_Multicam {};
            class VSM_RAV_operator_Multicam {};
        };

        // Uniform item classes must be defined in uniforms.hpp
        // before using them here.
        class uniforms: uniforms
        {
            class VSM_Multicam_Crye_Camo {};
            class VSM_Multicam_Crye_od_shirt_Camo {};
            class VSM_Multicam_Crye_od_pants_Camo {};
        };
    };

    class vehicles: vehicles
    {
        // Vehicle classes must be defined in vehicles/air.hpp
        // before using them here.
        class air: air {
			class RHS_MELB_MH6M {};
			class RHS_UH60M {};
			class RHS_CH_47F {};
			class RHS_MELB_AH6M_M {};
			class RHS_AH64D_wd {};
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
            class rhsusf_M1232_M2_usarmy_wd {};
            class rhsusf_M1232_MK19_usarmy_wd {};
            class rhsusf_M1232_usarmy_wd {};
            class rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy {};
            class rhsusf_M1083A1P2_B_wd_fmtv_usarmy {};
            class rhsusf_m113_usarmy {};
            class rhsusf_m113_usarmy_MK19 {};
            class rhsusf_m113_usarmy_unarmed {};
            class RHS_M2A3_BUSKI_wd {};
            class RHS_M2A3_BUSKIII_wd {};
            class rhsusf_m1a2sep1tuskiwd_usarmy {};
            class rhsusf_m1a2sep1tuskiiwd_usarmy {};
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