/* ----------
Function: FF7_fnc_extSerialize

Description:
    A function to save or load data from a database

Parameters:
    - Save or load (string)

Optional:
    - Data to save (String)

Example:
   
    ["save", _someString] call FF7_fnc_extSerialize;

Returns:
    String

Author:
    [FF7] Newsparta & [FF7] Bliss 
---------- */
// ---------- Parameters ----------

params ["_func",["_import", "", [""]]];

// ---------- Main ----------

_key = "data";
_return = "";
_data = "";

	// ---------- Save data ----------

	if (_func == "save") then {

		_data = ["003","data", _import] joinString ":";

		_return = "extSerialize" callExtension _data;

		if (_return == "ERROR") exitWith {
			["ERROR", "Error saving to database"] remoteExec ["FF7_fnc_formatHint", 0];
		};

	// ---------- Load data ----------
	} else {

		_call = str formatText
		[
			"002:%1",
			_key
		];

		while {true} do {

			_return = "extSerialize" callExtension _call;

			if (_return == "ERROR") exitWith {
				["ERROR", "Error loading from database"] remoteExec ["FF7_fnc_formatHint", 0];

				sleep 2;
			};

			if (_return == "ENDOFDATA") exitWith {/*done*/};
			
			_data = [_data, _return] joinString "";
		};

		_data = ParseSimpleArray _data;
	};
	_data