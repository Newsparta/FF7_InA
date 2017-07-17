params ["_check","_civ"];

_inception = random 1;
_quality = "";

[clientOwner, "currentMission"] remoteExec ["publicVariableClient", 2];
[clientOwner, "mission"] remoteExec ["publicVariableClient", 2];
[clientOwner, "spawnedObj"] remoteExec ["publicVariableClient", 2];

sleep 0.2;

if ((_inception >= 0) && {_inception <= (0.1 + (0.6 * civTol))}) then {
	_quality = "high";
} else {
	_quality = "low";
};

// ---------- Mission Type ----------

_type = "";
if (_check == "type") then {

	_objectives = [];

	if (_quality == "high") then {
		
		if (random 1 < 0.5) then {
		
			{
				for "_i" from 0 to (round random (count spawnedObj)) do {
				
					_select = spawnedObj call BIS_fnc_selectRandom;
					_loc = _select select 1;
					spawnedObj = spawnedObj - [_select];
					
					_size = (100 + (random 100));
					_pos = [_loc, 0, (_size - 20), 0, 0, 0, 0] call BIS_fnc_findSafePos;
					_mkr = createMarker [format ["Obj%1",_i], _pos];
					format ["Obj%1",_i] setMarkerColor "ColorGUER";
					format ["Obj%1",_i] setMarkerShape "ELLIPSE";
					format ["Obj%1",_i] setMarkerBrush "Border";
					format ["Obj%1",_i] setMarkerSize [_size, _size];
					
					placedMarkers pushBack format ["Obj%1",_i];
				
				};
			} remoteExec ["BIS_fnc_call", 2];
		
			_type = "marked on your map where they saw interesting things.";
			["INTERACTION",format ["This person %1",_type]] call FF7_fnc_formatHint;	
		
		} else {
		
			for "_i" from 0 to (round random (count spawnedObj)) do {
			
				_select = spawnedObj call BIS_fnc_selectRandom;
				_objectives pushBack (_select select 0);
				spawnedObj = spawnedObj - [_select];
			
			};
		
			_type = format ["they saw, %1", _objectives];
			["INTERACTION",format ["This person tells you %1",_type]] call FF7_fnc_formatHint;	
		
		};
	} else {
	
		if (random 1 < 0.5) then {
		
			{
				for "_i" from 0 to (round random (count spawnedObj)) do {
				
					_select = spawnedObj call BIS_fnc_selectRandom;
					_loc = _select select 1;
					spawnedObj = spawnedObj - [_select];
					
					_size = (250 + (random 250));
					_pos = [_loc, 0, (_size - 20), 0, 0, 0, 0] call BIS_fnc_findSafePos;
					_mkr = createMarker [format ["Obj%1",_i], _pos];
					format ["Obj%1",_i] setMarkerColor "ColorGUER";
					format ["Obj%1",_i] setMarkerShape "ELLIPSE";
					format ["Obj%1",_i] setMarkerBrush "Border";
					format ["Obj%1",_i] setMarkerSize [_size, _size];
					
					placedMarkers pushBack format ["Obj%1",_i];
				
				};
			} remoteExec ["BIS_fnc_call", 2];
		
			_type = "marked on your map where they saw interesting things.";
			["INTERACTION",format ["This person %1",_type]] call FF7_fnc_formatHint;	
		
		} else {
		
			for "_i" from 0 to (round random (count spawnedObj)) do {
			
				_select = spawnedObj call BIS_fnc_selectRandom;
				_objectives pushBack (_select select 0);
				spawnedObj = spawnedObj - [_select];
			
			};
		
			_type = format ["they saw, %1", _objectives];
			["INTERACTION",format ["This person tells you %1",_type]] call FF7_fnc_formatHint;	
		
		};
	};
	
	intelType = ["type", 1];
	publicVariableServer "intelType";

	givenType = _type;
	publicVariableServer "givenType";
};

// ---------- Mission Location ----------

