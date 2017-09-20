private ["_nearItems","_pos","_spawnPoint","_box"];
// ---------- Check for boat near player ----------

_nearItems = player nearEntities ["B_Boat_Transport_01_F", 10];
_checkPos = [];
_pos = [];

// ---------- Check for water near player ----------

if ((count _nearItems) > 0) then {
	boatBox = _nearItems select 0;
	publicVariableServer "boatBox";
	_pos = getPosATL boatBox;
	_checkPos = [_pos,0,10,0,0] call BIS_fnc_findSafePos;
};

// ---------- Pack boat into support box ----------

if (((count _nearItems) > 0) && ((count _checkPos) < 3)) then {

	sleep 1;
	
	{
		_pos = getPosATL boatBox;
		_spawnPoint = [_pos,0,10,0,0] call BIS_fnc_findSafePos;
		deleteVehicle boatBox;
		sleep 1;
		_box = createVehicle ["Box_NATO_Support_F", _spawnPoint, [], 0, "CAN_COLLIDE"];
		clearItemCargoGlobal _box;
		clearMagazineCargoGlobal _box;
		clearWeaponCargoGlobal _box;
		clearBackpackCargoGlobal _box;
	} remoteExec ["BIS_fnc_call", 2];
	
	["INTERACTION","Boat Disassembled."] call FF7_fnc_formatHint;
	
} else {
	if ((count _checkPos) > 2) then {
		["INTERACTION","There is no suitable location to disassemble."] call FF7_fnc_formatHint;
	} else {
		["INTERACTION","There are no nearby boats to disassemble."] call FF7_fnc_formatHint;
	};
};