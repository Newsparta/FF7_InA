_array = nearestObjects [getPosATL resupplyPad1,["Air"],100];
_phase = _this select 0;

if ((!alive logiVeh) && {(count _array) > 0}) then {

	_airArray = nearestObjects [getPosATL hangarStructure,["Air"],10];
	
	if (_phase == "bringOut") exitWith {
	
		if (vehicleAirParked) exitWith {
			["Headquarters", "Please clear the hangar before bringing out the sheltered helicopter."] remoteExec ["FF7_fnc_formatHint", ID, false];
		};
		
		_veh = _airArray select 0;
		
		_veh setPos (getMarkerPos "hangarSpawn");
		_veh setDir (markerDir "hangarSpawn");
		
		["Headquarters", "Helicopter brought out."] call FF7_fnc_formatHint;
	};

	if ((count _airArray) > 0) exitWith {
		["Headquarters", "There is already a helicopter sheltered."] remoteExec ["FF7_fnc_formatHint", ID, false];
	};
	
	if (_phase == "shelter") exitWith {
		
		_veh = _array select 0;
		
		_veh setPos (getPosATL hangarStructure);
		_veh setDir (getDir hangarStructure);
		
		["Headquarters", "Helicopter sheltered."] call FF7_fnc_formatHint;
	};

} else {
	["Headquarters", "There is no helicopter to shelter or it cannot be done at this time."] call FF7_fnc_formatHint;
};