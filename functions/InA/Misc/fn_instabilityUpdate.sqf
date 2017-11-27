/* ----------
Function: InA_fnc_instabilityUpdate

Description:
    A function to manage ambient region stability

Parameters:
    - Center Location (Position)
	- Name of the ambient Area (String)
	- initial instability value (Number)

Optional:


Example:
   
    [[0,0,0], Tanouka, 0.5] spawn InA_fnc_instabilityUpdate

Returns:
    Nil

Author:
    Newsparta
---------- */

//      |  Private Name     | Default Value     | Expected Types    | Expected Array Count |
params [[   "_loc"         	,[]                 ,[]               	,[]                  	], 
        [   "_name"  		,""             	,[""]               ,[]                   	],
        [   "_instability"  ,0              	,[0]             	,[]                   	],
		[	"_period"		,1800				,[0]				,[]						]];

// loop start
while {true;} do {

	// delay timer
	sleep ((_period * 0.85) + (random (_period * 0.15)));
	
	// check if region was made volatile and remove from fortified list
	call compile format
	[
		"
			if (%1 in _loc) then {
				if (%2 > 0.5) then {
					fortifiedRegions = fortifiedRegions - [_loc];
				};
			};
		",
		_name,
		_instability
	];

	// generic instability gain
	_instability = call compile format
	[
		"
			if (%2 == instability%1) then {
				%2 + (0.001488 * (1/volatileRate));
			} else {
				instability%1;
			};
		",
		_name,
		_instability
	];

	// max and min instability checks
	if (_instability > 1) then {
		_instability = 1;
	};
	if (_instability < 0) then {
		_instability = 0;
	};

	// instability value update
	call compile format
	[
		"instability%1 = %2",
		_name,
		_instability
	];
};