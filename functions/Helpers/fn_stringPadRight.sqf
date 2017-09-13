// Adds __padding to end of __string until __string is __length characters long.
params [
	["__string", "", [""]],
	["__padding", " ", [""]],
	["__length", -1, [0]]
];
assert(__length > 0); // Length must be specified!
if (!assert((count __padding) > 0)) exitWith { __string; }; // No infinite loops pls

private _result = __string;
while {(count _result) < __length} do {
	_result = _result + __padding;
};

// return
_result;