/* ----------
Function: InA_fnc_mortarStrike

Description:
    A function to drop mortar shells on a position

Parameters:
	- Center of area to hit (Position)

Optional:
	- Radius of the strike (Number)
    - Total number of mortar rounds to drop (Number)
	- Time to delay the strike (Number)

Example:
   
    [[0,0,0], 250, 10, 0] call InA_fnc_mortarStrike

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- PARAMETERS ----------

params ["_center", ["_radius", 250, [0]], ["_hits", 10, [0]], ["_delay", 0, [0]]];

// ---------- MAIN ----------
private ["_ammo","_impact"];

sleep _delay;
_impact = 0;
while {_impact < _hits} do {
	_ammo = "Sh_82mm_AMOS" createVehicle [((_center select 0) + (random [-(_radius), 0, _radius])),((_center select 1) + (random [-(_radius), 0, _radius])), 1000];
	_ammo setVelocity [ 0, 0, -40];
			
	sleep (1 + (random 10));
	_impact = _impact + 1;
};