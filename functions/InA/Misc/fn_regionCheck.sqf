/* ----------
Function:
	InA_fnc_regionCheck

Description:
	Finds all defined regions and collects data from them

Parameters:

Optional:

Example:
	[] call InA_fnc_regionCheck;

Returns:
	- all regions with their marker name, instability value, and name (Array)

Author:
	[FF7] Newsparta
---------- */

// Local declarations
private		_regions			= [];

// Execute on all defined ambient regions
{

	// Select data to aquire
	call compile format
	[
		"
			_regions pushBack ['ambient%1',instability%1,'%1'];
		",
		(_x select 0)
	];

} forEach ambientSitrep;

// Return value
_regions