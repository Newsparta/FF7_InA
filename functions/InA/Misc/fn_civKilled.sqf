params ["_unit",["_killer", objNull]];

[_unit] remoteExec ["removeAllActions", 0];

if ((isNull _killer) || {_killer == _unit}) then { 

	private _aceSource = _unit getVariable ["ace_medical_lastDamageSource", objNull]; 

	if ((!isNull _aceSource) && {_aceSource != _unit}) then { 
		_killer = _aceSource; 
	}; 
}; 

if (isPlayer _killer) then {
	private ["_nameKiller", "_typeWeapon", "_nameWeapon", "_typeMag", "_vehType", "_vehName"];
	
	_nameKiller	= (name _killer);
	
	[clientOwner, "civTol"] remoteExec ["publicVariableClient", 2];
	
	sleep 0.2;
	
	civTol = civTol - 0.1;
	publicVariableServer "civTol";

	["R.O.E", (format ["<t color='#CC2222'>%1</t> just murdered a civilian</t>", _nameKiller])] remoteExec ["FF7_fnc_formatHint", 0];

};