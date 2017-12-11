/* ----------
Function:
	InA_fnc_camp

Description:
	Set up a small camp

Parameters:

Optional:

Example:
	[] call InA_fnc_camp;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_delay				= 3600;
private		_isNear				= false;

// Sync server variable
[clientOwner, "campTimeout"] remoteExec ["publicVariableClient", 2];
[clientOwner, "utilityVehicles"] remoteExec ["publicVariableClient", 2];

// Delay to allow sync
sleep 0.2;

// Check if camp is on cooldown
if (campTimeout) exitWith {[false, "A camp has been placed too recently."] call InA_fnc_formatHint;};

// Get player location and direction
_dir = direction player;
_pos = getPosATL player;

// Get region data
_regions = [] call InA_fnc_regionCheck;

// Find any nearby regions
{
	if (getMarkerPos (_x select 0) distance _pos < 1050) then {
		_isNear = true;
	};
} forEach _regions;

// Check if near any regions
if (_isNear) exitWith {[false, "Area is too close to a region. Must be more than 1.05km away"] call InA_fnc_formatHint;};

// Check if near main base
if (getMarkerPos "respawn_west" distance _pos < 2000) exitWith {[false, "Area is too close to the base. Must be more than 2km away"] call InA_fnc_formatHint;};

// Check if valid location
_check = _pos isFlatEmpty [0, 0, 0.2, 4, 0, false];
if (count _check < 2) exitWith {[false, "Area is not suitable for camping (too steep)."] call InA_fnc_formatHint;};

// Check if overriding old camp
if (campPlaced) then {
	{
		// Delete marker
		deleteMarker "camp_mark";

		// Find all objects
		_objCamp = nearestObjects [InA_camp_location,["Static", "Thing"],50];

		// Delete all objects
		{
			deleteVehicle _x;
		} forEach _objCamp;
	} remoteExec ["BIS_fnc_call", 2];
};

// Set camp active
campPlaced = true;
publicVariableServer "campPlaced";

// Set camp location
InA_camp_location = _pos;
publicVariableServer "InA_camp_location";

// Set camp marker
{
	private _mkr = createMarker ["camp_mark", InA_camp_location];
	"camp_mark" setMarkerColor "ColorWest";
	"camp_mark" setMarkerShape "ICON";
	"camp_mark" setMarkerType "b_installation";
	"camp_mark" setMarkerText "Camp";
} remoteExec ["BIS_fnc_call", 2];

// Create Tent
_obj = createVehicle ["Land_TentDome_F",[0,0,0],[],0,"CAN_COLLIDE"];
_obj attachTo [player, 
	[
		0,
		3,
		0
	]
];
detach _obj;
_obj setPos [(getPosATL _obj select 0), (getPosATL _obj select 1), 0];
_obj setDir (_dir + 90);
[_obj, false] remoteExec ["enableSimulation", 0];

// Add tent to build vehicles
utilityVehicles pushBack [_obj, 10, 10, false];
publicVariableServer "utilityVehicles";

// Add actions to tent
[_obj, [
	"Fast travel",
	{_this call InA_fnc_actionTeleport;}, 
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 8)"
]] remoteExec ["addAction", 0, true];

[_obj, [
	"Pack up camp",
	{[] remoteExec ["InA_fnc_packUpCamp", 2];},
	[], 
	97, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 8)"
]] remoteExec ["addAction", 0, true];

// Create table
_table = createVehicle ["Land_CampingTable_small_F",[0,0,0],[],0,"CAN_COLLIDE"];
_table attachTo [player, 
	[
		2,
		0,
		0
	]
];
detach _table;
_table setPos [(getPosATL _table select 0), (getPosATL _table select 1), 0];
_table setDir (_dir + 90);

// Create map
_obj = createVehicle ["Land_Map_Tanoa_F",[0,0,0],[],0,"CAN_COLLIDE"];
_obj attachTo [_table, 
	[
		0,
		0,
		0.81
	]
];
detach _obj;
_obj setDir (_dir + 180);

// Add action to map
[_obj, [
	"Look at map",
	{_this call InA_fnc_actionHQLookAtMap;}, 
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 8)"
]] remoteExec ["addAction", 0, true];

// Create campfire
_obj = createVehicle ["Campfire_burning_F",[0,0,0],[],0,"CAN_COLLIDE"];
_obj attachTo [player, 
	[
		0,
		-2,
		0
	]
];
detach _obj;
_obj setPos [(getPosATL _obj select 0), (getPosATL _obj select 1), 0];
_obj setDir (_dir + 0);

// Skip time
[0.5] remoteExec ["skipTime", 0, false];

// Notification
[false, "Camp has been set up."] remoteExec ["InA_fnc_formatHint", 0];

// Set camp cooldown
campTimeout = true;
publicVariableServer "campTimeout";

// Cooldown timer
sleep _delay;

// Reset camp cooldown
campTimeout = false;
publicVariableServer "campTimeout";