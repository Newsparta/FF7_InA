if !(_this select 1 == leader (group (_this select 1))) exitWith {
	[false, "only the squad leader may access the headquarters."] call InA_fnc_formatHint;
};
call compile preprocessFileLineNumbers "functions\InA\Auxiliary\menuHQ.sqf";