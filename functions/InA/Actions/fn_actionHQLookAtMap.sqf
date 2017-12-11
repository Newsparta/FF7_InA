/* ----------
Function:
	InA_fnc_actionHQLookAtMap

Description:
	Allow someone to look at a map without having one

Parameters:

Optional:

Example:
	_ths call InA_fnc_actionHQLookAtMap;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Check if player alreay has a map
if ("ItemMap" in (assignedItems player)) exitWith {
	[false, "you already have a map to look at."] call InA_fnc_formatHint;
};

// Link map to player
(_this select 1) linkItem "ItemMap";

// Open the map
openMap true;

// Wait until they close the map
waitUntil {sleep 1; !visibleMap};

// Unlink the map
(_this select 1) unlinkItem "ItemMap";