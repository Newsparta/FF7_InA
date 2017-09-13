class blufor: InA_FactionBase
{
	sidename = "blufor";

    class gear: gear
    {
		// Default weapons for this side
		class weapons: weapons {};

		// Default magazines for this side
		class magazines: magazines {};
		
		// Defaut misc items for this side
		class miscitems: miscitems
		{
			class optic_Aco {};
			class rhsusf_acc_compm4 {};
			class RH_eotech553 {};
			class RH_eotech553mag {};
			class optic_Hamr {};
			class optic_ERCO_blk_F {};
			class rhsusf_acc_ELCAN {};
			class RH_ta31rmr {};
			class rhsusf_acc_grip2 {};
			class rhsusf_acc_grip3 {};
			class rhsusf_acc_nt4_black {};
			class ACE_Clacker {};
		};
	};
	
    class clothes: clothes
    {
        // Helmet item classes must be defined in helmets.hpp
        // before using them here.
        class helmets: helmets
        {
        };

        // Vest item classes must be defined in vests.hpp
        // before using them here.
        class vests: vests
        {
        };

        // Uniform item classes must be defined in uniforms.hpp
        // before using them here.
        class uniforms: uniforms
        {
        };
    };
    
    class loadout: loadout
	{
        // Weaponry
        class primary: primary {};
        class secondary: secondary {};
        class launcher: launcher {};

        // Containers
        class uniform: uniform {};
        class vest: vest {};
        class backpack: backpack {};
	};

    class vehicles: vehicles
	{
		// Vehicle classes must be defined in vehicles/air.hpp
		// before using them here.
		class air: air {};

		// Vehicle classes must be defined in vehicles/water.hpp
		// before using them here.
		class water: water {};

		// Vehicle classes must be defined in vehicles/land.hpp
		// before using them here.
		class land: land
		{
			class B_Quadbike_01_F: B_Quadbike_01_F
			{
				paint = '["Blufor",1]';
			};
			class B_T_LSV_01_unarmed_F
			{
				paint = '["Olive",1]';
			};
		};
	};
};