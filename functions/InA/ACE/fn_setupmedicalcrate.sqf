/* ----------
Function:
	InA_fnc_setupMedicalCrate

Description:
	Make an object able to full heal

Parameters:
	- Object to add healing action to (Object)

Optional:

Example:
	[_obj] call InA_fnc_setupMedicalCrate;

Returns:
	Nil

Author:
	[FF7] Whigital
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_box"			,[]					,[]					,[]							]];

// Local declarations
private		_null				= nil;
private		_obj				= ObjNull;

// Clear inventory
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;

// Remove all actions
removeAllActions _box;

// Add Arsenal and Gear options
_null = _box addAction
[
	"Treat Injuries",
	{call InA_fnc_aceHealLocal},
	[],
	100,
	true,
	true,
	"",
	"((_target distance _this) < 5)"
];

// Disable ACE cargo
_box setVariable ["ace_cargo_size", -1];

// Disable ACE dragging
[_box, false] call ace_dragging_fnc_setDraggable;

// Disable ACE carrying
[_box, false] call ace_dragging_fnc_setCarryable;

// Disable ACE cargo loading
_box setVariable ["ace_cargo_canLoad", 0];
