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
							ctrlSetText [1000, "1"];
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
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyATV1.sqf"] remoteExec ["execVM", 2];
						};

						case 1:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyTech1.sqf"] remoteExec ["execVM", 2];;
						};
						
						case 2:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyCar1.sqf"] remoteExec ["execVM", 2];
						};

						case 3:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyCar2.sqf"] remoteExec ["execVM", 2];;
						};

						case 4:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyCar3.sqf"] remoteExec ["execVM", 2];;
						};
						
						case 5:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyMRAP1.sqf"] remoteExec ["execVM", 2];;
						};

						case 6:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyMRAP2.sqf"] remoteExec ["execVM", 2];;
						};

						case 7:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyMRAP3.sqf"] remoteExec ["execVM", 2];;
						};
						
						case 8:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyTruck1.sqf"] remoteExec ["execVM", 2];;
						};

						case 9:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyTruck2.sqf"] remoteExec ["execVM", 2];;
						};
						
						case 10:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyAPC1.sqf"] remoteExec ["execVM", 2];;
						};
						
						case 11:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyAPC2.sqf"] remoteExec ["execVM", 2];;
						};

						case 12:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyAPC3.sqf"] remoteExec ["execVM", 2];;
						};
						
						case 13:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyIFV1.sqf"] remoteExec ["execVM", 2];;
						};

						case 14:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyIFV2.sqf"] remoteExec ["execVM", 2];;
						};
						
						case 15:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyTank1.sqf"] remoteExec ["execVM", 2];;
						};

						case 16:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyTank2.sqf"] remoteExec ["execVM", 2];;
						};
						
						case 17:
						{
							[[], "functions\InA\Vehicles\Garage\Army\bluforArmyUtility1.sqf"] remoteExec ["execVM", 2];
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
							ctrlSetText [1000, "1"];
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
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesATV1.sqf"] remoteExec ["execVM", 2];
						};

						case 1:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesTech1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 2:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesCar1.sqf"] remoteExec ["execVM", 2];
						};

						case 3:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesCar2.sqf"] remoteExec ["execVM", 2];
						};

						case 4:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesCar3.sqf"] remoteExec ["execVM", 2];
						};
						
						case 5:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesMRAP1.sqf"] remoteExec ["execVM", 2];
						};

						case 6:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesMRAP2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 7:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesTruck1.sqf"] remoteExec ["execVM", 2];
						};

						case 8:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesTruck2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 9:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesAPC1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 10:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesAPC2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 11:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesAPC3.sqf"] remoteExec ["execVM", 2];
						};
						
						case 12:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesIFV1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 13:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesIFV2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 14:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesTank1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 15:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesTank2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 16:
						{
							[[], "functions\InA\Vehicles\Garage\Marines\bluforMarinesUtility1.sqf"] remoteExec ["execVM", 2];
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
							ctrlSetText [1000, "1"];
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
							[[], "functions\InA\Vehicles\Garage\NATO\bluforNATOATV1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 1:
						{
							[[], "functions\InA\Vehicles\Garage\NATO\bluforNATOCar1.sqf"] remoteExec ["execVM", 2];
						};

						case 2:
						{
							[[], "functions\InA\Vehicles\Garage\NATO\bluforNATOCar2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 3:
						{
							[[], "functions\InA\Vehicles\Garage\NATO\bluforNATOMRAP1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 4:
						{
							[[], "functions\InA\Vehicles\Garage\NATO\bluforNATOMRAP2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 5:
						{
							[[], "functions\InA\Vehicles\Garage\NATO\bluforNATOMRAP3.sqf"] remoteExec ["execVM", 2];
						};
						
						case 6:
						{
							[[], "functions\InA\Vehicles\Garage\NATO\bluforNATOTruck1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 7:
						{
							[[], "functions\InA\Vehicles\Garage\NATO\bluforNATOAPC1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 8:
						{
							[[], "functions\InA\Vehicles\Garage\NATO\bluforNATOIFV1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 9:
						{
							[[], "functions\InA\Vehicles\Garage\NATO\bluforNATOTank1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 10:
						{
							[[], "functions\InA\Vehicles\Garage\NATO\bluforNATOUtility1.sqf"] remoteExec ["execVM", 2];
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
							ctrlSetText [1000, "1"];
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
							[[], "functions\InA\Vehicles\Garage\AAF\indAAFATV1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 1:
						{
							[[], "functions\InA\Vehicles\Garage\AAF\indAAFTech1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 2:
						{
							[[], "functions\InA\Vehicles\Garage\AAF\indAAFMRAP1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 3:
						{
							[[], "functions\InA\Vehicles\Garage\AAF\indAAFMRAP2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 4:
						{
							[[], "functions\InA\Vehicles\Garage\AAF\indAAFMRAP3.sqf"] remoteExec ["execVM", 2];
						};
						
						case 5:
						{
							[[], "functions\InA\Vehicles\Garage\AAF\indAAFTruck1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 6:
						{
							[[], "functions\InA\Vehicles\Garage\AAF\indAAFAPC1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 7:
						{
							[[], "functions\InA\Vehicles\Garage\AAF\indAAFIFV1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 8:
						{
							[[], "functions\InA\Vehicles\Garage\AAF\indAAFTank1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 9:
						{
							[[], "functions\InA\Vehicles\Garage\AAF\indAAFUtility1.sqf"] remoteExec ["execVM", 2];
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
							ctrlSetText [1000, "1"];
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
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaATV1.sqf"] remoteExec ["execVM", 2];
						};

						case 1:
						{
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaTech1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 2:
						{
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaCar1.sqf"] remoteExec ["execVM", 2];
						};

						case 3:
						{
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaCar2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 4:
						{
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaMRAP1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 5:
						{
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaMRAP2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 6:
						{
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaTruck1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 7:
						{
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaAPC1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 8:
						{
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaAPC2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 9:
						{
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaIFV1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 10:
						{
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaIFV2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 11:
						{
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaTank1.sqf"] remoteExec ["execVM", 2];
						};
						
						case 12:
						{
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaTank2.sqf"] remoteExec ["execVM", 2];
						};
						
						case 13:
						{
							[[], "functions\InA\Vehicles\Garage\Russia\opforRussiaUtility1.sqf"] remoteExec ["execVM", 2];
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