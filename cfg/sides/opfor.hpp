class opfor: InA_FactionBase
{
	sidename = "opfor";
	
	// Default weapons for this side
	class weapons: weapons {};

	// Default magazines for this side
	class magazines: magazines {};
	
	// Defaut misc items for this side
    class miscItems: miscItems
    {
    	class optic_ACO_grn {};
		class rhs_acc_rakursPM {};
		class rhs_acc_1p63 {};
		class optic_MRCO {};
		class optic_Arco_blk_F {};
		class rhs_acc_grip_ffg2 {};
		class rhs_acc_dtk4short {};
    };

    // Vehicle classes must be defined in vehicles/air.hpp
    // before using them here.
    class airvehicles {};

    // Vehicle classes must be defined in vehicles/water.hpp
    // before using them here.
    class watervehicles {};

    // Vehicle classes must be defined in vehicles/land.hpp
    // before using them here.
    class landvehicles : landvehicles
	{
		class B_Quadbike_01_F: B_Quadbike_01_F {};
	};
};