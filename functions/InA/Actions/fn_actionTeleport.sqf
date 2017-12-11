/* ----------
Function:
	InA_fnc_actionTeleport

Description:
	Choose a location to fast travel to

Parameters:

Optional:

Example:
	[] call InA_fnc_actionTeleport;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_mkr				= nil;
private		_hasMap				= false;
private		_pos				= [];
private		_regions			= [];
private		_validLoc			= false;
private		_travelLoc			= [];
private		_nmeCount			= 15;
private		_nmeRad				= 500;
private		_nme				= [];
private		_mkrLoc				= [];

// Notification
[false, "Select a location to fast travel."] call InA_fnc_formatHint;

// Execute on server
{
	// Collect region data
	private _regions = [] call InA_fnc_regionCheck;

	// Check for stable regions
	{
		if ((_x select 1) <= 0.5) then {
			fastTravelSites pushBack _x
			call compile format 
				[
					"
						_mkr = createMarker ['region%1', getMarkerPos '%1'];
						'region%1' setMarkerColor 'ColorWEST';
						'region%1' setMarkerShape 'ICON';
						'region%1' setMarkerType 'mil_end';
						'region%1' setMarkerText '%2';
					",
					_x select 0,
					_x select 2
				];
		};
	} forEach _regions;

	// Add FOB location if present
	if (fobPlaced) then {
		fastTravelSites pushBack ["fob_mark",0,""];
	};

	// Add camp location if present
	if (campPlaced) then {
		fastTravelSites pushBack ["camp_mark",0,""];
	};
} remoteExec ["BIS_fnc_call", 2];

// Sync travel sites
[clientOwner, "fastTravelSites"] remoteExec ["publicVariableClient", 2];

// delay to allow sync
sleep 0.2;

// Add main base location
fastTravelSites pushBack ["respawn_west",0,""];

if (count fastTravelSites < 2) exitwith {
	[false, "No locations available for fast travel."] call InA_fnc_formatHint;
};

// Open map for player
waitUntil { !isNull player };

// Check if player had a map before selecting
if ("ItemMap" in (assignedItems player)) then {
	_hasMap = true;
} else {
	player linkItem	"itemMap";
	_hasMap = false;
};

// Open map
if (_hasMap) then {
	openMap true;
} else {
	player linkItem	"itemMap";
	openMap true;
};

while {true;} do {
scopeName "travel";

	// Wait until player selects a location
	selectPos = false;
	fastTravel = [];
	onMapSingleClick "fastTravel = _pos; selectPos = true; onMapSingleClick ''; true;";
	waitUntil {selectPos or !(visiblemap)};

	if !(visiblemap) then {
		breakOut "travel";
	};

	{
		if ((side _x) == resistance) then {
			_nme pushBack _x;
		};
	} forEach allUnits;

	if (selectPos) then {

		_validLoc = false;

		{
			_mkrLoc = getMarkerPos (_x select 0);
			if ((fastTravel distance (getMarkerPos (_x select 0))) < 100) then {
				if (({_x distance _mkrLoc < _nmeRad} count _nme) > _nmeCount) then {
					[false, "Too many enemies are nearby."] call InA_fnc_formatHint;
					breakTo "travel";
				};
				if (({_x distance player < _nmeRad} count _nme) > _nmeCount) then {
					[false, "Too many enemies are nearby."] call InA_fnc_formatHint;
					breakTo "travel";
				};

				_validLoc = true;
				_travelLoc = _mkrLoc;
				breakOut "travel";
			};
		} forEach fastTravelSites;

		if !(_validLoc) then {
			[false, "Not a valid fast travel location."] call InA_fnc_formatHint;
			breakTo "travel";
		};
	};
};

// exit if closing map
if (!visibleMap) exitwith
{
	[false, "Fast travel aborted."] call InA_fnc_formatHint;
	if !(_hasMap) then {
		player unlinkItem "ItemMap";
	};

	{
		call compile format 
			[
				"
					deleteMarker 'region%1';
				",
				_x select 0
			];
	} forEach fastTravelSites;
};

// Initiate travel
[false, "Traveling."] call InA_fnc_formatHint;
if !(_hasMap) then {
	player unlinkItem "ItemMap";
};

// Delete markers
{
	call compile format 
		[
			"
				deleteMarker 'region%1';
			",
			_x select 0
		];
} forEach fastTravelSites;

// Close map and find safe location
openMap false;
_pos = [_travelLoc, 0, 20, 0, 0, -1, 0] call BIS_fnc_findSafePos;

// Black out
[["","BLACK OUT",4]] remoteExec ["titleCut", 0, false];
sleep 4;

// Travel text
[
	[
		["Traveling..."]
	] , 0, 0.5, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
] remoteExec ["BIS_fnc_typeText", 0];
sleep 3;

// Set location
player setPos _travelLoc;

// Fade back in
sleep 1;
[["","BLACK IN",4]] remoteExec ["titleCut", 0, false];
sleep 4;