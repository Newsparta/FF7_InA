// Gets a sub-element of __array with a config_name of __configName
// Assumes the first index of each sub-item is the config_name
params [
	["__array", [], [[]]],
	["__configName", "", [""]]
];
assert(!(__configName isEqualTo "")); // __configName must not be blank

// return (nil/void if not found)
{
	if ((_x select 0) isEqualTo __configName) exitWith { _x; };
} forEach __array;