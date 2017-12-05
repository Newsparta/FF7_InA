/* ----------
Function:
	InA_fnc_reqEvac
Description:
	Function call to start evac script

Parameters:
	- unit requesting evac (Unit)

Optional:

Example:
	[player] call InA_fnc_reqEvac

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_player"		,[]					,[]					,[]							]];

// Local declarations
private		_null			= nil;		

// Check if evac is available
if !(FF7_playerEvac) exitWith {[true, "Headquarters", "Evac is currently unavailable ...", "Headquarters"] call InA_fnc_formatHint};

if (InA_EvacDisabled) exitWith {[true, "Headquarters", "Evac is currently disabled ...", "Headquarters"] call InA_fnc_formatHint};

// Start evac script
_null = [] execVM "functions\InA\Support\evacCall.sqf";