////////////////
// DEPRECATED //
////////////////

// Delay for variable updates
sleep 0.2;

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_veh"			,[]					,[]					,[]							]];

// Local declarations
private		_config				= nil;
private		_fMulti				= nil;
private		_magCount			= nil;
private		_mags				= nil;
private		_magType			= nil;
private		_obj				= ObjNull;
private		_rMulti				= nil;
private		_turrets			= nil;

// Determine kind of vehicle
if (_veh isKindOf "Helicopter") then {
	_fMulti = 4;
	_rMulti = 300;
};
if (_veh isKindOf "Tank") then {
	_fMulti = 3;
	_rMulti = 300;
};
if (_veh isKindOf "Car") then {
	_fMulti = 1;
	_rMulti = 50;
};

// Determine repair cost
repairCost = round ((damage _veh) * _rMulti);
	
// Determine fuel cost
fuelCost = ((100 - (fuel _veh) * 100) * _fMulti);

// Reset munition cost
munitionCost = 0;

// Find all magazines
_mags = magazinesAllTurrets _veh;

// Subtract cost based on current ammo
{
	_magType = _x select 0;
	_magCount = _x select 2;
	
	[_magType,_magCount] call InA_fnc_magCostSubtract;
} forEach _mags;

// Find number of turrets
_turrets = count (configFile >> "CfgVehicles" >> (typeOf _veh) >> "Turrets");

// Check if vehicle has turrets
if (_turrets > 0) then {

	// Add magazine costs for each turret
	for "_i" from 0 to (_turrets - 1) do {
		_config = (configFile >> "CfgVehicles" >> (typeOf _veh) >> "Turrets") select _i;
		_mags = getArray(_config >> "magazines");
		
		{
			[_x] call InA_fnc_magCostAdd;
		} forEach _mags;
	};
};

// Bug fix for tanks that have wierd inventories
if (
		(typeOf _veh == "rhsusf_m1a2sep1tuskiwd_usarmy") || 
		{typeOf _veh == "rhsusf_m1a2sep1tuskiiwd_usarmy"} || 
		{typeOf _veh == "rhsusf_m1a1hc_wd"} || 
		{typeOf _veh == "rhsusf_m1a1fep_wd"} ||
		{typeOf _veh == "I_MBT_03_cannon_F"}
	) then {
	munitionCost = munitionCost + 100;
};

// Bug fix for helicopters
if (
		(typeOf _veh == "I_Heli_light_03_dynamicLoadout_F") ||
		{typeOf _veh == "B_Heli_Attack_01_dynamicLoadout_F"} ||
		{typeOf _veh == "B_Heli_Light_01_dynamicLoadout_F"}
	) then {
	munitionCost = munitionCost + 200;
};

// Send cost values to player
[ID, "repairCost"] remoteExec ["publicVariableClient", 2, false];
[ID, "fuelCost"] remoteExec ["publicVariableClient", 2, false];
[ID, "munitionCost"] remoteExec ["publicVariableClient", 2, false];

// Delay to allow sync
sleep 0.2;

// Set dialog text
{	

	if (munitionCost < 0) then {
		munitionCost = 0;
	};
	
	ctrlSetText [1000, (format ["%1",repairCost])];
	ctrlSetText [1001, (format ["%1",munitionCost])];
	ctrlSetText [1002, (format ["%1",fuelCost])];
} remoteExec ["BIS_fnc_call", ID];