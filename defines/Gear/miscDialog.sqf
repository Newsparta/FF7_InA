private ["_value","_itemType","_item","_id","_ctrl","_slider"];
// ---------- Requisition and display updates ----------

gearSliderChange =
{
	disableSerialization;

	_value = _this select 0;

	Amount = round (_value);
	ctrlSetText [1000,(format ["%1",round (_value)])];

	Cost = (Amount * Multiplier);
	ctrlSetText [1001,(format ["%1",Cost])];
};
lbSelCost =
{
	disableSerialization;
	
	Cost = (Amount * Multiplier);
	ctrlSetText [1001,(format ["%1",Cost])];
};
itemCostCheck = 
{
	[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];
	
	sleep 0.2;
	
	if (LogM >= Cost) then {
		
		switch (_itemType) do
		{
			case "medical":
			{
				[medicalCrate, [_item, Amount]] remoteExec ["addItemCargoGlobal", 2];
			};
			case "other":
			{
				[GearDump, [_item, Amount]] remoteExec ["addItemCargoGlobal", 2];
			};
		};
		
		LogM = (LogM - Cost);
		
		publicVariableServer "LogM";
		
		ctrlSetText [1002, (format ["%1",LogM])];	

		["Headquarters", "item(s) Requisitioned."] call FF7_fnc_formatHint;
	} else {
		["Headquarters", "Not enough Supplies."] call FF7_fnc_formatHint;
	};
};
backpackCostCheck = 
{
	[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];
	
	sleep 0.2;
	
	if (LogM >= Cost) then {
	
		[GearDump, [_item, Amount]] remoteExec ["addBackpackCargoGlobal", 2];
		
		LogM = (LogM - Cost);
		
		publicVariableServer "LogM";
		
		ctrlSetText [1002, (format ["%1",LogM])];	

		["Headquarters", "item(s) Requisitioned."] call FF7_fnc_formatHint;
	} else {
		["Headquarters", "Not enough Supplies."] call FF7_fnc_formatHint;
	};
};
boatCostCheck = 
{
	[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];

	sleep 0.2;
	
	if (LogM >= Cost) then {
	
		{
			_box = createVehicle ["Box_NATO_Support_F", (getMarkerPos "boatSpawn"), [], 0, "CAN_COLLIDE"];
			clearItemCargoGlobal _box;
			clearMagazineCargoGlobal _box;
			clearWeaponCargoGlobal _box;
			clearBackpackCargoGlobal _box;
			
		} remoteExec ["BIS_fnc_call", 2];
		
		LogM = (LogM - Cost);
		
		publicVariableServer "LogM";
		
		ctrlSetText [1002, (format ["%1",LogM])];	

		["Headquarters", "_item(s) Requisitioned."] call FF7_fnc_formatHint;
	} else {
		["Headquarters", "Not enough Supplies."] call FF7_fnc_formatHint;
	};
};

engineerCostCheck = 
{
	[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];

	sleep 0.2;
	
	if (LogM >= Cost) then {
	
		{
			_pos = [getPosATL resupplyPad1, 10, 20, 1, 0, 1, 0] call BIS_fnc_findSafePos;
			_box = createVehicle ["B_Slingload_01_Repair_F", _pos, [], 0, "CAN_COLLIDE"];
			_box setMass 3500;
			clearItemCargoGlobal _box;
			clearMagazineCargoGlobal _box;
			clearWeaponCargoGlobal _box;
			clearBackpackCargoGlobal _box;

			utilityVehicles pushBack _box;
			
		} remoteExec ["BIS_fnc_call", 2];
		
		LogM = (LogM - Cost);
		
		publicVariableServer "LogM";
		
		ctrlSetText [1002, (format ["%1",LogM])];	

		["Headquarters", "_item(s) Requisitioned."] call FF7_fnc_formatHint;
	} else {
		["Headquarters", "Not enough Supplies."] call FF7_fnc_formatHint;
	};
};

// ---------- _item information ----------

