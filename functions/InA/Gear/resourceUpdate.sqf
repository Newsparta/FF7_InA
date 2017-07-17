// ---------- Update logistics amount ----------

[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];

sleep 0.2;

ctrlSetText [1002, (format ["%1",LogM])];	