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

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_cen"			,[]					,[]					,[]							],
		[	"_rad"			,250				,[0]				,[]							],
		[	"_hits"			,10					,[0]				,[]							],
		[	"_delay"		,0					,[0]				,[]							]];

// Local declarations
private		_ammo				= "";
private		_impact				= 0;

// Delay strike
sleep _delay;

// Start strike
while {_impact < _hits;} do {

	// Create mortar shell
	_ammo = "Sh_82mm_AMOS" createVehicle [((_cen select 0) + (random [-(_rad), 0, _rad])),((_cen select 1) + (random [-(_rad), 0, _rad])), 1000];
	
	// Set shell as falling
	_ammo setVelocity [ 0, 0, -40];
	
	// Delay next round
	sleep (1 + (random 10));

	// Increment number of rounds fired counter
	_impact = _impact + 1;
};