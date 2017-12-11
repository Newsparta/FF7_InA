/* ----------
Function: InA_fnc_insCustomize

Description:
    A function to set skill values, remove linked items, and remove magazines on death for an array of units

Parameters:
    - Units to customize (Array)

Optional:
    - Accuracy minimum value (Number)
    - Accuracy ceiling value (Number)

Example:
   
    [allUnits] call InA_fnc_insCustomize

Returns:
    Nil

Author:
    Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_units"		,[]					,[]					,[]							],
		[	"_aimMin"		,0.10				,[0]				,[]							],
		[	"_aimMax"		,0.25				,[0]				,[]							]];

// Local declarations
private		_aimingShake		= random [0.6, 0.7, 0.8];
private		_aimingSpeed		= random [0.6, 0.7, 0.8];
private		_endurance			= 1;
private		_spotDistance		= 1;
private		_spotTime			= 1;
private		_courage			= random [0.6, 0.8, 1];
private		_reloadSpeed		= random [0.4, 0.6, 0.8];
private		_commanding			= 1;
private		_general			= 1;
private		_choice				= nil;
private		_num				= nil;
private		_unit				= nil;

// ---------- MAIN ----------

{	
	// Define unit
	_unit = _x;

	// Random skills
	_aimingShake = random [0.6, 0.7, 0.8];
	_aimingSpeed = random [0.6, 0.7, 0.8];
	_courage = random [0.6, 0.8, 1];
	_reloadSpeed = random [0.4, 0.6, 0.8];

	// Set AI skill levels
	_x setSkill ["aimingAccuracy",(_aimMin + (random (_aimMax - _aimMin)))];
	_x setSkill ["aimingShake",_aimingShake];
	_x setSkill ["aimingSpeed",_aimingSpeed];
	_x setSkill ["endurance",_endurance];
	_x setSkill ["spotDistance",_spotDistance];
	_x setSkill ["spotTime",_spotTime];
	_x setSkill ["courage",_courage];
	_x setSkill ["reloadSpeed",_reloadSpeed];
	_x setSkill ["commanding",_commanding];
	
	// Remove all items from unit
	removeAllAssignedItems _x;
	{
		_unit removeMagazines _x;
	} forEach magazines _unit;
	removeBackpackGlobal _x;
	removeAllWeapons _x;
	
	// RNG gear assigment
	_num = random 1;
	
	// Check what type of soldier it will be
	// Rifleman/AT
	if (_num <= 0.8) then {

		// Check supplier
		if (supplier == "OPF") then {
		
			// Add rifle
			_choice = INS_RIFLE_OPF call BIS_fnc_selectRandom;
			for "_i" from 1 to 6 do {_x addMagazine (_choice select 1);};
			_x addWeapon (_choice select 0);
			
			// Check if AT	
			if (_num <= 0.2) then {
				_choice = INS_AT_OPF call BIS_fnc_selectRandom;
				_x addBackpack (INS_BACKPACKS call BIS_fnc_selectRandom);
				for "_i" from 1 to 2 do {_x addMagazine (_choice select 1);};
				_x addWeapon (_choice select 0);
			};

		} else {

			// Add rifle
			_choice = INS_RIFLE_BLU call BIS_fnc_selectRandom;
			for "_i" from 1 to 6 do {_x addMagazine (_choice select 1);};
			_x addWeapon (_choice select 0);
			
			// Check if AT	
			if (_num <= 0.2) then {
				_choice = INS_AT_BLU call BIS_fnc_selectRandom;
				_x addBackpack (INS_BACKPACKS call BIS_fnc_selectRandom);
				for "_i" from 1 to 2 do {_x addMagazine (_choice select 1);};
				_x addWeapon (_choice select 0);
			};
		};	
	};
	// Machinegunner
	if ((_num > 0.8) && {_num <= 0.9}) then {

		// Check supplier
		if (supplier == "OPF") then {
		
			_choice = INS_MG_OPF call BIS_fnc_selectRandom;
			_x addBackpack (INS_BACKPACKS call BIS_fnc_selectRandom);
			for "_i" from 1 to 3 do {_x addMagazine (_choice select 1);};
			_x addWeapon (_choice select 0);
		} else {
			_choice = INS_MG_BLU call BIS_fnc_selectRandom;
			_x addBackpack (INS_BACKPACKS call BIS_fnc_selectRandom);
			for "_i" from 1 to 3 do {_x addMagazine (_choice select 1);};
			_x addWeapon (_choice select 0);
		};
	};

	// Grenadier
	if ((_num > 0.9) && {_num <= 1}) then {
		if (supplier == "OPF") then {
		
			_choice = INS_GL_OPF call BIS_fnc_selectRandom;
			for "_i" from 1 to 6 do {_x addMagazine (_choice select 1);};
			for "_i" from 1 to 4 do {_x addMagazine (_choice select 2);};
			_x addWeapon (_choice select 0);
			
		} else {
		
			_choice = INS_GL_BLU call BIS_fnc_selectRandom;
			for "_i" from 1 to 6 do {_x addMagazine (_choice select 1);};
			for "_i" from 1 to 4 do {_x addMagazine (_choice select 2);};
			_x addWeapon (_choice select 0);
			
		};
	};
	
	// Event handler for removing gear on death
	_x addEventHandler 
	[
		"killed",
		{
			_unit = _this select 0;
			{
				_unit removeMagazines _x;
			} forEach magazines _unit;
			
			removeBackpackGlobal _unit;
		}
	];
	
} forEach _units;