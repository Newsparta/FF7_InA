class opfor: InA_FactionBase
{
	sidename = "opfor";

    class gear: gear
	{
		// Default weapons for this side
		class weapons: weapons {};

		// Default magazines for this side
		class magazines: magazines {};
		
		// Defaut misc items for this side
		class miscitems: miscitems
		{
			class optic_ACO_grn {};
			class rhs_acc_rakursPM {};
			class rhs_acc_1p63 {};
			class optic_MRCO {};
			class optic_Arco_blk_F {};
			class rhs_acc_grip_ffg2 {};
			class rhs_acc_dtk4short {};
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
			class B_Quadbike_01_F: B_Quadbike_01_F {};
		};
	};
};