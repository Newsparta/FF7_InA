// Scans provided config for gear definitions
// returns array of [magazines,weapons,items]
params [
	["__config", configNull, [configNull]]
];

#include "configStructures.hpp";
_struct_wep = DATA_STRUCTURE_WEAPON;
_struct_mag = DATA_STRUCTURE_MAGAZINE;
_struct_msc = DATA_STRUCTURE_MISCITEM;
_defaults_wep = DATA_DEFAULT_WEAPON;
_defaults_mag = DATA_DEFAULT_MAGAZINE;
_defaults_msc = DATA_DEFAULT_MISCITEM;
//_struct_wep = ["classname", "name", "cost", "type"];
//_struct_mag = ["classname", "name", "cost", "type"];
//_struct_msc = ["classname", "name", "cost", "type"];
//_defaults_wep = ["", "", -1, ""];
//_defaults_mag = ["", "", -1, ""];
//_defaults_msc = ["", "", -1, ""];
_fnc_cfg_item_to_array = {
	params [
		["__item", configNull, [configNull]]
	];
	if (!assert(__item != configNull)) exitWith { 
		["", "", -1, ""];
	};

	private _cls = configName __item;
	private _name = "";
	private _cost = -1;
	private _type = "";


	if (__item >> "name" != configNull) then {
		_name = getText (__item >> "name");
	};
	if (__item >> "cost" != configNull) then {
		_cost = getNumber (__item >> "cost");
	};
	if (__item >> "type" != configNull) then {
		_type = getText (__item >> "type");
	};
	
	[
		_cls, 
		_name,
		_cost,
		_type
	];
};

// TODO: Make more generic.
// Must be elegant way to transform configs into arrays recursively using data index templates

// Gather definitions
private _magazines = [];
private _weapons = [];
private _miscItems = [];

{
	assert ([(configName _x), g_cfg_allMagazines] call Helpers_fnc_IsClassnameInArray);
	_value = [_x, _struct_mag, _defaults_mag] call Helpers_fnc_ConfigToArrayTemplate;
	_magazines pushBack _value;
} forEach configProperties [__config >> "magazines", "isClass _x", true];
if (count _magazines > 1) then { _magazines = [_magazines] call Helpers_fnc_SortArrayByClassname; };

{
	assert ([(configName _x), g_cfg_allWeapons] call Helpers_fnc_IsClassnameInArray);
	_value = [_x, _struct_wep, _defaults_wep] call Helpers_fnc_ConfigToArrayTemplate;
	_weapons pushBack _value;
} forEach configProperties [__config >> "weapons", "isClass _x", true];
if (count _weapons > 1) then { _weapons = [_weapons] call Helpers_fnc_SortArrayByClassname; };

{
	assert ([(configName _x), g_cfg_allMiscItems] call Helpers_fnc_IsClassnameInArray);
	_value = [_x, _struct_msc, _defaults_msc] call Helpers_fnc_ConfigToArrayTemplate;
	_miscItems pushBack _value;
} forEach configProperties [__config >> "miscItems", "isClass _x", true];
if (count _miscItems > 1) then { _miscItems = [_miscItems] call Helpers_fnc_SortArrayByClassname; };

// Return
[
	_magazines,
	_weapons,
	_miscItems
];