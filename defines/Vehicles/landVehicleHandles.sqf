[] spawn {
	private ["_items","_ctrl"];

	[clientOwner, "initialized"] remoteExec ["publicVariableClient", 2, false];
	
	sleep 0.2;
		
	if (initialized) then {
		switch (baseType) do {

			case "Army":
			{
				garageResources = 
				{
					_id = _this select 0;
					/*
					Logistics
					Fuel
					Munitions
					*/
					switch (_id) do
					{
						case 0:
						{
							ctrlSetText [1000, "0"];
							ctrlSetText [1001, "50"];
							ctrlSetText [1002, "0"];
						};
						
						case 1:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "0"];
						};
						
						case 2:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "50"];
						};

						case 3:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "150"];
						};

						case 4:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "0"];
						};
						
						case 5:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "100"];
						};

						case 6:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "200"];
						};

						case 7:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "50"];
						};
						
						case 8:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "50"];
						};

						case 9:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "0"];
						};
						
						case 10:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "250"];
							ctrlSetText [1002, "50"];
						};
						
						case 11:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "250"];
							ctrlSetText [1002, "150"];
						};

						case 12:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "250"];
							ctrlSetText [1002, "0"];
						};
						
						case 13:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "350"];
							ctrlSetText [1002, "200"];
						};

						case 14:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "350"];
							ctrlSetText [1002, "300"];
						};
						
						case 15:
						{
							ctrlSetText [1000, "4"];
							ctrlSetText [1001, "400"];
							ctrlSetText [1002, "350"];
						};

						case 16:
						{
							ctrlSetText [1000, "4"];
							ctrlSetText [1001, "400"];
							ctrlSetText [1002, "450"];
						};
						
						case 17:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "0"];
						};
					};
				};

				garageHandler = 
				{

					_id = _this select 0;

					switch (_id) do
					{
						case 0:
						{
							{
								vCost = 0;
								mCost = 0;
								fCost = 50;

								vehicleType = "B_Quadbike_01_F";
								vehiclePaint = ["Blufor",1];
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 1:
						{
							{
								vCost = 1;
								mCost = 0;
								fCost = 100;

								vehicleType = "B_T_LSV_01_unarmed_F";
								vehiclePaint = ["Olive",1];
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 2:
						{
							{
								vCost = 1;
								mCost = 50;
								fCost = 100;

								vehicleType = "rhsusf_m1025_w_m2";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 3:
						{
							{
								vCost = 1;
								mCost = 150;
								fCost = 100;

								vehicleType = "rhsusf_m1025_w_mk19";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 4:
						{
							{
								vCost = 1;
								mCost = 0;
								fCost = 100;

								vehicleType = "rhsusf_m1025_w";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 5:
						{
							{
								vCost = 2;
								mCost = 100;
								fCost = 200;

								vehicleType = "rhsusf_M1232_M2_usarmy_wd";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 6:
						{
							{
								vCost = 2;
								mCost = 200;
								fCost = 200;

								vehicleType = "rhsusf_M1232_MK19_usarmy_wd";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 7:
						{
							{
								vCost = 2;
								mCost = 50;
								fCost = 200;

								vehicleType = "rhsusf_M1232_usarmy_wd";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 8:
						{
							{
								vCost = 2;
								mCost = 50;
								fCost = 200;

								vehicleType = "rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 9:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 200;

								vehicleType = "rhsusf_M1083A1P2_B_wd_fmtv_usarmy";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 10:
						{
							{
								vCost = 3;
								mCost = 50;
								fCost = 250;

								vehicleType = "rhsusf_m113_usarmy";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 11:
						{
							{
								vCost = 3;
								mCost = 150;
								fCost = 250;

								vehicleType = "rhsusf_m113_usarmy_MK19";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 12:
						{
							{
								vCost = 3;
								mCost = 0;
								fCost = 250;

								vehicleType = "rhsusf_m113_usarmy_unarmed";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 13:
						{
							{
								vCost = 3;
								mCost = 200;
								fCost = 350;

								vehicleType = "RHS_M2A3_BUSKI_wd";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 14:
						{
							{
								vCost = 3;
								mCost = 300;
								fCost = 350;

								vehicleType = "RHS_M2A3_BUSKIII_wd";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 15:
						{
							{
								vCost = 4;
								mCost = 350;
								fCost = 400;

								vehicleType = "rhsusf_m1a2sep1tuskiwd_usarmy";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 16:
						{
							{
								vCost = 4;
								mCost = 450;
								fCost = 400;

								vehicleType = "rhsusf_m1a2sep1tuskiiwd_usarmy";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 17:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 200;

								vehicleType = "rhsusf_M1083A1P2_B_wd_flatbed_fmtv_usarmy";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = true;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
					};
				};
			};
			
			case "Marines":
			{
				garageResources = 
				{
					_id = _this select 0;
					/*
					Logistics
					Fuel
					Munitions
					*/
					switch (_id) do
					{
						case 0:
						{
							ctrlSetText [1000, "0"];
							ctrlSetText [1001, "50"];
							ctrlSetText [1002, "0"];
						};

						case 1:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "0"];
						};
						
						case 2:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "50"];
						};

						case 3:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "150"];
						};

						case 4:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "0"];
						};
						
						case 5:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "100"];
						};

						case 6:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "50"];
						};
						
						case 7:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "50"];
						};

						case 8:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "0"];
						};
						
						case 9:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "250"];
							ctrlSetText [1002, "50"];
						};
						
						case 10:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "250"];
							ctrlSetText [1002, "150"];
						};

						case 11:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "250"];
							ctrlSetText [1002, "0"];
						};
						
						case 12:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "350"];
							ctrlSetText [1002, "200"];
						};

						case 13:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "350"];
							ctrlSetText [1002, "300"];
						};
						
						case 14:
						{
							ctrlSetText [1000, "4"];
							ctrlSetText [1001, "350"];
							ctrlSetText [1002, "250"];
						};

						case 15:
						{
							ctrlSetText [1000, "4"];
							ctrlSetText [1001, "350"];
							ctrlSetText [1002, "350"];
						};
						
						case 16:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "0"];
						};
					};
				};

				garageHandler = 
				{

					_id = _this select 0;

					switch (_id) do
					{
						case 0:
						{
							{
								vCost = 0;
								mCost = 0;
								fCost = 50;

								vehicleType = "B_Quadbike_01_F";
								vehiclePaint = ["Blufor",1];
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 1:
						{
							{
								vCost = 1;
								mCost = 0;
								fCost = 100;

								vehicleType = "B_T_LSV_01_unarmed_F";
								vehiclePaint = ["Olive",1];
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 2:
						{
							{
								vCost = 1;
								mCost = 50;
								fCost = 100;

								vehicleType = "rhsusf_m1025_w_m2";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 3:
						{
							{
								vCost = 1;
								mCost = 150;
								fCost = 100;

								vehicleType = "rhsusf_m1025_w_mk19";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 4:
						{
							{
								vCost = 1;
								mCost = 0;
								fCost = 100;

								vehicleType = "rhsusf_m1025_w";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 5:
						{
							{
								vCost = 2;
								mCost = 100;
								fCost = 200;

								vehicleType = "rhsusf_rg33_m2_usmc_wd";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 6:
						{
							{
								vCost = 2;
								mCost = 50;
								fCost = 200;

								vehicleType = "rhsusf_rg33_usmc_wd";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 7:
						{
							{
								vCost = 2;
								mCost = 50;
								fCost = 200;

								vehicleType = "rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 8:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 200;

								vehicleType = "rhsusf_M1083A1P2_B_wd_fmtv_usarmy";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 9:
						{
							{
								vCost = 3;
								mCost = 50;
								fCost = 250;

								vehicleType = "rhsusf_m113_usarmy";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 10:
						{
							{
								vCost = 3;
								mCost = 150;
								fCost = 250;

								vehicleType = "rhsusf_m113_usarmy_MK19";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 11:
						{
							{
								vCost = 3;
								mCost = 0;
								fCost = 250;

								vehicleType = "rhsusf_m113_usarmy_unarmed";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 12:
						{
							{
								vCost = 3;
								mCost = 200;
								fCost = 350;

								vehicleType = "RHS_M2A3_BUSKI_wd";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 13:
						{
							{
								vCost = 3;
								mCost = 300;
								fCost = 350;

								vehicleType = "RHS_M2A3_BUSKIII_wd";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 14:
						{
							{
								vCost = 4;
								mCost = 250;
								fCost = 350;

								vehicleType = "rhsusf_m1a1hc_wd";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 15:
						{
							{
								vCost = 4;
								mCost = 350;
								fCost = 350;

								vehicleType = "rhsusf_m1a1fep_wd";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 16:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 200;

								vehicleType = "rhsusf_M1083A1P2_B_wd_flatbed_fmtv_usarmy";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = true;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
					};
				};				
			};
			
			case "Nato":
			{
				garageResources = 
				{
					_id = _this select 0;
					/*
					Logistics
					Fuel
					Munitions
					*/
					switch (_id) do
					{
						case 0:
						{
							ctrlSetText [1000, "0"];
							ctrlSetText [1001, "50"];
							ctrlSetText [1002, "0"];
						};
						
						case 1:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "100"];
						};

						case 2:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "0"];
						};
						
						case 3:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "100"];
						};

						case 4:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "200"];
						};

						case 5:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "50"];
						};
						
						case 6:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "0"];
						};
						
						case 7: 
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "350"];
							ctrlSetText [1002, "300"];
						};
						
						case 8: 
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "400"];
							ctrlSetText [1002, "350"];
						};
						
						case 9: 
						{
							ctrlSetText [1000, "4"];
							ctrlSetText [1001, "450"];
							ctrlSetText [1002, "400"];
						};
						
						case 10:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "0"];
						};
					};
				};

				garageHandler = 
				{

					_id = _this select 0;

					switch (_id) do
					{
						case 0:
						{
							{
								vCost = 0;
								mCost = 0;
								fCost = 50;

								vehicleType = "B_Quadbike_01_F";
								vehiclePaint = ["Blufor",1];
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 1:
						{
							{
								vCost = 1;
								mCost = 100;
								fCost = 100;

								vehicleType = "B_T_LSV_01_armed_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 2:
						{
							{
								vCost = 1;
								mCost = 0;
								fCost = 100;

								vehicleType = "B_T_LSV_01_unarmed_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 3:
						{
							{
								vCost = 2;
								mCost = 100;
								fCost = 200;

								vehicleType = "B_MRAP_01_hmg_f";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 4:
						{
							{
								vCost = 2;
								mCost = 200;
								fCost = 200;

								vehicleType = "B_MRAP_01_gmg_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 5:
						{
							{
								vCost = 2;
								mCost = 50;
								fCost = 200;

								vehicleType = "B_MRAP_01_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 6:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 200;

								vehicleType = "B_Truck_01_covered_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 7:
						{
							{
								vCost = 3;
								mCost = 300;
								fCost = 350;

								vehicleType = "B_APC_Tracked_01_rcws_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 8:
						{
							{
								vCost = 3;
								mCost = 350;
								fCost = 400;

								vehicleType = "B_APC_Wheeled_01_cannon_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 9:
						{
							{
								vCost = 4;
								mCost = 400;
								fCost = 450;

								vehicleType = "B_MBT_01_TUSK_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 10:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 200;

								vehicleType = "B_T_Truck_01_ammo_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = true;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
					};
				};				
			};
			
			case "AAF":
			{
				garageResources = 
				{
					_id = _this select 0;
					/*
					Logistics
					Fuel
					Munitions
					*/
					switch (_id) do
					{	
						case 0:
						{
							ctrlSetText [1000, "0"];
							ctrlSetText [1001, "50"];
							ctrlSetText [1002, "0"];
						};
						
						case 1:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "0"];
						};
						
						case 2:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "100"];
						};

						case 3:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "200"];
						};

						case 4:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "50"];
						};
						
						case 5:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "0"];
						};
						
						case 6: 
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "350"];
							ctrlSetText [1002, "300"];
						};
						
						case 7: 
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "400"];
							ctrlSetText [1002, "350"];
						};
						
						case 8: 
						{
							ctrlSetText [1000, "4"];
							ctrlSetText [1001, "450"];
							ctrlSetText [1002, "400"];
						};
						
						case 9:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "0"];
						};
					};
				};

				garageHandler = 
				{

					_id = _this select 0;

					switch (_id) do
					{
						case 0:
						{
							{
								vCost = 0;
								mCost = 0;
								fCost = 50;

								vehicleType = "B_Quadbike_01_F";
								vehiclePaint = ["Indep",1];
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 1:
						{
							{
								vCost = 1;
								mCost = 0;
								fCost = 100;

								vehicleType = "B_T_LSV_01_unarmed_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 2:
						{
							{
								vCost = 2;
								mCost = 100;
								fCost = 200;

								vehicleType = "I_MRAP_03_hmg_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 3:
						{
							{
								vCost = 2;
								mCost = 200;
								fCost = 200;

								vehicleType = "I_MRAP_03_gmg_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 4:
						{
							{
								vCost = 2;
								mCost = 50;
								fCost = 200;

								vehicleType = "I_MRAP_03_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 5:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 200;

								vehicleType = "I_Truck_02_covered_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 6:
						{
							{
								vCost = 3;
								mCost = 300;
								fCost = 350;

								vehicleType = "I_APC_Wheeled_03_cannon_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 7:
						{
							{
								vCost = 3;
								mCost = 350;
								fCost = 400;

								vehicleType = "I_APC_tracked_03_cannon_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 8:
						{
							{
								vCost = 4;
								mCost = 400;
								fCost = 450;

								vehicleType = "I_MBT_03_cannon_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 9:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 200;

								vehicleType = "I_Truck_02_box_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = true;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
					};
				};				
			};
			
			case "Russia":
			{
				garageResources = 
				{
					_id = _this select 0;
					/*
					Logistics
					Fuel
					Munitions
					*/
					switch (_id) do
					{
						case 0:
						{
							ctrlSetText [1000, "0"];
							ctrlSetText [1001, "50"];
							ctrlSetText [1002, "0"];
						};

						case 1:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "0"];
						};
						
						case 2:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "0"];
						};

						case 3:
						{
							ctrlSetText [1000, "1"];
							ctrlSetText [1001, "100"];
							ctrlSetText [1002, "150"];
						};
						
						case 4:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "100"];
						};
						
						case 5:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "50"];
						};
						
						case 6:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "0"];
						};
						
						case 7:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "300"];
							ctrlSetText [1002, "100"];
						};
						
						case 8:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "300"];
							ctrlSetText [1002, "250"];
						};
						
						case 9:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "350"];
							ctrlSetText [1002, "300"];
						};
						
						case 10:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "350"];
							ctrlSetText [1002, "400"];
						};
						
						case 11:
						{
							ctrlSetText [1000, "4"];
							ctrlSetText [1001, "400"];
							ctrlSetText [1002, "400"];
						};
						case 12:
						{
							ctrlSetText [1000, "4"];
							ctrlSetText [1001, "450"];
							ctrlSetText [1002, "450"];
						};
						
						case 13:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "200"];
							ctrlSetText [1002, "0"];
						};
					};
				};

				garageHandler = 
				{

					_id = _this select 0;

					switch (_id) do
					{
						case 0:
						{
							{
								vCost = 0;
								mCost = 0;
								fCost = 50;

								vehicleType = "B_Quadbike_01_F";
								vehiclePaint = ["GreenHex",1];
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 1:
						{
							{
								vCost = 1;
								mCost = 0;
								fCost = 100;

								vehicleType = "O_T_LSV_02_unarmed_F";
								vehiclePaint = ["Black",1];
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 2:
						{
							{
								vCost = 1;
								mCost = 0;
								fCost = 100;

								vehicleType = "rhs_tigr_3camo_msv";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 3:
						{
							{
								vCost = 1;
								mCost = 150;
								fCost = 100;

								vehicleType = "rhs_tigr_sts_3camo_msv";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 4:
						{
							{
								vCost = 2;
								mCost = 100;
								fCost = 200;

								vehicleType = "rhsgref_BRDM2_msv";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 5:
						{
							{
								vCost = 2;
								mCost = 50;
								fCost = 200;

								vehicleType = "rhsgref_BRDM2UM_msv";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 6:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 200;

								vehicleType = "rhs_kamaz5350_msv";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 7:
						{
							{
								vCost = 3;
								mCost = 100;
								fCost = 300;

								vehicleType = "rhs_btr80_msv";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 8:
						{
							{
								vCost = 3;
								mCost = 250;
								fCost = 300;

								vehicleType = "rhs_btr80a_msv";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 9:
						{
							{
								vCost = 3;
								mCost = 300;
								fCost = 350;

								vehicleType = "rhs_bmp2d_msv";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 10:
						{
							{
								vCost = 3;
								mCost = 400;
								fCost = 350;

								vehicleType = "rhs_bmp3_late_msv";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 11:
						{
							{
								vCost = 4;
								mCost = 400;
								fCost = 400;

								vehicleType = "rhs_t72bb_tv";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 12:
						{
							{
								vCost = 4;
								mCost = 450;
								fCost = 450;

								vehicleType = "rhs_t72bd_tv";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 13:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 200;

								vehicleType = "rhs_typhoon_vdv";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call vehicleSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
					};
				};			
			};
		};
	};

	_vehicles = [];

	switch (baseType) do {
		case "Army":
		{
			_vehicles =	[
				"ATV",
				"Prowler (unarmed)",
				"Humvee (M2)",
				"Humvee (Mk19)",
				"Humvee (unarmed)",
				"RG-33L (M2)",
				"RG-33L (Mk19)",
				"RG-33L (unarmed)",
				"M1083 MTV (M2)",
				"M1083 MTV (unarmed)",
				"M113 (M2)",
				"M113 (Mk19)",
				"M113 (unarmed)",
				"M2A3 Bradley (BUSK I)",
				"M2A3 Bradley (BUSK III)",
				"M1A2 Abrams (TUSK I)",
				"M1A2 Abrams (TUSK II)",
				"Utility Truck"
			];
		};
		
		case "Marines":
		{
			_vehicles =	[
				"ATV",
				"Prowler (unarmed)",
				"Humvee (M2)",
				"Humvee (Mk19)",
				"Humvee (unarmed)",
				"RG-33 (M2)",
				"RG-33 (unarmed)",
				"M1083 MTV (M2)",
				"M1083 MTV (unarmed)",
				"M113 (M2)",
				"M113 (Mk19)",
				"M113 (unarmed)",
				"M2A3 Bradley (BUSK I)",
				"M2A3 Bradley (BUSK III)",
				"M1A1 Abrams (HC)",
				"M1A1 Abrams (FEP)",
				"Utility Truck"
			];	
		};
		
		case "Nato":
		{
			_vehicles =	[
				"ATV",
				"Prowler (armed)",
				"Prowler (unarmed)",
				"M-ATV (HMG)",
				"M-ATV (GMG)",
				"M-ATV (unarmed)",
				"HEMTT",
				"Namer",
				"Badger",
				"Merkava Mk IV",
				"Utility Truck"
			];
		};
		
		case "AAF":
		{
			_vehicles =	[
				"ATV",
				"Prowler (unarmed)",
				"Fennek (HMG)",
				"Fennek (GMG)",
				"Fennek (unarmed)",
				"KamAZ",
				"Pandur II",
				"FV510 Warrior",
				"Leopard 2SG",
				"Utility Truck"
			];
		};
		
		case "Russia":
		{
			_vehicles =	[
				"ATV",
				"Qilin (unarmed)",
				"GAZ Tigr",
				"GAZ Tigr (armed)",
				"BRDM-2",
				"BRDM-2UM",
				"Kamaz 5350",
				"BTR-80",
				"BTR-80A",
				"BMP-2D",
				"BMP-3",
				"T-72B",
				"T-72B3",
				"Utility Truck"
			];
		};
	};
	
	disableSerialization;
	
	ID = clientOwner;
	publicVariableServer "ID";

	createDialog "InA_Garage_Dialog";
			
	waitUntil {!isNull (findDisplay 9999);};
			
	_ctrl = (findDisplay 9999) displayCtrl 1500;
			
	{
		_ctrl lbAdd _x;
	} forEach _vehicles;
	
	[clientOwner, "LogV"] remoteExec ["publicVariableClient", 2, false];
	[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];
	[clientOwner, "LogF"] remoteExec ["publicVariableClient", 2, false];
	
	sleep 0.2;
	
	ctrlSetText [1003, (format ["%1",LogV])];
	ctrlSetText [1004, (format ["%1",LogF])];
	ctrlSetText [1005, (format ["%1",LogM])];
	
	_ctrl lbSetCurSel 0;
};