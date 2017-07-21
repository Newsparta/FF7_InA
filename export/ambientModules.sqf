mapCenter = [(worldSize/2),(worldSize/2),0];
mapSize = sqrt((worldSize/2)^2 + (worldSize/2)^2);

// ---------- Spawn ambient modules ----------

[getMarkerPos "ambientLolisse","Lolisse",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientBosquet","Bosquet",500,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientSaintLouis","SaintLouis",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLarche","Larche",750,"large"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLaTrinite","LaTrinite",750,"large"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientGoisse","Goisse",750,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientSaintJean","SaintJean",750,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientArudy","Arudy",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientDourdan","Dourdan",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientHoudan","Houdan",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLaPessagne","LaPessagne",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientArette","Arette",750,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLaRiviere","LaRiviere",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientDorres","Dorres",750,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientSainteMarie","SainteMarie",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientBlanches","Blanches",500,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientChapoi","Chapoi",750,"large"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientCancon","Cancon",750,"large"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientNorthLePort","NorthLePort",750,"large"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLePort","LePort",750,"medium"] spawn InA_fnc_ambientModule;

// ---------- Location references ----------

ambientSitrep1 = 
[
	["Lolisse",600],
	["Bosquet",500],
	["SaintLouis",750],
	["Larche",750],
	["LaTrinite",750],
	["Goisse",750],
	["SaintJean",750],
	["Arudy",750],
	["Dourdan",750],
	["Houdan",750],
	["LaPessagne",750],
	["Arette",750],
	["LaRiviere",750],
	["Dorres",750],
	["SainteMarie",750],
	["Blanches",500],
	["Chapoi",750],
	["Cancon",750],
	["NorthLePort",750],
	["LePort",750]
];

ambientSitrep2 = 
[

];

ambientSitrep3 = 
[

];

// ---------- War torn region ----------

_array = nearestObjects 
[
	mapCenter, 
	[
		"Land_Barracks_01_camo_F",
		"Land_i_Barracks_V1_F",
		"Land_i_Barracks_V2_F",
		"Land_u_Barracks_V2_F",
		"Land_Barracks_01_grey_F",
		"Land_Barracks_01_dilapidated_F",
		"Land_Radar_F",
		"Land_Radar_Small_F",
		"Land_LampAirport_F",
		"Land_Airport_Tower_F",
		"Land_Airport_01_controlTower_F",
		"Land_Airport_02_controlTower_F",
		"Land_Airport_01_terminal_F",
		"Land_Airport_02_terminal_F",
		"Land_MilOffices_V1_F",
		"Land_Communication_F",
		"Land_TTowerSmall_1_F",
		"Land_TTowerBig_1_F",
		"Land_TTowerBig_2_F",
		"Land_MultistoryBuilding_01_F",
		"Land_MultistoryBuilding_02_F",
		"Land_MultistoryBuilding_03_F",
		"Land_MultistoryBuilding_04_F"
	], 
	mapSize
];

{
	if (_x distance (getMarkerPos "respawn_west") < 250) then {
		_array = _array - [_x];
	};
} forEach _array;

{
	_x setDamage 1;
} forEach _array;

// ---------- Spawn ambient arty controller ----------

[] spawn {
	while {true} do {
	
		sleep (4 + (random 4));

		_knownPlayers = [];
	
		{
		
			if (_x distance (getMarkerPos "respawn_west") > 750) then {

				_knowsAbout = (independent knowsAbout _x);
				
				if (_knowsAbout >= 3) then {
					_knownPlayers pushBack _x;
				};
		
			};
		} forEach (allPlayers - entities "HeadlessClient_F");

		if (count _knownPlayers > 0) then {
			if (random 100 < 0.01) then {

				_target = selectRandom _knownPlayers;

				sleep 60;

				[getPosATL _target, (100 + random 50), 1] spawn InA_fnc_mortarStrike;
					
				[getPosATL _target, (150 + random 50), (5 + (random 15)), 60] spawn InA_fnc_mortarStrike;
					
				sleep params_mortarTimeout;
			};
		};
	};
};