// Run only on player...
if (!hasInterface) exitWith
{
	call FF7_fnc_headlessInit;
};

//Wait until player is initialized...
waitUntil {!isNull player};
waitUntil{!(isNil "BIS_fnc_init")};

//initialize configs
_null = execVM "functions\InA\Init\initConfigs.sqf";

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

#include "functions\InA\Auxiliary\missionDescription.hpp";

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

		player forceAddUniform "VSM_MulticamTropic_Camo";
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

		player forceAddUniform "TRYK_U_B_MARPAT_Wood_Tshirt";
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

		player forceAddUniform "U_B_T_Soldier_F";
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

	{

		if (kitVeh in _x) then {

			kitVal = _x select 1;

		};

	} forEach utilityVehicles;

	if (kitVal >= objCost) then {

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