/* ----------
Script:
	Resource update

Description:
	update supply values

Author:
	[FF7] Newsparta
---------- */

// Sync value with server
[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];

// Delay to allow sync
sleep 0.2;

// Set text value
ctrlSetText [1002, (format ["%1",LogM])];	