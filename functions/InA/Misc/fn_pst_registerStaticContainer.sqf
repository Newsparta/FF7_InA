/*  Function: FF7_fnc_pst_registerStaticContainer

	Description:
		A function to register a container to be synced with the database
		Container is assumed to be permanent

	Syntax:
		_success = [object, name] call FF7_fnc_pst_registerStaticContainer

			{ object : object }  Must be a container capable of storing items.
			{ name   : string }  User-supplied string to identify the container.

	Returns:
		Boolean    True if (already) added. False if object is not compatible (not a container?)

	Example 1: (Add Local Player)
		_success = [player, getPlayerUID player] call FF7_fnc_pst_registerStaticContainer;
		// Players can be assumed as permanent (can set some expiry later)

	Example 2: (Add Named Container)
		_success = [_my_box1, "box1"] call FF7_fnc_pst_registerStaticContainer;

	Author:
		[FF7] Bliss

---------- */

// Input Parameterization
// __object     (Object)       Object of which to save the contents
// __name		(String)       Unique identifier for the object
//
//      |  Private Name     | Default Value     | Expected Types    | Expected Array Count |
params [[   "__object"      ,nil                ,[objNull]          ,[]                    ], 
        [   "__name"        ,""                 ,[""]               ,[]                    ]];

// Local scope
private     _index          = -1;
private     _return         = false;

// Only dedicated server (or player host)
if (!isServer) exitWith { true; };

	// Initialize if necessary
	if (isNil "g_pst_StaticContainers") then {
		g_pst_StaticContainers = [];
	};

	// Add object to global list
	_index = g_pst_StaticContainers pushBackUnique [__name, __object];

	// if _index == -1; already exists
	_return = (_index != -1);

_return;