// ---------- Mission Mechanics (4.2) ----------

player createDiarySubject ["missionMechanics","Mission Mechanics"];

player createDiaryRecord	[
								"missionMechanics",
								[
									"Vehicle Service",
									"There are vehicle service stations located next to the garage and at each helipad.<br/><br/>Use these locations to repair and refuel friendly vehicles. Keep in mind that they will require fuel and supplies to do so."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Tolerance",
									"Civilians have long memories. How you choose to treat the civilians on Tanoa will directly affect their tolerance of you. Upset them too much and they may lose interest in cooperation with your forces."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Side Missions",
									"Interacting with civilians will give you the chance to be assigned side missions to complete. In order to have a side mission activate you need to successfully converse with a civilian and then there will be a probability that the success outcome results in a side mission assignment. "
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Region Instability",
									"All areas of the map are simulated. Each region has a certain instability value. This value will slowly increase over time but can be stabalized by doing the following.<br/><br/>In order for you to stabalize a region you need to be present in the region for a period of time depending on how many friendlies you have. The stability of the region when you LEAVE (key word) is dependent on the number of enemies you LEAVE (same key word) behind when exiting the area.<br/><br/>Be sure to do quick patrols through regions that you may want to keep stable, once you get the notification that you have affected the region, that means the volatility value will be edited when you leave, and as long as you didnt leave behind lots of enemies, it will continue to be stable."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Strongholds and Hideouts",
									"There are concentrations of insurgents littered around the map via strongholds and hideouts. Civilians will give you intel on locations where insurgents are concentrated but will not specify if the area is a hideout or stronghold.<br/><br/>Hideouts are mere concentrations of enemies that occupy a small region. Routing the insurgents from this area will count as a completed objective. These hideout locations will change approximately every 12 hours. More hideouts will become active as you secure more of the map.<br/><br/>Strongholds only manifest in population centers on the map. These areas contain more insurgents and a heavier response to any attack. these locations will only manifest in volatile regions and will remain until cleared. If they are cleared they will not appear again for 2 days."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Armory",
									"By default the armory has no equipment in it, however, it has many containers to store equipment. It is highly recommended that you look here first for equipment before requisitioning more, and that when you are done with your missions to deposit all excess weapons/equipment here for safe keeping."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Vehicle Requisition",
									"All available vehicles can be requisitioned from the appropriate station.<br/><br/>Vehicle Service - The vehicle service area is located adjacent to the garage and at each helipad. You must exit the vehicle to service it, and the amount of resources required to service the vehicle depends on the damage it has sustained, the fuel it is missing, and the ammunition it requires to rearm."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Gear Requisition",
									"All available gear to be requisitioned can be accessed at the appropriate station.<br/><br/>Uniforms - All basic uniform equipment is located in the uniform box near this station.<br/><br/>Equipment - All gear can be requisitioned from the Gear Requisition menu station. Once the gear has been requisitioned it will be stored in the nearby cargo container.<br/><br/>Assault boats - boats can be requisitioned (in their disassembled form) from the Misc. category. These will appear as support boxes next to the station. support boxes are ONLY used to represent disassembled assault boats."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Headquarters",
									"The headquarters is the main hub for squadleaders.<br/><br/>Sitrep - The situation report will give you vital information on the stability of certain regions of the map, by default these reports can only be given once before they are unavailble for a short time.<br/><br/>Base Theme - This is a very dangerous command. From the headquarters you can select which theme you wish to play as, selecting a base theme will revert ALL progress that has been made and put you back at square 1. only do this if you are absolutely certain.<br/><br/>Time - If you wish to wait until a particular time of day, you may specify this here.<br/><br/>Resources - The current base resources are displayed here."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Resources",
									"Resources are used in this game mode to add a system of gear/equipment progression, and to punish players for losing vehicles and equipment in the field. Resource types are listed below.<br/><br/>Logistics Points- This resources is accumulated through the accomplishment of missions and through the stabalization of VOLATILE regions.<br/><br/>Supplies - A small set amount of supplies are gained with each resupply helicopter. Additional supplies can be redirected by HQ if you accomplish enough objectives (through completed objectives tally).<br/><br/>Fuel - This resource is only provided by each resupply helicopter."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Basic Tenets (please read)",
									"- Secure volatile and destabalizing regions (persistent combat).<br/><br/>- Interact with civilians (intel and side missions).<br/><br/>- seek out insurgent hideouts and strongholds (persistent combat).<br/><br/>- defend regions from incursions (defence combat).<br/><br/>- setup FOB's (safe haven).<br/><br/>- deliver aid to civilians (humanitarian).<br/><br/>"
								]
							];

// ---------- Notice ----------

[] spawn {

	sleep 5;
	
	["BASICS", "Press 'M' look on the left, find 'Mission Mechanics' and please read the 'Basic Tenets'."] call FF7_fnc_formatHint;
	
	sleep 60;
	
	["(4.2)<br/>2017-11-12", "Latest patch date"] call FF7_fnc_formatHint;
};

// ---------- Run only on player... ----------

if (!hasInterface) exitWith
{
	call FF7_fnc_headlessInit;
};

// ---------- Wait until player is initialized... ----------

waitUntil {!isNull player};

waitUntil{!(isNil "BIS_fnc_init")};

// ---------- Setup TFAR frequencies----------

if ("task_force_radio" in activatedAddons) then
{
	call FF7_fnc_TFARsetup;
}
else
{
	["initPlayerLocal", "TFAR not active ...."] call FF7_fnc_debugLog;
};

