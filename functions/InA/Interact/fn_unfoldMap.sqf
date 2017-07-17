_hasMap = "ItemMap" in (assignedItems player);

if (_hasMap) then {
	player unlinkItem "ItemMap";
	
	player switchMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	
	_map = createVehicle ["Land_Map_blank_F", 
	[
		getPosATL player select 0,
		getPosATL player select 1,
		(getPosATL player select 2 + 0.5)
	
	], [], 0, "CAN_COLLIDE"];
	
	[_map, [["FF9900", "Look At Map"] call FF7_fnc_formatText,
		{
		
			if ("ItemMap" in (assignedItems player)) exitWith {["HQ", "Headquarters", "You already have a map to look at silly."] call FF7_fnc_globalHintStruct;};

			(_this select 1) linkItem "ItemMap";
			
			openMap true;
			
			waitUntil {sleep 1; !visibleMap};
			
			(_this select 1) unlinkItem "ItemMap";

		},[], 99, true, true, "", "((_target distance _this) < 4)"]] remoteExec ["addAction", 0];
		
		[_map, [["FF9900", "Pick Up Map"] call FF7_fnc_formatText,
		{

			(_this select 1) linkItem "ItemMap";
			
			player switchMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
			
			[_this select 0] remoteExec ["deleteVehicle", 2];

		},[], 98, true, true, "", "((_target distance _this) < 4)"]] remoteExec ["addAction", 0];
		
} else {
	["INTERACTION","You have no map to unfold."] call FF7_fnc_formatHint;
};