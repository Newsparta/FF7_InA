// Parses config into structured array
//
// Recurses __structure, generates arrays based on current __structure falling back to __default equivelents if not found.
// Should only be externally called with CLASS_DEEP_STRUCTURE_FACTION (or w/e top-level DEEP structure you have defined).
params [
	["__config", configNull, [configNull]],
	["__structure",[],[[]]],
	["__default",[],[[]]]
];

private _array = [];

_inheritsFrom = __config >> "inheritsFrom";
_inheritsFromValue = (_inheritsFrom) call BIS_fnc_getCfgData; // array
if !(_inheritsFrom isEqualTo configNull) then {
	_baseConfigs = (_inheritsFromValue) call BIS_fnc_getCfg;

	if (_baseConfigs isEqualTo configNull) then {
		diag_log format ["[ERROR] Config specified by inheritsFrom property [%1] not found! Skipping configs in [%2].", _inheritsFromValue, __config];
	} else {
		// Loop each sub-config item
		{
			_inheritedConfig = _baseConfigs >> (configName _x);
			_subConfig = _x;

			if (_inheritedConfig isEqualTo configNull) then {
				diag_log format ["[ERROR] Config [%1] not defined in [%2].", configName _x, configName _baseConfigs];
			} else {
				// Construct item from default and any overrides
				_item = +__default; // <-- That necessary + symbol ... %#&$%@&!
				{
					if (_forEachIndex isEqualTo 0 && _x isEqualTo "config_name") then {
						_item set [0, configName _subConfig];
					} else {
						if !((_subConfig >> _x) isEqualTo configNull) then {
							_item set [_forEachIndex, (_subConfig >> _x) call BIS_fnc_getCfgData];
						} else {
							if !((_inheritedConfig >> _x) isEqualTo configNull) then {
								_item set [_forEachIndex, (_inheritedConfig >> _x) call BIS_fnc_getCfgData];
							};
						};
					};
				} forEach __structure;

				_array pushBack _item;
			};
		} forEach configProperties [__config, "isClass _x", true];
	};
} else {
	{
		if (_forEachIndex isEqualTo 0 && _x isEqualTo "config_name") then {
			_array pushBack configName (__config);
		} else {
			// Recurse or save property
			if (_x isEqualType []) then {
				// Recurse structure
				_array pushBack ([__config >> (_x select 0), _x select 1, __default select _forEachIndex] call Helpers_fnc_configToArrayByStructure);
			} else {
				// Get property and save or use default value
				if !((__config >> _x) isEqualTo configNull) then {
					_array pushBack ((__config >> _x) call BIS_fnc_getCfgData);
				} else {
					_array pushBack (__default select _forEachIndex);
				};
			};
		};
	} forEach __structure;
};

// return
_array;