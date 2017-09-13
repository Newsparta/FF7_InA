params ["_civ"];
private ["_array","_content","_profile"];
// ---------- Civilian action init ----------

[_civ,"MOVE"] remoteExec ["disableAI", 2];

[clientOwner, "civTol"] remoteExec ["publicVariableClient", 2, false];

interimCiv = _civ;

sleep 0.2;

// ---------- Civilian state ----------

_num = random 1;

if ((_num >= 0) && {_num <= (0.1 + (0.8 * civTol))}) then {

	_content =	
	[
		"cheerful",
		"contented",
		"delighted",
		"glad",
		"peaceful",
		"pleasant",
		"pleased",
		"lively",
		"interested",
		"supportive",
		"caring",
		"animated",
		"eager",
		"enthusiastic",
		"thrilled",
		"delighted"
	];
};
if ((_num > (0.1 + (0.8 * civTol))) && {_num <= 1}) then {

	_content =	
	[
		"dismal",
		"bitter",
		"melancholy",
		"pessimistic",
		"somber",
		"exasperated",
		"annoyed",
		"bitter",
		"exasperated",
		"irritated",
		"offended",
		"resentful",
		"sullen",
		"uptight",
		"panicked",
		"afraid",
		"anxious",
		"fearful",
		"startled"
	];
};

// ---------- Create dialog ----------

disableSerialization;

createDialog "InA_Civ_Dialog";

waitUntil {!isNull (findDisplay 8101);};

ctrlSetText [1000, (format ["%1",selectRandom _content])];