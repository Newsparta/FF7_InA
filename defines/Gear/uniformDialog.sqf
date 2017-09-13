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
					player forceAddUniform "MNP_CombatUniform_Scorpion_A";
				};

				case 1:
				{
					player forceAddUniform "MNP_CombatUniform_Scorpion_B";
				};
				
				case 2:
				{
					player forceAddUniform "U_B_CTRG_1";
				};

				case 3:
				{
					player forceAddUniform "U_B_CTRG_3";
				};

				case 4:
				{
					player forceAddUniform "MNP_CombatUniform_Germany";
				};

				case 5:
				{
					player forceAddUniform "MNP_CombatUniform_Germany_S";
				};

				case 6:
				{
					player forceAddUniform "MNP_CombatUniform_Canada";
				};

				case 7:
				{
					player forceAddUniform "MNP_CombatUniform_Canada_S";
				};

				case 8:
				{
					player forceAddUniform "MNP_CombatUniform_NOR_A";
				};

				case 9:
				{
					player forceAddUniform "MNP_CombatUniform_NOR_B";
				};

				case 10:
				{
					player forceAddUniform "MNP_CombatUniform_Fin_A";
				};

				case 11:
				{
					player forceAddUniform "MNP_CombatUniform_Fin_B";
				};

				case 12:
				{
					player forceAddUniform "MNP_CombatUniform_Australia";
				};

				case 13:
				{
					player forceAddUniform "MNP_CombatUniform_Australia_S";
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
			"United States Army (normal)",
			"United States Army (rolled)",
			"British Army (normal)",
			"British Army (rolled)",
			"Bundeswehr (normal)",
			"Bundeswehr (rolled)",
			"Canadian Army (normal)",
			"Canadian Army (rolled)",
			"Norwegian Army (normal)",
			"Norwegian Army (rolled)",
			"Finnish Army (normal)",
			"Finnish Army (rolled)",
			"Australian Army (normal)",
			"Australian Army (rolled)"
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