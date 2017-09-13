// -------- FASTEST METHOD (between 0.5 to 2.0 times faster)
// Get all faction names
_factions = [];
{ _factions pushBack (_x select g_IDX_FACTION_CONFIG_NAME);
} forEach g_cfg_Factions;
diag_log format ["Found %1 factions: %2", count _factions, _factions];

// Assume we are faction AAF (by default, this is index 0, would be loaded from db or chosen by user)
_factionIndex = 0;

// Get faction by index
_factionAAF = g_cfg_Factions select _factionIndex;
diag_log format ["Faction By Index = %1", _factionAAF];

// Get faction name
_factionName = _factionAAF select g_IDX_FACTION_NAME;
diag_log format ["Faction Name = %1", _factionName];

// Get all faction weapons
_weapons = (_factionAAF select g_IDX_FACTION_GEAR) select g_IDX_FACTION_GEAR_WEAPONS;
diag_log format ["Faction Weapons = %1", _weapons];

// Get list of weapons sorted by cost
_weaponsSortedByCost = [
	_weapons, 
	[g_IDX_FACTION_GEAR_WEAPONS_COST], 
	{_x select _input0}, 
	"ASCEND"
] call BIS_fnc_sortBy;
diag_log format ["Faction Weapons Sorted By Cost = %1", _weaponsSortedByCost];

// Get list of weapons sorted by config_name
_weaponsSortedByConfigName = [
	_weapons, 
	[g_IDX_FACTION_GEAR_WEAPONS_CONFIG_NAME], 
	{_x select _input0}, 
	"ASCEND"
] call BIS_fnc_sortBy;
diag_log format ["Faction Weapons Sorted By Config Name = %1", _weaponsSortedByConfigName];

// Get list of weapons sorted by display name
_weaponsSortedByDisplayName = [
	_weapons, 
	[g_IDX_FACTION_GEAR_WEAPONS_NAME], 
	{_x select _input0}, 
	"ASCEND"
] call BIS_fnc_sortBy;
diag_log format ["Faction Weapons Sorted By Display Name = %1", _weaponsSortedByDisplayName];

// Select a random weapon
_randWeapon = selectRandom _weapons;
diag_log format ["Random Weapon = %1", _randWeapon];

// Get classname of weapon
_randWepClassname = _randWeapon select g_IDX_FACTION_GEAR_WEAPONS_CONFIG_NAME;
diag_log format ["Random Weapon Classname = %1", _randWepClassname];

// Get the weapon by its classname alone
_weaponByClassname = [];
{
	if ((_x select g_IDX_FACTION_GEAR_WEAPONS_CONFIG_NAME) isEqualTo _randWepClassname) exitWith {
		_weaponByClassname = _x;
	};
} forEach _weapons;
diag_log format ["Weapon by Classname = %1", _weaponByClassname];

diag_log format ["Weapon Name = %1", _weaponByClassname select g_IDX_FACTION_GEAR_WEAPONS_NAME];
diag_log format ["Weapon Cost = %1", _weaponByClassname select g_IDX_FACTION_GEAR_WEAPONS_COST];
diag_log format ["Weapon Type = %1", _weaponByClassname select g_IDX_FACTION_GEAR_WEAPONS_TYPE];