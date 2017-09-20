// Gets a property from the specified array using the defined structures
#include "ConfigStructure.hpp"
params [
	["__vehicleArray", [], [[]]],
	["__propertyName", "", [""]]
];

assert(count __vehicleArray > 0); // __vehicleArray must have some properties!
assert(!(__propertyName isEqualTo "")); // Property name must be specified!

private _index = CLASS_STRUCTURE_AIR_VEHICLE find __propertyName;
assert(_index != -1); // Property doesn't exist for this structure!
__vehicleArray select _index;