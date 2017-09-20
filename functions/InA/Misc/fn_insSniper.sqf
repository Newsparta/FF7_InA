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

// ---------- PARAMETERS ----------

params ["_units", ["_aimMin", 0.50, [0]], ["_aimMax", 0.80, [0]]];
private ["_aimingShake","_aimingSpeed","_endurance","_spotDistance","_spotTime","_courage","_reloadSpeed",
	"_commanding","_general","_unit","_num","_choice"];

// ---------- MAIN ----------

{
	_aimingShake	= random [0.6, 0.7, 0.8];
	_aimingSpeed	= random [0.6, 0.7, 0.8];
	_endurance		= 1;
	_spotDistance	= 1;
	_spotTime		= 1;
	_courage		= random [0.6, 0.8, 1];
	_reloadSpeed	= random [0.4, 0.6, 0.8];
	_commanding		= 1;
	_general		= 1;
	
	_x setSkill ["aimingAccuracy",(_aimMin + (random (_aimMax - _aimMin)))];
	_x setSkill ["aimingShake",_aimingShake];
	_x setSkill ["aimingSpeed",_aimingSpeed];
	_x setSkill ["endurance",_endurance];
	_x setSkill ["spotDistance",_spotDistance];
	_x setSkill ["spotTime",_spotTime];
	_x setSkill ["courage",_courage];
	_x setSkill ["reloadSpeed",_reloadSpeed];
	_x setSkill ["commanding",_commanding];
	
	removeAllAssignedItems _x;
	
	_unit = _x;
	{
		_unit removeMagazines _x;
	} forEach magazines _unit;

	removeBackpackGlobal _x;
	
	removeAllWeapons _x;
	
	_num = random 1;
	
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