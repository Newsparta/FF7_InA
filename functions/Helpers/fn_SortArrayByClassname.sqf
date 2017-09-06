params [
	["__array", [], [[]]]
];
private _alphabetical = [];

if (!assert ((count __array) > 1)) exitWith { 
	diag_log format [
		"Error: initConfigs.sqf; _fnc_sortItemsBySubClassname; Nothing to sort! (%1 items).",
		count __array
	];
	__array;
};

// Copy names to a new (simple) array
{
	_alphabetical pushBack (_x select 0);
} forEach __array;

// Sort name array
_alphabetical = _alphabetical call BIS_fnc_sortAlphabetically;

// Turn name strings into full item arrays
for "_i" from 0 to ((count _alphabetical)-1) do {

	_name = _alphabetical select _i;
	if ((count _name) == 0) then { diag_log format ["_name was empty!"]; };
	_item = [_name, __array] call Helpers_fnc_FindArrayByClassname;

	// Todo: fix check, may need to track index changes
	//if (!assert (count _item != (count (__array select _i)))) exitWith { diag_log "Error: fn_SortArrayByClassname.sqf; Invariant mutation."; _alphabetical = __array;};
	_alphabetical set [_i, _item];
};
_alphabetical;