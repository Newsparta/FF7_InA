disableSerialization;

createDialog "InA_Intel_Dialog";

waitUntil {!isNull (findDisplay 8200);};

[clientOwner, "intelActivity"] remoteExec ["publicVariableClient", 2];
[clientOwner, "givenType"] remoteExec ["publicVariableClient", 2];
[clientOwner, "givenLoc"] remoteExec ["publicVariableClient", 2];
[clientOwner, "givenMan"] remoteExec ["publicVariableClient", 2];

sleep 0.2;

ctrlSetText [1000, (format ["%1",intelActivity])];

_ctrl = (findDisplay 8200) displayCtrl 1100;
_ctrl ctrlSetStructuredText parseText format ["- %1",givenType];

_ctrl = (findDisplay 8200) displayCtrl 1101;
_ctrl ctrlSetStructuredText parseText format ["- %1",givenLoc];

_ctrl = (findDisplay 8200) displayCtrl 1102;
_ctrl ctrlSetStructuredText parseText format ["- %1",givenMan];