// ---------- ACE actions ----------

["initPlayerLocal", "Adding ACE actions ...."] call FF7_fnc_debugLog;
	
[player] call InA_fnc_aceActions;

// ---------- Conversation structure ----------

call compile preprocessFileLineNumbers "functions\InA\Interact\conversationStructure.sqf";

// ---------- Initialize player ----------

// ---------- Initial gear ----------

[clientOwner, "baseType"] remoteExec ["publicVariableClient", 2, false];

sleep 0.2;

switch (baseType) do {
	case "Army":
	{
		removeAllWeapons player;
		removeAllItems player;
		removeBackpack player;
		removeAllAssignedItems player;
		removeVest player;
		removeUniform player;
		removeHeadgear player;

		player forceAddUniform "VSM_Multicam_Crye_Camo";
		player addMagazine "rhsusf_mag_15Rnd_9x19_JHP";
		player addWeapon "rhsusf_weap_m9";
	};
	case "Marines":
	{
		removeAllWeapons player;
		removeAllItems player;
		removeBackpack player;
		removeAllAssignedItems player;
		removeVest player;
		removeUniform player;
		removeHeadgear player;

		player forceAddUniform "rhs_uniform_FROG01_wd";
		player addMagazine "rhsusf_mag_15Rnd_9x19_JHP";
		player addWeapon "rhsusf_weap_m9";
	};
	case "Nato":
	{
		removeAllWeapons player;
		removeAllItems player;
		removeBackpack player;
		removeAllAssignedItems player;
		removeVest player;
		removeUniform player;
		removeHeadgear player;

		player forceAddUniform "MNP_CombatUniform_Scorpion_A";
		player addMagazine "16Rnd_9x21_Mag";
		player addWeapon "hgun_P07_F";
	};
	case "AAF":
	{
		removeAllWeapons player;
		removeAllItems player;
		removeBackpack player;
		removeAllAssignedItems player;
		removeVest player;
		removeUniform player;
		removeHeadgear player;

		player forceAddUniform "U_I_CombatUniform";
		player addMagazine "rhsusf_mag_15Rnd_9x19_JHP";
		player addWeapon "hgun_P07_F";
	};
	case "Russia":
	{
		removeAllWeapons player;
		removeAllItems player;
		removeBackpack player;
		removeAllAssignedItems player;
		removeVest player;
		removeUniform player;
		removeHeadgear player;

		player forceAddUniform "rhs_uniform_emr_patchless";
		player addMagazine "rhs_mag_9x18_8_57N181S";
		player addWeapon "rhs_weap_makarov_pm";
	};
	default
	{
		removeAllWeapons player;
		removeAllItems player;
		removeBackpack player;
		removeAllAssignedItems player;
		removeVest player;
		removeUniform player;
		removeHeadgear player;
	};
};

// ---------- Add actions to base ----------

InA_Warning_ID = 0;

menuHQ addAction [
	["hq", "FF9900", "Headquarters"] call FF7_fnc_formatAddAction, 
	{_this call InA_fnc_actionHQMenu;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
		
menuHQ addAction [["FF9900", "Look At Map"] call FF7_fnc_formatText,
	{_this call InA_fnc_actionHQLookAtMap;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
		
GearOpen addAction [["hq", "FF9900", "Gear Requisition"] call FF7_fnc_formatAddAction, 
	{_this call InA_fnc_actionGearRequisition;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
		
Garage addAction [["hq", "FF9900", "Vehicle Requisition"] call FF7_fnc_formatAddAction, 
	{_this call InA_fnc_actionGarageRequisition;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
		
Hangar addAction [["hq", "FF9900", "Vehicle Requisition"] call FF7_fnc_formatAddAction,
	{_this call InA_fnc_actionHangarRequisition;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
	
Hangar addAction [["hq", "FF9900", "Shelter helicopter"] call FF7_fnc_formatAddAction,
	{_this call InA_fnc_actionHangarShelter;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
	
Hangar addAction [["hq", "FF9900", "Bring out helicopter"] call FF7_fnc_formatAddAction,
	{_this call InA_fnc_actionHangarTakeOut;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
		
basicGearBox addAction [["hq", "FF9900", "Equip Uniform"] call FF7_fnc_formatAddAction, 
	{_this call InA_fnc_actionUniformEquip;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];

// ---------- Building Objects ----------

buildObj = 
{
	[clientOwner, "buildInventory"] remoteExec ["publicVariableClient", 2, false];

	sleep 0.2;

	if (buildInventory >= objCost) then {

		["BUILDING ACTIONS ADDED", "Building is hidden by default.<br/><br/>Use the SHOW and HIDE commands to toggle the visibility of the structure (keep it hidden if you dont need to see or place it yet, as to avoid accidentally squishing people)"] call FF7_fnc_formatHint;

		obj = objType createVehicle [0,0,0];

		xPos = xDefine;
		yPos = yDefine;
		zPos = zDefine;

		aPos = rotDefine;
		bPos = 0;
		cPos = 0;

		transX = 0;
		transY = 0;
		transZ = 0;

		transA = aPos;
		transC = cPos;

		disableSerialization;

		player addAction [["FF9900", "(Open Action Menu)"] call FF7_fnc_formatText, 
				{
					createDialog "InA_Build_Action_Dialog";
				}, [], 99, true, true, "", "",0];
	} else {
		["Headquarters", "You do not have the logistical supplies to construct this fortification."] call FF7_fnc_formatHint;
	};
};