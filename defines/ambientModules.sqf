mapCenter = [(worldSize/2),(worldSize/2),0];
mapSize = sqrt((worldSize/2)^2 + (worldSize/2)^2);

// ---------- Volatility rate (1 = 2 weeks) ----------

volatileRate = 2;

// ---------- Spawn ambient modules ----------

[getMarkerPos "ambientTanouka","Tanouka",1000,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientGalili","Galili",750,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientVagalala","Vagalala",850,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientBa","Ba",500,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientBluePearlIndustrial","BluePearlIndustrial",1000,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLuganville","Luganville",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientNandai","Nandai",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientOumere","Oumere",1000,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientKotomo","Kotomo",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLami","Lami",750,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientRegina","Regina",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLobaka","Lobaka",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLifou","Lifou",750,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientGeorgetown","Georgetown",1000,"large"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientSaintJulien","SaintJulien",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientIpota","Ipota",750] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientNicolet","Nicolet",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientPetitNicolet","PetitNicolet",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLaRochelle","LaRochelle",750] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientOvau","Ovau",750,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientMomeaPenelo","MomeaPenelo",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientSavu","Savu",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientSaintPaul","SaintPaul",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientHarcourt","Harcourt",500,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientDoodstil","Doodstil",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientPortBoise","PortBoise",400,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLijnhaven","Lijnhaven",1000,"large"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientBlerick","Blerick",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientBuabua","Buabua",500,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientRereki","Rereki",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientTaga","Taga",500,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientModdergat","Moddergat",600,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLaFoa","LaFoa",500,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientTobakoro","Tobakoro",500,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLosi","Losi",500,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientSosovu","Sosovu",500,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientKatkoula","Katkoula",1000,"large"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientSavaka","Savaka",500,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientYanukka","Yanukka",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLailai","Lailai",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientKoumac","Koumac",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientCerebu","Cerebu",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientRautake","Rautake",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientNamuvaka","Namuvaka",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLaikoro","Laikoro",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientBalavu","Balavu",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLeqa","Leqa",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientMuaceba","Muaceba",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientLakatoro","Lakatoro",500,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientTavu","Tavu",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientNani","Nani",600,"small"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientBelfort","Belfort",750,"medium"] spawn InA_fnc_ambientModule;
[getMarkerPos "ambientTuvanaka","Tuvanaka",850,"medium"] spawn InA_fnc_ambientModule;

// ---------- Location references ----------

ambientSitrep1 = 
[
	["BluePearlIndustrial",1000],
	["Ba",500],
	["Galili",750],
	["SaintJulien",750],
	["GeorgeTown",1000],
	["Ipota",750],
	["Kotomo",750],
	["LaRochelle",750],
	["Ovau",750],
	["MomeaPenelo",750],
	["Lakatoro",500],
	["Lifou",750],
	["Lami",750],
	["Luganville",600],
	["Nicolet",750],
	["PetitNicolet",600],
	["Regina",750],
	["Lobaka",600],
	["Nandai",600],
	["Oumere",1000],
	["Savu",600],
	["SaintPaul",600],
	["Tanouka",1000],
	["Vagalala",850]
];

ambientSitrep2 = 
[
	["BuaBua",500],
	["Cerebu",500],
	["Doodstil",750],
	["Harcourt",500],
	["Katkoula",1000],
	["Koumac",500],
	["Losi",500],
	["Lailai",750],
	["Lijnhaven",1000],
	["Blerick",600],
	["Moddergat",600],
	["LaFoa",500],
	["Tobakoro",500],
	["PortBoise",400],
	["Rereki",600],
	["Taga",500],
	["Savaka",500],
	["Yanukka",750]
];

ambientSitrep3 = 
[
	["Balavu",750],
	["Belfort",750],
	["Laikoro",600],
	["Leqa",600],
	["Nani",600],
	["Rautake",750],
	["Namuvaka",600],
	["Sosovu",500],
	["Tavu",750],
	["Tuvanaka",850]
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
			if (random 100 < 0.05) then {

				_target = selectRandom _knownPlayers;

				sleep 60;

				[getPosATL _target, (100 + random 50), 1] spawn InA_fnc_mortarStrike;
					
				[getPosATL _target, (150 + random 50), (5 + (random 15)), 60] spawn InA_fnc_mortarStrike;
					
				sleep params_mortarTimeout;
			};
		};
	};
};