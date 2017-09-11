// Reads all InA faction config data and preloads them into a global variable (server-side) 
// for faster access (at cost of few mb of memory + initial load time)

// Run once and only on server
if !(isServer || !isNil "g_cfg_initDone") exitWith {};
g_cfg_initDone = false; // for other scripts waiting for this to finish
g_cfg_Factions = ([] call Helpers_fnc_composeFactionConfigs);
g_cfg_initDone = true;


// Examples --------------
// Get all faction names
_factions = [g_cfg_Factions] call Helpers_fnc_getAllFactionNames;
diag_log format ["%1 Loaded Factions: %2", count _factions, _factions];

// Loop each loaded faction
{
	diag_log "---------------------";
	
	// Get Faction By Classname
	_factionByClassname = +([_x] call Helpers_fnc_getFactionByClassname);
	diag_log format ["Faction By Classname = %1", _factionByClassname];

	// Get faction name
	_factionName =  [_factionByClassname, ["name"]] call Helpers_fnc_getFactionProperty;
	diag_log format ["Faction Name = %1", _factionName];

	// Get all faction weapons
	_weapons = [_factionByClassname, ["gear", "weapons"]] call Helpers_fnc_getFactionProperty;
	diag_log format ["Faction Weapons = %1", _weapons];

	// Get sorted list of weapons sorted by cost
	_weaponsSortedByCost = [_weapons, [(["cost"] call Helpers_fnc_indexOfProp_Weapon)], {_x select _input0}, "ASCEND"] call BIS_fnc_sortBy;
	diag_log format ["Faction Weapons Sorted By Cost = %1", _weaponsSortedByCost];

	// Get sorted list of weapons sorted by config_name
	_weaponsSortedByConfigName = [_weapons, [(["config_name"] call Helpers_fnc_indexOfProp_Weapon)], {_x select _input0}, "ASCEND"] call BIS_fnc_sortBy;
	diag_log format ["Faction Weapons Sorted By Config Name = %1", _weaponsSortedByConfigName];

	// Get sorted list of weapons sorted by display name
	_weaponsSortedByDisplayName = [_weapons, [(["name"] call Helpers_fnc_indexOfProp_Weapon)], {_x select _input0}, "ASCEND"] call BIS_fnc_sortBy;
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
} forEach _factions;


// debug
[g_cfg_Factions] call Helpers_fnc_debugPrettyDumpFactions;

// return
true;