if ("ItemMap" in (assignedItems player)) exitWith {
	["HQ", "Headquarters", "You already have a map to look at silly."] call FF7_fnc_globalHintStruct;
};

(_this select 1) linkItem "ItemMap";

openMap true;

waitUntil {sleep 1; !visibleMap};

(_this select 1) unlinkItem "ItemMap";