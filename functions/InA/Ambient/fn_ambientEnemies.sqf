/* ----------
Function:
	InA_fnc_ambientEnemies

Description:
	Executes a single RNG check to spawn enemies

Parameters:
	- 

Optional:

Example:

Returns:

Author:
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_loc"			,[]					,[]					,[]							],
		[	"_rad"			,[]					,[]					,[]							],
		[	"_ambMult"		,0.25				,[0]				,[]							]];

// If too many spawns active, prevent more spawns
if (({(side _x) == resistance} count allUnits) < 150) exitWith {};

if (random 100 < (0.7 + (0.7 * _ambMult * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
	[
		_loc, 
		_rad + 500, 
		(_rad/2), 
		1
	] spawn InA_fnc_insLightInfantryAttack;
};
if (random 100 < (0.01 + (0.01 * _ambMult))) then {
	[
		_loc, 
		_rad + 500, 
		(_rad/2), 
		1
	] spawn InA_fnc_insSniperAttack;
};
if (random 100 < (0.025 + (0.025 * _ambMult))) then {
	[
		_loc, 
		_rad + 1000, 
		(_rad/2), 
		1
	] spawn InA_fnc_insLightCarAttack;
};
if (random 100 < (0.02 + (0.02 * _ambMult))) then {
	[
		_loc, 
		_rad + 1000, 
		(_rad/2), 
		1
	] spawn InA_fnc_insMediumCarAttack;
};
if (random 100 < (0.025 + (0.025 * _ambMult))) then {
	[
		_loc, 
		_rad + 1000, 
		(_rad/2), 
		1
	] spawn InA_fnc_insMediumTruckTransport;
};
if (count (call BIS_fnc_listPlayers) > 7) then {
	if (random 100 < (0.01 + (0.025 * _ambMult * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
		[
			_loc, 
			_rad + 1000, 
			(_rad/2), 
			1
		] spawn InA_fnc_insApcTransport;
	};
	if (random 100 < (0.006250 + (0.0125 * _ambMult * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
		[
			_loc, 
			_rad + 1000, 
			(_rad/2),  
			1
		] spawn InA_fnc_insIfvTransport;
	};
};
if (random 100 < (0.008 + (0.008 * _ambMult * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
	[
		_loc, 
		_rad + 2500, 
		(_rad/2), 
		1
	] spawn InA_fnc_insLightHeliAttack;
};
if (random 100 < (0.006250 + (0.006250 * _ambMult))) then {
	[
		_loc, 
		_rad + 1000, 
		(_rad/2), 
		1
	] spawn InA_fnc_insTankAttack;
};
if (random 100 < (0.006250 + (0.006250 * _ambMult))) then {
	[
		_loc, 
		_rad + 2500, 
		(_rad/2),  
		1
	] spawn InA_fnc_insMediumHeliTransport;
};
if (random 100 < (0.001562 + (0.001562 * _ambMult))) then {
	[
		_loc, 
		_rad + 2500, 
		(_rad/2), 
		1
	] spawn InA_fnc_insHeavyHeliTransport;
};
if (random 100 < (0.004 + (0.004 * _ambMult * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
	[
		_loc, 
		_rad + 1000, 
		(_rad/2), 
		1
	] spawn InA_fnc_insLightBoatAttack;
};