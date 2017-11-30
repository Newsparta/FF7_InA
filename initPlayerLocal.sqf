// Run only on player
if (!hasInterface) exitWith {};

// Wait until player is initialized
waitUntil {!isNull player};
waitUntil{!(isNil "BIS_fnc_init")};

// Initialize configs
_null = execVM "functions\InA\Init\initConfigs.sqf";

// Setup TFAR frequencies
if ("task_force_radio" in activatedAddons) then {
	call FF7_fnc_TFARsetup;
};

// ACE actions
[player] call InA_fnc_aceActions;

// Conversation structure
call compile preprocessFileLineNumbers "functions\InA\Interact\conversationStructure.sqf";

// Mission description
#include "functions\InA\Auxiliary\missionDescription.hpp";

// Initial gear
[player] call InA_fnc_gearWipe;

// Add actions to base
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

// Building Objects
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