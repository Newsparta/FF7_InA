params [
	["__classname", "", [""]],
	["__array", [], [[]]]
];
private _return = [];

if (!assert (__classname != "")) exitWith { diag_log "Error: fn_FindArrayByClassname.sqf; Empty classname given."; _return;};

// Find item
{
	if (__classname == _x select 0) exitWith {
		_return = _x;
	};
} forEach __array;

_return;