/* ----------
Function: InA_fnc_fob

Description:
    A function to add building radius to an area for semi-permanent construction.

Parameters:
    - Position to place radius (Position)

Example:
   
    [[0,0,0]] call InA_fnc_fob

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- PARAMETERS ----------

params ["_command",["_loc",[0,0,0],[[]]]];

// ---------- MAIN ----------

if (_command == "build") then {

	InA_fob_array = [];

	InA_fob_location = _loc;

	deleteMarker "fob_mark";
	deleteMarker "fob_area";

	_mkr = createMarker ["fob_mark", _loc];
	"fob_mark" setMarkerColor "ColorWest";
	"fob_mark" setMarkerShape "ICON";
	"fob_mark" setMarkerType "b_installation";
	"fob_mark" setMarkerText "FOB";
	_mkr = createMarker ["fob_area", _loc];
	"fob_area" setMarkerColor "ColorWEST";
	"fob_area" setMarkerShape "ELLIPSE";
	"fob_area" setMarkerBrush "BDiagonal";
	"fob_area" setMarkerSize [100, 100];

	["HQ", "Headquarters", "FOB location set."] remoteExec ["FF7_fnc_globalHintStruct", 0];

} else {
	InA_fob_array = [];

	InA_fob_location = _loc;

	deleteMarker "fob_mark";
	deleteMarker "fob_area";

	["HQ", "Headquarters", "FOB abandoned."] remoteExec ["FF7_fnc_globalHintStruct", 0];
};