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

// Collect server variable
[clientOwner, "utilityVehicles"] remoteExec ["publicVariableClient", 2, false];

// Delay to allow sync
sleep 0.2;

// Find utility vehicle
{

	if (kitVeh in _x) then {

		veh = _x;
		kitVal = _x select 1;

	};

} forEach utilityVehicles;

// Check if you have the resources
if (kitVal >= objCost) then {

    detach obj;
    veh set [1,(kitVal - objCost)];
    publicVariableServer "utilityVehicles";

    removeAllActions player;

    closeDialog 0;
} else {
    ["Headquarters", "You do not have the logistical supplies to construct this fortification (someone has built after you selected and before you placed)."] call FF7_fnc_formatHint;
};