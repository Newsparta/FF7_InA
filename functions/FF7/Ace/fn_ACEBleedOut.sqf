/* ----------
Function: FF7_fnc_ACEBleedOut

Description:
    A function to manage ambient elements

Parameters:
    - unit that changed state (Unit)
	- state of conciousness (Boolean)

Optional:


Example:
   
    [_unit, _state] spawn FF7_fnc_ACEBleedOut

Returns:
    Nil

Author:
    Whigital & Newsparta
---------- */

// ---------- Parameters ----------

params ["_unit","_state"];
	
// ---------- Main ----------
 
_var = random 1;

while {true} do {
	scopeName format ["playerLoop%1",_var];
	
	// ---------- Break if state is concious ----------
	if !(_state) then {
		breakOut format ["playerLoop%1",_var];
	};

	sleep (2 + (random 2));
	
	// ---------- Kill if bloodloss is > 0.4 ----------
	
	if (([_unit] call ace_medical_fnc_getBloodLoss) > 0.4) then
	{
	
		//_unit setVariable ["ACE_isDead", true, true];
		//_unit setVariable ["isDeadPlayer", true, true];
		["NOTICE", "Blood Loss 40% or greater."] remoteExec ["FF7_fnc_formatHint", 0, false];
		
		breakOut format ["playerLoop%1",_var];
	};
	
	// ---------- Break if not bleeding or IV'd ----------
	
	if ((([_unit] call ace_medical_fnc_getBloodLoss) == _notBleedingCheck) || {([_unit] call ace_medical_fnc_getBloodLoss) < _notBleedingCheck}) then {
		breakOut format ["playerLoop%1",_var];
	};
	
	_notBleedingCheck = [_unit] call ace_medical_fnc_getBloodLoss;
};
