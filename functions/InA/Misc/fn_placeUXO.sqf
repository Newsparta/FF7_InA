/* ----------
Function: InA_fnc_placeUXO

Description:
    A function to place a small field of UXO within a radius.

Parameters:
    - Center Location (Position)
	- Radius (Number)

Optional:
    - Radius of field (Number)
	- UXO's to place (Number)

Example:
   
    [[0,0,0], 100] call InA_fnc_placeUXO

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- Parameters ----------

params ["_loc", ["_rad", 1000, [0]], ["_fieldSize", 20, [0]], ["_total", 20, [0]]];

_allUXO = 
[
	"BombCluster_01_UXO1_F",
	"BombCluster_02_UXO1_F",
	"BombCluster_03_UXO1_F",
	"BombCluster_01_UXO2_F",
	"BombCluster_02_UXO2_F",
	"BombCluster_03_UXO2_F",
	"BombCluster_01_UXO3_F",
	"BombCluster_02_UXO3_F",
	"BombCluster_03_UXO3_F",
	"BombCluster_01_UXO4_F",
	"BombCluster_02_UXO4_F",
	"BombCluster_03_UXO4_F"
];

// ---------- Location selection ----------

_fieldLoc = [];
_accepted = false;
while {!_accepted} do {
	_pos = [[[_loc,_rad]],["water","out"]] call BIS_fnc_randomPos;
	_fieldLoc = _pos isFlatEmpty [1, 0, 1, 1, 0, false];

	_isNear = false;

	{
		if ((_x distance _pos) < 250) then {
			_isNear = true;
		};
	} forEach (allPlayers - entities "HeadlessClient_F");
			
	if (count _fieldLoc > 2) then {
		if !(_isNear) then {
			if (_fieldLoc distance (getMarkerPos "respawn_west") > 1000) then {
				_accepted = true;
			};
		};
	};
};

// ---------- Spawn UXO's ----------

for "_i" from 1 to _total do {
	_pos = [[[_fieldLoc,_fieldSize]],["water","out"]] call BIS_fnc_randomPos;
	_uxo = (selectRandom _allUXO) createVehicle _pos;
	_uxo setDir (random 360);
	_uxo setPos [_pos select 0,_pos select 1, 0];
};