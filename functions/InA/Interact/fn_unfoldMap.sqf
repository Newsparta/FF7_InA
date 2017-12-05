_hasMap = "ItemMap" in (assignedItems player);

if (_hasMap) then {
	player unlinkItem "ItemMap";
	
	player switchMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	
	_map = createVehicle ["Land_Map_Tanoa_F", 
	[
		getPosATL player select 0,
		getPosATL player select 1,
		(getPosATL player select 2 + 0.5)
	
	], [], 0, "CAN_COLLIDE"];
	
	[_map, [
		"Look at map",
		{
		
			if ("ItemMap" in (assignedItems player)) exitWith {[false, "You already have a map to look at."] call InA_fnc_formatHint;};

			(_this select 1) linkItem "ItemMap";
			
			openMap true;
			
			waitUntil {sleep 1; !visibleMap};
			
			(_this select 1) unlinkItem "ItemMap";

		},[], 99, true, true, "", "((_target distance _this) < 4)"]] remoteExec ["addAction", 0];
		
	[_map, [
		"Pick up map",
		{

			(_this select 1) linkItem "ItemMap";
			
			player switchMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
			
			[_this select 0] remoteExec ["deleteVehicle", 2];

		},[], 98, true, true, "", "((_target distance _this) < 4)"]] remoteExec ["addAction", 0];
		
} else {
	[false,"You have no map to unfold."] call InA_fnc_formatHint;
};