// ALL factions inherit these items...
class InA_FactionBase
{
    name = "FactionBase";
    sidename = "";

    // Item classes must be defined in magazines.hpp
    // before using them here.
    class magazines
    {
        class mag_APERSMine_Range_Mag {};
        class mag_SLAMDirectionalMine_Wire_Mag {};
        class mag_ClaymoreDirectionalMine_Remote_Mag {};
        class mag_ATMine_Range_Mag {};
        class mag_DemoCharge_Remote_Mag {};
    };

    // Weapon classes must be defined in weapons.hpp
    // before using them here.
    class weapons {};

    // Misc item classes must be defined in misc.hpp
    // before using them here.
    class miscItems 
    {
        class ACE_fieldDressing {};
        class ACE_morphine {};
        class ACE_EarPlugs {};
        class ACE_epinephrine {};
        class ACE_bloodIV {};
        class ACE_bloodIV_500 {};
        class ACE_bloodIV_250 {};
        class tf_anprc152 {};
        class tfw_ilbe_gr {};
        class ItemMap {};
        class ItemCompass {};
        class ItemGPS {};
        class ItemWatch {};
        class Binocular {};
        class ACE_VectorDay {};
        class Laserdesignator_01_khk_F {};
        class ACE_NVG_Wide {};
        class RH_barska_rds {};
        class optic_SOS {};
        class optic_KHS_blk {};
        class optic_LRPS {};
        class acc_pointer_IR {};
        class RH_SFM952V {};
        class bipod_01_F_blk {};
        class ACE_SpareBarrel {};
        class ACE_CableTie {};
        class ACE_Flashlight_XL50 {};
        class ACE_MapTools {};
        class ACE_HuntIR_monitor {};
        class ACE_EntrenchingTool {};
        class ACE_IR_Strobe_Item {};
        class ToolKit {};
        class ACE_wirecutter {};
        class ACE_DefusalKit {};
        class MineDetector {};
        class ACE_M26_Clacker {};
        class ACE_Kestrel4500 {};
        class ACE_ATragMX {};
        class ACE_RangeCard {};
        class VSM_OGA_OD_Backpack_Compact {};
        class VSM_OGA_OD_Backpack_Kitbag {};
        class VSM_OGA_OD_carryall {};
    };

    // Helmet item classes must be defined in helmets.hpp
    // before using them here.
    class helmets
    {
    };

    // Vest item classes must be defined in vests.hpp
    // before using them here.
    class vests
    {
    };

    // Uniform item classes must be defined in uniforms.hpp
    // before using them here.
    class uniforms
    {
    };
    
    class defaultLoadout
    {
        // Weaponry
        class primary {};
        class secondary {};
        class launcher {};

        // Containers
        class uniform {};
        class vest  {};
        class backpack  {};

        // Equipment & Accessories (Assigned to slot)
        equipment[] = {}; // {"ItemGPS","NVGoggles", ...}
    };

    // Vehicle classes must be defined in vehicles/air.hpp
    // before using them here.
    class airvehicles {};

    // Vehicle classes must be defined in vehicles/water.hpp
    // before using them here.
    class watervehicles {};

    // Vehicle classes must be defined in vehicles/land.hpp
    // before using them here.
    class landvehicles
    {
        class B_Quadbike_01_F {};
    };
};