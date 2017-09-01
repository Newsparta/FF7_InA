_regions = [];

{

	call compile format
	[
		"
			_regions pushBack ['ambient%1',instability%1,'%1'];
		",
		(_x select 0)
	];

} forEach (ambientSitrep1 + ambientSitrep2 + ambientSitrep3);

_regions