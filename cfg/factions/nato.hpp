class Nato: blufor
{
    name = "North Atlantic Treaty Org.";

    class gear: gear
    {
        // Item classes must be defined in magazines.hpp
        // before using them here.
        class magazines: magazines
        {
            class mag_16Rnd_9x21_Mag {};
            class mag_30Rnd_556x45_Stanag {};
            class mag_30Rnd_556x45_Stanag_Tracer_Red {};
            class mag_rhs_200rnd_556x45_M_SAW {};
            class mag_rhsusf_100Rnd_556x45_soft_pouch {};
            class mag_130Rnd_338_Mag {};
            class mag_20Rnd_762x51_Mag {};
            class mag_rhsusf_10Rnd_762x51_m118_special_Mag {};
            class mag_rhsusf_mag_10Rnd_STD_50BMG_M33 {};
            class mag_tf47_m3maaws_HEAT {};
            class mag_tf47_m3maaws_HEDP {};
            class mag_tf47_m3maaws_HE {};
            class mag_tf47_m3maaws_SMOKE {};
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
            class rhs_weap_m4a1_carryhandle_pmag { cost = 0; };
            class rhs_weap_hk416d10 {};
            class rhs_weap_hk416d145 {};
            class hlc_rifle_ACR_Carb_tan {};
            class hlc_rifle_ACR_mid_tan {};
            class hlc_rifle_ACR_full_tan {};
            class rhs_weap_m4a1_m320 {};
            class rhs_weap_hk416d145_m320 { cost = 10; };
            class rhs_weap_m249_pip_S {};
            class MMG_02_sand_F {};
            class rhs_weap_m14ebrri {};
            class rhs_weap_m40a5_wd {};
            class rhs_weap_M107_w {};
            class tf47_at4_heat {};
            class tf47_at4_HEDP {};
            class tf47_at4_HP {};
            class rhs_weap_m72a7 {};
            class tf47_m3maaws {};
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
            class H_HelmetB_light_desert {};
            class H_HelmetB_light_grass {};
            class H_HelmetB_light_snakeskin {};
            class H_HelmetSpecB_paint2 {};
            class H_HelmetSpecB_paint1 {};
            class H_HelmetSpecB_snakeskin {};
            class MNP_Helmet_Scorpion {};
            class MNP_Helmet_Germany {};
            class MNP_Helmet_Canada_T {};
            class MNP_Helmet_FIN_T {};
            class MNP_Helmet_Australia {};
        };

        // Vest item classes must be defined in vests.hpp
        // before using them here.
        class vests: vests
        {
            class MNP_Vest_Scorpion_1 {};
            class MNP_Vest_Scorpion_2 {};
            class V_PlateCarrierL_CTRG {};
            class V_PlateCarrierH_CTRG {};
            class MNP_Vest_Germany {};
            class MNP_Vest_Germany_2 {};
            class MNP_Vest_Canada_T {};
            class MNP_Vest_Canada_T2 {};
            class MNP_Vest_NOR_1 {};
            class MNP_Vest_NOR_2 {};
            class MNP_Vest_FIN_1 {};
            class MNP_Vest_FIN_2 {};
            class MNP_Vest_Australia {};
            class MNP_Vest_Australia_B {};
        };

        // Uniform item classes must be defined in uniforms.hpp
        // before using them here.
        class uniforms: uniforms
        {
            class MNP_CombatUniform_Scorpion_A {};
            class MNP_CombatUniform_Scorpion_B {};
            class U_B_CTRG_1 {};
            class U_B_CTRG_3 {};
            class MNP_CombatUniform_Germany {};
            class MNP_CombatUniform_Germany_S {};
            class MNP_CombatUniform_Canada {};
            class MNP_CombatUniform_Canada_S {};
            class MNP_CombatUniform_NOR_A {};
            class MNP_CombatUniform_NOR_B {};
            class MNP_CombatUniform_Fin_A {};
            class MNP_CombatUniform_Fin_B {};
            class MNP_CombatUniform_Australia {};
            class MNP_CombatUniform_Australia_S {};
        };
    };

    class vehicles: vehicles
    {
        // Vehicle classes must be defined in vehicles/air.hpp
        // before using them here.
        class air: air {
			class B_Heli_Light_01_F {};
			class B_Heli_Transport_01_camo_F {};
			class B_Heli_Transport_03_F {};
			class B_Heli_Light_01_dynamicLoadout_F {};
			class B_Heli_Attack_01_dynamicLoadout_F {};
        };

        // Vehicle classes must be defined in vehicles/water.hpp
        // before using them here.
        class water: water {};

        // Vehicle classes must be defined in vehicles/land.hpp
        // before using them here.
        class land: land
        {
            class B_T_LSV_01_unarmed_F: B_T_LSV_01_unarmed_F
            {
                paint = 'true';
            };
            class B_MRAP_01_hmg_f {};
            class B_MRAP_01_gmg_F {};
            class B_MRAP_01_F {};
            class B_Truck_01_covered_F {};
            class B_APC_Tracked_01_rcws_F {};
            class B_APC_Wheeled_01_cannon_F {};
            class B_MBT_01_TUSK_F {};
            class B_T_Truck_01_ammo_F {};
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