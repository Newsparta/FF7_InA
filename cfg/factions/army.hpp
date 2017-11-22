class Army: blufor
{
    name = "United States Army";

    class gear: gear
    {
        // Item classes must be defined in magazines.hpp
        // before using them here.
		class magazines: magazines 
		{
			class mag_hlc_30rnd_68x43_FMJ {};
			class mag_hlc_30rnd_68x43_Tracer {};
			class mag_rhs_fgm148_magazine_AT {};
			class mag_rhs_fim92_mag {};
            class mag_rhsusf_100Rnd_762x51_m80a1epr {};
            class mag_rhsusf_50Rnd_762x51_m80a1epr {};
			class mag_rhsusf_5Rnd_300winmag_xm2010 {};
			class mag_rhsusf_mag_15Rnd_9x19_JHP {};
		};

        // Weapon classes must be defined in weapons.hpp
        // before using them here.
		class weapons: weapons 
		{
            class rhsusf_weap_m9 {};
			class hlc_rifle_ACR68_full_black {};
			class hlc_rifle_ACR68_Carb_black {};
			class hlc_rifle_ACR_Carb_black {};
			class hlc_rifle_ACR_full_black {};
            class hlc_rifle_ACR_SBR_black {};
            class hlc_lmg_mk48mod1 {};
            class rhs_weap_m240B_CAP {};
            class rhs_weap_m32 {};
            class rhs_weap_XM2010_sa {};
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
            classname = "rhsusf_weap_m9";
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
            classname = "VSM_Multicam_Crye_Camo";
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