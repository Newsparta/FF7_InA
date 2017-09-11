class Russia: opfor
{
    name = "Russian Army";

    class gear: gear
    {
        // Item classes must be defined in magazines.hpp
        // before using them here.
        class magazines: magazines
        {
            class mag_rhs_mag_9x18_8_57N181S {};
            class mag_rhs_30Rnd_545x39_7N10_AK {};
            class mag_rhs_30Rnd_545x39_AK_green {};
            class mag_rhs_100Rnd_762x54mmR {};
            class mag_rhs_100Rnd_762x54mmR_green {};
            class mag_rhs_10Rnd_762x54mmR_7N1 {};
            class mag_rhs_5Rnd_338lapua_t5000 {};
            class mag_rhs_rpg7_PG7V_mag {};
            class mag_rhs_rpg7_OG7V_mag {};
            class mag_rhs_rpg7_TBG7V_mag {};
            class mag_rhs_rpg7_PG7VR_mag {};
            class mag_rhs_mag_9k38_rocket {};
            class mag_rhs_VOG25 {};
            class mag_rhs_VG40TB {};
            class mag_rhs_VG40MD_White {};
            class mag_rhs_VG40OP_white {};
            class mag_rhs_mag_rgo {};
            class mag_rhs_mag_rgn {};
            class mag_rhs_mag_rdg2_white {};
            class mag_rhs_mag_rdg2_black {};
        };

        // Weapon classes must be defined in weapons.hpp
        // before using them here.
        class weapons: weapons
        {
            class rhs_weap_makarov_pm {};
            class rhs_weap_ak74m_zenitco01 { cost = 0; };
            class rhs_weap_ak74m_zenitco01_b33 {};
            class rhs_weap_ak74mr {};
            class rhs_weap_ak74mr_gp25 {};
            class rhs_weap_pkm {};
            class rhs_weap_pkp {};
            class rhs_weap_svds_npz {};
            class rhs_weap_svdp_npz {};
            class rhs_weap_t5000 {};
            class rhs_weap_rpg26 {};
            class rhs_weap_rshg2 {};
            class rhs_weap_rpg7 {};
            class rhs_weap_igla {};
            class RHS_NSV_Tripod_Bag {};
            class RHS_NSV_Gun_Bag {};
            class RHS_AGS30_Tripod_Bag {};
            class RHS_AGS30_Gun_Bag {};
            class RHS_Kornet_Tripod_Bag {};
            class RHS_Kornet_Gun_Bag {};
            class RHS_Podnos_Bipod_Bag {};
            class RHS_Podnos_Gun_Bag {};
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
            class rhs_6b47 {};
            class rhs_6b47_ess {};
        };

        // Vest item classes must be defined in vests.hpp
        // before using them here.
        class vests: vests
        {
            class rhs_6b23_6sh116 {};
            class rhs_6b23_6sh116_vog {};
            class rhs_6b23_digi_6sh92 {};
            class rhs_6b23_digi_6sh92_spetsnaz2 {};
            class rhs_6b23_digi_6sh92_Vog_Spetsnaz {};
        };

        // Uniform item classes must be defined in uniforms.hpp
        // before using them here.
        class uniforms: uniforms
        {
            class rhs_uniform_emr_patchless {};
        };
    };

    class vehicles: vehicles
    {
        // Vehicle classes must be defined in vehicles/air.hpp
        // before using them here.
        class air: air {
			class rhs_ka60_c {};
			class RHS_Mi24P_CAS_vvsc {};
			class RHS_Mi8AMT_vvsc {};
			class RHS_Mi8AMTSh_vvsc {};
			class RHS_Ka52_vvsc {};
			class rhs_mi28n_vvsc {};
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
                paint = '["GreenHex",1]';
            };
            class O_T_LSV_02_unarmed_F {};
            class rhs_tigr_3camo_msv {};
            class rhs_tigr_sts_3camo_msv {};
            class rhsgref_BRDM2_msv {};
            class rhsgref_BRDM2UM_msv {};
            class rhs_kamaz5350_msv {};
            class rhs_btr80_msv {};
            class rhs_btr80a_msv {};
            class rhs_bmp2d_msv {};
            class rhs_bmp3_late_msv {};
            class rhs_t72bb_tv {};
            class rhs_t72bd_tv {};
            class rhs_typhoon_vdv {};
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