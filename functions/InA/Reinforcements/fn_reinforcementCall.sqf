/* ----------
Script:
	reinforcement call
Description:
	call for reinforcements

Author:
	[FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_loc"			,[]					,[]					,[]							]];

// Local declarations
private		_rad			= 500;

[
	_loc, 
	_rad + 500, 
	(_rad/2), 
	4,
	(random 900)
] spawn InA_fnc_insLightInfantryAttack;

if (random 100 < 10) then {
	[
		_loc, 
		_rad + 500, 
		(_rad/2), 
		1,
		(random 900)
	] spawn InA_fnc_insSniperAttack;
};
if (random 100 < 10) then {
	[
		_loc, 
		_rad + 1000, 
		(_rad/2), 
		1,
		(random 900)
	] spawn InA_fnc_insLightCarAttack;
};
if (random 100 < 10) then {
	[
		_loc, 
		_rad + 1000, 
		(_rad/2), 
		1,
		(random 900)
	] spawn InA_fnc_insMediumCarAttack;
};
if (random 100 < 10) then {
	[
		_loc, 
		_rad + 1000, 
		(_rad/2), 
		1,
		(random 900)
	] spawn InA_fnc_insMediumTruckTransport;
};
if (count (call BIS_fnc_listPlayers) > 5) then {
	if (random 100 < 10) then {
		[
			_loc, 
			_rad + 1000, 
			(_rad/2), 
			1,
			(random 900)
		] spawn InA_fnc_insApcTransport;
	};
	if (random 100 < 10) then {
		[
			_loc, 
			_rad + 1000, 
			(_rad/2),  
			1,
			(random 900)
		] spawn InA_fnc_insIfvTransport;
	};
};
if (random 100 < 10) then {
	[
		_loc, 
		_rad + 2500, 
		(_rad/2), 
		1,
		(random 900)
	] spawn InA_fnc_insLightHeliAttack;
};
if (random 100 < 10) then {
	[
		_loc, 
		_rad + 1000, 
		(_rad/2), 
		1,
		(random 900)
	] spawn InA_fnc_insTankAttack;
};
if (random 100 < 10) then {
	[
		_loc, 
		_rad + 2500, 
		(_rad/2),  
		1,
		(random 900)
	] spawn InA_fnc_insMediumHeliTransport;
};
if (random 100 < 10) then {
	[
		_loc, 
		_rad + 2500, 
		(_rad/2), 
		1,
		(random 900)
	] spawn InA_fnc_insHeavyHeliTransport;
};
if (random 100 < 10) then {
	[
		_loc, 
		_rad + 1000, 
		(_rad/2), 
		1,
		(random 900)
	] spawn InA_fnc_insLightBoatAttack;
};