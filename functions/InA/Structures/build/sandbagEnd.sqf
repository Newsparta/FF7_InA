[clientOwner, "buildInventory"] remoteExec ["publicVariableClient", 2, false];

sleep 1;

cCost = 0.25;

if (buildInventory >= cCost) then {

	["BUILDING ACTIONS ADDED", "Building is hidden by default.<br/><br/>Use the SHOW and HIDE commands to toggle the visibility of the structure (keep it hidden if you dont need to see or place it yet, as to avoid accidentally squishing people)"] call FF7_fnc_formatHint;

	obj = "Land_BagFence_end_F" createVehicle [0,0,0];

	xPos = 0;
	yPos = 2.5;
	zPos = 0.4;

	aPos = 180;
	bPos = 0;
	cPos = 0;

	transX = 0;
	transY = 0;
	transZ = 0;

	transA = aPos;
	transC = cPos;

	disableSerialization;

	player addAction [["FF9900", "(Open Action Menu)"] call FF7_fnc_formatText, 
			{
				createDialog "InA_Build_Action_Dialog";
			}, [], 99, true, true, "", "",0];
} else {
	["Headquarters", "You do not have the logistical supplies to construct this fortification."] call FF7_fnc_formatHint;
};