params [ "_killed", "_killer", "_aceSource"];

_killInfo = [];

if ((isNull _killer) || {_killer == _unit}) then { 

	private _aceSource = _unit getVariable ["ace_medical_lastDamageSource", objNull]; 
	
	if ((!isNull _aceSource) && {_aceSource != _unit}) then { 
		_killInfo pushBack "Last damage";
		FF7_OPS_Target = _aceSource;
		publicVariable "FF7_OP_civKiller";
	}; 
}; 



sleep 0.2;

if ((_killed getVariable ["FF7_OPS_Target", false])) exitWith {};

if (local (missionNamespace getVariable "FF7_OP_civKiller")) then
{
	if (isPlayer (missionNamespace getVariable "FF7_OP_civKiller")) then
	{
		private ["_nameKiller","_tmpKiller"];

		_tmpKiller = (missionNamespace getVariable "FF7_OP_civKiller");
		_nameKiller	= (name _tmpKiller);

		if !((vehicle _tmpKiller) isKindOf "Man") then
		{
		
			_vehType	= (typeOf (vehicle _tmpKiller));
			_vehName	= (getText (configFile >> "CfgVehicles" >> _vehType >> "displayName"));

			["ROE", "R.O.E", (format ["<t color='#CC2222'>%1</t> just murdered a civilian with a <t color='#22CC22'>%2</t>.<br/><br/>This will not be tolerated and as a result, the vehicle has rendered useless !</t>", _nameKiller, _vehName])] remoteExec ["FF7_fnc_globalHintStruct", 0];
		}
		else
		{
		
			_typeWeapon	= (currentWeapon _tmpKiller);
			_typeMag	= (currentMagazine _tmpKiller);
			_nameWeapon = (getText (configFile >> "CfgWeapons" >> _typeWeapon >> "displayName"));

			["ROE", "R.O.E", (format ["<t color='#CC2222'>%1</t> just murdered a civilian with a <t color='#22CC22'>%2</t>.<br/><br/>This will not be tolerated and as a result, his/hers weapon has been removed !</t>", _nameKiller, _nameWeapon])] remoteExec ["FF7_fnc_globalHintStruct", 0];
		};
	};
};
