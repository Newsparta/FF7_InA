params ["_civ"];
private ["_num"];
// ---------- Interrogate init ----------

_num = random 1;

if ((_num >= 0) && {_num <= (0.1 + (0.8 * civTol))}) then {

	[clientOwner, "intelType"] remoteExec ["publicVariableClient", 2, false];
	[clientOwner, "intelLoc"] remoteExec ["publicVariableClient", 2, false];
	[clientOwner, "intelMan"] remoteExec ["publicVariableClient", 2, false];
	[clientOwner, "mission"] remoteExec ["publicVariableClient", 2, false];

	sleep 1;

	_civ remoteExec ["removeAllActions", 0];

	_state = 0;
	_check = "";
	response = "";

	// ---------- Conversation subjects ----------
		
		// ---------- Idle subjects ----------
		
		_IDLpool = 
		[
			format 
			[
				"%1 %2 %3", 
				(selectRandom (subjectPersonal + subjectOther)), 
				(selectRandom verbSee), 
				(selectRandom predicateSeen)
			],
			format 
			[
				"%1 %2 %3", 
				(selectRandom subjectPersonal), 
				(selectRandom verbLikeSingular),
				(selectRandom predicateLike)
			],
			format 
			[
				"%1 %2 %3", 
				(selectRandom subjectOther), 
				(selectRandom verbLikePlural),
				(selectRandom predicateLike)
			]
		];
		_IDL01 = 
		[
			selectRandom _IDLpool,
			nil,
			"Intimidate"
		];
		
		_IDLpool = 
		[
			format 
			[
				"%1 %2 %3 %4", 
				(selectRandom subjectPersonal),
				(selectRandom verbThinkSingular),
				(selectRandom subjectWar), 
				(selectRandom predicateThink)
			],
			format 
			[
				"%1 %2 %3 %4", 
				(selectRandom subjectOther),
				(selectRandom verbThinkPlural),
				(selectRandom subjectWar), 
				(selectRandom predicateThink)
			]
		];
		_IDL02 = 
		[
			selectRandom _IDLpool,
			nil,
			"Intimidate"
		];
		
		_IDLpool = 
		[
			format 
			[
				"my %1 was %2",
				(selectRandom subjectObject), 
				(selectRandom predicateDestroyed)
			],
			format 
			[
				"%1 %2 a %3 %4",
				(selectRandom (subjectPersonal + subjectOther)),
				(selectRandom verbWitness),
				(selectRandom subjectObject), 
				(selectRandom predicateWitness)
			]
		];
		_IDL03 = 
		[
			selectRandom _IDLpool,
			nil,
			"Intimidate"
		];
		
		_IDLpool = 
		[
			format 
			[
				"%1 %2 %3 %4", 
				(selectRandom subjectPersonal),
				(selectRandom verbHopeSingular),
				(selectRandom subjectTimeFuture), 
				(selectRandom predicateHope)
			],
			format 
			[
				"%1 %2 %3 %4", 
				(selectRandom subjectOther),
				(selectRandom verbHopePlural),
				(selectRandom subjectTimeFuture), 
				(selectRandom predicateHope)
			]
		];
		_IDL04 = 
		[
			selectRandom _IDLpool,
			nil,
			"Intimidate"
		];
		
		_IDLpool = 
		[
			format 
			[
				"I am %1", 
				(selectRandom predicateOccupation)
			],
			format 
			[
				"%1 is %2", 
				(selectRandom subjectOther),
				(selectRandom predicateOccupation)
			]
		];
		_IDL05 = 
		[
			selectRandom _IDLpool,
			nil,
			"Intimidate"
		];
		
		_IDLpool = 
		[
			format 
			[
				"%1 %2 %3", 
				(selectRandom subjectPersonal),
				(selectRandom verbHaveSingular),
				(selectRandom predicateCommonObject)
			],
			format 
			[
				"%1 %2 %3", 
				(selectRandom subjectOther),
				(selectRandom verbHavePlural),
				(selectRandom predicateCommonObject)
			]
		];
		_IDL06 = 
		[
			selectRandom _IDLpool,
			nil,
			"Intimidate"
		];
		
		// ---------- Success subjects ----------
		
		_SUCpool = 
		[
			format 
			[
				"the insurgents %1 %2", 
				(selectRandom verbCritical), 
				(selectRandom subjectOther)
			]
		];
		_SUC01 = 
		[
			selectRandom _SUCpool,
			"Sympathize",
			"Intimidate"
		];
		
		_SUCpool = 
		[
			format 
			[
				"%1 if the insurgents %2 %3", 
				(selectRandom verbMove),
				(selectRandom verbSee),
				(selectRandom predicateUneasy)
			],
			format 
			[
				"%1 if %2 %3 %4", 
				(selectRandom verbMove), 
				(selectRandom subjectOther),
				(selectRandom verbSee),				
				(selectRandom predicateUneasy)
			]
		];
		_SUC02 = 
		[
			selectRandom _SUCpool,
			"Persuade",
			"Question"
		];
		
		_SUCpool = 
		[
			format 
			[
				"%1 %2 %3", 
				(selectRandom subjectPersonal), 
				(selectRandom verbDoSingular), 
				(selectRandom predicateSkeptic)
			],
			format 
			[
				"%1 %2 %3", 
				(selectRandom subjectOther), 
				(selectRandom verbDoPlural), 
				(selectRandom predicateSkeptic)
			]
		];
		_SUC03 = 
		[
			selectRandom _SUCpool,
			"Intimidate",
			"Sympathize"
		];
		
		_SUCpool = 
		[
			format 
			[
				"%1 %2", 
				(selectRandom subjectPersonal), 
				(selectRandom predicateInform)
			]
		];
		_SUC04 = 
		[
			selectRandom _SUCpool,
			"Question",
			"Persuade"
		];
		
		// ---------- Subject compile ----------
		
		_idle = 
		[
			_IDL01,
			_IDL02,
			_IDL03,
			_IDL04,
			_IDL05,
			_IDL06
		];
		_success = 
		[
			_SUC01,
			_SUC02,
			_SUC03,
			_SUC04
		];
		
		_alt = random 1;
		_tree = [];
		_endTree = [];

		if ((_alt >= 0) && {_alt <= (0.2 + (0.2 * civTol))}) then {
		
			_select = selectRandom _success;
			_tree = _tree + [_select];
			_success = _success - [_select];
			
			_select = selectRandom _idle;
			_tree = _tree + [_select];
			_idle = _idle - [_select];
			
			_select = selectRandom _idle;
			_tree = _tree + [_select];
			_idle = _idle - [_select];
			
			_select = selectRandom _idle;
			_tree = _tree + [_select];
			_idle = _idle - [_select];
			
			_endTree = _tree call BIS_fnc_arrayShuffle;
		} else {
			
			_select = selectRandom _idle;
			_tree = _tree + [_select];
			_idle = _idle - [_select];
			
			_select = selectRandom _idle;
			_tree = _tree + [_select];
			_idle = _idle - [_select];
			
			_select = selectRandom _idle;
			_tree = _tree + [_select];
			_idle = _idle - [_select];
			
			_select = selectRandom _idle;
			_tree = _tree + [_select];
			_idle = _idle - [_select];
			
			_endTree = _tree call BIS_fnc_arrayShuffle;
		};

	disableSerialization;

	createDialog "InA_CivConverse_Dialog";

	waitUntil {!isNull (findDisplay 8102);};
	
	_ctrl = (findDisplay 8102) displayCtrl 1100;
	
	// ---------- Subject 1 ----------
	
		responded = false;

		_ctrl ctrlSetStructuredText parseText format ["%1",_endTree select 0 select 0];
		
		waitUntil {sleep 1; if (isNull (findDisplay 8102)) exitWith {true}; responded};
		
		if (response == (_endTree select 0 select 1)) then {
			
			if (random 1 < 0.5) then {
			
				[clientOwner, "intelType"] remoteExec ["publicVariableClient", 2, false];
				[clientOwner, "intelLoc"] remoteExec ["publicVariableClient", 2, false];
				[clientOwner, "intelMan"] remoteExec ["publicVariableClient", 2, false];
				[clientOwner, "InA_missionActive"] remoteExec ["publicVariableClient", 2, false];
				
				sleep 0.2;
				
				if (InA_missionActive) then {
					_exit = false;
					while {true} do {
						scopeName "intelLoop";
					
						if (intelType select 1 == 1) then {
							if (intelLoc select 1 == 1) then {
								if (intelMan select 1 == 1) then {
								_exit = true
								};
							};
						};
						
						if (_exit) exitWith {["INTERACTION","This person affirms the intel you already have."] call FF7_fnc_formatHint;};

						_array = 
						[
							intelType,
							intelLoc,
							intelMan
						];
						
						_selection = (selectRandom _array);
						_state = _selection select 1;
						_check = _selection select 0;
						
						if (_state == 0) then {breakOut "intelLoop";};
					};
					
					[_check,_civ] spawn InA_fnc_intelUpdate;			
				} else {
				
					_nearGuer = {side _x == resistance} count (_civ nearEntities ["Man", 3000]);
					
					if (_nearGuer > 0) then {
						
						_men = [];
						{
							if (side _x == resistance) then {
								_men = _men + [_x];
							};
						} forEach (_civ nearEntities ["Man", 3000]);
						
						_mkrName = random 1;
						
						_mkr = createMarker [format ["%1",_mkrName], selectRandom _men];
						format ["%1",_mkrName] setMarkerColor "ColorGuer";
						format ["%1",_mkrName] setMarkerShape "ICON";
						format ["%1",_mkrName] setMarkerType "o_inf";
						format ["%1",_mkrName] setMarkerText "Infantry";
						
						[_mkrName] spawn {
							private ["_i"];
						
							_mkrName = _this select 0;
							
							_i = 1;
							while {_i = _i - (1/120); _i > 0} do {
							
								format ["%1",_mkrName] setMarkerAlpha _i;
								
								sleep 1;
							};

							sleep 120;

							deleteMarker format ["%1",_mkrName];
						};
						
						["INTERACTION","This person saw some enemies moving around in the immediate area."] call FF7_fnc_formatHint;
					} else {
						["INTERACTION","This person has not seen any insurgents recently."] call FF7_fnc_formatHint;
					};
				};
			} else {
				_nearGuer = {side _x == resistance} count (_civ nearEntities ["Man", 3000]);
				
				if (_nearGuer > 0) then {
				
					_men = [];
					{
						if (side _x == resistance) then {
							_men = _men + [_x];
						};
					} forEach (_civ nearEntities ["Man", 3000]);
					
					_mkrName = random 1;
					
					_mkr = createMarker [format ["%1",_mkrName], selectRandom _men];
					format ["%1",_mkrName] setMarkerColor "ColorGuer";
					format ["%1",_mkrName] setMarkerShape "ICON";
					format ["%1",_mkrName] setMarkerType "o_inf";
					format ["%1",_mkrName] setMarkerText "Infantry";
					
					[_mkrName] spawn {
						private ["_i"];
					
						_mkrName = _this select 0;
						
						_i = 1;
						while {_i = _i - (1/120); _i > 0} do {
						
							format ["%1",_mkrName] setMarkerAlpha _i;
							
							sleep 1;
						};
						
						sleep 120;
							
						deleteMarker format ["%1",_mkrName];
					};
					
					["INTERACTION","This person saw some enemies moving around in the immediate area."] call FF7_fnc_formatHint;
				} else {
					["INTERACTION","This person has not seen any insurgents recently."] call FF7_fnc_formatHint;
				};
			};
		};
		if (response == (_endTree select 0 select 2)) exitWith {
		
			closeDialog 0;
			
			["INTERACTION","This person is taken aback at your behavior."] call FF7_fnc_formatHint;
		};
		
		responded = false;
		
	// ---------- Subject 2 ----------

		_ctrl ctrlSetStructuredText parseText format ["%1",_endTree select 1 select 0];
		
		waitUntil {sleep 1; if (isNull (findDisplay 8102)) exitWith {true}; responded};
		
		if (response == (_endTree select 1 select 1)) then {
				
			if (random 1 < 0.5) then {
			
				[clientOwner, "intelType"] remoteExec ["publicVariableClient", 2, false];
				[clientOwner, "intelLoc"] remoteExec ["publicVariableClient", 2, false];
				[clientOwner, "intelMan"] remoteExec ["publicVariableClient", 2, false];
				[clientOwner, "InA_missionActive"] remoteExec ["publicVariableClient", 2, false];
				
				sleep 0.2;
				
				if (InA_missionActive) then {
					_exit = false;
					while {true} do {
						scopeName "intelLoop";
					
						if (intelType select 1 == 1) then {
							if (intelLoc select 1 == 1) then {
								if (intelMan select 1 == 1) then {
								_exit = true
								};
							};
						};
						
						if (_exit) exitWith {["INTERACTION","This person affirms the intel you already have."] call FF7_fnc_formatHint;};

						_array = 
						[
							intelType,
							intelLoc,
							intelMan
						];
						
						_selection = (selectRandom _array);
						_state = _selection select 1;
						_check = _selection select 0;
						
						if (_state == 0) then {breakOut "intelLoop";};
					};
					
					[_check,_civ] spawn InA_fnc_intelUpdate;			
				} else {
				
					_nearGuer = {side _x == resistance} count (_civ nearEntities ["Man", 3000]);
					
					if (_nearGuer > 0) then {
					
						_men = [];
						{
							if (side _x == resistance) then {
								_men = _men + [_x];
							};
						} forEach (_civ nearEntities ["Man", 3000]);
						
						_mkrName = random 1;
						
						_mkr = createMarker [format ["%1",_mkrName], selectRandom _men];
						format ["%1",_mkrName] setMarkerColor "ColorGuer";
						format ["%1",_mkrName] setMarkerShape "ICON";
						format ["%1",_mkrName] setMarkerType "o_inf";
						format ["%1",_mkrName] setMarkerText "Infantry";
						
						[_mkrName] spawn {
							private ["_i"];
						
							_mkrName = _this select 0;
							
							_i = 1;
							while {_i = _i - (1/120); _i > 0} do {
							
								format ["%1",_mkrName] setMarkerAlpha _i;
								
								sleep 1;
							};

							sleep 120;

							deleteMarker format ["%1",_mkrName];
						};
						
						["INTERACTION","This person saw some enemies moving around in the immediate area."] call FF7_fnc_formatHint;
					} else {
						["INTERACTION","This person has not seen any insurgents recently."] call FF7_fnc_formatHint;
					};
				};
			} else {
				_nearGuer = {side _x == resistance} count (_civ nearEntities ["Man", 3000]);
				
				if (_nearGuer > 0) then {
				
					_men = [];
					{
						if (side _x == resistance) then {
							_men = _men + [_x];
						};
					} forEach (_civ nearEntities ["Man", 3000]);
					
					_mkrName = random 1;
					
					_mkr = createMarker [format ["%1",_mkrName], selectRandom _men];
					format ["%1",_mkrName] setMarkerColor "ColorGuer";
					format ["%1",_mkrName] setMarkerShape "ICON";
					format ["%1",_mkrName] setMarkerType "o_inf";
					format ["%1",_mkrName] setMarkerText "Infantry";
					
					[_mkrName] spawn {
						private ["_i"];
					
						_mkrName = _this select 0;
						
						_i = 1;
						while {_i = _i - (1/120); _i > 0} do {
						
							format ["%1",_mkrName] setMarkerAlpha _i;
							
							sleep 1;
						};
						
						sleep 120;
							
						deleteMarker format ["%1",_mkrName];
					};
					
					["INTERACTION","This person saw some enemies moving around in the immediate area."] call FF7_fnc_formatHint;
				} else {
					["INTERACTION","This person has not seen any insurgents recently."] call FF7_fnc_formatHint;
				};
			};
		};
		if (response == (_endTree select 1 select 2)) exitWith {
		
			closeDialog 0;
			
			["INTERACTION","This person is taken aback at your behavior."] call FF7_fnc_formatHint;
		};
		
		responded = false;
		
	// ---------- Subject 3 ----------

		_ctrl ctrlSetStructuredText parseText format ["%1",_endTree select 2 select 0];
		
		waitUntil {sleep 1; if (isNull (findDisplay 8102)) exitWith {true}; responded};
		
		if (response == (_endTree select 2 select 1)) then {
			
			if (random 1 < 0.5) then {
			
				[clientOwner, "intelType"] remoteExec ["publicVariableClient", 2, false];
				[clientOwner, "intelLoc"] remoteExec ["publicVariableClient", 2, false];
				[clientOwner, "intelMan"] remoteExec ["publicVariableClient", 2, false];
				[clientOwner, "InA_missionActive"] remoteExec ["publicVariableClient", 2, false];
				
				sleep 0.2;
				
				if (InA_missionActive) then {
					_exit = false;
					while {true} do {
						scopeName "intelLoop";
					
						if (intelType select 1 == 1) then {
							if (intelLoc select 1 == 1) then {
								if (intelMan select 1 == 1) then {
								_exit = true
								};
							};
						};
						
						if (_exit) exitWith {["INTERACTION","This person affirms the intel you already have."] call FF7_fnc_formatHint;};

						_array = 
						[
							intelType,
							intelLoc,
							intelMan
						];
						
						_selection = (selectRandom _array);
						_state = _selection select 1;
						_check = _selection select 0;
						
						if (_state == 0) then {breakOut "intelLoop";};
					};
					
					[_check,_civ] spawn InA_fnc_intelUpdate;			
				} else {
				
					_nearGuer = {side _x == resistance} count (_civ nearEntities ["Man", 3000]);
					
					if (_nearGuer > 0) then {
					
						_men = [];
						{
							if (side _x == resistance) then {
								_men = _men + [_x];
							};
						} forEach (_civ nearEntities ["Man", 3000]);
						
						_mkrName = random 1;
						
						_mkr = createMarker [format ["%1",_mkrName], selectRandom _men];
						format ["%1",_mkrName] setMarkerColor "ColorGuer";
						format ["%1",_mkrName] setMarkerShape "ICON";
						format ["%1",_mkrName] setMarkerType "o_inf";
						format ["%1",_mkrName] setMarkerText "Infantry";
						
						[_mkrName] spawn {
							private ["_i"];
						
							_mkrName = _this select 0;
							
							_i = 1;
							while {_i = _i - (1/120); _i > 0} do {
							
								format ["%1",_mkrName] setMarkerAlpha _i;
								
								sleep 1;
							};

							sleep 120;

							deleteMarker format ["%1",_mkrName];
						};
						
						["INTERACTION","This person saw some enemies moving around in the immediate area."] call FF7_fnc_formatHint;
					} else {
						["INTERACTION","This person has not seen any insurgents recently."] call FF7_fnc_formatHint;
					};
				};
			} else {
				_nearGuer = {side _x == resistance} count (_civ nearEntities ["Man", 3000]);
				
				if (_nearGuer > 0) then {
				
					_men = [];
					{
						if (side _x == resistance) then {
							_men = _men + [_x];
						};
					} forEach (_civ nearEntities ["Man", 3000]);
					
					_mkrName = random 1;
					
					_mkr = createMarker [format ["%1",_mkrName], selectRandom _men];
					format ["%1",_mkrName] setMarkerColor "ColorGuer";
					format ["%1",_mkrName] setMarkerShape "ICON";
					format ["%1",_mkrName] setMarkerType "o_inf";
					format ["%1",_mkrName] setMarkerText "Infantry";
					
					[_mkrName] spawn {
						private ["_i"];
					
						_mkrName = _this select 0;
						
						_i = 1;
						while {_i = _i - (1/120); _i > 0} do {
						
							format ["%1",_mkrName] setMarkerAlpha _i;
							
							sleep 1;
						};
						
						sleep 120;
							
						deleteMarker format ["%1",_mkrName];
					};
					
					["INTERACTION","This person saw some enemies moving around in the immediate area."] call FF7_fnc_formatHint;
				} else {
					["INTERACTION","This person has not seen any insurgents recently."] call FF7_fnc_formatHint;
				};
			};
		};
		if (response == (_endTree select 2 select 2)) exitWith {
		
			closeDialog 0;
			
			["INTERACTION","This person is taken aback at your behavior."] call FF7_fnc_formatHint;
		};
		
		responded = false;
		
	// ---------- Subject 4 ----------

		_ctrl ctrlSetStructuredText parseText format ["%1",_endTree select 3 select 0];
		
		waitUntil {sleep 1; if (isNull (findDisplay 8102)) exitWith {true}; responded};
		
		if (response == (_endTree select 3 select 1)) then {
			
			if (random 1 < 0.5) then {
			
				[clientOwner, "intelType"] remoteExec ["publicVariableClient", 2, false];
				[clientOwner, "intelLoc"] remoteExec ["publicVariableClient", 2, false];
				[clientOwner, "intelMan"] remoteExec ["publicVariableClient", 2, false];
				[clientOwner, "InA_missionActive"] remoteExec ["publicVariableClient", 2, false];
				
				sleep 0.2;
				
				if (InA_missionActive) then {
					_exit = false;
					while {true} do {
						scopeName "intelLoop";
					
						if (intelType select 1 == 1) then {
							if (intelLoc select 1 == 1) then {
								if (intelMan select 1 == 1) then {
								_exit = true
								};
							};
						};
						
						if (_exit) exitWith {["INTERACTION","This person affirms the intel you already have."] call FF7_fnc_formatHint;};

						_array = 
						[
							intelType,
							intelLoc,
							intelMan
						];
						
						_selection = (selectRandom _array);
						_state = _selection select 1;
						_check = _selection select 0;
						
						if (_state == 0) then {breakOut "intelLoop";};
					};
					
					[_check,_civ] spawn InA_fnc_intelUpdate;			
				} else {
				
					_nearGuer = {side _x == resistance} count (_civ nearEntities ["Man", 3000]);
					
					if (_nearGuer > 0) then {
					
						_men = [];
						{
							if (side _x == resistance) then {
								_men = _men + [_x];
							};
						} forEach (_civ nearEntities ["Man", 3000]);
						
						_mkrName = random 1;
						
						_mkr = createMarker [format ["%1",_mkrName], selectRandom _men];
						format ["%1",_mkrName] setMarkerColor "ColorGuer";
						format ["%1",_mkrName] setMarkerShape "ICON";
						format ["%1",_mkrName] setMarkerType "o_inf";
						format ["%1",_mkrName] setMarkerText "Infantry";
						
						[_mkrName] spawn {
							private ["_i"];
						
							_mkrName = _this select 0;
							
							_i = 1;
							while {_i = _i - (1/120); _i > 0} do {
							
								format ["%1",_mkrName] setMarkerAlpha _i;
								
								sleep 1;
							};

							sleep 120;

							deleteMarker format ["%1",_mkrName];
						};
						
						["INTERACTION","This person saw some enemies moving around in the immediate area."] call FF7_fnc_formatHint;
					} else {
						["INTERACTION","This person has not seen any insurgents recently."] call FF7_fnc_formatHint;
					};
				};
			} else {
				_nearGuer = {side _x == resistance} count (_civ nearEntities ["Man", 3000]);
				
				if (_nearGuer > 0) then {
				
					_men = [];
					{
						if (side _x == resistance) then {
							_men = _men + [_x];
						};
					} forEach (_civ nearEntities ["Man", 3000]);
					
					_mkrName = random 1;
					
					_mkr = createMarker [format ["%1",_mkrName], selectRandom _men];
					format ["%1",_mkrName] setMarkerColor "ColorGuer";
					format ["%1",_mkrName] setMarkerShape "ICON";
					format ["%1",_mkrName] setMarkerType "o_inf";
					format ["%1",_mkrName] setMarkerText "Infantry";
					
					[_mkrName] spawn {
						private ["_i"];
					
						_mkrName = _this select 0;
						
						_i = 1;
						while {_i = _i - (1/120); _i > 0} do {
						
							format ["%1",_mkrName] setMarkerAlpha _i;
							
							sleep 1;
						};
						
						sleep 120;
							
						deleteMarker format ["%1",_mkrName];
					};
					
					["INTERACTION","This person saw some enemies moving around in the immediate area."] call FF7_fnc_formatHint;
				} else {
					["INTERACTION","This person has not seen any insurgents recently."] call FF7_fnc_formatHint;
				};
			};
		};
		if (response == (_endTree select 3 select 2)) exitWith {
		
			closeDialog 0;
			
			["INTERACTION","This person is taken aback at your behavior."] call FF7_fnc_formatHint;
		};

	[_civ,"MOVE"] remoteExec ["enableAI", 2];
	
	closeDialog 0;

} else {

	_civ remoteExec ["removeAllActions", 0];

	[_civ,"MOVE"] remoteExec ["enableAI", 2];

	["INTERACTION","This person does not wish to converse with you."] call FF7_fnc_formatHint;
};

