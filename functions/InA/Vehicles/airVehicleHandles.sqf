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
							[[], "functions\InA\Vehicles\Hangar\Army\bluforArmyTransport1.sqf"] remoteExec ["execVM", 2];
						};

						case 1:
						{
							[[], "functions\InA\Vehicles\Hangar\Army\bluforArmyTransport2.sqf"] remoteExec ["execVM", 2];
						};

						case 2:
						{
							[[], "functions\InA\Vehicles\Hangar\Army\bluforArmyTransport3.sqf"] remoteExec ["execVM", 2];
						};
						
						case 3:
						{
							[[], "functions\InA\Vehicles\Hangar\Army\bluforArmyAH1.sqf"] remoteExec ["execVM", 2];
						};

						case 4:
						{
							[[], "functions\InA\Vehicles\Hangar\Army\bluforArmyAH2.sqf"] remoteExec ["execVM", 2];
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
							[[], "functions\InA\Vehicles\Hangar\Marines\bluforMarinesTransport1.sqf"] remoteExec ["execVM", 2];
						};

						case 1:
						{
							[[], "functions\InA\Vehicles\Hangar\Marines\bluforMarinesTransport2.sqf"] remoteExec ["execVM", 2];
						};

						case 2:
						{
							[[], "functions\InA\Vehicles\Hangar\Marines\bluforMarinesTransport3.sqf"] remoteExec ["execVM", 2];
						};
						
						case 3:
						{
							[[], "functions\InA\Vehicles\Hangar\Marines\bluforMarinesAH1.sqf"] remoteExec ["execVM", 2];
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
							[[], "functions\InA\Vehicles\Hangar\NATO\bluforNATOTransport1.sqf"] remoteExec ["execVM", 2];
						};

						case 1:
						{
							[[], "functions\InA\Vehicles\Hangar\NATO\bluforNATOTransport2.sqf"] remoteExec ["execVM", 2];
						};

						case 2:
						{
							[[], "functions\InA\Vehicles\Hangar\NATO\bluforNATOTransport3.sqf"] remoteExec ["execVM", 2];
						};
						
						case 3:
						{
							[[], "functions\InA\Vehicles\Hangar\NATO\bluforNATOAH1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 4:
						{
							[[], "functions\InA\Vehicles\Hangar\NATO\bluforNATOAH2.sqf"] remoteExec ["execVM", 2];
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
							[[], "functions\InA\Vehicles\Hangar\AAF\indAAFTransport1.sqf"] remoteExec ["execVM", 2];
						};

						case 1:
						{
							[[], "functions\InA\Vehicles\Hangar\AAF\indAAFTransport2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 2:
						{
							[[], "functions\InA\Vehicles\Hangar\AAF\indAAFAH1.sqf"] remoteExec ["execVM", 2];
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
							[[], "functions\InA\Vehicles\Hangar\Russia\opforRussiaTransport1.sqf"] remoteExec ["execVM", 2];
						};

						case 1:
						{
							[[], "functions\InA\Vehicles\Hangar\Russia\opforRussiaTransport2.sqf"] remoteExec ["execVM", 2];
						};

						case 2:
						{
							[[], "functions\InA\Vehicles\Hangar\Russia\opforRussiaTransport3.sqf"] remoteExec ["execVM", 2];
						};
						
						case 3:
						{
							[[], "functions\InA\Vehicles\Hangar\Russia\opforRussiaTransport4.sqf"] remoteExec ["execVM", 2];
						};
						
						case 4:
						{
							[[], "functions\InA\Vehicles\Hangar\Russia\opforRussiaAH1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 5:
						{
							[[], "functions\InA\Vehicles\Hangar\Russia\opforRussiaAH2.sqf"] remoteExec ["execVM", 2];
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