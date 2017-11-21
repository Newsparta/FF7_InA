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
            class mag_hlc_20rnd_762x51_b_G3 {};
            class mag_hlc_20rnd_762x51_barrier_G3 {};
			class mag_hlc_30rnd_556x45_EPR_G36 {};
			class mag_hlc_30rnd_556x45_SOST_G36 {};
            class mag_hlc_30rnd_556x45_Tracers_G36 {};
		};

        // Weapon classes must be defined in weapons.hpp
        // before using them here.
		class weapons: weapons 
		{
			class hgun_P07_F {};
            class hlc_rifle_G36CV {};
            class hlc_rifle_G36KV {};
            class hlc_rifle_G36V {};
            class hlc_rifle_G36VAG36 {};
            class hlc_lmg_mk48mod1 {};
            class rhs_weap_m240B_CAP {};
            class hlc_rifle_PSG1A1_RIS {};
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