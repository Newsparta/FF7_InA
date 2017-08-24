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

closeDialog 0;