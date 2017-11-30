// local declarations
private		_iRespawn		= nil;

// only on player
if (!hasInterface) exitWith {};

// disable chatter
player disableConversation true;
enableSentences false;

// respawn timer
_iRespawn = "RespawnTime" call BIS_fnc_getParamValue;
setPlayerRespawnTime _iRespawn;

// weapon sway
player setCustomAimCoef 0.5;

// initial gear
[player, 1] call InA_fnc_gearWipe;