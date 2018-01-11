/* ----------
Function:	InA_fnc_nearCheck

Description:
	Logical operator for checking when players are near an area

Parameters:
	- Center location of area (position)
	- Radius to check (number)
	- Logical operator to use (string)
	- Value to check for (number)

Optional:

Example:
	[[0,0,0], 250, ">", 0] call InA_fnc_nearCheck;

Returns:
	Boolean

Author:
	[FF7] Newsparta
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_loc"			,[]					,[[]]				,[]							],
		[	"_rad"			,[]					,[0]				,[]							],
		[	"_op"			,[]					,[""]				,[]							],
		[	"_check"		,[]					,[0]				,[]							]];

// Local declarations
private		_bool					= nil;
private		_count					= nil;

_count = ({_x distance _loc < _rad} count (allPlayers - entities "HeadlessClient_F"));

switch (_op) do {
	case ">":
	{
		if (_count > _check) then {
			_bool = true;
		} else {
			_bool = false;
		};
	};

	case "<":
	{
		if (_count < _check) then {
			_bool = true;
		} else {
			_bool = false;
		};
	};

	case "==":
	{
		if (_count == _check) then {
			_bool = true;
		} else {
			_bool = false;
		};
	};

	case ">=":
	{
		if (_count >= _check) then {
			_bool = true;
		} else {
			_bool = false;
		};
	};

	case "<=":
	{
		if (_count <= _check) then {
			_bool = true;
		} else {
			_bool = false;
		};
	};

	default 
	{
		_bool = false;
	};
};

_bool