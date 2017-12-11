/* ----------
Function:
	InA_fnc_aceHealLocal

Description:
	Heals player

Parameters:
	- Medical box (Object)
	- Player to heal (Unit)

Optional:

Example:
	_this call InA_fnc_aceHealLocal;

Returns:
	Nil

Author:
	[FF7] Newsparta
	[FF7] Whigital
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_box"			,[]					,[]					,[]							],
		[	"_unit"			,[]					,[]					,[]							]];

// Start treating animation
_unit playMove "AinvPknlMstpSlayWrflDnon_medic";

// Spawn progress bar
[10, [], {}, {}, "Treating injuries, standby ...."] call ace_common_fnc_progressBar;

// Heal player
[_box, _unit] call ace_medical_fnc_treatmentAdvanced_fullHeal;
