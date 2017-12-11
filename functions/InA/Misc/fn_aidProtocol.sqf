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
    [FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_veh"			,[]					,[]					,[]							]];

// Local declarations
private		_agent				= nil;
private		_i					= 0;
private		_loc				= [];
private		_pos				= [];
private		_rad				= 500;
private		_region				= "";
private		_vehicles			= [];

// Find all IDAP vehicles
_vehicles = nearestObjects [getPosATL _veh, idap_cars, 1250];

// Remove all actions
{
	[_x] remoteExec ["removeAllActions", 0];
} forEach _vehicles;

// Find location of deploy vehicle
_loc = getPosATL _veh;

// Notification
[true, "Keep the aid vehicle in the region for 5 minutes to deploy the supplies.", "IDAP"] remoteExec ["InA_fnc_formatHint", 0, false];

// Keep engine off while deployed
_veh engineOn false;
[_veh] spawn {

	_veh = _this select 0;

	while {!aidDeployed} do {

		if (isEngineOn _veh) then {
			_veh engineOn false;
		};
	};
};

// Create passive IDAP agents
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

// Deploy leep
while {_i <= 150;} do {

	sleep 2;

	// Check if destroyed
	if !(alive _veh) exitWith {
		[true, "The aid vehicle has been destroyed.", "IDAP"] remoteExec ["InA_fnc_formatHint", 0, false];
	};

	// Check if max timer reached
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

	// increment counter
	_i = _i + 1;
};