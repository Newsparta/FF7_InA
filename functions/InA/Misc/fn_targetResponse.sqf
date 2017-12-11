/* ----------
Function: InA_fnc_targetResponse

Description:
    A function to spawn reinforcements if spotted on target confirmation

Parameters:
    - Target location (Position)

Optional:


Example:
   
    [[0,0,0]] spawn InA_fnc_targetResponse

Returns:
    Nil

Author:
    Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_loc"			,[]					,[]					,[]							]];

// Local declarations
private		_airRad				= 3000;
private		_landRad			= 1000;

// Check if spotted
if (spotted) then {

	[
		_loc, 
		_landRad, 
		(_landRad/4), 
		(1 + ((count (call BIS_fnc_listPlayers)) * 0.1)),
		0,
		"COMBAT",
		"FULL"
	] spawn InA_fnc_insLightInfantryAttack;

	if (random 100 < (20 + (10 * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
		[
			_loc, 
			_landRad, 
			(_landRad/4), 
			1,
			0,
			"COMBAT",
			"FULL"
		] spawn InA_fnc_insLightCarAttack;
	};

	if (random 100 < (10 + (10 * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
		[
			_loc, 
			_landRad, 
			(_landRad/4), 
			1,
			0,
			"COMBAT",
			"FULL"
		] spawn InA_fnc_insMediumCarAttack;
	};

	if (random 100 < (20 + (10 * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
		[
			_loc, 
			_landRad, 
			(_landRad/4), 
			1,
			0,
			"COMBAT",
			"FULL"
		] spawn InA_fnc_insMediumTruckTransport;
	};

	if (random 100 < (5 + (20 * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
		[
			_loc, 
			_landRad, 
			(_landRad/4), 
			1,
			0,
			"COMBAT",
			"FULL"
		] spawn InA_fnc_insApcTransport;
	};

	if (random 100 < (5 + (5 * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
		[
			_loc, 
			_landRad, 
			(_landRad/4), 
			1,
			0,
			"COMBAT",
			"FULL"
		] spawn InA_fnc_insIfvTransport;
	};

	if (random 100 < (5 + (5 * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
		[
			_loc, 
			_landRad, 
			(_landRad/4), 
			1,
			0,
			"COMBAT",
			"FULL"
		] spawn InA_fnc_insLightHeliAttack;
	};

	if (random 100 < (5 + (5 * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
		[
			_loc, 
			_landRad, 
			(_landRad/4), 
			1,
			0,
			"COMBAT",
			"FULL"
		] spawn InA_fnc_insTankAttack;
	};

	if (random 100 < (5 + (5 * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
		[
			_loc, 
			_landRad, 
			(_landRad/4), 
			1,
			0,
			"COMBAT",
			"FULL"
		] spawn InA_fnc_insMediumHeliTransport;
	};

	if (random 100 < (2 + (2 * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
		[
			_loc, 
			_landRad, 
			(_landRad/4), 
			1,
			0,
			"COMBAT",
			"FULL"
		] spawn InA_fnc_insHeavyHeliTransport;
	};

	if (random 100 < (20 + (10 * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
		[
			_loc, 
			_landRad, 
			(_landRad/4), 
			1,
			0,
			"COMBAT",
			"FULL"
		] spawn InA_fnc_insLightBoatAttack;
	};
};