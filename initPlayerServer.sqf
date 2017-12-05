private "_player";

_player = (_this select 0);

// Exit if headless
if ((typeOf (_player)) == "HeadlessClient_F") exitWith {};