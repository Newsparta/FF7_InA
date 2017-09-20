[clientOwner, "gearRestricted"] remoteExec ["publicVariableClient", 2, false];

sleep 0.2;

if (!(_this select 1 == leader (group (_this select 1))) && (gearRestricted)) exitWith {
	["Headquarters", "Only the squad leader may access gear requisition."] call FF7_fnc_formatHint;
};

call compile preprocessFileLineNumbers "defines\Vehicles\airVehicleHandles.sqf";