// Creates faction array from config structures
#include "ConfigStructure.hpp";
params []; // expect no params

// Build each faction config
private _factions = [];
{
	_factions pushBack ([_x, CLASS_DEEP_STRUCTURE_FACTION, CLASS_DEFAULT_FACTION] call Helpers_fnc_configToArrayByStructure);
} forEach configProperties [(getMissionConfig "InA_Factions"), "isClass _x", true];

// Compile global index variables dynamically
_globalIndexCompiles = [];

_fnc_composeStructureIndexGlobals = {
	// Takes a string and an array of strings.
	// returns array of strings such that executing them will create global variables of indexes of the array, eg;
	//
	//     ["MAGAZINE", ["config_name","name","cost"]] call _fnc_composeStructureIndexGlobals;
	//     returns:
	//         [
	//             "g_IDX_MAGAZINE_CONFIG_NAME = 0;",
	//             "g_IDX_MAGAZINE_NAME = 1;"
	//             "g_IDX_MAGAZINE_COST = 2;"
	//         ]
	//     
	// Which can then be joined + executed to generate the global variables.
	// Can take CLASS_DEEP_STRUCTURE_ macros
	// 
	params [
		["__prefix", "", [""]],
		["__array", [], [[]]]
	];
	private _gVarPrefix = "g_IDX_" + __prefix;
	private _resultArray = [];

	{
		if (_x isEqualType []) then {
			// Recurse sub-array with _x[0] as prefix - DEEP_STRUCTURES
			_resultArray pushBack (format ["%1_%2=%3;", _gVarPrefix, toUpper (_x select 0), _forEachIndex]);
			_resultArray append ([__prefix + "_" + (toUpper (_x select 0)), _x select 1] call _fnc_composeStructureIndexGlobals);
		} else {
			// simply build and push the global var string
			_resultArray pushBack (format ["%1_%2=%3;", _gVarPrefix, toUpper _x, _forEachIndex]);
		};
	} forEach __array;

	// return
	_resultArray;
};

// Build global index variables
private _globalVarString = (["FACTION", CLASS_DEEP_STRUCTURE_FACTION] call _fnc_composeStructureIndexGlobals) joinString "";
call compile _globalVarString; // execute code - creates/sets the global variables in the string

_factions;