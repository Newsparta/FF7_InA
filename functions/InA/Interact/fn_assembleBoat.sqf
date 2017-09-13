private ["_nearItems","_pos","_checkPos","_spawnPoint","_boat"];
// ---------- Check for support boxes near player ----------

_nearItems = player nearEntities ["Box_NATO_Support_F", 5];
_checkPos = [];
_pos = [];

// ---------- Check for water near player ----------

if ((count _nearItems) > 0) then {
	boatBox = _nearItems select 0;
	publicVariableServer "boatBox";
	_pos = getPosATL boatBox;
	_checkPos = [_pos,0,10,0,2] call BIS_fnc_findSafePos;
};

// ---------- Assemble boat from support box ----------

if (((count _nearItems) > 0) && ((count _checkPos) < 3)) then {

	sleep 1;
	
	{
		private ["_pos","_spawnPoint","_boat"];
		
		_pos = getPosATL boatBox;
		_spawnPoint = [_pos,0,10,0,2] call BIS_fnc_findSafePos;
		deleteVehicle boatBox;
		sleep 1;
		_boat = createVehicle ["B_Boat_Transport_01_F", _spawnPoint, [], 0, "CAN_COLLIDE"];
	} remoteExec ["BIS_fnc_call", 2];
	
	["INTERACTION","Boat assembled."] call FF7_fnc_formatHint;
} else {
	if ((count _checkPos) > 2) then {
		["INTERACTION","There is no suitable location to assemble."] call FF7_fnc_formatHint;
	} else {
		["INTERACTION","There are no nearby boats to assemble."] call FF7_fnc_formatHint;
	};
};