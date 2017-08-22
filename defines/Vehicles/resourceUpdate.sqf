sleep 1;

[clientOwner, "LogV"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "LogF"] remoteExec ["publicVariableClient", 2, false];
	
sleep 0.2;
	
ctrlSetText [1003, (format ["%1",LogV])];
ctrlSetText [1004, (format ["%1",LogF])];
ctrlSetText [1005, (format ["%1",LogM])];