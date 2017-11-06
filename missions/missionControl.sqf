private ["_missions","_delay","_virgin","_handle","_last","_missionRequested","_missionRequest"];

waitUntil {sleep 20; ["HQ", "Headquarters", "Select a base theme to begin."] remoteExec ["FF7_fnc_globalHintStruct", 0]; initialized};

[] spawn InA_fnc_spotCheck;

[] spawn InA_fnc_majorActivity;

while {true} do {
	
	sleep (5 + (random 5));

	if !(InA_stronghold) then {

		[] spawn InA_fnc_stronghold;

	};

	_regions = [] call InA_fnc_regionCheck;
	_cond = [];

	{
		_cond pushBack (_x select 1);
	} forEach _regions; 

	if (activeLocations < 1) then {
		[] spawn InA_fnc_majorActivity;
	};

	sleep 1;

	if ((({_x < 0.5} count _cond)/ count _regions) >= 0.25) then {

		if (activeLocations < 2) then {
			[] spawn InA_fnc_majorActivity;
		};
	};

	sleep 1;

	if ((({_x < 0.5} count _cond)/ count _regions) >= 0.50) then {

		if (activeLocations < 3) then {
			[] spawn InA_fnc_majorActivity;
		};
	};

	sleep 1;

	if ((({_x < 0.5} count _cond)/ count _regions) >= 0.75) then {

		if (activeLocations < 4) then {
			[] spawn InA_fnc_majorActivity;
		};
	};
};