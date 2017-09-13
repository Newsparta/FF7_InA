sleep 0.2;

params ["_parkedVehicle"];

_fMulti = nil;
_rMulti = nil;

if (_parkedVehicle isKindOf "Helicopter") then {
	_fMulti = 4;
	_rMulti = 300;
};
if (_parkedVehicle isKindOf "Tank") then {
	_fMulti = 3;
	_rMulti = 300;
};
if (_parkedVehicle isKindOf "Car") then {
	_fMulti = 1;
	_rMulti = 50;
};
	
repairCost = round ((damage _parkedVehicle) * _rMulti);
	
fuelCost = ((100 - (fuel _parkedVehicle) * 100) * _fMulti);
	
munitionCost = 0;

_mags = magazinesAllTurrets _parkedVehicle;

{
	_magType = _x select 0;
	_magCount = _x select 2;
	
	[_magType,_magCount] call InA_fnc_magCostSubtract;
} forEach _mags;

_turrets = count (configFile >> "CfgVehicles" >> (typeOf _parkedVehicle) >> "Turrets");

if (_turrets > 0) then {
	for "_i" from 0 to (_turrets - 1) do {
		_config = (configFile >> "CfgVehicles" >> (typeOf _parkedVehicle) >> "Turrets") select _i;
		_mags = getArray(_config >> "magazines");
		
		{
			[_x] call InA_fnc_magCostAdd;
		} forEach _mags;
	};
};

if (
		(typeOf _parkedVehicle == "rhsusf_m1a2sep1tuskiwd_usarmy") || 
		{typeOf _parkedVehicle == "rhsusf_m1a2sep1tuskiiwd_usarmy"} || 
		{typeOf _parkedVehicle == "rhsusf_m1a1hc_wd"} || 
		{typeOf _parkedVehicle == "rhsusf_m1a1fep_wd"} ||
		{typeOf _parkedVehicle == "I_MBT_03_cannon_F"}
	) then {
	munitionCost = munitionCost + 100;
};

if (
		(typeOf _parkedVehicle == "I_Heli_light_03_dynamicLoadout_F") ||
		{typeOf _parkedVehicle == "B_Heli_Attack_01_dynamicLoadout_F"} ||
		{typeOf _parkedVehicle == "B_Heli_Light_01_dynamicLoadout_F"}
	) then {
	munitionCost = munitionCost + 200;
};

[ID, "repairCost"] remoteExec ["publicVariableClient", 2, false];
[ID, "fuelCost"] remoteExec ["publicVariableClient", 2, false];
[ID, "munitionCost"] remoteExec ["publicVariableClient", 2, false];

sleep 0.2;

{	

	if (munitionCost < 0) then {
		munitionCost = 0;
	};
	
	ctrlSetText [1000, (format ["%1",repairCost])];
	ctrlSetText [1001, (format ["%1",munitionCost])];
	ctrlSetText [1002, (format ["%1",fuelCost])];
} remoteExec ["BIS_fnc_call", ID];