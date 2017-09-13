private ["_selections","_ctrl"];

disableSerialization;

_selections =	[
	"Morning",
	"Day",
	"Evening",
	"Night"
];

createDialog "InA_Timer_Dialog";

waitUntil {!isNull (findDisplay 7999);};

_ctrl = (findDisplay 7999) displayCtrl 1500;

{
	_ctrl lbAdd _x;
} forEach _selections;
lbSetCurSel [1500, 0];