// Creates faction array from config structures
#include "ConfigStructure.hpp";
params []; // expect no params

private _factions = [];
{
	_factions pushBack ([_x, CLASS_DEEP_STRUCTURE_FACTION, CLASS_DEFAULT_FACTION] call Helpers_fnc_configToArrayByStructure);
} forEach configProperties [(getMissionConfig "InA_Factions"), "isClass _x", true];

_factions;