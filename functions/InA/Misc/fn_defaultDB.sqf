_export = [];

// ---------- Region stability ----------

_export pushBack ([]);

// ---------- Armory inventory ----------

_launcherInventory = [];
_explosiveInventory = [];
_ammoInventory = [];
_weaponInventory1 = [];
_weaponInventory2 = [];
_grenadeInventory = [];
_equipmentInventory = [];
_medicalInventory = [];
_miscInventory = [];
_dumpInventory = [];

_export pushBack _launcherInventory;
_export pushBack _explosiveInventory;
_export pushBack _ammoInventory;
_export pushBack _weaponInventory1;
_export pushBack _weaponInventory2;
_export pushBack _grenadeInventory;
_export pushBack _equipmentInventory;
_export pushBack _medicalInventory;
_export pushBack _miscInventory;
_export pushBack _dumpInventory;

// ---------- Logistics ----------

_export pushBack [];

// ---------- Vehicles ----------

_allVehicles = [];

_export pushBack _allVehicles;

// ---------- End ----------

_export = str _export;

_null = ["save",_export] call FF7_fnc_extSerialize;

["SAVE", "Database has been reset."] remoteExec ["FF7_fnc_formatHint", 0];