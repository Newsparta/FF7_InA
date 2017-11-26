waitUntil {sleep 1; initialized};

while {true} do {
	
	sleep 3600;

	{
		_name = _x select 0;
		_region = ["ambient",_name] joinString "";
		_loc = (getMarkerPos _region);
		if (_loc in fortifiedRegions) then {
			call compile format
			[
				"
					instability%1 = 0;
				",
				_name
			];
		};
	} forEach ambientSitrep;
};