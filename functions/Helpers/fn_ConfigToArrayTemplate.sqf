// Takes config entry (weapon, miscitem, landvehicle, etc)
// Returns array based on __dataStructure (with __dataDefaults as defaults if not found)
// Eg: _vehicleArray = [_someConfig, DATA_STRUCTURE_LAND_VEHICLE] call _fnc_configPropertiesToArray;
// Output would be an array structured (as of writing) like so: 
//		["vehicle_max_cost", "Vehicle Display Name", 10, 600, 1000, 'true', true, false]
params [
	["__configItem", configNull, [configNull]],
	["__dataStructure", [], [[]]],
	["__dataDefaults", [], [[]]]
];
assert(__configItem != configNull); // No Config Supplied!
assert(count __dataDefaults == count __dataStructure); // Error in macros!
private _array = [];

for "_i" from 0 to (count __dataStructure)-1 do {
	_value = __dataDefaults select _i;

	// Get classname from config class itself
	if ((__dataStructure select _i) == "classname") then { 
		_value = configName __configItem;
	} else {
		_property = (__configItem >> (__dataStructure select _i));
		if(_property != configNull) then {
			_value = _property call BIS_fnc_getCfgData;
		};
	};
	_array pushBack _value;
};

_array;