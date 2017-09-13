_export = [];

// ---------- Region stability ----------

_export pushBack ([]);

// ---------- Armory inventory ----------

_lI1 = [];
_lI2 = [];
_aI1 = [];
_aI2 = [];
_wI1 = [];
_wI2 = [];
_wI3 = [];
_gI1 = [];
_gI2 = [];
_eI1 = [];
_mI1 = [];
_dI = [];

_allItems = [];

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

// ---------- Logistics ----------

_export pushBack [];

// ---------- Vehicles ----------

_allVehicles = [];

_export pushBack _allVehicles;

// ---------- Check build vehicles ----------

_export pushBack [];

// ---------- Base type ----------

_export pushBack [];

// ---------- Main AO ----------

_export pushBack [false,[],[]];

// ---------- End ----------

_null = ["save", "data", _export] call FF7_fnc_extSerialize;

["SAVE", "Database has been reset."] remoteExec ["FF7_fnc_formatHint", 0];