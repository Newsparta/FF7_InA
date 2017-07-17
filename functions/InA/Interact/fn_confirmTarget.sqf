private ["_variable","_type"];
[clientOwner, "signalArray"] remoteExec ["publicVariableClient", 2];
[clientOwner, "signalType"] remoteExec ["publicVariableClient", 2];

sleep 0.2;

if (count signalArray > 0) then {

	[clientOwner, "compObj"] remoteExec ["publicVariableClient", 2];

	[clientOwner, "commNum"] remoteExec ["publicVariableClient", 2];
	[clientOwner, "fuelNum"] remoteExec ["publicVariableClient", 2];
	[clientOwner, "officerNum"] remoteExec ["publicVariableClient", 2];
	[clientOwner, "MGNum"] remoteExec ["publicVariableClient", 2];
	[clientOwner, "weaponNum"] remoteExec ["publicVariableClient", 2];

	sleep 0.2;

	_variable = signalArray select 0;
	_type = signalType select 0;
	
	switch (_type) do
	{
		case "commOutpost":
		{
			commNum = commNum + 1;
			publicVariableServer "commNum";
		};
		case "fuelDepot":
		{
			fuelNum = fuelNum + 1;
			publicVariableServer "fuelNum";
		};
		case "HVTOfficer":
		{
			officerNum = officerNum + 1;
			publicVariableServer "officerNum";
		};
		case "MGNest":
		{
			MGNum = MGNum + 1;
			publicVariableServer "MGNum";
		};
		case "weaponsCache":
		{
			weaponNum = weaponNum + 1;
			publicVariableServer "weaponNum";
		};
		case "supplyOutpost":
		{
			goodsNum = goodsNum + 1;
			publicVariableServer "goodsNum";
		};
		case "barracksStructure":
		{
			barracksNum = barracksNum + 1;
			publicVariableServer "barracksNum";
		};
		case "AAAEmplacement":
		{
			AAANum = AAANum + 1;
			publicVariableServer "AAANum";
		};
	};
	
	Objectives =
	[
		["communication outpost(s)",commNum],
		["fuel depot(s)",fuelNum],
		["officer(s)",officerNum],
		["machine gun post(s)",MGNum],
		["weapon cache(s)",weaponNum],
		["supply outpost(s)",goodsNum],
		["barracks",barracksNum],
		["AAA Emplacement",AAANum]
	];
	publicVariableServer "Objectives";
	
	compObj = compObj + 1;
	publicVariableServer "compObj";
	
	signalArray = signalArray - [_variable];
	publicVariableServer "signalArray";
	signalType = signalType - [_type];
	publicVariableServer "signalType";
	
	["CONFIRMATION","Objective confirmed."] call FF7_fnc_formatHint;
} else {
	["INVALID","No objectives can be confirmed."] call FF7_fnc_formatHint;
};