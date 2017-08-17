/* ----------
Function: InA_fnc_ambientModule

Description:
    A function to manage ambient elements

Parameters:
    - Center Location (Position)
	- Name of the ambient Area (String)
	- Radius of the ambient area (Number)

Optional:


Example:
   
    [[0,0,0], Tanouka, 2000] spawn InA_fnc_ambientModule

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- Parameters ----------

params ["_loc","_name",["_rad", 1000, [0]],["_size", "small", [""]]];
	
// ---------- Main ----------
private ["_instability","_reward","_affect","_didSomething","_affectTimer","_i","_ambMult","_patrols","_groups","_group","_pos","_car","_nme"];

sleep random 3;

_instability = (0.5 + (random 0.5));
_reward = false;
_affect = false;
_didSomething = false;
_affectTimer = 1;
_i = 0;
_ambMult = 0.75;

call compile format
[
	"%1Occupied = false",
	_name
];

call compile format
[
	"instability%1 = %2",
	_name,
	_instability
];

while {true} do {

	sleep (2 + (random 2));
	
	_i = 0;
	
	if ({_x distance _loc < (_rad * 1.5)} count (allPlayers - entities "HeadlessClient_F") > 0) then {
	
		call compile format
		[
			"
				
				if (!%1Occupied) then {
					
					[%2,%3,'%4',%5] call InA_fnc_ambientEntrance;
				};
				
				%1Occupied = true;
			",
			_name,
			_loc,
			_rad,
			_size,
			_instability
		];
	
	};

	if ({_x distance _loc < _rad} count (allPlayers - entities "HeadlessClient_F") > 0) then {
		
		if (_instability < 0.5) then {

			_reward = false;
			_affect = false;
			_didSomething = false;
			_affectTimer = 0.25;
			_ambMult = 0.25;
		};
		if ((_instability >= 0.5) && {_instability < 0.9}) then {

			_reward = false;
			_affect = false;
			_didSomething = false;
			_affectTimer = 0.75;
			_ambMult = 1.25;
		};
		if (_instability >= 0.9) then {
			
			_reward = true;
			_affect = false;
			_didSomething = false;
			_affectTimer = 1;
			_ambMult = 1.75;
		};
		
		while {true} do {
			scopeName "entered";
			
			sleep (2 + (random 2));
			
			_i = _i + 1;
			
			if (_i >= 225) then {
				_ambMult = 0.25;
			};
			
			if ({_x distance _loc < _rad} count (allPlayers - entities "HeadlessClient_F") > 0) then {
	
				if (random 100 < (0.7 + (0.7 * _ambMult * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
					[
						_loc, 
						_rad + 500, 
						(_rad/2), 
						1
					] spawn InA_fnc_insLightInfantryAttack;
				};
				if (random 100 < (0.025 + (0.025 * _ambMult))) then {
					[
						_loc, 
						_rad + 1000, 
						(_rad/2), 
						1
					] spawn InA_fnc_insLightCarAttack;
				};
				if (random 100 < (0.02 + (0.02 * _ambMult))) then {
					[
						_loc, 
						_rad + 1000, 
						(_rad/2), 
						1
					] spawn InA_fnc_insMediumCarAttack;
				};
				if (random 100 < (0.025 + (0.025 * _ambMult))) then {
					[
						_loc, 
						_rad + 1000, 
						(_rad/2), 
						1
					] spawn InA_fnc_insMediumTruckTransport;
				};
				if (random 100 < (0.0125 + (0.025 * _ambMult * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
					[
						_loc, 
						_rad + 1000, 
						(_rad/2), 
						1
					] spawn InA_fnc_insApcTransport;
				};
				if (random 100 < (0.006250 + (0.0125 * _ambMult * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
					[
						_loc, 
						_rad + 1000, 
						(_rad/2),  
						1
					] spawn InA_fnc_insIfvTransport;
				};
				if (random 100 < (0.008 + (0.008 * _ambMult * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
					[
						_loc, 
						_rad + 2500, 
						(_rad/2), 
						1
					] spawn InA_fnc_insLightHeliAttack;
				};
				if (random 100 < (0.006250 + (0.006250 * _ambMult))) then {
					[
						_loc, 
						_rad + 1000, 
						(_rad/2), 
						1
					] spawn InA_fnc_insTankAttack;
				};
				if (random 100 < (0.006250 + (0.006250 * _ambMult))) then {
					[
						_loc, 
						_rad + 2500, 
						(_rad/2),  
						1
					] spawn InA_fnc_insMediumHeliTransport;
				};
				if (random 100 < (0.001562 + (0.001562 * _ambMult))) then {
					[
						_loc, 
						_rad + 2500, 
						(_rad/2), 
						1
					] spawn InA_fnc_insHeavyHeliTransport;
				};
				if (random 100 < (0.004 + (0.004 * _ambMult * ((count (call BIS_fnc_listPlayers)) * 0.1)))) then {
					[
						_loc, 
						_rad + 1000, 
						(_rad/2), 
						1
					] spawn InA_fnc_insLightBoatAttack;
				};
			};
			
			if ({_x distance _loc < _rad} count (allPlayers - entities "HeadlessClient_F") < 1) then {
				if (_loc distance mission > (_rad * 2)) then {
				
					["HQ", "DEBUG", "Exited Ambient Area."] call FF7_fnc_globalHintStruct;
					
					_nme = {(side _x == resistance) && ((_x distance _loc) < _rad)} count allUnits;
					
					if (_affect) then {
						if (_nme > 15) then {
							_instability = random 0.5;
							if (_nme > 25) then {
								_instability = (0.5 + (random 0.5));
							};
						} else {
							_instability = 0;
						};
						
						call compile format
						[
							"instability%1 = %2",
							_name,
							_instability
						];
					};
				
					[_loc,_rad,_name] spawn {
					
						_loc = _this select 0;
						_rad = _this select 1;
						_name = _this select 2;
						
						waitUntil {sleep (2 + (random 2)); {_x distance _loc < (_rad * 2)} count (allPlayers - entities "HeadlessClient_F") < 1};
						
						call compile format
						[
							"%1Occupied = false",
							_name
						];
						
						[_loc,_rad] spawn InA_fnc_cleanup;
					};
					
					[_loc, _rad, 1,"unlock"] spawn InA_fnc_houseLocks;
					
					ambientExited = true;
					_i = 0;
				
					breakOut "entered";
				};
			};
			
			_affectTimer = _affectTimer - (0.0034 + (.0001 * ({(side _x == west) && ((_x distance _loc) < _rad)} count allUnits)));
			
			if (_affectTimer < 0) then {
				_affectTimer = 0;
				
				if !(_affect) then {
				
					[format ["%1", _name], "The region has been affected by your presence."] remoteExec ["FF7_fnc_formatHint", 0, false];
					_affect = true;
					
					if (_reward) then {
						LogV = LogV + 1;
						civTol = civTol + 0.1;
						_reward = false;
					};
				};
				
				_nme = {(side _x == resistance) && ((_x distance _loc) < _rad)} count allUnits;
				
				if ((!_didSomething) and {_nme <= 15}) then {
				
					_didSomething = true;
					
					sleep 3;
					
					[format ["%1", _name], "The region appears to be pacified."] remoteExec ["FF7_fnc_formatHint", 0, false];
				};
			};
		};
	};

	call compile format
	[
		"
			if (_instability == instability%1) then {
				_instability = _instability + 0.00000165;
			} else {
				_instability = instability%1;
			};
		",
		_name,
		_instability
	];
	
	if (_instability > 1) then {
		_instability = 1;
	};
	
	if (_instability < 0) then {
		_instability = 0;
	};

	call compile format
	[
		"instability%1 = %2",
		_name,
		_instability
	];
};
