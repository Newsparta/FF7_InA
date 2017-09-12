// Reads all InA faction config data and preloads them into a global variable (server-side) 
// for faster access (at cost of few mb of memory + initial load time)

// Run once and only on server
if !(isServer || !isNil "g_cfg_initDone") exitWith {};

g_cfg_initDone = false; // for other scripts waiting for this to finish
g_cfg_Factions = ([] call Helpers_fnc_composeFactionConfigs);
g_cfg_initDone = true;

// debug
[g_cfg_Factions] call Helpers_fnc_debugPrettyDumpFactions;

// return
true;