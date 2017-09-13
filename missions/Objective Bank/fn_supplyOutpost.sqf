// ---------- Arguments ----------

params ["_loc",["_virgin", true,[true]],["_rad", 500,[0]]];
private ["_tPos","_accepted","_pos","_net","_target","_xPos","_yPos","_zDir","_i","_obj"];
#define CRATES "Land_Cargo10_blue_F","Land_Cargo10_brick_red_F","Land_Cargo10_cyan_F","Land_Cargo10_grey_F","Land_Cargo10_light_blue_F","Land_Cargo10_light_green_F","Land_Cargo10_military_green_F","Land_Cargo10_orange_F","Land_Cargo10_red_F","Land_Cargo10_sand_F","Land_Cargo10_white_F","Land_Cargo10_yellow_F"


// ---------- Main ----------

_pos = [];

/*
Select objective location, using mission location if virgin or input location if not.
*/

if (_virgin) then {
	_tPos = [];
	_accepted = false;
	while {!_accepted} do {
		_pos = [[[_loc,_rad]],["water","out"]] call BIS_fnc_randomPos;
		_tPos = _pos isFlatEmpty [1, 0, 0.2, 4, 0, false];
		
		_roads = nearestTerrainObjects [_pos, ["ROAD","MAIN ROAD"], 30];
		
		if (count _tPos > 2) then {
			if (count _roads < 1) then {
				_accepted = true;
			};
		};		
	};
} else {
	_pos = _loc;
};

// ---------- insert spawn into memory ----------

mainObj pushBack ["supplyOutpost",_pos];

/*
Loop for spawning objective when players are near.
*/

while {!InA_missionCompleted} do {

	sleep (2 + (random 2));

	if ({_x distance mission < mainLimit} count (allPlayers - entities "HeadlessClient_F") > 0) then {

		///////////////////////////
		// objective spawn start //
		///////////////////////////

		_net = INS_CAMONET createVehicle _pos;
		waitUntil {alive _net};
		_net setDir (random 360);
		_net setPos [_pos select 0, _pos select 1, 0];

		_target = _net;
		_loc = getPosATL _net;

		spawnedObj pushBack ["supply cache", _loc];

		_obj = createVehicle [[CRATES] call BIS_fnc_selectRandom,[0,0,0],[],0,"CAN_COLLIDE"];
		_obj attachTo [_net, 
			[
				-4.183,
				-2.243,
				0
			]
		];
		detach _obj;
		_obj setDir (direction _net + 0);
		_obj enableSimulationGlobal false;

		_obj = createVehicle ["Land_WoodenCrate_01_stack_x5_F",[0,0,0],[],0,"CAN_COLLIDE"];
		_obj attachTo [_net, 
			[
				-0.914,
				-2.015,
				-0.25
			]
		];
		detach _obj;
		_obj setDir (direction _net + 3.877);

		_obj = createVehicle ["Land_WoodenCrate_01_stack_x3_F",[0,0,0],[],0,"CAN_COLLIDE"];
		_obj attachTo [_net, 
			[
				0.965,
				-2.358,
				-0.45
			]
		];
		detach _obj;
		_obj setDir (direction _net + 272.34);

		_obj = createVehicle ["Land_WoodenCrate_01_stack_x3_F",[0,0,0],[],0,"CAN_COLLIDE"];
		_obj attachTo [_net, 
			[
				2.671,
				-2.221,
				-0.45
			]
		];
		detach _obj;
		_obj setDir (direction _net + 181.507);

		_obj = createVehicle ["Land_PicnicTable_01_F",[0,0,0],[],0,"CAN_COLLIDE"];
		_obj attachTo [_net, 
			[
				4.279,
				1.949,
				-0.75
			]
		];
		detach _obj;
		_obj setDir (direction _net + 0);

		_obj = createVehicle ["Land_WaterTank_04_F",[0,0,0],[],0,"CAN_COLLIDE"];
		_obj attachTo [_net, 
			[
				-4.057,
				0.453,
				0
			]
		];
		detach _obj;
		_obj setDir (direction _net + 181.507);

		/////////////////////////
		// objective spawn end //
		/////////////////////////

		// ---------- target confirmation ----------

		[_target,_loc] spawn {

			_target = _this select 0;
			_loc = _this select 1;
			
			while {InA_missionActive} do {
			
				sleep (2 + (random 2));
				
				_virgin = false;
				
				if ({_x distance _loc < 50} count (allPlayers - entities "HeadlessClient_F") > 0) then {
				
					_virgin = true;
					
					_z = random 1;
					
					while {true} do {
						scopeName format ["target%1",_z];
						
						sleep (2 + (random 2));
						
						if (_virgin && {!alive _target}) then {
							
							signalArray pushBack _target;
							signalType pushBack "supplyOutpost";
							_virgin = false;
						};
						
						if ({_x distance _loc < 50} count (allPlayers - entities "HeadlessClient_F") < 1) then {
							if !(_virgin) then {
								signalArray = signalArray - [_target];
								signalType = signalType - ["supplyOutpost"];
							};
							
							breakOut format ["target%1",_z];
						};
					};
				};
			};
		};

		// ---------- near objective pause loop ----------

		while {true} do {
			scopeName "obj_sup";

			sleep (2 + (random 2));

			if ({_x distance mission < mainLimit} count (allPlayers - entities "HeadlessClient_F") < 1) then {
				breakOut "obj_sup";
			};

		};

	};

};