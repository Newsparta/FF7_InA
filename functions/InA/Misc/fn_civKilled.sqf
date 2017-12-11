/* ----------
Function:
	InA_fnc_civKilled;

Description:
	Check who killed a civ and notify if it was a player

Parameters:
	- civilian (Unit)
	- killer (Unit)

Optional:

Example:
	[_unit] call InA_fnc_civKilled;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_unit"			,[]					,[]					,[]							],
		[	"_killer"		,objNull			,[ObjNull]			,[]							]];

// Local declarations
private		_aceSource			= nil;
private		_nameKiller			= "";
private		_nameWeapon			= nil;
private		_typeMag			= nil;
private		_typeWeapon			= nil;
private		_vehName			= "";
private		_vehType			= nil;

// Remove all the actions from killed unit
[_unit] remoteExec ["removeAllActions", 0];

// Check if no killer or suicide
if ((isNull _killer) || {_killer == _unit}) then { 

	private _aceSource = _unit getVariable ["ace_medical_lastDamageSource", objNull]; 

	if ((!isNull _aceSource) && {_aceSource != _unit}) then { 
		_killer = _aceSource; 
	}; 
}; 

// Check if player was killer
if (isPlayer _killer) then {
	
	_nameKiller	= (name _killer);
	
	// Sync tolerance value
	[clientOwner, "civTol"] remoteExec ["publicVariableClient", 2];

	// Delay to allow sync
	sleep 0.2;
	
	// Reduce civilian tolerance
	civTol = civTol - 0.5;
	publicVariableServer "civTol";

	// Notification
	[false, (format ["<t color='#CC2222'>%1</t> just murdered a civilian</t>", _nameKiller])] remoteExec ["InA_fnc_formatHint", 0];

};