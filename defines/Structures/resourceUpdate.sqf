[clientOwner, "buildInventory"] remoteExec ["publicVariableClient", 2, false];

sleep 0.2;
	
ctrlSetText [1001, (format ["%1",kitVal])];