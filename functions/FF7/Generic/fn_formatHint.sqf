private ["_title", "_msg"];

_title	= (_this select 0);
_msg 	= (_this select 1);

hint parseText (format ["<t align='center' font='PuristaMedium' size='1.2'><t size='1.7' color='#00EEB2'>%1</t><br/>-------------------------------------------------------<br/><t color='#00B2EE'>%2</t></t>", _title, _msg]);
