/* ----------
Script:
	InA_fnc_baseHandler

Description:
	Choose faction and define elements

Author:
	[FF7] Newsparta
---------- */
// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_id"			,[]					,[]					,[]							]];

// Local declarations
private		_null				= nil;

// Switch based on listbox
switch (_id) do
{
	case 0:
	{
		_null = [] execVM "defines\Factions\army.sqf";
		waitUntil {scriptDone _null;};

		call themeSelect;

		[] call InA_fnc_defaultDB;
	};
	
	case 1:
	{
		_null = [] execVM "defines\Factions\marines.sqf";
		waitUntil {scriptDone _null;};

		call themeSelect;

		[] call InA_fnc_defaultDB;
	};
	
	case 2:
	{
		_null = [] execVM "defines\Factions\nato.sqf";
		waitUntil {scriptDone _null;};

		call themeSelect;

		[] call InA_fnc_defaultDB;
	};
	
	case 3:
	{
		_null = [] execVM "defines\Factions\aaf.sqf";
		waitUntil {scriptDone _null;};

		call themeSelect;

		[] call InA_fnc_defaultDB;
	};
	
	case 4:
	{
		_null = [] execVM "defines\Factions\russia.sqf";
		waitUntil {scriptDone _null;};

		call themeSelect;

		[] call InA_fnc_defaultDB;
	};
};