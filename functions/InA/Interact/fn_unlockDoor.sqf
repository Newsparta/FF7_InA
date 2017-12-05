//////////////////////////////////////////////////////////////////////////
// ---------- HEAVILY MODIFIED FROM MCC SCRIPT fn_isdoor.sqf ---------- //
//////////////////////////////////////////////////////////////////////////

private ["_houses","_house","_obj","_doorTypes","_loadName","_optionalDoors","_door","_typeOfSelected",
"_animation","_phase","_boxes"];
// ---------- Check for a house near the player ----------

_houses = nearestTerrainObjects [getPosATL player, ["HOUSE"], 20];

_house = (_houses select 0);

if (count _houses < 1) exitWith {
	[false,"There is no door nearby to unlock."] call InA_fnc_formatHint;
};

// ---------- Check what player is looking at ----------

_obj = _houses select 0;

_doorTypes	= ["door", "hatch"];
_loadName	= "GEOM";

_optionalDoors = [_obj, _loadName] intersect [asltoatl (eyepos player),(player modelToworld [0, 3, 0])];

_door = "";
{
	_typeOfSelected = _x select 0;
	{
		if ([_x,_typeOfSelected] call BIS_fnc_inString) exitWith {_door = _typeOfSelected};
	} foreach _doorTypes;

} forEach _optionalDoors;

if (_door == "") exitWith {
	[false,"There is no door nearby to unlock."] call InA_fnc_formatHint;
};

// ---------- Get animation phase of door ----------

_animation = _door + "_rot";

_phase = if ((_obj animationPhase _animation) > 0) then {0} else {1};

if (_phase == 0) exitWith {
	[false,"This door is already opened."] call InA_fnc_formatHint;
};

// ---------- Initiate unlock sequence ----------

player playMove "AmovPercMstpSnonWnonDnon_AmovPknlMstpSnonWnonDnon";

sleep 0.65;

player playMove "Acts_carFixingWheel";

sleep (random [10, 15, 20]);

player switchMove "";

_obj animate [_animation, 1, 1];