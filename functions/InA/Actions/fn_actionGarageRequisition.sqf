[clientOwner, "gearRestricted"] remoteExec ["publicVariableClient", 2, false];

sleep 0.2;

if (!(_this select 1 == leader (group (_this select 1))) && (gearRestricted)) exitWith {
	[false, "only the squad leader may access the garage."] call InA_fnc_formatHint;
};

call compile preprocessFileLineNumbers "defines\Vehicles\landVehicleHandles.sqf";