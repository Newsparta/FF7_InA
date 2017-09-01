// ---------- ARGUMENTS ----------

_player = _this select 0; // player requesting Evac

// ---------- MAIN ----------

if !(FF7_playerEvac) exitWith {["HQ", "Headquarters", "Evac is currently unavailable ..."] call FF7_fnc_globalHintStruct};

if (InA_EvacDisabled) exitWith {["HQ", "Headquarters", "Evac is currently disabled ..."] call FF7_fnc_globalHintStruct};

_null = [] execVM "functions\InA\Support\evacCall.sqf";