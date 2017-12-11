////////////////
// DEPRECATED //
////////////////

[] spawn {
	private ["_items","_ctrl"];

	[clientOwner, "initialized"] remoteExec ["publicVariableClient", 2, false];
	
	sleep 0.2;
		
	if (initialized) then {
		switch (baseType) do {

			case "Army":
			{			
				hangarResources = 
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
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "300"];
							ctrlSetText [1002, "0"];
						};

						case 1:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "400"];
							ctrlSetText [1002, "100"];
						};

						case 2:
						{
							ctrlSetText [1000, "6"];
							ctrlSetText [1001, "600"];
							ctrlSetText [1002, "100"];
						};
						
						case 3:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "300"];
							ctrlSetText [1002, "200"];
						};

						case 4:
						{
							ctrlSetText [1000, "4"];
							ctrlSetText [1001, "600"];
							ctrlSetText [1002, "450"];
						};
					};
				};

				hangarHandler = 
				{

					_id = _this select 0;

					switch (_id) do
					{
						case 0:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 300;

								vehicleType = "RHS_MELB_MH6M";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 1:
						{
							{
								vCost = 3;
								mCost = 100;
								fCost = 400;

								vehicleType = "RHS_UH60M";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 2:
						{
							{
								vCost = 6;
								mCost = 100;
								fCost = 600;

								vehicleType = "RHS_CH_47F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 3:
						{
							{
								vCost = 2;
								mCost = 200;
								fCost = 300;

								vehicleType = "RHS_MELB_AH6M_M";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 4:
						{
							{
								vCost = 4;
								mCost = 450;
								fCost = 600;

								vehicleType = "RHS_AH64D_wd";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
					};
				};
			};
			
			case "Marines":
			{	
				hangarResources = 
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
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "300"];
							ctrlSetText [1002, "0"];
						};

						case 1:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "300"];
							ctrlSetText [1002, "200"];
						};

						case 2:
						{
							ctrlSetText [1000, "6"];
							ctrlSetText [1001, "600"];
							ctrlSetText [1002, "0"];
						};
						
						case 3:
						{
							ctrlSetText [1000, "4"];
							ctrlSetText [1001, "600"];
							ctrlSetText [1002, "400"];
						};
					};
				};

				hangarHandler = 
				{

					_id = _this select 0;

					switch (_id) do
					{
						case 0:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 300;

								vehicleType = "RHS_UH1Y_UNARMED";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 1:
						{
							{
								vCost = 2;
								mCost = 200;
								fCost = 300;

								vehicleType = "RHS_UH1Y_GS";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 2:
						{
							{
								vCost = 6;
								mCost = 0;
								fCost = 600;

								vehicleType = "rhsusf_CH53E_USMC";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 3:
						{
							{
								vCost = 4;
								mCost = 400;
								fCost = 600;

								vehicleType = "RHS_AH1Z_wd";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
					};
				};				
			};
			
			case "Nato":
			{	
				hangarResources = 
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
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "300"];
							ctrlSetText [1002, "0"];
						};

						case 1:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "400"];
							ctrlSetText [1002, "100"];
						};

						case 2:
						{
							ctrlSetText [1000, "6"];
							ctrlSetText [1001, "600"];
							ctrlSetText [1002, "100"];
						};
						
						case 3:
						{
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "300"];
							ctrlSetText [1002, "200"];
						};
						
						case 4:
						{
							ctrlSetText [1000, "4"];
							ctrlSetText [1001, "600"];
							ctrlSetText [1002, "400"];
						};
					};
				};

				hangarHandler = 
				{

					_id = _this select 0;

					switch (_id) do
					{
						case 0:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 300;

								vehicleType = "B_Heli_Light_01_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 1:
						{
							{
								vCost = 3;
								mCost = 100;
								fCost = 400;

								vehicleType = "B_Heli_Transport_01_camo_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 2:
						{
							{
								vCost = 6;
								mCost = 100;
								fCost = 600;

								vehicleType = "B_Heli_Transport_03_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 3:
						{
							{
								vCost = 2;
								mCost = 200;
								fCost = 300;

								vehicleType = "B_Heli_Light_01_dynamicLoadout_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 4:
						{
							{
								vCost = 4;
								mCost = 400;
								fCost = 600;

								vehicleType = "B_Heli_Attack_01_dynamicLoadout_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
					};
				};					
			};
			
			case "AAF":
			{	
				hangarResources = 
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
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "400"];
							ctrlSetText [1002, "0"];
						};

						case 1:
						{
							ctrlSetText [1000, "6"];
							ctrlSetText [1001, "600"];
							ctrlSetText [1002, "0"];
						};

						case 2:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "400"];
							ctrlSetText [1002, "200"];
						};
					};
				};

				hangarHandler = 
				{

					_id = _this select 0;

					switch (_id) do
					{	
						case 0:
						{
							{
								vCost = 3;
								mCost = 0;
								fCost = 400;

								vehicleType = "I_Heli_light_03_unarmed_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 1:
						{
							{
								vCost = 6;
								mCost = 0;
								fCost = 600;

								vehicleType = "I_Heli_Transport_02_F";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 2:
						{
							{
								vCost = 3;
								mCost = 200;
								fCost = 400;

								vehicleType = "I_Heli_light_03_dynamicLoadout_f";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
					};
				};					
			};
			
			case "Russia":
			{
				hangarResources = 
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
							ctrlSetText [1000, "2"];
							ctrlSetText [1001, "300"];
							ctrlSetText [1002, "0"];
						};

						case 1:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "400"];
							ctrlSetText [1002, "300"];
						};

						case 2:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "400"];
							ctrlSetText [1002, "0"];
						};
						
						case 3:
						{
							ctrlSetText [1000, "3"];
							ctrlSetText [1001, "400"];
							ctrlSetText [1002, "300"];
						};
						
						case 4:
						{
							ctrlSetText [1000, "4"];
							ctrlSetText [1001, "600"];
							ctrlSetText [1002, "300"];
						};
						
						case 5:
						{
							ctrlSetText [1000, "4"];
							ctrlSetText [1001, "600"];
							ctrlSetText [1002, "400"];
						};
					};
				};

				hangarHandler = 
				{

					_id = _this select 0;

					switch (_id) do
					{
						case 0:
						{
							{
								vCost = 2;
								mCost = 0;
								fCost = 300;

								vehicleType = "rhs_ka60_c";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 1:
						{
							{
								vCost = 3;
								mCost = 300;
								fCost = 400;

								vehicleType = "RHS_Mi24P_CAS_vvsc";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};

						case 2:
						{
							{
								vCost = 3;
								mCost = 0;
								fCost = 400;

								vehicleType = "RHS_Mi8AMT_vvsc";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 3:
						{
							{
								vCost = 3;
								mCost = 300;
								fCost = 400;

								vehicleType = "RHS_Mi8AMTSh_vvsc";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 4:
						{
							{
								vCost = 4;
								mCost = 300;
								fCost = 600;

								vehicleType = "RHS_Ka52_vvsc";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
							} remoteExec ["BIS_fnc_call", 2];
						};
						
						case 5:
						{
							{
								vCost = 4;
								mCost = 400;
								fCost = 600;

								vehicleType = "rhs_mi28n_vvsc";
								vehiclePaint = true;
								vehicleAnim = true;
								isUtility = false;

								call airSpawn; 
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
				"MH-6M Little Bird",
				"UH-60M Black Hawk",
				"CH-47F Chinook",
				"AH-6M-M Little Bird",
				"AH-64D Apache"
			];
		};
		
		case "Marines":
		{
			_vehicles =	[
				"UH-1Y Venom (unarmed)",
				"UH-1Y Venom (armed)",
				"CH-53E Super Stallion",
				"AH-1Z Viper"
			];
		};
		
		case "Nato":
		{
			_vehicles =	[
				"MH-6 Little Bird",
				"UH-80 Ghost Hawk",
				"CH-47I Chinook",
				"AH-9 Pawnee",
				"AH-99 Blackfoot"
			];
		};
		
		case "AAF":
		{
			_vehicles =	[
				"AW159 Wildcat",
				"AW101 Merlin",
				"WY-55 Hellcat"
			];
		};
		
		case "Russia":
		{
			_vehicles =	[
				"Ka-60 Kasatka",
				"Mi-24P Hind",
				"Mi-8AMT Hip",
				"Mi-8AMTSh Hip",
				"Ka-52 Alligator",
				"Mi-28 Havoc"
			];
		};
	};
	
	disableSerialization;
	
	ID = clientOwner;
	publicVariableServer "ID";

	createDialog "InA_Hangar_Dialog";
			
	waitUntil {!isNull (findDisplay 8999);};
			
	_ctrl = (findDisplay 8999) displayCtrl 1500;
			
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