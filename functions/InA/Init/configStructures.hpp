///////////////////////////////////////////////////////////////////////////
/// Config Indexing Structures
///////////////////////////////////////////////////////////////////////////
// 
// This system allows the developer to easily refer to specific entries by index without knowing the index number.
// eg, instead of remembering "cost" is at index 2, simply use: 
//     CLASS_STRUCTURE_MAGAZINE find "cost";
//  ** Helper macros to hide this are defined at the end of this file
// 
// The recursive config to array function uses these indexes when building the arrays, therefor you can 
// re-position any of the elements mentioned in the structures without causing any issues.
//
// ** config_name at index 0 is a special case, the recursion function will assume there is no property called config_name and instead give {configName _configItem;} as the value.

// Vehicle property indexes
#define CLASS_STRUCTURE_LAND_VEHICLE      ["config_name", "name", "cost_logistics", "cost_munitions", "cost_fuel", "paint", "anim", "isUtility"]
#define CLASS_STRUCTURE_AIR_VEHICLE       ["config_name", "name", "cost_logistics", "cost_munitions", "cost_fuel", "paint", "anim"]
#define CLASS_STRUCTURE_WATER_VEHICLE     ["config_name", "name", "cost_logistics", "cost_munitions", "cost_fuel", "paint", "anim"]

// Gear property indexes
#define CLASS_STRUCTURE_WEAPON            ["config_name", "name", "cost", "type"]
#define CLASS_STRUCTURE_MAGAZINE          ["config_name", "name", "cost", "type"]
#define CLASS_STRUCTURE_MISCITEM          ["config_name", "name", "cost", "type"]
#define CLASS_STRUCTURE_HELMET            ["config_name", "name", "cost", "type"]
#define CLASS_STRUCTURE_UNIFORM           ["config_name", "name", "cost", "type"]
#define CLASS_STRUCTURE_VEST              ["config_name", "name", "cost", "type"]

// Loadout property indexes
#define CLASS_STRUCTURE_LOADOUT_PRIMARY   ["classname", "ammo", "items"]
#define CLASS_STRUCTURE_LOADOUT_SECONDARY ["classname", "ammo", "items"]
#define CLASS_STRUCTURE_LOADOUT_LAUNCHER  ["classname", "ammo"]
#define CLASS_STRUCTURE_LOADOUT_HELMET    ["classname"]
#define CLASS_STRUCTURE_LOADOUT_VEST      ["classname", "items"]
#define CLASS_STRUCTURE_LOADOUT_UNIFORM   ["classname", "items"]
#define CLASS_STRUCTURE_LOADOUT_BACKPACK  ["classname", "items"]

// Faction sub-property indexes
#define CLASS_STRUCTURE_CLOTHES           ["helmets", "vests", "uniforms"]
#define CLASS_STRUCTURE_VEHICLES          ["land", "air", "water"]
#define CLASS_STRUCTURE_GEAR              ["magazines", "weapons", "miscitems"]
#define CLASS_STRUCTURE_LOADOUT           ["primary", "secondary", "launcher", "helmet", "vest", "uniform", "backpack", "equipment"]

// Faction property indexes
#define CLASS_STRUCTURE_FACTION           ["config_name", "name", "sidename", "gear", "vehicles", "clothes", "loadout"]

///////////////////////////////////////////////////////////////////////////
/// Default arrays for defiend structures - MUST MATCH TYPES WITH ABOVE INDEXES!
///////////////////////////////////////////////////////////////////////////
// ** Each structure requires a default array. The types and indexes of the default arrays must match the structures (ofc).
// ** Undefined behaviour occurs if the type specified in the default arrays below does not match the type actually used in the config (string/number/array/bool).

