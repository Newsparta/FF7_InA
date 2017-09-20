// Simple macro wrapper, get index of property defined in ConfigStructure.hpp
#include "ConfigStructure.hpp"
params [
	["__propertyName", "", [""]]
];
assert(!(__propertyName isEqualTo "")); // Must not be blank
// return
(CLASS_STRUCTURE_WATER_VEHICLE find __propertyName);