_loc = "";
if (_check == "loc") then {

	if (_quality == "high") then {
	
		if (random 1 < 0.5) then {

			{
				if (random 1 <= 0.5) then {
					_size = (1000 + (random 500));
					_pos = [mission, 0, (_size - 100), 0, 0, 0, 0] call BIS_fnc_findSafePos;
					_mkr = createMarker ["AO", _pos];
					"AO" setMarkerColor "ColorGUER";
					"AO" setMarkerShape "ELLIPSE";
					"AO" setMarkerBrush "BDiagonal";
					"AO" setMarkerSize [_size, _size];
					
					placedMarkers pushBack "AO";
				} else {
				
					_size = (1000 + (random 500));
					
					for [{_i = 1}, {_i < 4}, {_i = _i + 1}] do {
						_pos = [mission, 0, (_size - 100), 0, 0, 0, 0] call BIS_fnc_findSafePos;
						_mkr = createMarker [(format ["text_%1",_i]), _pos];
						(format ["text_%1",_i]) setMarkerColor "ColorGuer";
						(format ["text_%1",_i]) setMarkerShape "ICON";
						(format ["text_%1",_i]) setMarkerType "mil_triangle";
						(format ["text_%1",_i]) setMarkerText "POI";
						
						placedMarkers pushBack (format ["text_%1",_i]);
					};
				};
			} remoteExec ["BIS_fnc_call", 2];
			
			_loc = "marked on your map to show you where activity was noticed.";
			["INTERACTION",format ["This person %1",_loc]] call FF7_fnc_formatHint;

		} else {
			_location = text (nearestLocations [mission, 
			[
				"NameCity",
				"NameVillage",
				"NameCityCapital"
			
			], 2000] select 0);
			
			_loc = format ["the enemy may be near %1", _location];
			["INTERACTION",format ["This person tells you %1",_loc]] call FF7_fnc_formatHint;		
		};
	} else {

		if (random 1 < 0.5) then {

			{
				if (random 1 <= 0.5) then {
					_size = (1500 + (random 500));
					_pos = [mission, 0, (_size - 100), 0, 0, 0, 0] call BIS_fnc_findSafePos;
					_mkr = createMarker ["AO", _pos];
					"AO" setMarkerColor "ColorGUER";
					"AO" setMarkerShape "ELLIPSE";
					"AO" setMarkerBrush "BDiagonal";
					"AO" setMarkerSize [_size, _size];
					
					placedMarkers pushBack "AO";
					
				} else {
				
					_size = (1500 + (random 500));
					
					for [{_i = 1}, {_i < 4}, {_i = _i + 1}] do {
						_pos = [mission, 0, (_size - 100), 0, 0, 0, 0] call BIS_fnc_findSafePos;
						_mkr = createMarker [(format ["text_%1",_i]), _pos];
						(format ["text_%1",_i]) setMarkerColor "ColorGuer";
						(format ["text_%1",_i]) setMarkerShape "ICON";
						(format ["text_%1",_i]) setMarkerType "mil_triangle";
						(format ["text_%1",_i]) setMarkerText "POI";
						
						placedMarkers pushBack (format ["text_%1",_i]);
					};
				};
			} remoteExec ["BIS_fnc_call", 2];
			
			_loc = "marked on your map to show you where activity was noticed.";
			["INTERACTION",format ["This person %1",_loc]] call FF7_fnc_formatHint;

		} else {
			_location = text (nearestLocations [mission, 
			[
				"NameCity",
				"NameVillage",
				"NameCityCapital"
			
			], 2000] select 0);
			
			_loc = format ["the enemy may be near %1", _location];
			["INTERACTION",format ["This person tells you %1",_loc]] call FF7_fnc_formatHint;		
		};
	};
	
	intelLoc = ["loc", 1];
	publicVariableServer "intelLoc";

	givenLoc = _loc;
	publicVariableServer "givenLoc";
};

// ---------- Mission Man ----------

_man = "";
if (_check == "man") then {

	if (_quality == "high") then {
		_total = mission nearEntities ["Man", 1500];
		
		if (({side _x == resistance} count _total < 20) && ({side _x == resistance} count _total > 0)) then {
			_man = format ["definitely less than %1 insurgents", floor (random [15,20,25])];
			["INTERACTION",format ["This person tells you there were %1",_man]] call FF7_fnc_formatHint;	
		};
		if (({side _x == resistance} count _total >= 20) && {{side _x == resistance} count _total < 40}) then {
			_man = format ["definitely more than %1 insurgents", floor (random [15,20,25])];
			["INTERACTION",format ["This person tells you there were %1",_man]] call FF7_fnc_formatHint;		
		};
		if ({side _x == resistance} count _total >= 40) then {
			_man = format ["definitely more than %1 insurgents", floor (random [35,40,45])];
			["INTERACTION",format ["This person tells you there were %1",_man]] call FF7_fnc_formatHint;		
		};
		if ({side _x == resistance} count _total == 0) then {
			_man = "definitely insurgents amassing in the jungles";
			["INTERACTION",format ["This person tells you there were %1",_man]] call FF7_fnc_formatHint;		
		};
		
	} else {
		_total = mission nearEntities ["Man", 1500];
	
		if ({side _x == resistance} count _total < 20) then {
			_man = "very few insurgents somewhere.";
			["INTERACTION",format ["This person tells you there were %1",_man]] call FF7_fnc_formatHint;	
		};
		if (({side _x == resistance} count _total >= 20) && {{side _x == resistance} count _total < 40}) then {
			_man = "a sizeable amount of insurgents somewhere.";
			["INTERACTION",format ["This person tells you there were %1",_man]] call FF7_fnc_formatHint;		
		};
		if ({side _x == resistance} count _total >= 40) then {
			_man = "a very large number of insurgents somewhere.";
			["INTERACTION",format ["This person tells you there were %1",_man]] call FF7_fnc_formatHint;		
		};
	};
	
	intelMan = ["man", 1];
	publicVariableServer "intelMan";

	givenMan = _man;
	publicVariableServer "givenMan";
};