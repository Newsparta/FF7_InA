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
					player addHeadGear "VSM_Mich2000_Multicam";
				};
				
				case 1:
				{
					player addHeadGear "VSM_OPS_multicam";
				};
			};
		};
		
		case "Marines":
		{
			switch (_id) do {
			
				case 0:
				{
					player addHeadGear "rhsusf_mich_helmet_marpatwd_norotos_arc";
				};
				
				case 1:
				{
					player addHeadGear "rhsusf_mich_helmet_marpatwd_norotos";
				};
				
				case 2:
				{
					player addHeadGear "rhsusf_mich_helmet_marpatwd";
				};
				
				case 3:
				{
					player addHeadGear "rhsusf_mich_helmet_marpatwd_alt";
				};
			};
		};
		
		case "Nato":
		{
			switch (_id) do {

				case 0:
				{
					player addHeadGear (["H_HelmetB_light_desert","H_HelmetB_light_grass","H_HelmetB_light_snakeskin"] call BIS_fnc_selectRandom);
				};
				
				case 1:
				{
					player addHeadGear (["H_HelmetSpecB_paint2","H_HelmetSpecB_paint1","H_HelmetSpecB_snakeskin"] call BIS_fnc_selectRandom);
				};

				case 2:
				{
					player addHeadGear "MNP_Helmet_Scorpion";
				};

				case 3:
				{
					player addHeadGear "MNP_Helmet_Germany";
				};

				case 4:
				{
					player addHeadGear "MNP_Helmet_Canada_T";
				};

				case 5:
				{
					player addHeadGear "MNP_Helmet_FIN_T";
				};

				case 6:
				{
					player addHeadGear "MNP_Helmet_Australia";
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
			"OpsCore"
		];
	};
	case "Marines":
	{
		_items = [
			"MICH 2000 (1)",
			"MICH 2000 (2)",
			"MICH 2000 (3)",
			"MICH 2000 (4)"
		];
	};
	case "Nato":
	{
		_items = [
			"Light Combat Helmet",
			"Enhanced Combat Helmet",
			"United States Army (MICH camo)",
			"Bundeswehr (MICH camo)",
			"Canadian Army (MICH camo)",
			"Finnish Army (MICH camo)",
			"Australian Army (MICH camo)"
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