/* ----------
Function:
	InA_fnc_formatText

Description:
	Structured text return

Parameters:
	- Color (String)
	- Size (String)
	- Text (String)

Optional:

Example:
	[#00B2EE, 1.2, "Hello World!"] call InA_fnc_formatText;

Returns:
	Nil

Author:
	[FF7] Newsparta
	[FF7] Whigital
---------- */

// Parameters
//		|	Private Name 	|	Default Value 	|	Expected Types 	|	Expected Array Count 	|
params [[	"_color"		,false				,[false]			,[]							],
		[	"_size"			,[]					,[]					,[]							],
		[	"_text"			,[]					,[]					,[]							]];

_format =  parseText (format ["<t font='PuristaMedium' size='%2'><t color='%1'>%3</t></t>", _color,_size,_text]);
_format