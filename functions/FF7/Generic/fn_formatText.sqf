params
[
	"_color",
	"_capition",
	["_font", "PuristaMedium"],
	["_fontSize", "1.1"]
];

private ["_text"];

_text = (format ["<t size='%1' font='%2' color='#%3'>%4</t>", _fontSize, _font, _color, _capition]);

_text;