gearItemChange = 
{

	switch (supplier) do {
	
		case "OPF":
		
		{
			_id = _this select 0;

			switch (_id) do {
			
				case 0:
				{
					// Boat
					Multiplier = 50;
				};
				
				case 1:
				{
					// Bandage
					Multiplier = 0.05;
				};
				
				case 2:
				{
					// Morphine
					Multiplier = 0.05;
				};
				
				case 3:
				{
					// Earplugs
					Multiplier = 0;
				};
				
				case 4:
				{
					// Epinephrine
					Multiplier = 0.25;
				};
				
				case 5:
				{
					// Blood IV 1000
					Multiplier = 1;
				};
				
				case 6:
				{
					// Blood IV 500
					Multiplier = 0.5;
				};
				
				case 7:
				{
					// Blood IV 250
					Multiplier = 0.25;
				};
				
				case 8:
				{
					// ANPRC 152 Radio
					Multiplier = 50;
				};
				
				case 9:
				{
					// RT-1523G Radio
					Multiplier = 50;
				};
				
				case 10:
				{
					// Map
					Multiplier = 20;
				};
				
				case 11:
				{
					// Compass
					Multiplier = 10;
				};
				
				case 12:
				{
					// GPS
					Multiplier = 100;
				};
				
				case 13:
				{
					// Watch
					Multiplier = 0;
				};
				
				case 14:
				{
					// Binocular
					Multiplier = 0;
				};
				
				case 15:
				{
					// Rangefinder
					Multiplier = 100;
				};
				
				case 16:
				{
					// Laser Designator
					Multiplier = 100;
				};
				
				case 17:
				{
					// NVG's
					Multiplier = 50;
				};
				
				case 18:
				{
					// ACO
					Multiplier = 0.1;
				};
				
				case 19:
				{
					// M68 CCO
					Multiplier = 0.1;
				};
				
				case 20:
				{
					// Barska
					Multiplier = 0.1;
				};
				
				case 21:
				{
					// Eotech 553
					Multiplier = 0.1;
				};
				
				case 22:
				{
					// Eotech 553 3x
					Multiplier = 10;
				};
				
				case 23:
				{
					// RCO
					Multiplier = 20;
				};
				
				case 24:
				{
					// ERCO
					Multiplier = 20;
				};
				
				case 25:
				{
					// MGO
					Multiplier = 20;
				};
				
				case 26:
				{
					// ACOG
					Multiplier = 20;
				};
				
				case 27:
				{
					// MOS
					Multiplier = 20;
				};
				
				case 28:
				{
					// Kahlia
					Multiplier = 25;
				};
				
				case 29:
				{
					// LRPS
					Multiplier = 30;
				};
				
				case 30:
				{
					// AFG Grip
					Multiplier = 0;
				};
				
				case 31:
				{
					// Vertical Grip
					Multiplier = 0;
				};
				
				case 32:
				{
					// Laser Pointer
					Multiplier = 0;
				};
				
				case 33:
				{
					// Flashlight
					Multiplier = 0;
				};
				
				case 34:
				{
					// 5.56mm SS
					Multiplier = 10;
				};
				
				case 35:
				{
					// Bipod
					Multiplier = 0;
				};
				
				case 36:
				{
					// Spare Barrel
					Multiplier = 1;
				};
				
				case 37:
				{
					// Cable Tie
					Multiplier = 0;
				};
				case 38:
				{
					// Map Light
					Multiplier = 0;
				};
				
				case 39:
				{
					// Map Tools
					Multiplier = 0;
				};
				
				case 40:
				{
					// HuntIR
					Multiplier = 50;
				};
				
				case 41:
				{
					// Entrenching tool
					Multiplier = 0;
				};
				
				case 42:
				{
					// Strobe
					Multiplier = 0;
				};
				
				case 43:
				{
					// Toolkit
					Multiplier = 20;
				};
				
				case 44:
				{
					// Wirecutter
					Multiplier = 10;
				};
				
				case 45:
				{
					// Difusal Kit
					Multiplier = 10;
				};
				
				case 46:
				{
					// Mine Detector
					Multiplier = 100;
				};
				
				case 47:
				{
					// M152 Firing Device
					Multiplier = 0.1;
				};
				
				case 48:
				{
					// M57 Firing Device
					Multiplier = 0.1;
				};
				
				case 49:
				{
					// Kestrel
					Multiplier = 10;
				};
				
				case 50:
				{
					// ATragMX
					Multiplier = 20;
				};
				
				case 51:
				{
					// Range Card
					Multiplier = 0;
				};
				
				case 52:
				{
					// Backpack small
					Multiplier = 10;
				};
				
				case 53:
				{
					// Backpack medium
					Multiplier = 20;
				};
				
				case 54:
				{
					// Backpack large
					Multiplier = 30;
				};
				
				case 55:
				{
					// Engineer Kit
					Multiplier = 20;
				};
			};
		};
		
		case "BLU":
		
		{
			_id = _this select 0;

			switch (_id) do {
			
				case 0:
				{
					// Boat
					Multiplier = 50;
				};
				
				case 1:
				{
					// Bandage
					Multiplier = 0.05;
				};
				
				case 2:
				{
					// Morphine
					Multiplier = 0.05;
				};
				
				case 3:
				{
					// Earplugs
					Multiplier = 0;
				};
				
				case 4:
				{
					// Epinephrine
					Multiplier = 0.25;
				};
				
				case 5:
				{
					// Blood IV 1000
					Multiplier = 1;
				};
				
				case 6:
				{
					// Blood IV 500
					Multiplier = 0.5;
				};
				
				case 7:
				{
					// Blood IV 250
					Multiplier = 0.25;
				};
				
				case 8:
				{
					// ANPRC 152 Radio
					Multiplier = 50;
				};
				
				case 9:
				{
					// RT-1523G Radio
					Multiplier = 50;
				};
				
				case 10:
				{
					// Map
					Multiplier = 20;
				};
				
				case 11:
				{
					// Compass
					Multiplier = 10;
				};
				
				case 12:
				{
					// GPS
					Multiplier = 100;
				};
				
				case 13:
				{
					// Watch
					Multiplier = 0;
				};
				
				case 14:
				{
					// Binocular
					Multiplier = 0;
				};
				
				case 15:
				{
					// Rangefinder
					Multiplier = 100;
				};
				
				case 16:
				{
					// Laser Designator
					Multiplier = 100;
				};
				
				case 17:
				{
					// NVG's
					Multiplier = 50;
				};
				
				case 18:
				{
					// ACO
					Multiplier = 0.1;
				};
				
				case 19:
				{
					// Rakurs PM
					Multiplier = 0.1;
				};
				
				case 20:
				{
					// Barska
					Multiplier = 0.1;
				};
				
				case 21:
				{
					// 1P63
					Multiplier = 0.1;
				};
				
				case 22:
				{
					// MRCO
					Multiplier = 20;
				};
				
				case 23:
				{
					// ARCO
					Multiplier = 20;
				};
				
				case 24:
				{
					// MOS
					Multiplier = 20;
				};
				
				case 25:
				{
					// Kahlia
					Multiplier = 25;
				};
				
				case 26:
				{
					// LRPS
					Multiplier = 30;
				};
				
				case 27:
				{
					// Vertical Grip
					Multiplier = 0;
				};
				
				case 28:
				{
					// Laser Pointer
					Multiplier = 0;
				};
				
				case 29:
				{
					// Flashlight
					Multiplier = 0;
				};
				
				case 30:
				{
					// 5.45mm SS
					Multiplier = 10;
				};
				
				case 31:
				{
					// Bipod
					Multiplier = 0;
				};
				
				case 32:
				{
					// Spare Barrel
					Multiplier = 1;
				};
				
				case 33:
				{
					// Cable Tie
					Multiplier = 0;
				};
				case 34:
				{
					// Map Light
					Multiplier = 0;
				};
				
				case 35:
				{
					// Map Tools
					Multiplier = 0;
				};
				
				case 36:
				{
					// HuntIR
					Multiplier = 50;
				};
				
				case 37:
				{
					// Entrenching tool
					Multiplier = 0;
				};
				
				case 38:
				{
					// Strobe
					Multiplier = 0;
				};
				
				case 39:
				{
					// Toolkit
					Multiplier = 20;
				};
				
				case 40:
				{
					// Wirecutter
					Multiplier = 10;
				};
				
				case 41:
				{
					// Difusal Kit
					Multiplier = 10;
				};
				
				case 42:
				{
					// Mine Detector
					Multiplier = 100;
				};
				
				case 43:
				{
					// M152 Firing Device
					Multiplier = 0.1;
				};
				
				case 44:
				{
					// Kestrel
					Multiplier = 10;
				};
				
				case 45:
				{
					// ATragMX
					Multiplier = 20;
				};
				
				case 46:
				{
					// Range Card
					Multiplier = 0;
				};
				
				case 47:
				{
					// Backpack small
					Multiplier = 10;
				};
				
				case 48:
				{
					// Backpack medium
					Multiplier = 20;
				};
				
				case 49:
				{
					// Backpack large
					Multiplier = 30;
				};
				
				case 50:
				{
					// Engineer Kit
					Multiplier = 20;
				};
			};
		};
	};
};
gearRequisition = 
{

	switch (supplier) do {
	
		case "OPF":
		
		{
			_id = _this select 0;

			switch (_id) do {
				case 0:
				{
					call boatCostCheck;
				};
				
				case 1:
				{
					_item = "ACE_fieldDressing";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 2:
				{
					_item = "ACE_morphine";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 3:
				{
					_item = "ACE_EarPlugs";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 4:
				{
					_item = "ACE_epinephrine";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 5:
				{
					_item = "ACE_bloodIV";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 6:
				{
					_item = "ACE_bloodIV_500";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 7:
				{
					_item = "ACE_bloodIV_250";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 8:
				{
					_item = "tf_anprc152";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 9:
				{
					_item = "tfw_ilbe_gr";
					_itemType = "other";
					call backpackCostCheck;
				};
				
				case 10:
				{
					_item = "ItemMap";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 11:
				{
					_item = "ItemCompass";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 12:
				{
					_item = "ItemGPS";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 13:
				{
					_item = "ItemWatch";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 14:
				{
					_item = "Binocular";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 15:
				{
					_item = "ACE_VectorDay";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 16:
				{
					_item = "Laserdesignator_01_khk_F";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 17:
				{
					_item = "ACE_NVG_Wide";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 18:
				{
					_item = "optic_Aco";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 19:
				{
					_item = "rhsusf_acc_compm4";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 20:
				{
					_item = "RH_barska_rds";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 21:
				{
					_item = "RH_eotech553";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 22:
				{
					_item = "RH_eotech553mag";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 23:
				{
					_item = "optic_Hamr";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 24:
				{
					_item = "optic_ERCO_blk_F";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 25:
				{
					_item = "rhsusf_acc_ELCAN";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 26:
				{
					_item = "RH_ta31rmr";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 27:
				{
					_item = "optic_SOS";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 28:
				{
					_item = "optic_KHS_blk";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 29:
				{
					_item = "optic_LRPS";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 30:
				{
					_item = "rhsusf_acc_grip2";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 31:
				{
					_item = "rhsusf_acc_grip3";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 32:
				{
					_item = "acc_pointer_IR";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 33:
				{
					_item = "RH_SFM952V";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 34:
				{
					_item = "rhsusf_acc_nt4_black";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 35:
				{
					_item = "bipod_01_F_blk";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 36:
				{
					_item = "ACE_SpareBarrel";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 37:
				{
					_item = "ACE_CableTie";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 38:
				{
					_item = "ACE_Flashlight_XL50";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 39:
				{
					_item = "ACE_MapTools";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 40:
				{
					_item = "ACE_HuntIR_monitor";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 41:
				{
					_item = "ACE_EntrenchingTool";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 42:
				{
					_item = "ACE_IR_Strobe_Item";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 43:
				{
					_item = "ToolKit";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 44:
				{
					_item = "ACE_wirecutter";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 45:
				{
					_item = "ACE_DefusalKit";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 46:
				{
					_item = "MineDetector";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 47:
				{
					_item = "ACE_M26_Clacker";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 48:
				{
					_item = "ACE_Clacker";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 49:
				{
					_item = "ACE_Kestrel4500";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 50:
				{
					_item = "ACE_ATragMX";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 51:
				{
					_item = "ACE_RangeCard";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 52:
				{
					_item = "VSM_OGA_OD_Backpack_Compact";
					_itemType = "other";
					call backpackCostCheck;
				};
				
				case 53:
				{
					_item = "VSM_OGA_OD_Backpack_Kitbag";
					_itemType = "other";
					call backpackCostCheck;
				};
				
				case 54:
				{
					_item = "VSM_OGA_OD_carryall";
					_itemType = "other";
					call backpackCostCheck;
				};
				
				case 55:
				{
					call engineerCostCheck;
				};
			};
		};
		
		case "BLU":
		
		{
			_id = _this select 0;

			switch (_id) do {
				case 0:
				{
					call boatCostCheck;
				};
				
				case 1:
				{
					_item = "ACE_fieldDressing";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 2:
				{
					_item = "ACE_morphine";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 3:
				{
					_item = "ACE_EarPlugs";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 4:
				{
					_item = "ACE_epinephrine";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 5:
				{
					_item = "ACE_bloodIV";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 6:
				{
					_item = "ACE_bloodIV_500";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 7:
				{
					_item = "ACE_bloodIV_250";
					_itemType = "medical";
					call itemCostCheck;
				};
				
				case 8:
				{
					_item = "tf_anprc152";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 9:
				{
					_item = "tfw_ilbe_gr";
					_itemType = "other";
					call backpackCostCheck;
				};
				
				case 10:
				{
					_item = "ItemMap";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 11:
				{
					_item = "ItemCompass";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 12:
				{
					_item = "ItemGPS";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 13:
				{
					_item = "ItemWatch";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 14:
				{
					_item = "Binocular";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 15:
				{
					_item = "ACE_VectorDay";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 16:
				{
					_item = "Laserdesignator_01_khk_F";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 17:
				{
					_item = "ACE_NVG_Wide";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 18:
				{
					_item = "optic_ACO_grn";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 19:
				{
					_item = "rhs_acc_rakursPM";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 20:
				{
					_item = "RH_barska_rds";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 21:
				{
					_item = "rhs_acc_1p63";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 22:
				{
					_item = "optic_MRCO";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 23:
				{
					_item = "optic_Arco_blk_F";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 24:
				{
					_item = "optic_SOS";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 25:
				{
					_item = "optic_KHS_blk";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 26:
				{
					_item = "optic_LRPS";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 27:
				{
					_item = "rhs_acc_grip_ffg2";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 28:
				{
					_item = "acc_pointer_IR";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 29:
				{
					_item = "RH_SFM952V";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 30:
				{
					_item = "rhs_acc_dtk4short";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 31:
				{
					_item = "bipod_01_F_blk";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 32:
				{
					_item = "ACE_SpareBarrel";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 33:
				{
					_item = "ACE_CableTie";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 34:
				{
					_item = "ACE_Flashlight_XL50";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 35:
				{
					_item = "ACE_MapTools";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 36:
				{
					_item = "ACE_HuntIR_monitor";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 37:
				{
					_item = "ACE_EntrenchingTool";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 38:
				{
					_item = "ACE_IR_Strobe_Item";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 39:
				{
					_item = "ToolKit";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 40:
				{
					_item = "ACE_wirecutter";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 41:
				{
					_item = "ACE_DefusalKit";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 42:
				{
					_item = "MineDetector";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 43:
				{
					_item = "ACE_M26_Clacker";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 44:
				{
					_item = "ACE_Kestrel4500";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 45:
				{
					_item = "ACE_ATragMX";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 46:
				{
					_item = "ACE_RangeCard";
					_itemType = "other";
					call itemCostCheck;
				};
				
				case 47:
				{
					_item = "VSM_OGA_OD_Backpack_Compact";
					_itemType = "other";
					call backpackCostCheck;
				};
				
				case 48:
				{
					_item = "VSM_OGA_OD_Backpack_Kitbag";
					_itemType = "other";
					call backpackCostCheck;
				};
				
				case 49:
				{
					_item = "VSM_OGA_OD_carryall";
					_itemType = "other";
					call backpackCostCheck;
				};
				
				case 50:
				{
					call engineerCostCheck;
				};
			};
		};
	};
};

_items = [];

switch (supplier) do {
	
	case "OPF":
		
	{
		_items = [
			"Assault Boat (disassembled)",
			"Bandage",
			"Morphine",
			"Earplugs",
			"Epinephrine",
			"Blood IV (1000mL)",
			"Blood IV (500mL)",
			"Blood IV (250mL)",
			"AN PRC 152 Radio",
			"RT-1523G Radio",
			"Map",
			"Compass",
			"GPS",
			"Watch",
			"Binocular",
			"Rangefinder",
			"Laser Designator",
			"Night Vision Goggles",
			"[Optic 1x] ACO",
			"[Optic 1x] M68 CCO",
			"[Optic 1x] Barska RDS",
			"[Optic 1x] Eotech 553",
			"[Optic 3x] Eotech 553 mag",
			"[Optic 4x] RCO",
			"[Optic 4x] ERCO",
			"[Optic 4x] M145 MGO",
			"[Optic 4x] ACOG",
			"[Optic 5x] MOS",
			"[Optic 11x] Kahlia",
			"[Optic 25x] LRPS",
			"[Acc] AFG Grip",
			"[Acc] Vertical Grip",
			"[Acc] Laser Pointer",
			"[Acc] Flashlight",
			"[Acc] 5.56mm Sound Suppressor",
			"[Acc] Bipod",
			"Spare Barrel",
			"Cable Tie",
			"Map Light",
			"Map Tools",
			"HuntIR Monitor",
			"Entrenching Tool",
			"IR Strobe",
			"Tool Kit",
			"Wirecutter",
			"Difusal Kit",
			"Mine Detector",
			"M152 Firing Device",
			"M57 Firing Device",
			"Kestrel 4500",
			"ATragMX",
			"Range Card",
			"[Backpack] Compact",
			"[Backpack] Kitbag",
			"[Backpack] Carryall",
			"Engineering Kit"
		];
	};
	
	case "BLU":
		
	{
		_items = [
			"Assault Boat (disassembled)",
			"Bandage",
			"Morphine",
			"Earplugs",
			"Epinephrine",
			"Blood IV (1000mL)",
			"Blood IV (500mL)",
			"Blood IV (250mL)",
			"AN PRC 152 Radio",
			"RT-1523G Radio",
			"Map",
			"Compass",
			"GPS",
			"Watch",
			"Binocular",
			"Rangefinder",
			"Laser Designator",
			"Night Vision Goggles",
			"[Optic 1x] ACO",
			"[Optic 1x] 1P76",
			"[Optic 1x] Barksa RDS",
			"[Optic 1x] 1P63",
			"[Optic 4x] MRCO",
			"[Optic 4x] ARCO",
			"[Optic 5x] MOS",
			"[Optic 11x] Kahlia",
			"[Optic 25x] LRPS",
			"[Acc] Vertical Grip",
			"[Acc] Laser Pointer",
			"[Acc] Flashlight",
			"[Acc] 5.45mm Sound Suppressor",
			"[Acc] Bipod",
			"Spare Barrel",
			"Cable Tie",
			"Map Light",
			"Map Tools",
			"HuntIR Monitor",
			"Entrenching Tool",
			"IR Strobe",
			"Tool Kit",
			"Wirecutter",
			"Difusal Kit",
			"Mine Detector",
			"M152 Firing Device",
			"Kestrel 4500",
			"ATragMX",
			"Range Card",
			"[Backpack] Compact",
			"[Backpack] Kitbag",
			"[Backpack] Carryall",
			"Engineering Kit"
		];
	};
};

// ---------- Create dialog ----------

disableSerialization;

createDialog "InA_Gear_Dialog";

waitUntil {!isNull (findDisplay 9200);};

_ctrl = (findDisplay 9200) displayCtrl 1500;

{
	_ctrl lbAdd _x;
} forEach _items;

_slider = (findDisplay 9200) displayCtrl 1900;
_slider sliderSetRange [1, 50];
_slider slidersetSpeed [1, 1];
Amount = 1;
_ctrl lbSetCurSel 0;