if !(_this select 1 == leader (group (_this select 1))) exitWith {
	["HQ", "Headquarters", "Only the squad leader may access the headquarters."] call FF7_fnc_globalHintStruct;
};
call compile preprocessFileLineNumbers "functions\InA\Auxiliary\menuHQ.sqf";