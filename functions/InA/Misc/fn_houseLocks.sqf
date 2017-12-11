/* ----------
Function: InA_fnc_houseLocks

Description:
    A function to manage locking/unlocking random houses

Parameters:
    - Center Location (Position)
	- Radius to search for buildings (Number)
	- Radius of the ambient area (Number)

Optional:


Example:
   
    [[0,0,0], 2000] spawn InA_fnc_houseLocks

Returns:
    Nil

Author:
    Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_loc"			,[]					,[]					,[]							],
		[	"_rad"			,1000			 	,[0]				,[]							],
		[	"_pct"			,0.5				,[0]				,[]							],
		[	"_state"		,"lock"				,[""]				,[]							]];

// Local declarations
private		_houses				= [];
private		_i					= 0;

// Check if locking or unlocking
if (_state == "lock") then {

	// Find all houses
	_houses = nearestTerrainObjects [_loc, ["HOUSE"], _rad];

	// Lock all the doors
	{
		
		for [{_i=1}, {_i < 11}, {_i = _i + 1}] do {
	
			_x animate [format ["Door_%1_rot", _i], 0];
		};

		if (floor (random 100) < (_pct * 100)) then {
			for [{_i=0}, {_i < 10}, {_i = _i + 1}] do {
				_x setVariable [format ['bis_disabled_Door_%1', _i],1,true];
			};
		};

	} forEach _houses;
	
} else {

	// Find all the houses
	_houses = nearestTerrainObjects [_loc, ["HOUSE"], _rad];

	// Unlock all the doors
	{
		for [{_i=0}, {_i < 10}, {_i = _i + 1}] do {
			_x setVariable [format ['bis_disabled_Door_%1', _i],0,true];
		};

	} forEach _houses;

};