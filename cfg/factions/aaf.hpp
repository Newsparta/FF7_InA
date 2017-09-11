class AAF: opfor
{
    name = "Altis Armed Forces";

    class gear: gear
    {
        // Item classes must be defined in magazines.hpp
        // before using them here.
        class magazines: magazines
        {
            class mag_16Rnd_9x21_Mag {};
            class mag_30Rnd_556x45_Stanag {};
            class mag_30Rnd_556x45_Stanag_Tracer_Yellow {};
            class mag_200Rnd_65x39_cased_Box {};
            class mag_200Rnd_65x39_cased_Box_Tracer {};
            class mag_150Rnd_93x64_Mag {};
            class mag_20Rnd_762x51_Mag {};
            class mag_rhsusf_mag_10Rnd_STD_50BMG_M33 {};
            class mag_Titan_AT {};
            class mag_Titan_AP {};
            class mag_Titan_AA {};
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
            class hgun_P07_F {};
            class rhs_weap_hk416d10 { cost = 0; };
            class rhs_weap_hk416d145 {};
            class rhs_weap_hk416d145_m320 {};
            class LMG_Mk200_F {};
            class MMG_01_tan_F {};
            class srifle_EBR_F {};
            class rhs_weap_M107_w {};
            class tf47_at4_heat {};
            class tf47_at4_HEDP {};
            class tf47_at4_HP {};
            class rhs_weap_m72a7 {};
            class launch_B_Titan_short_tna_F {};
            class launch_B_Titan_tna_F {};
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