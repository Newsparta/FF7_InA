/*  Function: InA_fnc_simpleListFromItemArray

	Description:
		Creates a single dimensional array containing only the chosen field from 
		a supplied item config array. Preserves ordering.

	Syntax:
		_simpleList = [itemArray, fieldName, itemType] call InA_fnc_simpleListFromItemArray

			{ itemArray  : array  }    The item config array to create the list from
			{ fieldName  : string }    The field name to use in the list. One of "name", "config_name" or "cost".
			{ itemType   : string }    The type of the items in the array. One of "weapons", "magazines" or "miscitems".

	Returns:
		Array     Simple list of items
		** returns nil on error

	Example 1: (Create a list of magazine display names from itemConfigArray)
		_simpleList = [itemConfigArray, "name", "magazines"] call InA_fnc_simpleListFromItemArray

	Author:
		[FF7] Bliss

---------- */

// Input Parameterization
// __itemArray      (Array)        Config Array
// __fieldName      (String)       Name of field to use
// __itemType       (String)       Type of item we are dealing with
//
//      |  Private Name     | Default Value     | Expected Types    | Expected Array Count |
params [[  "__itemArray"     ,[]                 ,[[]]               ,[]                   ],
        [  "__fieldName"     ,""                 ,[""]               ,[]                   ],
        [  "__itemType"      ,""                 ,[""]               ,[]                   ]];

// Local Declerations
private    _list    = [];

// SANITY CHECK -- Exit here if necessary
if (count __itemArray == 0) exitWith {
	hint "ERROR #511: Supplied array had zero items.";
	nil;
};
if !(__fieldName == "name" or __fieldName == "cost" or __fieldName == "config_name") exitWith {
	hint "ERROR #512: Supplied field name not recognized.";
	nil;
};
if !(__itemType == "weapons" or __itemType == "magazines" or __itemType == "miscitems") exitWith {
	hint "ERROR #513: Supplied item type of array not recognized.";
	nil;
};

// Create simple list
{
	switch (__itemType) do {
		case "weapons":
		{
			_list pushBack ([_x, __fieldName] call Helpers_fnc_getProperty_FromWeapon);
		};
		case "magazines":
		{
			_list pushBack ([_x, __fieldName] call Helpers_fnc_getProperty_FromMagazine);
		};
		case "miscitems":
		{
			_list pushBack ([_x, __fieldName] call Helpers_fnc_getProperty_FromMiscItem);
		};
	};
} forEach __itemArray;

// Something went wrong
if (count _list == 0) exitWith {
	nil;
};

// Return
_list;