#define CLASS_DEFAULT_LAND_VEHICLE        ["", "", -1, -1, -1, "true", true, false]
#define CLASS_DEFAULT_AIR_VEHICLE         ["", "", -1, -1, -1, "true", true]
#define CLASS_DEFAULT_WATER_VEHICLE       ["", "", -1, -1, -1, "true", true]
#define CLASS_DEFAULT_WEAPON              ["", "", -1, ""]
#define CLASS_DEFAULT_MAGAZINE            ["", "", -1, ""]
#define CLASS_DEFAULT_MISCITEM            ["", "", -1, ""]
#define CLASS_DEFAULT_HELMET              ["", "", -1, ""]
#define CLASS_DEFAULT_UNIFORM             ["", "", -1, ""]
#define CLASS_DEFAULT_VEST                ["", "", -1, ""]
#define CLASS_DEFAULT_LOADOUT_PRIMARY     ["", "", []]
#define CLASS_DEFAULT_LOADOUT_SECONDARY   ["", "", []]
#define CLASS_DEFAULT_LOADOUT_LAUNCHER    ["", ""]
#define CLASS_DEFAULT_LOADOUT_HELMET      [""]
#define CLASS_DEFAULT_LOADOUT_VEST        ["", []]
#define CLASS_DEFAULT_LOADOUT_UNIFORM     ["", []]
#define CLASS_DEFAULT_LOADOUT_BACKPACK    ["", []]
#define CLASS_DEFAULT_CLOTHES             [[CLASS_STRUCTURE_HELMET],[CLASS_STRUCTURE_VEST],[CLASS_STRUCTURE_UNIFORM]]
#define CLASS_DEFAULT_VEHICLES            [[CLASS_DEFAULT_LAND_VEHICLE],[CLASS_DEFAULT_AIR_VEHICLE],[CLASS_DEFAULT_WATER_VEHICLE]]
#define CLASS_DEFAULT_GEAR                [[CLASS_DEFAULT_MAGAZINE],[CLASS_DEFAULT_WEAPON],[CLASS_DEFAULT_MISCITEM]]
#define CLASS_DEFAULT_LOADOUT             [CLASS_DEFAULT_LOADOUT_PRIMARY,CLASS_DEFAULT_LOADOUT_SECONDARY,CLASS_DEFAULT_LOADOUT_LAUNCHER,CLASS_DEFAULT_LOADOUT_HELMET,CLASS_DEFAULT_LOADOUT_VEST,CLASS_DEFAULT_LOADOUT_UNIFORM,CLASS_DEFAULT_LOADOUT_BACKPACK, []]
#define CLASS_DEFAULT_FACTION             ["", "", "", CLASS_DEFAULT_GEAR, CLASS_DEFAULT_VEHICLES, CLASS_DEFAULT_CLOTHES, CLASS_DEFAULT_LOADOUT]

///////////////////////////////////////////////////////////////////////////
/// Deep structures used for recursive Config to Array function.
///////////////////////////////////////////////////////////////////////////
// ** The DEEP class structures are used for the recursive config to array function only.
// ** Adding/Removing config items will be completely ignored unless defined in the top-level structure (CLASS_DEEP_STRUCTURE_FACTION)
// ** The deep structure item names MUST match the unreferenced defined index structures above! (CLASS_STRUCTURE_GEAR etc)
// ** Class-type properties that have class properties of their own use the format ["property_name", _sub_class_structure_]
//
// (Recursion Function details)
// ** If the class has "inheritsFrom" specified, that config is assumed to be a list of classes and the structure provided is applied to each sub-class found
//    ^ The config specified by the inheritsFrom property will "fill-in" any missing properties not specified by the faction data

