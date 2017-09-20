private ["_obj","_player","_files","_computers"];
// ---------- Init ----------

_obj = (_this select 0);
_player = (_this select 1);

_comp = ["Land_Laptop_F"];
_file = ["Land_File1_F","Land_File2_F","Land_FilePhotos_F"];

_player switchMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";

// ---------- Delete intel ----------

sleep 1;

_obj remoteExec ["deleteVehicle", 2, false];

[clientOwner, "compObj"] remoteExec ["publicVariableClient", 2];

sleep 0.2;

compObj = compObj + 1;
publicVariableServer "compObj";
