/* ----------
Function:
	InA_fnc_disableAceInteractions

Description:
	Disable all ace added interactions with an object

Parameters:
	- Object to remove ace interaction from (Object)

Optional:

Example:
	[_obj] call InA_fnc_disableAceInteractions;

Returns:
	Nil

Author:
	[FF7] Whigital
---------- */
// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_obj"			,[]					,[]					,[]							]];

// Disable ACE dragging
[_obj, false] call ace_dragging_fnc_setDraggable;

// Disable ACE carrying
[_obj, false] call ace_dragging_fnc_setCarryable;

// Disable ACE cargo loading
_obj setVariable ["ace_cargo_canLoad", 0];
