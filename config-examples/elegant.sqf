// -------- LEAST MAINTENENCE/SLOWEST METHOD
// Get all faction names
_factions = [g_cfg_Factions] call Helpers_fnc_getAllFactionNames;
diag_log format ["Found %1 factions: %2", count _factions, _factions];

// Assume we are AAF again, but this time, we only have classname
_factionClassname = "AAF";

// Get Faction By Classname
_factionAAF = [_factionClassname] call Helpers_fnc_getFactionByClassname;
diag_log format ["Faction By Classname = %1", _factionAAF];

// Get faction name
_factionName =  [_factionAAF, ["name"]] call Helpers_fnc_getFactionProperty;
diag_log format ["Faction Name = %1", _factionName];

// Get all faction weapons
_weapons = [_factionAAF, ["gear", "weapons"]] call Helpers_fnc_getFactionProperty;
diag_log format ["Faction Weapons = %1", _weapons];

// Get list of weapons sorted by cost
_weaponsSortedByCost = [
	_weapons, 
	[
		["cost"] call Helpers_fnc_indexOfProp_Weapon
	], 
	{_x select _input0}, 
	"ASCEND"
] call BIS_fnc_sortBy;
diag_log format ["Faction Weapons Sorted By Cost = %1", _weaponsSortedByCost];

// Get list of weapons sorted by config_name
_weaponsSortedByConfigName = [
	_weapons, 
	[
		["config_name"] call Helpers_fnc_indexOfProp_Weapon
	], 
	{_x select _input0}, 
	"ASCEND"
] call BIS_fnc_sortBy;
diag_log format ["Faction Weapons Sorted By Config Name = %1", _weaponsSortedByConfigName];

// Get list of weapons sorted by display name
_weaponsSortedByDisplayName = [
	_weapons, 
	[
		["name"] call Helpers_fnc_indexOfProp_Weapon
	], 
	{_x select _input0}, 
	"ASCEND"
] call BIS_fnc_sortBy;
diag_log format ["Faction Weapons Sorted By Display Name = %1", _weaponsSortedByDisplayName];

// Select a random weapon
_randWeapon = selectRandom _weapons;
diag_log format ["Random Weapon = %1", _randWeapon];

// Get classname of weapon
_randWepClassname = [_randWeapon, "config_name"] call Helpers_fnc_getProperty_FromWeapon;
diag_log format ["Random Weapon Classname = %1", _randWepClassname];

// Get the weapon by its classname alone
_weaponByClassname = [_weapons, _randWepClassname] call Helpers_fnc_getElementByConfigName;
diag_log format ["Weapon by Classname = %1", _weaponByClassname];

diag_log format ["Weapon Name = %1", [_weaponByClassname, "name"] call Helpers_fnc_getProperty_FromWeapon];
diag_log format ["Weapon Cost = %1", [_weaponByClassname, "cost"] call Helpers_fnc_getProperty_FromWeapon];
diag_log format ["Weapon Type = %1", [_weaponByClassname, "type"] call Helpers_fnc_getProperty_FromWeapon];