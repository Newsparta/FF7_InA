/* ----------
Function: InA_fnc_insSniper

Description:
    A function to set skill values, remove linked items, assign a marksman weapon,and remove magazines on death for an array of units

Parameters:
    - Units to customize (Array)

Optional:
    - Accuracy minimum value (Number)
    - Accuracy ceiling value (Number)

Example:
   
    [allUnits] call InA_fnc_insSniper

Returns:
    Nil

Author:
    Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_units"		,[]					,[]					,[]							],
		[	"_aimMin"		,0.50				,[0]				,[]							],
		[	"_aimMax"		,0.80				,[0]				,[]							]];

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
	
	// Gear assigmnent
	if (supplier == "OPF") then {	
		_choice = INS_SNIPER_OPF call BIS_fnc_selectRandom;
		for "_i" from 1 to 8 do {_x addMagazine (_choice select 1);};
		_x addWeapon (_choice select 0);
		_x addPrimaryWeaponItem "optic_LRPS";
	} else {
		_choice = INS_SNIPER_BLU call BIS_fnc_selectRandom;
		for "_i" from 1 to 8 do {_x addMagazine (_choice select 1);};
		_x addWeapon (_choice select 0);
		_x addPrimaryWeaponItem "optic_LRPS";		
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