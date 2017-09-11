#include "ConfigStructure.hpp";

_fnc_debug_printlog_fixedwidth_item = {
	params [
		["__itemArray", ["","",-1,""], [[]], 4],
		["__bRemovePrefix", false, [true]]
	];
	
	private _columnStr = 47;
	private _columnCost = 17;
	private _columnType = 56;

	private _cls  = [    (__itemArray select 0), " ", _columnStr] call Helpers_fnc_stringPadRight;
	private _name = [    (__itemArray select 1), " ", _columnStr] call Helpers_fnc_stringPadRight;
	private _cost = [str (__itemArray select 2), " ", _columnCost] call Helpers_fnc_stringPadRight;
	private _type = [    (__itemArray select 3), " ", _columnType] call Helpers_fnc_stringPadRight;

	if (__bRemovePrefix) then {
		_cls = [_cls select [4], " ", _columnStr] call Helpers_fnc_stringPadRight;
	};

	diag_log format ["| %1 | %2 | %3 | %4 |",_cls, _name, _cost, _type];
};

_fnc_debug_printlog_fixedwidth_vehicle = {
	params [
		["__itemArray", ["","",-1,-1,-1,'',true,false], [[]]]
	];
	assert(count __itemArray >= 7); // Should be at least this many elements
	
	private _columnString = 47;
	private _columnCost = 9;
	private _columnPaint = 22;
	private _columnAnim = 5;
	private _columnUtil = 7;

	private _p = call compile (call compile (__itemArray select 5)); // <- this crap happens when you have no type safety!
	if (_p isEqualType []) then { // alignment hack
		_columnPaint = _columnPaint - 2;
	};

	private _cls   = [                 (__itemArray select 0), " ", _columnString] call Helpers_fnc_stringPadRight;
	private _name  = [                 (__itemArray select 1), " ", _columnString] call Helpers_fnc_stringPadRight;
	private _log   = [str              (__itemArray select 2), " ", _columnCost] call Helpers_fnc_stringPadRight;
	private _supp  = [str              (__itemArray select 3), " ", _columnCost] call Helpers_fnc_stringPadRight;
	private _fuel  = [str              (__itemArray select 4), " ", _columnCost] call Helpers_fnc_stringPadRight;
	private _paint = [                 (format ["%1", _p])   , " ", _columnPaint] call Helpers_fnc_stringPadRight;
	private _anim  = [                 (__itemArray select 6), " ", _columnAnim] call Helpers_fnc_stringPadRight;

	// Util is only in land vehicles
	private _util = ["N/A", " ", _columnUtil] call Helpers_fnc_stringPadRight;
	if (count __itemArray > 7) then {
		_util = [(__itemArray select 7), " ", _columnUtil] call Helpers_fnc_stringPadRight;
	};

	diag_log format ["| %1 | %2 | %3 | %4 | %5 | %6 | %7 | %8 |",_cls, _name, _log, _fuel, _supp, _paint, _anim, _util];
};

_fnc_debug_printlog_faction_clothes = {
	params [
		["__helmets", [], [[]]],
		["__vests", [], [[]]],
		["__uniforms", [], [[]]]
	];
	
	diag_log " ------------------------------------------------------------------------------------[ HELMETS ]----------------------------------------------------------------------------------- ";
	diag_log "| Classname                                       | Name                                            | Cost              | Type                                                     |";
	{ 
		[_x] call _fnc_debug_printlog_fixedwidth_item;
	} forEach __helmets;

	diag_log " -------------------------------------------------------------------------------------[ VESTS ]------------------------------------------------------------------------------------ ";
	diag_log "| Classname                                       | Name                                            | Cost              | Type                                                     |";
	{ 
		[_x] call _fnc_debug_printlog_fixedwidth_item;
	} forEach __vests;

	diag_log " ------------------------------------------------------------------------------------[ UNIFORMS ]---------------------------------------------------------------------------------- ";
	diag_log "| Classname                                       | Name                                            | Cost              | Type                                                     |";
	{ 
		[_x] call _fnc_debug_printlog_fixedwidth_item;
	} forEach __uniforms;
};

_fnc_debug_printlog_faction_gear = {
	params [
		["__weapons", [], [[]]],
		["__magazines", [], [[]]],
		["__miscItems", [], [[]]]
	];
	
	diag_log " -----------------------------------------------------------------------------------[ MAGAZINES ]---------------------------------------------------------------------------------- ";
	diag_log "| Classname                                       | Name                                            | Cost              | Type                                                     |";
	{ 
		[_x, true] call _fnc_debug_printlog_fixedwidth_item;
	} forEach __magazines;

	diag_log " ------------------------------------------------------------------------------------[ WEAPONS ]----------------------------------------------------------------------------------- ";
	diag_log "| Classname                                       | Name                                            | Cost              | Type                                                     |";
	{ 
		[_x] call _fnc_debug_printlog_fixedwidth_item;
	} forEach __weapons;

	diag_log " -----------------------------------------------------------------------------------[ MISC ITEMS ]--------------------------------------------------------------------------------- ";
	diag_log "| Classname                                       | Name                                            | Cost              | Type                                                     |";
	{ 
		[_x] call _fnc_debug_printlog_fixedwidth_item;
	} forEach __miscItems;
};

