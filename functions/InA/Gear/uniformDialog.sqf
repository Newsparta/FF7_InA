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
					player forceAddUniform "VSM_Multicam_Crye_Camo";
				};
				
				case 1:
				{
					player forceAddUniform "VSM_Multicam_Crye_od_shirt_Camo";
				};
				
				case 2:
				{
					player forceAddUniform "VSM_Multicam_Crye_od_pants_Camo";
				};
			};
		};
		
		case "Marines":
		{
			switch (_id) do {
			
				case 0:
				{
					player forceAddUniform "rhs_uniform_FROG01_wd";
				};
			};
		};
		
		case "Nato":
		{
			switch (_id) do {
			
				case 0:
				{
					player forceAddUniform "U_B_CombatUniform_mcam";
				};

				case 1:
				{
					player forceAddUniform "U_B_CombatUniform_mcam_vest";
				};
				
				case 2:
				{
					player forceAddUniform "U_B_CombatUniform_mcam_tshirt";
				};
			};
		};
		
		case "AAF":
		{
			switch (_id) do {
			
				case 0:
				{
					player forceAddUniform "U_I_CombatUniform";
				};
				
				case 1:
				{
					player forceAddUniform "U_I_CombatUniform_shortsleeve";
				};
			};
		};
		
		case "Russia":
		{
			switch (_id) do {
			
				case 0:
				{
					player forceAddUniform "rhs_uniform_emr_patchless";
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
			"OCP",
			"OCP (OD Shirt)",
			"OCP (OD Pants)"
		];
	};
	case "Marines":
	{
		_items = [
			"MARPAT"
		];
	};
	case "Nato":
	{
		_items = [
			"MTP",
			"MTP (rolled)",
			"MTP (tee)"
		];
	};
	case "AAF":
	{
		_items = [
			"Fatigues",
			"Fatigues (rolled)"
		];
	};
	case "Russia":
	{
		_items = [
			"EMR"
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