// ---------- Mission Mechanics (4.2) ----------

player createDiarySubject ["missionMechanics","Mission Mechanics"];

player createDiaryRecord	[
								"missionMechanics",
								[
									"WAD",
									"There is a weapons and ammunition disposal crate inside the hangar next to the hangar vehicle station. You can place any items in here to be disposed of."
								]
							];
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
									"Intelligence Gathering",
									"If the enemy have an operation planned or a presence somewhere in the region it will be noted via an 'increased' enemy activity indicator announced by HQ and in the intel clipboard available to squad leaders. If there is increased enemy presence, you will have to talk to civilians to gain intelligence on what objectives might have been spotted (or where), where the general activity is, and what their strength might be. There will be various qualities of intel that the civilians will reveal. Do note that what the civilians give you is all you have to work with, sometimes you may not know absolutely everything and you will have to figure it out on the go. Once all of the intel is aquired it will be stored in the intel clipboard for reference."
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
									"Main AO's",
									"Main AO's will spawn persistently around the map randomly, with approximately 1 hour inbetween spawns if you complete one. This area is not marked in any way and you will never be told when the AO is clear or when objectives have been destroyed. The main tasks you need to accomplish are clearing enemies from the AO and destroying any objectives you find. Some example objectives include:<br/><br/>- Barracks<br/>- Fuel Depot<br/>- Officer<br/>- AA emplacement<br/><br/>The civilians will be able to tell you generally where the AO is and either what objectives they saw or a general area where they saw them. They might tell you about all the objectives in the AO or thy might only tell you about one of them. It is completely up to you to determine when you think the job is done and you can RTB.<br/><br/>In order to complete the objectives you will need to use the 'Confirm Target' command in your self interaction menu. You can only confirm a target if it has been properly destroyed, so in order for you to confirm you destroyed an enemy barracks, you need to blow it up and then walk up and inspect it, use the confirm target and it will prompt you if it has been identified (if it is invalid, you either didnt kill the target or someone has already confirmed it)."
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
									"Resources are used in this game mode to add a system of gear/equipment progression, and to punish players for losing vehicles and equipment in the field. Resource types are listed below.<br/><br/>Logistics Points- This resources is accumulated through the accomplishment of missions and through the stabalization of VOLATILE regions.<br/><br/>Supplies - A small set amount of supplies are gained with each resupply helicopter. Additional supplies can be redirected by HQ if you accomplish enough objectives (through main AO's).<br/><br/>Fuel - This resource is only provided by each resupply helicopter."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Basic Tenets (please read)",
									"- This is NOT a sandbox.<br/><br/>- Secure volatile and destabalizing regions (persistent combat).<br/><br/>- Interact with civilians (intel and side missions).<br/><br/>- seek out insurgent hideouts and strongholds (persistent combat).<br/><br/>- defend regions from incursions (defence combat).<br/><br/>- setup FOB's (safe haven).<br/><br/>- deliver aid to civilians (humanitarian).<br/><br/>- ."
								]
							];

// ---------- Notice ----------

[] spawn {

	sleep 5;
	
	["BASICS", "Press 'M' look on the left, find 'Mission Mechanics' and please read the 'Basic Tenets'."] call FF7_fnc_formatHint;
	
	sleep 60;
	
	["(4.2)<br/>2017-10-09", "Latest patch date"] call FF7_fnc_formatHint;
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