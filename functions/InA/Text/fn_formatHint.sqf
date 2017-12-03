/* ----------
Function:
	InA_fnc_formatHint

Description:
	Structured hint on the screen

Parameters:
	- Add title (Boolean)
	- Message (String)

Optional:
	- Title (String)

Example:
	[false, "Hello World!"] call InA_fnc_formatHint;

Returns:
	Nil

Author:
	[FF7] Newsparta
	[FF7] Whigital
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_hasTitle"		,false				,[false]			,[]							],
		[	"_msg"			,[]					,[]					,[]							],
		[	"_title"		,[]					,[]					,[]							]];

if !(_hasTitle) then {
	hint parseText (format ["<t align='center' font='PuristaMedium' size='1.2'><t color='#00B2EE'>%1</t></t>", _msg]);
} else {
	hint parseText (format ["<t align='center' font='PuristaMedium' size='1.2'><t size='1.6' color='#00EEB2'>%1</t><br/>----------<br/><t color='#00B2EE'>%2</t></t>", _title, _msg]);
};