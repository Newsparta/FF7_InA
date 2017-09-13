private ["_id","_ctrl","_items"];
// ---------- Item information ----------

equipUniform = 
{
	_id = _this select 0;
	
	switch (baseType) do {
	
		case "Army":
		{
			switch (_id) do {
			
				case 0:
				{
					player addVest "VSM_FAPC_Breacher_Multicam";
				};
				
				case 1:
				{
					player addVest "VSM_FAPC_MG_Multicam";
				};
				
				case 2:
				{
					player addVest "VSM_FAPC_Operator_Multicam";
				};
				
				case 3:
				{
					player addVest "VSM_LBT6094_breacher_multicam";
				};
				
				case 4:
				{
					player addVest "VSM_LBT6094_operator_multicam";
				};
				
				case 5:
				{
					player addVest "VSM_RAV_Breacher_Multicam";
				};
				
				case 6:
				{
					player addVest "VSM_RAV_MG_Multicam";
				};
				
				case 7:
				{
					player addVest "VSM_RAV_operator_Multicam";
				};
			};
		};
		
		case "Marines":
		{
			switch (_id) do {
			
				case 0:
				{
					player addVest "rhsusf_spc_corpsman";
				};
				
				case 1:
				{
					player addVest "rhsusf_spc_iar";
				};
				
				case 2:
				{
					player addVest "rhsusf_spc_light";
				};
				
				case 3:
				{
					player addVest "rhsusf_spc_mg";
				};
				
				case 4:
				{
					player addVest "rhsusf_spc_rifleman";
				};
			};
		};
		
		case "Nato":
		{
			switch (_id) do {
			
				case 0:
				{
					player addVest "MNP_Vest_Scorpion_1";
				};
				
				case 1:
				{
					player addVest "MNP_Vest_Scorpion_2";
				};
				
				case 2:
				{
					player addVest "V_PlateCarrierL_CTRG";
				};
				
				case 3:
				{
					player addVest "V_PlateCarrierH_CTRG";
				};

				case 4:
				{
					player addVest "MNP_Vest_Germany";
				};

				case 5:
				{
					player addVest "MNP_Vest_Germany_2";
				};

				case 6:
				{
					player addVest "MNP_Vest_Canada_T";
				};

				case 7:
				{
					player addVest "MNP_Vest_Canada_T2";
				};

				case 8:
				{
					player addVest "MNP_Vest_NOR_1";
				};

				case 9:
				{
					player addVest "MNP_Vest_NOR_2";
				};

				case 10:
				{
					player addVest "MNP_Vest_FIN_1";
				};

				case 11:
				{
					player addVest "MNP_Vest_FIN_2";
				};

				case 12:
				{
					player addVest "MNP_Vest_Australia";
				};

				case 13:
				{
					player addVest "MNP_Vest_Australia_B";
				};
			};
		};
		
		case "AAF":
		{
			switch (_id) do {
			
				case 0:
				{
					player addVest "V_PlateCarrierIA1_dgtl";
				};
				
				case 1:
				{
					player addVest "V_PlateCarrierIA2_dgtl";
				};
				
				case 2:
				{
					player addVest "V_PlateCarrierIAGL_dgtl";
				};
			};
		};
		
		case "Russia":
		{
			switch (_id) do {
			
				case 0:
				{
					player addVest "rhs_6b23_6sh116";
				};
				
				case 1:
				{
					player addVest "rhs_6b23_6sh116_vog";
				};
				
				case 2:
				{
					player addVest "rhs_6b23_digi_6sh92";
				};
				
				case 3:
				{
					player addVest "rhs_6b23_digi_6sh92_spetsnaz2";
				};
				
				case 4:
				{
					player addVest "rhs_6b23_digi_6sh92_Vog_Spetsnaz";
				};
			};
		};
	};
};

_items = [];

switch (baseType) do {

	case "Army":
	{
		_items = [
			"FAPC (Breacher)",
			"FAPC (Gunner)",
			"FAPC (Operator)",
			"LBT6094 (Breacher)",
			"LBT6094 (Operator)",
			"RAV (Breacher)",
			"RAV (Gunner)",
			"RAV (Operator)"
		];
	};
	case "Marines":
	{
		_items = [
			"SPC (corpsman)",
			"SPC (iar)",
			"SPC (light)",
			"SPC (mg)",
			"SPC (rifleman)"
		];
	};
	case "Nato":
	{
		_items = [
			"United States Army (1)",
			"United States Army (2)",
			"British Army (1)",
			"British Army (2)",
			"Bundeswehr (1)",
			"Bundeswehr (2)",
			"Canadian Army (1)",
			"Canadian Army (2)",
			"Norwegian Army (1)",
			"Norwegian Army (2)",
			"Finnish Army (1)",
			"Finnish Army (2)",
			"Australian Army (1)",
			"Australian Army (2)"
		];
	};
	case "AAF":
	{
		_items = [
			"Carrier Lite",
			"Carrier Rig",
			"Carrier GL"
		];
	};
	case "Russia":
	{
		_items = [
			"6Sh116",
			"6Sh116 (VOG)",
			"6Sh92",
			"6Sh92(2)",
			"6Sh92(VOG)"
		];
	};
};

// ---------- Create dialog ----------

disableSerialization;

createDialog "InA_UniformEquip_Dialog";

waitUntil {!isNull (findDisplay 9202);};

_ctrl = (findDisplay 9202) displayCtrl 1500;

{
	_ctrl lbAdd _x;
} forEach _items;
_ctrl lbSetCurSel 0;