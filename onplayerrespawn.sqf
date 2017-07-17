private ["_iRespawn"];

// ---------- Only on player ----------

if (!hasInterface) exitWith {};

// ---------- Disable chatter ----------

player disableConversation true;
enableSentences false;

// ---------- Respawn time ----------

_iRespawn = "RespawnTime" call BIS_fnc_getParamValue;
setPlayerRespawnTime _iRespawn;

// ---------- Weapon sway ----------

player setCustomAimCoef 0.5;

// ---------- Remove all gear ----------

removeAllWeapons player;
removeAllItems player;
removeBackpack player;
removeAllAssignedItems player;
removeVest player;
removeUniform player;
removeHeadgear player;