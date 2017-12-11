/* ----------
Script:
	Uniform dialog

Description:
	All Uniform information

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_ctrl				= nil;
private		_items				= [];

equipUniform = 
{
	_id = _this select 0;
	
	switch (baseType) do {
	
		case "Army":
		{
			switch (_id) do {
			
				case 0:
				{
					player forceAddUniform "VSM_MulticamTropic_Camo";
				};
				
				case 1:
				{
					player forceAddUniform "VSM_MulticamTropic_od_shirt_Camo";
				};
				
				case 2:
				{
					player forceAddUniform "VSM_MulticamTropic_od_pants_Camo";
				};
			};
		};
		
		case "Marines":
		{
			switch (_id) do {
			
				case 0:
				{
					player forceAddUniform "TRYK_U_B_MARPAT_Wood_Tshirt";
				};

				case 1:
				{
					player forceAddUniform "TRYK_U_B_MARPAT_Wood";
				};
			};
		};
		
		case "Nato":
		{
			switch (_id) do {
			
				case 0:
				{
					player forceAddUniform "U_B_T_Soldier_F";
				};

				case 1:
				{
					player forceAddUniform "U_B_T_Soldier_SL_F";
				};
				
				case 2:
				{
					player forceAddUniform "U_B_T_Soldier_AR_F";
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
			"OCP Tropic",
			"OCP Tropic (OD Shirt)",
			"OCP Tropic (OD Pants)"
		];
	};
	case "Marines":
	{
		_items = [
			"MARPAT",
			"MARPAT (rolled)"
		];
	};
	case "Nato":
	{
		_items = [
			"Tropic",
			"Tropic (rolled)",
			"Tropic (Tee)"
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