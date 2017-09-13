/* ----------
Function: InA_fnc_WAD

Description:
    A function to remove insurgent weapons from a container for disposal

Parameters:
    - Cargo box (Object)

Optional:
    - 

Example:
   
    [_box] spawn InA_fnc_WAD

Returns:
    Nil

Author:
    Newsparta
---------- */
// ---------- Parameters ----------

params ["_box"];

// ---------- Main ----------

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearItemCargoGlobal _box;