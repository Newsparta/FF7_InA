if ("ItemMap" in (assignedItems player)) exitWith {
	[false, "you already have a map to look at."] call InA_fnc_formatHint;
};

(_this select 1) linkItem "ItemMap";

openMap true;

waitUntil {sleep 1; !visibleMap};

(_this select 1) unlinkItem "ItemMap";