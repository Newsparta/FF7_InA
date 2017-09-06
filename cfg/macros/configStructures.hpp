///////////////////////////////////////////////////////////////////////////
/// Configurations <-> SQF Arrays (Properties)
///////////////////////////////////////////////////////////////////////////

// Data Layouts (Config Variable Names)
#define DATA_STRUCTURE_LAND_VEHICLE ["classname", "name", "cost_logistics", "cost_munitions", "cost_fuel", "paint", "anim", "isUtility"]
#define DATA_STRUCTURE_AIR_VEHICLE ["classname", "name", "cost_logistics", "cost_munitions", "cost_fuel", "paint", "anim"]
#define DATA_STRUCTURE_WATER_VEHICLE ["classname", "name", "cost_logistics", "cost_munitions", "cost_fuel", "paint", "anim"]
#define DATA_STRUCTURE_WEAPON ["classname", "name", "cost", "type"]
#define DATA_STRUCTURE_MAGAZINE ["classname", "name", "cost", "type"]
#define DATA_STRUCTURE_MISCITEM ["classname", "name", "cost", "type"]
#define DATA_STRUCTURE_HELMET ["classname", "name", "cost", "type"]
#define DATA_STRUCTURE_UNIFORM ["classname", "name", "cost", "type"]
#define DATA_STRUCTURE_VEST ["classname", "name", "cost", "type"]

// Data Layouts (Default Values - MUST MATCH WITH ABOVE INDEXES!)
#define DATA_DEFAULT_LAND_VEHICLE ["", "", -1, -1, -1, "true", true, false]
#define DATA_DEFAULT_AIR_VEHICLE ["", "", -1, -1, -1, "true", true]
#define DATA_DEFAULT_WATER_VEHICLE ["", "", -1, -1, -1, "true", true]
#define DATA_DEFAULT_WEAPON ["", "", -1, ""]
#define DATA_DEFAULT_MAGAZINE ["", "", -1, ""]
#define DATA_DEFAULT_MISCITEM ["", "", -1, ""]
#define DATA_DEFAULT_HELMET ["", "", -1, ""]
#define DATA_DEFAULT_UNIFORM ["", "", -1, ""]
#define DATA_DEFAULT_VEST ["", "", -1, ""]


///////////////////////////////////////////////////////////////////////////
/// Configurations <-> SQF Arrays (Classes)
///////////////////////////////////////////////////////////////////////////

// Class Layouts (Config Class Names)
#define CLASS_STRUCTURE_CLOTHES ["classname", "helmets", "vests", "uniforms"]
#define CLASS_STRUCTURE_VEHICLES ["classname", "landvehicles", "airvehicles", "watervehicles"]
#define CLASS_STRUCTURE_GEAR ["classname", "magazines", "weapons", "miscItems"]
#define CLASS_STRUCTURE_LOADOUT ["classname", "primary", "secondary", "launcher", "helmet", "vest", "uniform", "equipment"]
#define CLASS_STRUCTURE_FACTION ["classname", "name", "sidename", "gear", "vehicles", "clothes", "loadout"]

// Class Layouts (Default Values - MUST MATCH WITH ABOVE INDEXES!)
#define CLASS_DEFAULT_CLOTHES ["", [],[],[]]
#define CLASS_DEFAULT_VEHICLES ["", [],[],[]]
#define CLASS_DEFAULT_GEAR ["", [],[],[]]
#define CLASS_DEFAULT_LOADOUT ["", [],[],[],[],[],[],[]]
#define CLASS_DEFAULT_FACTION ["", "", "", CLASS_DEFAULT_GEAR, CLASS_DEFAULT_VEHICLES, CLASS_DEFAULT_CLOTHES, CLASS_DEFAULT_LOADOUT]
    

///////////////////////////////////////////////////////////////////////////
/// Configurations <-> SQF Arrays Helpers
///////////////////////////////////////////////////////////////////////////

// Property Accessor Helper acros
// Usage: { _VehicleSupplyCost = _myVehicle SELECT_LAND_VEHICLE_PROPERTY("cost_munitions"); }
#define SELECT_LAND_VEHICLE_PROPERTY(PROP_NAME) select (DATA_STRUCTURE_LAND_VEHICLE find PROP_NAME);
#define SELECT_AIR_VEHICLE_PROPERTY(PROP_NAME) select (DATA_STRUCTURE_AIR_VEHICLE find PROP_NAME);
#define SELECT_WATER_VEHICLE_PROPERTY(PROP_NAME) select (DATA_STRUCTURE_WATER_VEHICLE find PROP_NAME);
#define SELECT_WEAPON_PROPERTY(PROP_NAME) select (DATA_STRUCTURE_WEAPON find PROP_NAME);
#define SELECT_MAGAZINE_PROPERTY(PROP_NAME) select (DATA_STRUCTURE_MAGAZINE find PROP_NAME);
#define SELECT_MISCITEM_PROPERTY(PROP_NAME) select (DATA_STRUCTURE_MISCITEM find PROP_NAME);
#define SELECT_HELMET_PROPERTY(PROP_NAME) select (DATA_STRUCTURE_HELMET find PROP_NAME);
#define SELECT_UNIFORM_PROPERTY(PROP_NAME) select (DATA_STRUCTURE_UNIFORM find PROP_NAME);
#define SELECT_VEST_PROPERTY(PROP_NAME) select (DATA_STRUCTURE_VEST find PROP_NAME);
