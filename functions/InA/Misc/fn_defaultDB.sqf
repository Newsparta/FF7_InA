/* ----------
Function:
	InA_fnc_defaultDB

Description:
	Resets database to default values.

Parameters:

Optional:

Example:
	[] call InA_fnc_defaultDB;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_export				= [];
private		_lI1 				= [];
private 	_lI2 				= [];
private		_aI1 				= [];
private		_aI2 				= [];
private 	_wI1 				= [];
private 	_wI2 				= [];
private 	_wI3 				= [];
private 	_gI1 				= [];
private 	_gI2 				= [];
private 	_eI1 				= [];
private 	_mI1 				= [];
private 	_dI 				= [];
private 	_allItems 			= [];
private 	_allVehicles 		= [];
private		_null				= nil;

// Region Stability
_export pushBack ([]);

// Armory Inventory
_allItems pushBack _lI1;
_allItems pushBack _lI2;
_allItems pushBack _eI1;
_allItems pushBack _aI1;
_allItems pushBack _aI2;
_allItems pushBack _wI1;
_allItems pushBack _wI2;
_allItems pushBack _wI3;
_allItems pushBack _gI1;
_allItems pushBack _gI2;
_allItems pushBack _eI1;
_allItems pushBack _mI1;
_allItems pushBack _dI;

_export pushBack _allItems;

// Logistics
_export pushBack [];

// Vehicles
_export pushBack _allVehicles;

// Check build vehicles
_export pushBack [];

// Base type
_export pushBack [];

// FOB
_export pushBack [false, [0,0,0]];

// Stronghold
_export pushBack [false, [0,0,0]];

// Save data
_null = ["save", "data", _export] call InA_fnc_extSerialize;
[true, "Reset.", "Database"] remoteExec ["InA_fnc_formatHint", 0];