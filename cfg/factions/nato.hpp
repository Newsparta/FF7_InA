class Nato: blufor
{
    name = "North Atlantic Treaty Org.";

    class gear: gear
    {
        // Item classes must be defined in magazines.hpp
        // before using them here.
		class magazines: magazines 
		{
			class mag_130Rnd_338_Mag {};
			class mag_16Rnd_9x21_Mag {};
			class mag_20Rnd_762x51_Mag {};
			class mag_rhs_200rnd_556x45_M_SAW
			{
				cost = 6;
			};
			class mag_rhsusf_100Rnd_556x45_soft_pouch
			{
				cost = 6;
			};
			class mag_rhsusf_10Rnd_762x51_m118_special_Mag {};
			class mag_Titan_AA {};
			class mag_Titan_AP {};
			class mag_Titan_AT {};
		};

        // Weapon classes must be defined in weapons.hpp
        // before using them here.
		class weapons: weapons 
		{
			class hgun_P07_F {};
			class hlc_rifle_ACR_Carb_tan {};
			class hlc_rifle_ACR_full_tan {};
			class hlc_rifle_ACR_mid_tan {};
			class launch_B_Titan_short_tna_F {};
			class launch_B_Titan_tna_F {};
			class MMG_02_sand_F {};
			class rhs_weap_hk416d10 {};
			class rhs_weap_hk416d145 {};
			class rhs_weap_hk416d145_m320 {};
			class rhs_weap_m40a5_wd {};
			class rhs_weap_m4a1_carryhandle_pmag {};
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
            classname = "hgun_P07_F";
            ammo[] = {"16Rnd_9x21_Mag", ""}; // {"magazine class name", "# num bullets"}
            items[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag"}; // addSecondaryWeaponItem
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
            classname = "MNP_CombatUniform_Scorpion_A";
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