_fnc_debug_printlog_faction_vehicles = {
	params [
		["__land", [], [[]]],
		["__air", [], [[]]],
		["__water", [], [[]]]
	];
	diag_log " ---------------------------------------------------------------------------------[ LAND VEHICLES ]-------------------------------------------------------------------------------- ";
	diag_log "| Classname                                       | Name                                            | Logistics | Fuel      | Supplies  | Paint                  | Anim  | Is Util |";
	{ 
		[_x] call _fnc_debug_printlog_fixedwidth_vehicle;
	} forEach __land;

	diag_log " ---------------------------------------------------------------------------------[ AIR VEHICLES ]--------------------------------------------------------------------------------- ";
	diag_log "| Classname                                       | Name                                            | Logistics | Fuel      | Supplies  | Paint                  | Anim  | Is Util |";
	{ 
		[_x] call _fnc_debug_printlog_fixedwidth_vehicle;
	} forEach __air;

	diag_log " --------------------------------------------------------------------------------[ WATER VEHICLES ]-------------------------------------------------------------------------------- ";
	diag_log "| Classname                                       | Name                                            | Logistics | Fuel      | Supplies  | Paint                  | Anim  | Is Util |";
	{ 
		[_x] call _fnc_debug_printlog_fixedwidth_vehicle;
	} forEach __water;
};

_fnc_debug_printlog_faction_loadout = {
	params [
		["__primary", [], [[]]],
		["__secondary", [], [[]]],
		["__launcher", [], [[]]],
		["__helmet", [], [[]]],
		["__vest", [], [[]]],
		["__uniform", [], [[]]],
		["__equipment", [], [[]]]
	];
	diag_log " ------------------------------------------------------------------------------------[ LOADOUT ]----------------------------------------------------------------------------------- ";
	diag_log ([(format [" Primary Weapon = %1", __primary]), " ", 178] call Helpers_fnc_stringPadRight);
	diag_log ([(format [" Secondary Weapon = %1", __secondary]), " ", 178] call Helpers_fnc_stringPadRight);
	diag_log ([(format [" Launcher = %1", __launcher]), " ", 176] call Helpers_fnc_stringPadRight);
	diag_log ([(format [" Helmet = %1", __helmet]), " ", 178] call Helpers_fnc_stringPadRight);
	diag_log ([(format [" Vest = %1", __vest]), " ", 178] call Helpers_fnc_stringPadRight);
	diag_log ([(format [" Uniform = %1", __uniform]), " ", 178] call Helpers_fnc_stringPadRight);
	diag_log ([(format [" Equipment = %1", __equipment]), " ", 180] call Helpers_fnc_stringPadRight);

};

_fnc_debug_printlog_faction = {
	params [
		["__factionArray", [], [[]]]
	];
	diag_log (["", " ", 180] call Helpers_fnc_stringPadRight); // spacer
	diag_log "=================================================================================== FACTION DUMP ===================================================================================";
	diag_log format [" %1 ", [(format ["Faction Classname: %1", _x select 0]), " ", 178] call Helpers_fnc_stringPadRight];
	diag_log format [" %1 ", [(format ["Faction Name: %1", _x select 1]), " ", 178] call Helpers_fnc_stringPadRight];
	diag_log format [" %1 ", [(format ["Faction Side: %1", _x select 2]), " ", 178] call Helpers_fnc_stringPadRight];

	[
		_x SELECT_FACTION_DATA("gear") SELECT_GEAR_DATA("weapons"),
		_x SELECT_FACTION_DATA("gear") SELECT_GEAR_DATA("magazines"),
		_x SELECT_FACTION_DATA("gear") SELECT_GEAR_DATA("miscitems")
	] call _fnc_debug_printlog_faction_gear;

	[
		_x SELECT_FACTION_DATA("vehicles") SELECT_VEHICLES_DATA("land"),
		_x SELECT_FACTION_DATA("vehicles") SELECT_VEHICLES_DATA("air"),
		_x SELECT_FACTION_DATA("vehicles") SELECT_VEHICLES_DATA("water")
	] call _fnc_debug_printlog_faction_vehicles;

	[
		_x SELECT_FACTION_DATA("clothes") SELECT_CLOTHES_DATA("helmets"),
		_x SELECT_FACTION_DATA("clothes") SELECT_CLOTHES_DATA("vests"),
		_x SELECT_FACTION_DATA("clothes") SELECT_CLOTHES_DATA("uniforms")
	] call _fnc_debug_printlog_faction_clothes;

	[
		_x SELECT_FACTION_DATA("loadout") SELECT_LOADOUT_DATA("primary"),
		_x SELECT_FACTION_DATA("loadout") SELECT_LOADOUT_DATA("secondary"),
		_x SELECT_FACTION_DATA("loadout") SELECT_LOADOUT_DATA("launcher"),
		_x SELECT_FACTION_DATA("loadout") SELECT_LOADOUT_DATA("helmet"),
		_x SELECT_FACTION_DATA("loadout") SELECT_LOADOUT_DATA("vest"),
		_x SELECT_FACTION_DATA("loadout") SELECT_LOADOUT_DATA("uniform"),
		_x SELECT_FACTION_DATA("loadout") SELECT_LOADOUT_DATA("equipment")
	] call _fnc_debug_printlog_faction_loadout;

	diag_log "====================================================================================================================================================================================";
};

_fnc_debug_printlog_allFactions = {
	params [
		["__factionsArray", [], [[]]]
	];
	diag_log "Dumping All Factions";
	diag_log "====================================================================================================================================================================================";
	{
		[_x] call _fnc_debug_printlog_faction;
	} forEach __factionsArray;
	diag_log (["", " ", 180] call Helpers_fnc_stringPadRight); // spacer
	diag_log "====================================================================================================================================================================================";
};

if (!isNil "g_cfg_Factions") then {
	[g_cfg_Factions] call _fnc_debug_printlog_allFactions;
} else {
	diag_log "[ERROR] 'g_cfg_Factions' is undefined!";
};