/* ----------
Function: InA_fnc_aceActions

Description:
    A function to add ACE actions to the player

Parameters:
    - Player to add actions to. (object)

Optional:


Example:
   
    [unit] call InA_fnc_aceActions;

Returns:
    Nil

Author:
    Whigital && Newsparta
---------- */

params ["_unit"];

private ["_action", "_cond", "_type"];

_type = (typeOf _unit);

// ---------- ROLE SPECIFIC ACTIONS ----------

if (_type in ["B_Soldier_SL_F", "B_Soldier_TL_F", "B_spotter_F", "B_recon_JTAC_F"]) then
{
	_cond = {true};
	
	// ---------- SUPPORT PARENT ----------
	_action =
	[
		"InA_Support",
		"Support",
		"",
		{},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
		
	// ---------- EVAC PARENT ----------
	_action =
	[
		"InA_Support_Evac",
		"Emergency Evac",
		"",
		{},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions", "InA_Support"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	// ---------- EVAC CALL ----------
	_action =
	[
		"InA_Support_Evac_Call",
		"Call",
		"",
		{[_player] call InA_fnc_reqEvac;},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions", "InA_Support","InA_Support_Evac"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	// ---------- EVAC RTB ----------
	_action =
	[
		"InA_Support_Evac_RTB",
		"Return to Base",
		"",
		{return = true; publicVariableServer "return";},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions", "InA_Support","InA_Support_Evac"], _action] call ace_interact_menu_fnc_addActionToObject;

	// ---------- FOB parent ----------
	_action =
	[
		"FF7_Interaction_Environment_FOB",
		"FOB",
		"",
		{},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions","FF7_Interaction"], _action] call ace_interact_menu_fnc_addActionToObject;

	// ---------- FOB set ----------
	_action =
	[
		"FF7_Interaction_Environment_FOB_set",
		"set location",
		"",
		{["build",getPosATL player] remoteExec ["InA_fnc_fob", 2];},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions","FF7_Interaction","FF7_Interaction_Environment_FOB"], _action] call ace_interact_menu_fnc_addActionToObject;

	// ---------- FOB cancel ----------
	_action =
	[
		"FF7_Interaction_Environment_FOB_cancel",
		"abandon",
		"",
		{["cancel"] remoteExec ["InA_fnc_fob", 2];},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions","FF7_Interaction","FF7_Interaction_Environment_FOB"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	// ---------- Base Restrictions ----------
	_action =
	[
		"InA_Restrict",
		"Restrict",
		"",
		{},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

		// ---------- Base Restrictions (yes) ----------
		_action =
		[
			"InA_Restrict_Yes",
			"Yes",
			"",
			{gearRestricted = true;publicVariableServer "gearRestricted";["Headquarters", "Gear access is now restricted."] call FF7_fnc_formatHint;},
			_cond
		] call ace_interact_menu_fnc_createAction;

		[_unit, 1, ["ACE_SelfActions","InA_Restrict"], _action] call ace_interact_menu_fnc_addActionToObject;

		// ---------- Base Restrictions (no) ----------
		_action =
		[
			"InA_Restrict_No",
			"No",
			"",
			{gearRestricted = false;publicVariableServer "gearRestricted";["Headquarters", "Gear access is now unrestricted."] call FF7_fnc_formatHint;},
			_cond
		] call ace_interact_menu_fnc_createAction;

		[_unit, 1, ["ACE_SelfActions","InA_Restrict"], _action] call ace_interact_menu_fnc_addActionToObject;
}
else
{

	_cond = {((leader (group _player)) == _player)};
	
	// ---------- SUPPORT PARENT ----------
	_action =
	[
		"InA_Support",
		"Support",
		"",
		{},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
		
	// ---------- EVAC PARENT ----------
	_action =
	[
		"InA_Support_Evac",
		"Emergency Evac",
		"",
		{},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions", "InA_Support"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	// ---------- EVAC CALL ----------
	_action =
	[
		"InA_Support_Evac_Call",
		"Call",
		"",
		{[_player] call InA_fnc_reqEvac;},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions", "InA_Support","InA_Support_Evac"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	// ---------- EVAC RTB ----------
	_action =
	[
		"InA_Support_Evac_RTB",
		"Return to Base",
		"",
		{return = true; publicVariableServer "return";},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions", "InA_Support","InA_Support_Evac"], _action] call ace_interact_menu_fnc_addActionToObject;

	// ---------- FOB parent ----------
	_action =
	[
		"FF7_Interaction_Environment_FOB",
		"FOB",
		"",
		{},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions","FF7_Interaction"], _action] call ace_interact_menu_fnc_addActionToObject;

	// ---------- FOB set ----------
	_action =
	[
		"FF7_Interaction_Environment_FOB_set",
		"set location",
		"",
		{["build",getPosATL player] remoteExec ["InA_fnc_fob", 2];},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions","FF7_Interaction","FF7_Interaction_Environment_FOB"], _action] call ace_interact_menu_fnc_addActionToObject;

	// ---------- FOB cancel ----------
	_action =
	[
		"FF7_Interaction_Environment_FOB_cancel",
		"abandon",
		"",
		{["cancel"] remoteExec ["InA_fnc_fob", 2];},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions","FF7_Interaction","FF7_Interaction_Environment_FOB"], _action] call ace_interact_menu_fnc_addActionToObject;

	// ---------- Base Restrictions ----------
	_action =
	[
		"InA_Restrict",
		"Restrict",
		"",
		{},
		_cond
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

		// ---------- Base Restrictions (yes) ----------
		_action =
		[
			"InA_Restrict_Yes",
			"Yes",
			"",
			{gearRestricted = true;publicVariableServer "gearRestricted";["Headquarters", "Gear access is now restricted."] call FF7_fnc_formatHint;},
			_cond
		] call ace_interact_menu_fnc_createAction;

		[_unit, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

		// ---------- Base Restrictions (no) ----------
		_action =
		[
			"InA_Restrict_No",
			"No",
			"",
			{gearRestricted = false;publicVariableServer "gearRestricted";["Headquarters", "Gear access is now unrestricted."] call FF7_fnc_formatHint;},
			_cond
		] call ace_interact_menu_fnc_createAction;

		[_unit, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};

//----- Health check for medics -----
if (_type in ["B_medic_F", "B_recon_medic_F"]) then
{
	_action =
	[
		"FF7_MedicalStatus",
		"Health status",
		"img\icon\icon-health.paa",
		{[_target] spawn FF7_fnc_aceMedicalStatus;},
		{([_player] call ace_medical_fnc_isMedic)}
	] call ace_interact_menu_fnc_createAction;

	["CAManBase", 0, ["ACE_Torso"], _action, true] call ace_interact_menu_fnc_addActionToClass;
};


//----- Common actions -----

_cond = {true};

// Assemble Boat
_action =
[
	"FF7_Boat_Assemble",
	"Assemble Assault Boat",
	"",
	{[] spawn InA_fnc_assembleBoat;},
	_cond
] call ace_interact_menu_fnc_createAction;

["Box_NATO_Support_F", 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;

// disassemble Boat
_action =
[
	"FF7_Boat_Disassemble",
	"Disassemble Assault Boat",
	"",
	{[] spawn InA_fnc_disassembleBoat;},
	_cond
] call ace_interact_menu_fnc_createAction;

["B_Boat_Transport_01_F", 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;

// Interaction parent
_action =
[
	"FF7_Interaction",
	"Interaction",
	"",
	{},
	_cond
] call ace_interact_menu_fnc_createAction;

[_unit, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// Unlock Door
_action =
[
	"FF7_Interaction_Environment_unlockDoor",
	"Unlock Door",
	"",
	{[] spawn InA_fnc_unlockDoor;},
	_cond
] call ace_interact_menu_fnc_createAction;

[_unit, 1, ["ACE_SelfActions","FF7_Interaction"], _action] call ace_interact_menu_fnc_addActionToObject;

// Unfold map
_action =
[
	"FF7_Interaction_Self_unfoldMap",
	"Unfold Map",
	"",
	{[] spawn InA_fnc_unfoldMap;},
	{"ItemMap" in (assignedItems player);}
] call ace_interact_menu_fnc_createAction;

[_unit, 1, ["ACE_SelfActions","FF7_Interaction"], _action] call ace_interact_menu_fnc_addActionToObject;
