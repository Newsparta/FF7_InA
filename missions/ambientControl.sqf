/* ----------
Script:
	Ambient Control

Description:
	Suppress instability gain on any fortified regions

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_name			= "";
private		_region			= "";
private		_loc			= [];

// Wait until faction is selected
waitUntil {
	sleep 1; 
	initialized;
};

while {true} do {
	
	sleep 3600;

	// Collect region data
	{
		_name = _x select 0;
		_region = ["ambient",_name] joinString "";
		_loc = (getMarkerPos _region);

		// Check if region is fortified
		if (_loc in fortifiedRegions) then {

			// Reset instability value of fortified region
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