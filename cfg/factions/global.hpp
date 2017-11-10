// ALL factions inherit these items...
// Also kind of a template for each faction/side definition (in-case of missing structures)
class InA_FactionBase
{
    name = "FactionBase";
    sidename = "";

    class gear
    {
        // Item classes must be defined in magazines.hpp
        // before using them here.
		class magazines
		{
            inheritsFrom[] = {"InA_Magazines"};

			class mag_APERSMine_Range_Mag {};
			class mag_ATMine_Range_Mag {};
			class mag_ClaymoreDirectionalMine_Remote_Mag {};
			class mag_DemoCharge_Remote_Mag {};
			class mag_SLAMDirectionalMine_Wire_Mag {};
		};

        // Weapon classes must be defined in weapons.hpp
        // before using them here.
		class weapons
		{
            inheritsFrom[] = {"InA_Weapons"};
		};

        // Misc item classes must be defined in misc.hpp
        // before using them here.
		class miscitems
		{
            inheritsFrom[] = {"InA_MiscItems"};
			
			class acc_pointer_IR {};
			class ACE_ATragMX {};
			class ACE_bloodIV {};
			class ACE_bloodIV_250 {};
			class ACE_bloodIV_500 {};
			class ACE_CableTie {};
			class ACE_DefusalKit {};
			class ACE_EarPlugs {};
			class ACE_EntrenchingTool {};
			class ACE_epinephrine {};
			class ACE_fieldDressing {};
			class ACE_Flashlight_XL50 {};
			class ACE_HuntIR_monitor {};
			class ACE_IR_Strobe_Item {};
			class ACE_Kestrel4500 {};
			class ACE_M26_Clacker {};
			class ACE_MapTools {};
			class ACE_morphine {};
			class ACE_NVG_Wide {};
			class ACE_RangeCard {};
			class ACE_SpareBarrel {};
			class ACE_VectorDay {};
			class ACE_wirecutter {};
			class Binocular {};
			class bipod_01_F_blk {};
			class ItemCompass {};
			class ItemGPS {};
			class ItemMap {};
			class ItemWatch {};
			class Laserdesignator_01_khk_F {};
			class MineDetector {};
			class optic_KHS_blk {};
			class optic_LRPS {};
			class optic_SOS {};
			class RH_barska_rds {};
			class RH_SFM952V {};
			class tf_anprc152 {};
			class tfw_ilbe_gr {};
			class ToolKit {};
			class VSM_OGA_OD_Backpack_Compact {};
			class VSM_OGA_OD_Backpack_Kitbag {};
			class VSM_OGA_OD_carryall {};
		};
    };

    class clothes
    {
        // Helmet item classes must be defined in helmets.hpp
        // before using them here.
        class helmets
        {
            inheritsFrom[] = {"InA_Helmets"};
        };

        // Vest item classes must be defined in vests.hpp
        // before using them here.
        class vests
        {
            inheritsFrom[] = {"InA_Vests"};
        };

        // Uniform item classes must be defined in uniforms.hpp
        // before using them here.
        class uniforms
        {
            inheritsFrom[] = {"InA_Uniforms"};
        };
    };
    
    class loadout
    {
        // Weaponry
        class primary {};
        class secondary {};
        class launcher {};

        // Containers
        class helmet {};
        class uniform {};
        class vest  {};
        class backpack  {};

        // Equipment & Accessories (Assigned to slot)
        equipment[] = {}; // {"ItemGPS","NVGoggles", ...}
    };

    class vehicles
    {
        // Vehicle classes must be defined in vehicles/air.hpp
        // before using them here.
        class air {
            inheritsFrom[] = {"InA_Vehicles", "Air"};
        };

        // Vehicle classes must be defined in vehicles/water.hpp
        // before using them here.
        class water {
            inheritsFrom[] = {"InA_Vehicles", "Water"};
        };

        // Vehicle classes must be defined in vehicles/land.hpp
        // before using them here.
        class land
        {
            inheritsFrom[] = {"InA_Vehicles", "Land"};

            class B_Quadbike_01_F {};
        };
    };
};