// Returns an array that contains the value in the specified sub-index
// Assumes all sub-elements of __array have an index of __subIndex and is the same type as provided __subIndexValue
params [
	["__subIndex", -1, [0]],
	["__subIndexValue", nil], // any type
	["__array", [], [[]]]
];
assert(__subIndex >= 0); // Index integer must be positive!
assert(!isNil "__subIndexValue"); // __subIndexValue must have a value - even if empty (more specifically, a type)

private _return = []; // default to empty array

// Find item
{
	if (_x select __subIndex isEqualTo __subIndexValue) exitWith {
		_return = _x;
	};
} forEach __array;

_return;