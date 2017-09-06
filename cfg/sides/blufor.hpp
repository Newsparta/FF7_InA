class blufor: InA_FactionBase
{
	sidename = "blufor";
	
	// Default weapons for this side
	class weapons: weapons {};

	// Default magazines for this side
	class magazines: magazines {};
	
	// Defaut misc items for this side
    class miscItems: miscItems
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