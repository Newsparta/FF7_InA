/* ----------
Function:
	InA_fnc_sitrep

Description:
	Spawns all region markers

Parameters:

Optional:

Example:
	[] call InA_fnc_sitrep;

Returns:
	Nil

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_i					= 0;
private		_instability		= nil;
private		_mkr				= nil;
private		_region				= nil;

// Declare sitrep active
InA_sitrep = false;
publicVariable "InA_sitrep";

// For all regions
for [{_i = 0}, {_i < (count ambientSitrep)}, {_i = _i + 1}] do {

	// Spawn markers
	call compile format 
	[
		"
			_instability%1 = missionNamespace getVariable 'instability%1';
			
			if (_instability%1 < 0.5) then {
			 _mkr = createMarker ['region%1', getMarkerPos 'ambient%1'];
			'region%1' setMarkerColor 'ColorWEST';
			'region%1' setMarkerShape 'ELLIPSE';
			'region%1' setMarkerBrush 'BDiagonal';
			'region%1' setMarkerSize [%2, %2];
			_mkr = createMarker ['text%1', getMarkerPos 'ambient%1'];
			'text%1' setMarkerColor 'ColorBlack';
			'text%1' setMarkerShape 'ICON';
			'text%1' setMarkerType 'mil_dot';
			'text%1' setMarkerText 'Stable';
			};
			if ((_instability%1 > 0.5) and (_instability%1 < 0.9)) then {
			 _mkr = createMarker ['region%1', getMarkerPos 'ambient%1'];
			'region%1' setMarkerColor 'ColorCIV';
			'region%1' setMarkerShape 'ELLIPSE';
			'region%1' setMarkerBrush 'BDiagonal';
			'region%1' setMarkerSize [%2, %2];
			_mkr = createMarker ['text%1', getMarkerPos 'ambient%1'];
			'text%1' setMarkerColor 'ColorBlack';
			'text%1' setMarkerShape 'ICON';
			'text%1' setMarkerType 'mil_warning';
			'text%1' setMarkerText 'Destabalizing';
			};
			if (_instability%1 > 0.9) then {
			 _mkr = createMarker ['region%1', getMarkerPos 'ambient%1'];
			'region%1' setMarkerColor 'ColorGUER';
			'region%1' setMarkerShape 'ELLIPSE';
			'region%1' setMarkerBrush 'BDiagonal';
			'region%1' setMarkerSize [%2, %2];
			_mkr = createMarker ['text%1', getMarkerPos 'ambient%1'];
			'text%1' setMarkerColor 'ColorRed';
			'text%1' setMarkerShape 'ICON';
			'text%1' setMarkerType 'mil_warning';
			'text%1' setMarkerText 'Volatile';
			};
			
			[] spawn {
				private ['_x'];
				_x = 1;
				while {_x = _x - (1/120); _x > 0} do {
					
					'region%1' setMarkerAlpha _x;
					'text%1' setMarkerAlpha _x;
					
					sleep 1;
				};

				sleep 120;

				deleteMarker 'region%1';
				deleteMarker 'text%1';
			};
		",
		ambientSitrep select _i select 0,
		ambientSitrep select _i select 1
	];
};

// Check if there are any fortified regions
if (count fortifiedRegions > 0) then {
	for [{_i = 0}, {_i < (count fortifiedRegions)}, {_i = _i + 1}] do {

		call compile format 
		[
			"
				_mkr = createMarker ['fText%2', [%1 select 0, ((%1 select 1) + 100), %1 select 2]];
				'fText%2' setMarkerColor 'ColorWEST';
				'fText%2' setMarkerShape 'ICON';
				'fText%2' setMarkerType 'mil_dot';
				'fText%2' setMarkerText 'Fortified';
				
				[] spawn {
					private ['_x'];
					_x = 1;
					while {_x = _x - (1/120); _x > 0} do {
						
						'fBorder%2' setMarkerAlpha _x;
						'fText%2' setMarkerAlpha _x;
						
						sleep 1;
					};

					sleep 120;

					deleteMarker 'fBorder%2';
					deleteMarker 'fText%2';
				};
			",
			fortifiedRegions select _i,
			_i
		];
	};
};

// Delay next sitrep
sleep (params_sitrepDelay - 120);

// Reset variables
InA_sitrep = true;
publicVariable "InA_sitrep";