#define CLASS_DEEP_STRUCTURE_CLOTHES      [["helmets", CLASS_STRUCTURE_HELMET], ["vests", CLASS_STRUCTURE_VEST], ["uniforms", CLASS_STRUCTURE_UNIFORM]]
#define CLASS_DEEP_STRUCTURE_VEHICLES     [["land", CLASS_STRUCTURE_LAND_VEHICLE], ["air", CLASS_STRUCTURE_AIR_VEHICLE], ["water", CLASS_STRUCTURE_WATER_VEHICLE]]
#define CLASS_DEEP_STRUCTURE_GEAR         [["magazines", CLASS_STRUCTURE_MAGAZINE], ["weapons", CLASS_STRUCTURE_WEAPON], ["miscitems", CLASS_STRUCTURE_MISCITEM]]
#define CLASS_DEEP_STRUCTURE_LOADOUT      [["primary", CLASS_STRUCTURE_LOADOUT_PRIMARY], ["secondary", CLASS_STRUCTURE_LOADOUT_SECONDARY], ["launcher", CLASS_STRUCTURE_LOADOUT_LAUNCHER], ["helmet", CLASS_STRUCTURE_LOADOUT_HELMET], ["vest", CLASS_STRUCTURE_LOADOUT_VEST], ["uniform", CLASS_STRUCTURE_LOADOUT_UNIFORM], ["backpack", CLASS_STRUCTURE_LOADOUT_BACKPACK], "equipment"]

#define CLASS_DEEP_STRUCTURE_FACTION      ["config_name", "name", "sidename", ["gear", CLASS_DEEP_STRUCTURE_GEAR], ["vehicles", CLASS_DEEP_STRUCTURE_VEHICLES], ["clothes", CLASS_DEEP_STRUCTURE_CLOTHES], ["loadout", CLASS_DEEP_STRUCTURE_LOADOUT]]

///////////////////////////////////////////////////////////////////////////
/// Property Accessor Helper macros
///////////////////////////////////////////////////////////////////////////
// Usage: { _VehicleSupplyCost = _myVehicle SELECT_LAND_VEHICLE_PROPERTY("cost_munitions"); }

#define SELECT_LAND_VEHICLE_PROPERTY(PROP_NAME)  select (CLASS_STRUCTURE_LAND_VEHICLE find PROP_NAME)
#define SELECT_AIR_VEHICLE_PROPERTY(PROP_NAME)   select (CLASS_STRUCTURE_AIR_VEHICLE find PROP_NAME)
#define SELECT_WATER_VEHICLE_PROPERTY(PROP_NAME) select (CLASS_STRUCTURE_WATER_VEHICLE find PROP_NAME)

#define SELECT_WEAPON_PROPERTY(PROP_NAME)        select (CLASS_STRUCTURE_WEAPON find PROP_NAME)
#define SELECT_MAGAZINE_PROPERTY(PROP_NAME)      select (CLASS_STRUCTURE_MAGAZINE find PROP_NAME)
#define SELECT_MISCITEM_PROPERTY(PROP_NAME)      select (CLASS_STRUCTURE_MISCITEM find PROP_NAME)

#define SELECT_HELMET_PROPERTY(PROP_NAME)        select (CLASS_STRUCTURE_HELMET find PROP_NAME)
#define SELECT_UNIFORM_PROPERTY(PROP_NAME)       select (CLASS_STRUCTURE_UNIFORM find PROP_NAME)
#define SELECT_VEST_PROPERTY(PROP_NAME)          select (CLASS_STRUCTURE_VEST find PROP_NAME)

#define SELECT_GEAR_DATA(GEAR_PROP)              select (CLASS_STRUCTURE_GEAR find GEAR_PROP)
#define SELECT_VEHICLES_DATA(VEHICLES_PROP)      select (CLASS_STRUCTURE_VEHICLES find VEHICLES_PROP)
#define SELECT_CLOTHES_DATA(CLOTHES_PROP)        select (CLASS_STRUCTURE_CLOTHES find CLOTHES_PROP)
#define SELECT_LOADOUT_DATA(LOADOUT_PROP)        select (CLASS_STRUCTURE_LOADOUT find LOADOUT_PROP)

#define SELECT_FACTION_DATA(FACTION_PROP)        select (CLASS_STRUCTURE_FACTION find FACTION_PROP)

#define INDEX_OF(PROP_NAME) find PROP_NAME
