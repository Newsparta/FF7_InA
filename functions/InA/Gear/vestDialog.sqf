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
					player addVest "V_Chestrig_oli";
				};
				
				case 1:
				{
					player addVest "V_PlateCarrier1_rgr";
				};
				
				case 2:
				{
					player addVest "V_PlateCarrier2_rgr";
				};
				
				case 3:
				{
					player addVest "V_PlateCarrierGL_rgr";
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
			"Chest Rig",
			"Carrier Rig (light)",
			"Carrier Rig",
			"Carrier Rig (heavy)"
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