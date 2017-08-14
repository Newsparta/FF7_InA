// ---------- Mission Mechanics (4.1.7c) ----------

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
									"There are vehicle service stations located next to the garage (under the two hooks) and at each helipad.<br/><br/>Use these locations to repair and refuel friendly vehicles. Keep in mind that they will require fuel and supplies to do so."
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
									"All areas of the map are simulated. Each region has a certain instability value. This value will slowly increase over time (going from completely stable to completely volatile will take approximately 2 weeks) but can be stabalized by doing the following.<br/><br/>In order for you to stabalize a region you need to be present in the region for a period of time depending on how many friendlies you have. The stability of the region when you LEAVE (key word) is dependent on the number of enemies you LEAVE (same key word) behind when exiting the area.<br/><br/>Be sure to do quick patrols through regions that you may want to keep stable, once you get the notification that you have affected the region, that means the volatility value will be edited when you leave, and as long as you didnt leave behind lots of enemies, it will continue to be stable."
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
									"Interaction Menu",
									"Mission specific ACE interaction menu actions have been added for interacting with yourself and the environment."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Vehicle Requisition",
									"All available vehicles can be requisitioned from this station.<br/><br/>Vehicle Service - The vehicle service area is located adjacent to the garage and at each helipad. You must exit the vehicle to service it, and the amount of resources required to service the vehicle depends on the damage it has sustained, the fuel it is missing, and the ammunition it requires to rearm."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Gear Requisition",
									"All available gear to be requisitioned can be accessed at this station.<br/><br/>Uniforms - All basic uniform equipment is located in the uniform box near this station.<br/><br/>Equipment - All gear can be requisitioned from the Gear Requisition menu station. Once the gear has been requisitioned it will be stored in the nearby cargo container.<br/><br/>Assault boats - boats can be requisitioned (in their disassembled form) from the Misc. category. These will appear as support boxes next to the station. support boxes are ONLY used to represent disassembled assault boats."
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
									"The crux of this map is the use of a resource system. Equipment and vehicles will all cost certain resources to requisition and maintain. The resources and their procurement are listed below<br/><br/>Logistics - This resources is accumulated through the accomplishment of missions and through the stabalization of VOLATILE regions. There is no other way to gain logistics.<br/><br/>Fuel/Supplies - These resources are ONLY aquired through periodic (approx. every 2 hrs) supply transports from offshore. Manage these resources wisely. You can increase the amount you get by completing objectives in the main AO."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Menu Stability",
									"Many menus were added to this map. To ensure that everything functions as intended it is highly recommended that you do not have many people accessing menus all at once, and that you do not press buttons spastically. There should not be any issues, but i thought i would mention this just to make everyone aware."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Feedback",
									"Where applicable, feedback is greatly appreciated. 'It is good' and 'It is bad' are not examples of informative feedback, i do not care how critical you are, but i need to know specifically WHY you hold the opinion that you do. Key areas where feedback is most needed are listed below.<br/><br/>Difficulty - The overall difficulty of the enemy and the missions is very important from both a FPS and a balance standpoint. The mission utilizes a difficulty scaling system that attempts to alter the difficulty based on the specific number of people who are playing. Considering i can only test by myself, it is important that i know how difficult the mission is with 'x' amount of players.<br/><br/>Resources - I am intentionally limiting your capabilities via a resource system, this resource system is not intended to restrict what you have access to but rather restrict you only if the resources are not managed well. It is intended to have you gain equipment and vehicles the longer you progress. Feedback on the effectiveness of these intentions would be good."
								]
							];
player createDiaryRecord	[
								"missionMechanics",
								[
									"Basic Tenets (please read)",
									"- This is not a sandbox, value your gear and your vehicles. If you die there will be no free respawns and no reimbursements.<br/><br/>- Collect intel from civilians (you will not see any information about the main AO if you do not).<br/><br/>- Secure regions. (persistently)<br/><br/>- Scout AO's<br/><br/>- Clear enemies from any main AO and clear any objectives you find.<br/><br/>- Confirm your targets.<br/><br/>- submit an after action report and call it a day."
								]
							];
							
// ---------- Patch Notes (4.1.7c) ----------

player createDiarySubject ["patchNotes","Patch Notes"];

player createDiaryRecord	[
								"patchNotes",
								[
									"Misc.",
									"- Tweaks to enemy spawn RNG <br/>- Defence missions are more explicit<br/>- Region markers edited<br/>- Supplies drops scale ETA, if one drops the next will be delayed longer, this pattern repeats for as long as people are on and reverts back to the standard drop time when everyone is off.<br/>- Supplies received was drastically reduced (keep in mind main AO's give bonus supplies if you complete enough objectives, this may take multiple AO's depending on RNG)<br/>"
								]
							];

