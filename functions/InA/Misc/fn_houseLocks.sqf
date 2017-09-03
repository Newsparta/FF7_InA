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

// ---------- PARAMETERS ----------

params ["_loc",["_rad", 1000, [0]],["_pct", 0.5, [0]],["_state", "lock", [""]]];

// ---------- MAIN ----------

if (_state == "lock") then {

	_houses = nearestTerrainObjects [_loc, ["HOUSE"], _rad];

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

	_houses = nearestTerrainObjects [_loc, ["HOUSE"], _rad];

	{
		for [{_i=0}, {_i < 10}, {_i = _i + 1}] do {
			_x setVariable [format ['bis_disabled_Door_%1', _i],0,true];
		};

	} forEach _houses;

};