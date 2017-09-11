// Gets a property from the specified array using the defined structures
#include "ConfigStructure.hpp"
params [
	["__itemArray", [], [[]]],
	["__propertyName", "", [""]]
];

assert(count __itemArray > 0); // __itemArray must have some properties!
assert(!(__propertyName isEqualTo "")); // Property name must be specified!

private _index = CLASS_STRUCTURE_WEAPON find __propertyName;
assert(_index != -1); // Property doesn't exist for this structure!
__itemArray select _index;