// ---------- Notice to read patch notes ----------

[] spawn {

	sleep 5;
	
	["BASICS", "Press 'M' look on the left, find 'Mission Mechanics' and please read the 'Basic Tenets'."] call FF7_fnc_formatHint;
	
	sleep 60;
	
	["(4.1.7c)<br/>2017-08-13", "If you have not already read the patch notes, please do so."] call FF7_fnc_formatHint;
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
		player addWeapon "rhsusf_weap_m9",
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
		player addWeapon "rhsusf_weap_m9",
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

		player forceAddUniform "U_B_CombatUniform_mcam";
		player addMagazine "16Rnd_9x21_Mag";
		player addWeapon "hgun_P07_F",
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
		player addWeapon "hgun_P07_F",
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
		player addWeapon "rhs_weap_makarov_pm",
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

menuHQ addAction [["hq", "FF9900", "Headquarters"] call FF7_fnc_formatAddAction, 
		{
			if !(_this select 1 == leader (group (_this select 1))) exitWith {["HQ", "Headquarters", "Only the squad leader may access the headquarters."] call FF7_fnc_globalHintStruct;};
			
			call compile preprocessFileLineNumbers "functions\InA\Auxiliary\menuHQ.sqf";
			
		}, [], 99, true, true, "", "((_target distance _this) < 4)"];
		
menuHQ addAction [["FF9900", "Look At Map"] call FF7_fnc_formatText,
		{
		
			if ("ItemMap" in (assignedItems player)) exitWith {["HQ", "Headquarters", "You already have a map to look at silly."] call FF7_fnc_globalHintStruct;};

			(_this select 1) linkItem "ItemMap";
			
			openMap true;
			
			waitUntil {sleep 1; !visibleMap};
			
			(_this select 1) unlinkItem "ItemMap";

		},[], 99, true, true, "", "((_target distance _this) < 4)"];
		
GearOpen addAction [["hq", "FF9900", "Gear Requisition"] call FF7_fnc_formatAddAction, 
		{
			[clientOwner, "gearRestricted"] remoteExec ["publicVariableClient", 2, false];
			
			sleep 0.2;
		
			if (!(_this select 1 == leader (group (_this select 1))) && (gearRestricted)) exitWith {["Headquarters", "Only the squad leader may access gear requisition."] call FF7_fnc_formatHint;};
		
			disableSerialization;
	
			createDialog "InA_Gear_Open_Dialog";
			
			[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];

			sleep 0.2;

			ctrlSetText [1002, (format ["%1",LogM])];	
		
		}, [], 99, true, true, "", "((_target distance _this) < 4)"];
		
Garage addAction [["hq", "FF9900", "Vehicle Requisition"] call FF7_fnc_formatAddAction, 
		{
		
			if !(_this select 1 == leader (group (_this select 1))) exitWith {["Headquarters", "Only the squad leader may requisition vehicles."] call FF7_fnc_formatHint;};
			
			call compile preprocessFileLineNumbers "functions\InA\Vehicles\landVehicleHandles.sqf";
		
		}, [], 99, true, true, "", "((_target distance _this) < 4)"];
		
Hangar addAction [["hq", "FF9900", "Vehicle Requisition"] call FF7_fnc_formatAddAction,
		{

			if !(_this select 1 == leader (group (_this select 1))) exitWith {["Headquarters", "Only the squad leader may requisition vehicles."] call FF7_fnc_formatHint;};
			
			call compile preprocessFileLineNumbers "functions\InA\Vehicles\airVehicleHandles.sqf";

		},[], 99, true, true, "", "((_target distance _this) < 4)"];
	
	Hangar addAction [["hq", "FF9900", "Shelter helicopter"] call FF7_fnc_formatAddAction,
		{

			[["shelter"],"functions\InA\Vehicles\shelterHelicopter.sqf"] remoteExec ["execVM", 2];

		},[], 99, true, true, "", "((_target distance _this) < 4)"];
		
	Hangar addAction [["hq", "FF9900", "Bring out helicopter"] call FF7_fnc_formatAddAction,
		{
			
			[["bringOut"],"functions\InA\Vehicles\shelterHelicopter.sqf"] remoteExec ["execVM", 2];

		},[], 99, true, true, "", "((_target distance _this) < 4)"];
		
basicGearBox addAction [["hq", "FF9900", "Equip Uniform"] call FF7_fnc_formatAddAction, 
		{
		
			disableSerialization;
	
			createDialog "InA_Uniform_Dialog";
		
		}, [], 99, true, true, "", "((_target distance _this) < 4)"];