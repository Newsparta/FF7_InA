/* ----------
Function:
	InA_fnc_MGNest

Description:
	Spawn an encampment with HMG's

Parameters:
	- Location to spawn encampment (Location)

Optional:

Example:
	[[0,0,0]] call InA_fnc_MGNest;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_pos"			,[]					,[]					,[]						]];	

// Local declarations
private		_group				= [];
private		_i					= 0;
private		_net				= ObjNull;
private		_obj				= ObjNull;
private		_xPos				= [];
private		_yPos				= [];
private		_zDir				= [];

// Create main camonet
_net = INS_CAMONET createVehicle _pos;
waitUntil {alive _net};
_net allowDamage false;
_net setDir (random 360);
_net setPos [_pos select 0, _pos select 1, 0];

// Create Trenches
_xPos = [-7.342,-2.664,2.151,7.149,2.325,-2.221];
_yPos = [-2.929,5.369,5.359,2.651,-5.657,-5.836];
_zDir = [72.986,184.274,170.930,240.171,2.847,353.591];

for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
			
	_obj = createVehicle ["Land_Trench_01_grass_F",[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-1.9
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

// Create long sandbags
_xPos = [-5.805,-1.564,1.734,5.910,1.528,-2.334];
_yPos = [-1.947,3.509,3.535,1.294,-3.848,-4.136];
_zDir = [252.469,184.390,355.182,59.442,181.420,171];

for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
			
	_obj = createVehicle [INS_SANDBAG_LONG,[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-0.8
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

// Create round sandbags
_xPos = [-4.599,4.227];
_yPos = [-3.917,3.351];
_zDir = [32.002,205.769];

for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
			
	_obj = createVehicle [INS_SANDBAG_ROUND,[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-0.8
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

// Create short sandbags
_xPos = [-3.821,3.725];
_yPos = [3.797,-3.934];
_zDir = [189.749,184.830];

for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {
	
	_obj = createVehicle [INS_SANDBAG_SHORT,[0,0,0],[],0,"CAN_COLLIDE"];
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			-0.8
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
	sleep 0.1;
};

// Create HMG's
_xPos = [4.241,-4.076];
_yPos = [0.906,-1.780];
_zDir = [61.346,254.267];

for [{_i = 0}, {_i <= ((count _xPos) - 1)}, {_i = _i + 1}] do {

	if (supplier == "BLU") then {
		_obj = createVehicle [(selectRandom INS_STATIC_HMG_BLU),[0,0,0],[],0,"CAN_COLLIDE"];
	} else {
		_obj = createVehicle [(selectRandom INS_STATIC_HMG_OPF),[0,0,0],[],0,"CAN_COLLIDE"];
	};
	_obj attachTo [_net, 
		[
			(_xPos select _i),
			(_yPos select _i),
			0.75
		]
	];
	detach _obj;
	_obj setDir (direction _net + (_zDir select _i));
			
	_group = 
	[
		[0,0,0], 
		INDEPENDENT, 
		[
			(selectRandom INS_INF_SINGLE)
		]
	] call BIS_fnc_spawnGroup;
	(units _group select 0) moveInTurret [_obj, [0]];
	[units _group] call InA_fnc_insCustomize;
	sleep 0.1;
};

// Create wooden crates
_obj = createVehicle ["Land_WoodenCrate_01_stack_x5_F",[0,0,0],[],0,"CAN_COLLIDE"];
_obj attachTo [_net, 
	[
		0.274,
		-2.733,
		-0.25
	]
];
detach _obj;
_obj setDir (direction _net + 0);

_obj = createVehicle ["Land_WoodenCrate_01_stack_x3_F",[0,0,0],[],0,"CAN_COLLIDE"];
_obj attachTo [_net, 
	[
		1.969,
		-2.803,
		-0.4
	]
];
detach _obj;
_obj setDir (direction _net + 184.398);

// Create garbage
_obj = createVehicle ["Land_Garbage_square5_F",[0,0,0],[],0,"CAN_COLLIDE"];
_obj attachTo [_net, 
	[
		2.116,
		0.106,
		-1.1
	]
];
detach _obj;
_obj setDir (direction _net + 91.709);

_obj = createVehicle ["Land_Garbage_square3_F",[0,0,0],[],0,"CAN_COLLIDE"];
_obj attachTo [_net, 
	[
		-1.898,
		-2.267,
		-1.1
	]
];
detach _obj;
_obj setDir (direction _net + 0);