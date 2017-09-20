// ---------- MAIN ----------

["HQ", "Headquarters", "Evac is on standby ..."] call FF7_fnc_globalHintStruct;

waitUntil { !isNull player };
openMap true;

InA_EvacLZ = false;
onMapSingleClick "evacLZ = _pos; InA_EvacLZ = true; onMapSingleClick ''; true;";
waitUntil {InA_EvacLZ or !(visiblemap)};

if (!visibleMap) exitwith
{
	["HQ", "Headquarters","Evac cancelled ..."] call FF7_fnc_globalHintStruct;
};

publicVariableServer "evacLZ";

openMap false;

["HQ", "Headquarters","Coordinates received, Evac is en route..."] call FF7_fnc_globalHintStruct;

[[], "functions\InA\Support\evac.sqf"] remoteExec ["execVM", 2];