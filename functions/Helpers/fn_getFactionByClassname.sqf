// Gets faction by classname from global factions array
#include "ConfigStructure.hpp";
params [
	["__classname", "", [""]]
];
assert(!(__classname isEqualTo "")); // Need a faction AND at least 1 target property..
if(!assert(!isNil "g_cfg_Factions")) exitWith {}; // Factions must be composed before using this function, this global is only on the server!

// Get faction
{
	if (_x SELECT_FACTION_DATA("config_name") isEqualTo __classname) exitWith {
		_x;
	};
} forEach g_cfg_Factions;