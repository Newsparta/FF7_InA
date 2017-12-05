/*  Function: FF7_fnc_extSerialize

	Description:
		A function to save or load data from a database

	Syntax:
		_response = [func, key(, data)] call FF7_fnc_extSerial

			{ func : string }    Must be either "load" or "save"
			{ key  : string }    User-supplied string to identify the data.
			{ data : array  }    (optional) Array of strings of data to be saved.

	Returns:
		Array 		Parsed SQF array of the data stored by key
		** nil on error

	Example 1: (Write)
		_response = ["save", "somekey", ["some", ["arbitrary",["data"]]]] call FF7_fnc_extSerialize;

	Example 2: (Load)
		_response = ["load", "somekey"] call FF7_fnc_extSerialize;

	Author:
		[FF7] Newsparta & [FF7] Bliss 

---------- */


// Input Parameterization
// __func       (String)       Serialize function
// __key		(String)       Unique key
// __data       (Array)        Data to send
//
//      |  Private Name     | Default Value     | Expected Types    | Expected Array Count |
params [[   "__func"         ,""                 ,[""]              ,[]                    ], 
        [   "__key"          ,""                 ,[""]              ,[]                    ],
        [   "__data"         ,[]                 ,[[]]              ,[]                    ]];

// Local Declerations
private     _call_string    = "";
private     _data_string    = "";
private     _response       = "";
private     _return         = nil;

// ---------- Save data ----------
if (__func == "save") then {

	if (0 == count __data) exitWith {
		[true, "Error saving to database", "ERROR"] remoteExec ["InA_fnc_formatHint", 0];
		diag_log format ["ERROR (extSerialize.sqf/save): __data array was empty."];
	};

	_call_string = ["003", __key, str __data] joinString ":";

	_response = "extSerialize" callExtension _call_string;

	if (_response == "ERROR") exitWith {
		[true, "Error saving to database", "ERROR"] remoteExec ["InA_fnc_formatHint", 0];
		diag_log format ["ERROR (extSerialize.sqf/save): _response was ""ERROR""."];
	};

	_return = [_response];


// ---------- Load data ----------
} else { if (__func == "load") then {

	_call_string = ["002", __key] joinString ":";

	while {true} do {

		_response = "extSerialize" callExtension _call_string;

		if (_response == "ERROR") exitWith {
			[true, "Error loading from database", "ERROR"] remoteExec ["InA_fnc_formatHint", 0];
			diag_log format ["ERROR (extSerialize.sqf/load): _response was ""ERROR""."];

			sleep 2;
		};

		if (_response == "ENDOFDATA") exitWith {/*done*/};
		
		_data_string = [_data_string, _response] joinString "";
	};

	if (_data_string != "") then {
		_return = parseSimpleArray _data_string;
	}

// ---------- Unknown Func ----------

} else {
    [true, "Unknown function passed to extSerialize", "ERROR"] remoteExec ["InA_fnc_formatHint", 0];
	diag_log format ["ERROR (extSerialize.sqf): Unknown function ""%1"" called with key ""%2"".", __func, __key];
}; };

if (isNil "_return") then {
	nil
} else {
	_return
}