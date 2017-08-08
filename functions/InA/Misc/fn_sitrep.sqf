
params ["_region"];
private ["_mkr"];

InA_sitrep = false;
publicVariable "InA_sitrep";

_list = [];
if (_region == "1") then {
	_list = ambientSitrep1;
};
if (_region == "2") then {
	_list = ambientSitrep2;
};
if (_region == "3") then {
	_list = ambientSitrep3;
};

for [{_i = 0}, {_i < (count _list)}, {_i = _i + 1}] do {

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
			'text%1' setMarkerType 'mil_unknown';
			'text%1' setMarkerText 'Region Stable';
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
			'text%1' setMarkerText 'Region Destabalizing';
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
			'text%1' setMarkerText 'Volatile Region';
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
		_list select _i select 0,
		_list select _i select 1
	];
};

sleep (params_sitrepDelay - 120);

InA_sitrep = true;
publicVariable "InA_sitrep";
