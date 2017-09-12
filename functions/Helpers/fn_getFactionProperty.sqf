// Recursive
// Takes array of traversal into faction array
//
// Example 1: [[_Myfaction, "name"]] call Helpers_fnc_getFactionProperty; // Get faction name
// Example 2: [[_Myfaction, "gear", "magazines"]] call Helpers_fnc_getFactionProperty; // Get all faction defined magazines
//
#include "ConfigStructure.hpp";
params [
	["__faction", CLASS_DEFAULT_FACTION, [[]], count CLASS_DEFAULT_FACTION],
	["__route", [], [[]]]
];
assert((count __route) > 0); // Need at least 1 target property..
if(!assert(!isNil "g_cfg_initDone")) exitWith {}; // Factions must be composed before using this function, this global is only on the server!

// Make sure we copy the route array..
_routeCopy = +__route;

// Recursive helper func
_fnc_RecurseProperties = {
	params [
		["__routeArray", [], [[]]],
		["__configArray", [], [[]]],
		["__arrayStructure", [], [[]]]
	];
	assert((count __routeArray) > 0); // Need a target
	assert((count __configArray) > 0); // Need an array to target from...
	assert((count __arrayStructure) > 0); // Need some properties to target...
	
	// Make sure we copy the route array.. less we modify the callers data
	_routeArrayCopy = __routeArray;

	// get property name (and remove this element from route)
	_propertyName = _routeArrayCopy deleteAt 0;

	if (!assert(!(isNil "_propertyName"))) exitWith { diag_log format ["Property [%1] was nil. from %2", _propertyName, _routeArrayCopy]; };
	// Get index of property
	_index = -1;
	{
		if (_x isEqualType []) then {
			if ((_x select 0) isEqualTo _propertyName) exitWith {
				_index = _forEachIndex;
				__arrayStructure = _x select 1;
			};
		} else {
			if (_x isEqualTo _propertyName) exitWith {
				_index = _forEachIndex;
				__arrayStructure = _x;
			};
		};
	} forEach __arrayStructure;

	// Property not found!
	if(!assert(_index != -1)) exitWith { 
		diag_log format ["[ERROR] Property '%1' not found in structure %2", _propertyName, __arrayStructure];
		nil; // return null
	}; 

	_property = __configArray select _index;

	// If we need to go deeper (more route elements)
	if (count _routeArrayCopy > 0) then {
		assert(_property isEqualType []); // Tried to get a property of a value!
		_property = [_routeArrayCopy, _property, __arrayStructure] call _fnc_RecurseProperties;
	};

	// return
	_property;
};

// return faction property
[_routeCopy, __faction, CLASS_DEEP_STRUCTURE_FACTION] call _fnc_RecurseProperties;