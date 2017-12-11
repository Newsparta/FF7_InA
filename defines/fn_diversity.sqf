/* ----------
Function:
	InA_fnc_diversity

Description:
	Choose array of civilians based on arbitrary ethnic range

Parameters:

Optional:

Example:
	[] call InA_fnc_diversity;

Returns:
	- Civilians (Array)

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_val					= 0;
private		_men					= [];

// create value to select ethnicity
_val = random 1;

// Select ethnicity
if (_val < 0.90) then {_men = civ_man_tanoan};
if (_val < 0.925 and _val >= 0.90) then {_men = civ_man_european};
if (_val < 0.975 and _val >= 0.925) then {_men = civ_man_asian};
if (_val < 1 and _val >= 0.975) then {_men = civ_man_african};

// Return Variable
_men 