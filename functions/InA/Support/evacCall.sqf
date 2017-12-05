/* ----------
Script:
	Evac Call
Description:
	Allow player to select evac location
Author:
	[FF7] Newsparta
---------- */

// Notification
[true, "Headquarters", "Evac is on standby ...", "Headquarters"] call InA_fnc_formatHint;

// Open map for player
waitUntil { !isNull player };
openMap true;

// Wait until player selects a location
InA_EvacLZ = false;
onMapSingleClick "evacLZ = _pos; InA_EvacLZ = true; onMapSingleClick ''; true;";
waitUntil {InA_EvacLZ or !(visiblemap)};

// exit if closing map
if (!visibleMap) exitwith
{
	[true, "Headquarters","Evac cancelled ...", "Headquarters"] call InA_fnc_formatHint;
};

// Call evac
publicVariableServer "evacLZ";

openMap false;

[true, "Headquarters","Coordinates received, Evac is en route...", "Headquarters"] call InA_fnc_formatHint;

[[], "functions\InA\Support\evac.sqf"] remoteExec ["execVM", 2];