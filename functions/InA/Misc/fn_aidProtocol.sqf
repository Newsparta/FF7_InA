/* ----------
Function: InA_fnc_aidProtocol

Description:
    A function to add aid action to vehicle.

Parameters:
    - Aid vehicle (Object)
	- Name of region (String)

Optional:


Example:
   
    [[0,0,0]] spawn InA_fnc_aidProtocol

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- Parameters ----------

params ["_veh"];
	
// ---------- Main ----------

_vehicles = nearestObjects [getPosATL _veh, idap_cars, 1250];

{
	[_x] remoteExec ["removeAllActions", 0];
} forEach _vehicles;

_loc = getPosATL _veh;
_rad = 500;

[true, "Keep the aid vehicle in the region for 5 minutes to deploy the supplies.", "IDAP"] remoteExec ["InA_fnc_formatHint", 0, false];

_veh engineOn false;
[_veh] spawn {

	_veh = _this select 0;

	while {!aidDeployed} do {

		if (isEngineOn _veh) then {
			_veh engineOn false;
		};
	};
};

_i = 0;

for "_i" from 1 to 5 do {

	_pos = [_loc, 0, 10, 1, 0, 1, 0] call BIS_fnc_findSafePos;
	_agent = createAgent [(selectRandom idap_men), _pos, [], 0, "NONE"];
	_agent disableAI "FSM";
	_agent setBehaviour "CARELESS";
	removeAllAssignedItems _agent;
	
	[_agent, _loc, _rad] spawn InA_fnc_agentUrbanPatrol;
	
	_agent addEventHandler ["killed",{[_this select 0,_this select 1] spawn InA_fnc_civKilled;}];
	_agent addEventHandler ["firedNear",{ambientShotsFired = true;}];
};

while {_i <= 150;} do {

	sleep 2;

	if !(alive _veh) exitWith {
		[true, "The aid vehicle has been destroyed.", "IDAP"] remoteExec ["InA_fnc_formatHint", 0, false];
	};

	if (_i >= 150) then {

		[true, "Aid has been successfully deployed.", "IDAP"] remoteExec ["InA_fnc_formatHint", 0, false];

		{
			_region = ["ambient",(_x select 0)] joinString "";
			_loc = (getMarkerPos _region);
			if ((_loc distance _veh) < 1000) then {
				fortifiedRegions pushBack _loc;
				[_loc] spawn {
					sleep 604800;
					fortifiedRegions = fortifiedRegions - [_loc];
				};
			};
		} forEach ambientSitrep;

		LogV = LogV + 1;
		civTol = civTol + 0.1;
		compObj = compObj + 1;

		aidDeployed = true;

	};

	_i = _i + 1;
};