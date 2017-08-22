/* ----------
Function: InA_fnc_placeObj

Description:
    A function to place an object from build action menu.

Parameters:
    - 

Example:
   
    [object] call InA_fnc_placeObj

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- PARAMETERS ----------

// ---------- MAIN ----------

detach obj;
buildInventory = buildInventory - cCost;
publicVariableServer "buildInventory";

removeAllActions player;

[clientOwner, "InA_fob_location"] remoteExec ["publicVariableClient", 2, false];
[clientOwner, "InA_fob_array"] remoteExec ["publicVariableClient", 2, false];
sleep 0.2;

if (obj distance Ina_fob_location <= 100) then {

	InA_fob_array pushBack obj;
	publicVariableServer "InA_fob_array";
};

closeDialog 0;