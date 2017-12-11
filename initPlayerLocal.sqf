// Run only on player
if (!hasInterface) exitWith {};

// Wait until player is initialized
waitUntil {!isNull player};
waitUntil{!(isNil "BIS_fnc_init")};

// Initialize configs
_null = execVM "functions\InA\Init\initConfigs.sqf";

// Setup TFAR frequencies
if ("task_force_radio" in activatedAddons) then {
	call InA_fnc_TFARsetup;
};

// ACE actions
[player] call InA_fnc_aceActions;

// Conversation structure
call compile preprocessFileLineNumbers "functions\InA\Interact\conversationStructure.sqf";

// Mission description
#include "functions\InA\Init\missionDescription.hpp";

// Ambient
[clientOwner, "ambientSitrep"] remoteExec ["publicVariableClient", 2];

// Initial gear
[player] call InA_fnc_gearWipe;

// Add actions to base
InA_Warning_ID = 0;

menuHQ addAction [
	"Headquarters", 
	{_this call InA_fnc_actionHQMenu;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
		
menuHQ addAction [
	"Look at map",
	{_this call InA_fnc_actionHQLookAtMap;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
		
GearOpen addAction [
	"Gear Requisition", 
	{_this call InA_fnc_actionGearRequisition;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
		
Garage addAction [
	"Vehicle Requisition", 
	{_this call InA_fnc_actionGarageRequisition;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
		
Hangar addAction [
	"Vehicle Requisition",
	{_this call InA_fnc_actionHangarRequisition;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
	
Hangar addAction [
	"Shelter helicopter",
	{["shelter"] call InA_fnc_shelterHelicopter;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
	
Hangar addAction [
	"Bring out helicopter",
	{["remove"] call InA_fnc_shelterHelicopter;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];
		
basicGearBox addAction [
	"Equip Uniform", 
	{_this call InA_fnc_actionUniformEquip;},
	[], 
	99, 
	true, 
	true, 
	"", 
	"((_target distance _this) < 4)"
];

menuHQ addAction [
	"Fast travel", 
	{_this call InA_fnc_actionTeleport;},
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

		[true, "Building is hidden by default.<br/><br/>Use the SHOW and HIDE commands to toggle the visibility of the structure (keep it hidden if you dont need to see or place it yet, as to avoid accidentally squishing people)", "BUILDING ACTIONS ADDED"] call InA_fnc_formatHint;

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

		player addAction [
			"Building actions", 
			{
				createDialog "InA_Build_Action_Dialog";
			}, 
			[], 
			99, 
			true, 
			true, 
			"", 
			"",
			0
		];
	} else {
		[false, "You do not have the logistical supplies to construct this fortification."] call InA_fnc_formatHint;
	};
};