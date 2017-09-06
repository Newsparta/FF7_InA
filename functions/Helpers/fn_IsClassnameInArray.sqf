params [
	["__classname", "", [""]], 
	["__itemArray", [], [[]]]
];

assert (__classname != ""); // Caller didnt give a name
assert ((count __itemArray) > 0); // Caller didnt give any items to match against
private _bClassExists = false;

{
	if ((_x select 0) == __classname) exitWith {
		_bClassExists = true;
	};
} forEach __itemArray;

_bClassExists;