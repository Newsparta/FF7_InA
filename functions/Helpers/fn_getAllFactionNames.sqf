// Composes an array of strings representing faction class names
#include "ConfigStructure.hpp";
params [
	["__factionArray", [], [[]]]
];

_factions = [];
{
	_factions pushBack (_x SELECT_FACTION_DATA("config_name"));
} forEach __factionArray;

// return
_factions;