/* ----------
Function: InA_fnc_taskUrbanPatrol

Description:
    A function to create waypoints specifically around structures instead of randomly placed

Parameters:
    - Group to patrol (Group)
	- Center location of patrol area (Position)

Optional:
    - Radius to patrol (Number)

Example:
   
    [group player, getPos player, 500] spawn InA_fnc_taskUrbanPatrol

Returns:
    Nil

Author:
    [FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_group"		,[]					,[]					,[]							],
		[	"_loc"			,[]					,[]					,[]							],
		[	"_rad"			,500				,[0]				,[]							]];

// Local declarations
private		_accepted			= false;
private		_end				= nil;
private		_pos				= [];
private		_restrict			= [0,0,0];
private		_wp					= [];
private		_wpd				= nil;

// Set behavior and speed
_group setBehaviour "SAFE";
_group setSpeedMode "LIMITED";

// Set waypoints
for "_i" from 1 to 6 do {
	_wp = [];
	_accepted = false;
	while {!_accepted;} do {
		_pos = [[[_loc,_rad]],["water","out"]] call BIS_fnc_randomPos;
		_wp = _pos isFlatEmpty [1, 0, 1, 1, 0, false];
		
		if (count _wp > 2) then {
			if ((((nearestTerrainObjects [_wp, ["HOUSE"], _rad]) select 0) distance _wp) < 10) then {
				if ((_wp distance _restrict) > 25) then {
					_accepted = true;
				};
			};
		};
	};

	_wpd = _group addWaypoint [_wp,0];
	_wpd setWaypointTimeout [5,10,15];
	_restrict = _wp;
};

// End with a cycle waypoint
_end = _group addWaypoint [_loc,0];
_end setWaypointType "CYCLE";
_end setWaypointCompletionRadius 15;