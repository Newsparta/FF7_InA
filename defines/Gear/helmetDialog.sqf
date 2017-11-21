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
					player addHeadGear "VSM_Mich2000_MulticamTropic";
				};
				
				case 1:
				{
					player addHeadGear "VSM_Mich2000_2_MulticamTropic";
				};

				case 2:
				{
					player addHeadGear "VSM_MulticamTropic_OPS";
				};

				case 3:
				{
					player addHeadGear "VSM_MulticamTropic_OPS_2";
				};

				case 4:
				{
					player addHeadGear "VSM_MulticamTropic_Boonie";
				};
			};
		};
		
		case "Marines":
		{
			switch (_id) do {
			
				case 0:
				{
					player addHeadGear "TRYK_H_Helmet_MARPAT_Wood";
				};
				
				case 1:
				{
					player addHeadGear "TRYK_H_Booniehat_MARPAT_WOOD";
				};
			};
		};
		
		case "Nato":
		{
			switch (_id) do {

				case 0:
				{
					player addHeadGear "H_HelmetB_Light_tna_F";
				};
				
				case 1:
				{
					player addHeadGear "H_HelmetB_tna_F";
				};

				case 2:
				{
					player addHeadGear "H_HelmetB_Enh_tna_F";
				};

				case 3:
				{
					player addHeadGear "H_Booniehat_tna_F";
				};
			};
		};
		
		case "AAF":
		{
			switch (_id) do {
			
				case 0:
				{
					player addHeadGear "H_HelmetIA";
				};
				
				case 1:
				{
					player addHeadGear "H_MilCap_dgtl";
				};
			};
		};
		
		case "Russia":
		{
			switch (_id) do {
			
				case 0:
				{
					player addHeadGear "rhs_6b47";
				};
				
				case 1:
				{
					player addHeadGear "rhs_6b47_ess";
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
			"MICH 2000",
			"MICH 2000 (2)",
			"OpsCore",
			"OpsCore (2)",
			"Bonnie"
		];
	};
	case "Marines":
	{
		_items = [
			"MICH 2000",
			"Bonnie"
		];
	};
	case "Nato":
	{
		_items = [
			"Light Combat Helmet",
			"Combat Helmet",
			"Enhanced Combat Helmet",
			"Bonnie"
		];
	};
	case "AAF":
	{
		_items = [
			"Modular Helmet",
			"Officer Cap"
		];
	};
	case "Russia":
	{
		_items = [
			"6b47",
			"6b47 (ESS)"
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