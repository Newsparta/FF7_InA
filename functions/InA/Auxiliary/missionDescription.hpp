// ---------- Notice ----------

[] spawn {
    
        sleep 5;
        
        ["BASICS", "Press 'M' look on the left, find 'Mission Mechanics' and please read the 'Basic Tenets'."] call FF7_fnc_formatHint;
        
        sleep 60;
        
        ["(4.2)<br/>2017-11-15", "Latest patch date"] call FF7_fnc_formatHint;
    };

// ---------- Mission Mechanics (4.2) ----------

player createDiarySubject ["missionMechanics","Mission Mechanics"];


player createDiaryRecord	
[
	"missionMechanics",
	[
"FOB's",
"
FOB's can be disignated by squad leaders. 
Only one FOB may be active at one time, and you must abandon any operational FOB's before declaring a new one. 
You can place an FOB by using the 'ace self interaction --> interaction --> FOB'. 
Once the FOB location is set, new build options will be available while you are near it. 
A passive garrison of friendly troops will also occupy the area.
"
	]
];
player createDiaryRecord	
[
	"missionMechanics",
	[
"Vehicle Service",
"
There are vehicle service stations located next to the garage and at each helipad.
Use these locations to repair and refuel friendly vehicles. 
Keep in mind that they will require fuel and supplies to do so.
"
	]
];
player createDiaryRecord	
[
	"missionMechanics",
	[
"Tolerance",
"
Civilians have long memories. 
How you choose to treat the civilians will directly affect their tolerance of you.
Upset them too much and they may lose interest in cooperation with your forces.<br/><br/>
WARNING: Civilians that do not want to interact with you will severely limit your operatinal capabilities.<br/><br/>
You will not be able to aquire intel on hideouts and strongholds.<br/><br/>
You will not be able to complete side missions.
"
	]
];
player createDiaryRecord	
[
	"missionMechanics",
	[
"Defence Missions",
"
Periodically if players are on, the insurgents will try and assault a stable or destabalizing region.
If insurgents are successful or if you do nothing, the region will become volatile.
A pop up will appear that notifies you that an attack is immenent on a region.
You have a period of approximately 1 - 2 hours to respond or else it will be captured.
Once you are close enough to the region, there will be a notification that the attack will begin shortly.
A safehouse will be revealed that will allow you to build fortifications.<br/><br/>
Defence missions reward<br/>
	- 3 logistics<br/>
	- increased civ tolerance<br/>
	- completed objective
"
	]
];
player createDiaryRecord	
[
	"missionMechanics",
	[
"Side Missions",
"
Interacting with civilians will give you the chance to be assigned side missions to complete. 
In order to have a side mission activate you need to successfully converse with a civilian.
Upon successful conversation there is a small chance that they will issue a side mission.<br/><br/>
Side missions reward<br/>
	- 1 logistics<br/>
	- completed objective
"
	]
];
player createDiaryRecord	
[
	"missionMechanics",
	[
"Strongholds and Hideouts",
"
There are concentrations of insurgents littered around the map via strongholds and hideouts. 
Civilians will give you intel on locations where insurgents are concentrated.
They will not specify if the area is a hideout or stronghold.<br/><br/>
Hideouts are mere concentrations of enemies that occupy a small region.
Routing the insurgents from this area will count as a completed objective. 
These hideout locations will change approximately every 12 hours.
More hideouts will become active as you secure more of the map.<br/><br/>
Strongholds only manifest in population centers on the map. 
These areas contain more insurgents and a heavier response to any attack.
these locations will only manifest in volatile regions and will remain until cleared.
If they are cleared they will not appear again for 2 days.<br/><br/>
Stronghold's reward<br/>
	- 6 logistics<br/>
	- 50 - 150 instant supply boost<br/>
	- completed objective<br/><br/>
Hideout's reward<br/>
	- 3 logistics<br/>
	- completed objective
"
	]
];
player createDiaryRecord	
[
	"missionMechanics",
	[
"Region Instability",
"
Each region of the map has a certain instability value (random at mission start).
This value will slowly increase over time if nothing is done.
In order to stabalize a region you must have a friendly force present in the area for a short time.
The time you must spend in the region depends on how many friendly forces are present in the region.
Once you have been in the region for the minimum time to affect you will be notified.
If you see this notification, the region will be updated as soon as you leave the area.
You will also be notified if you pacify a majority of the enemies in the area.
Pacifying most of the enemies will result in stabalizing the region.
However if you do not completely rout the enemies, it can result in a destabalizing or volatile region.<br/><br/>
Region pacification rewards<br/>
	- 1 logistics<br/>
	- increased civ tolerance<br/>
	- completed objective
"
	]
];
player createDiaryRecord	
[
	"missionMechanics",
	[
"Humaitarian Aid",
"
You can bring humanitarian aid vehicles into destabalizing and stable regions to deploy aid.
Once the vehicle is in the region there will be an action added to 'deploy aid'.
Once activated the vehicle will need to remain in the area for 5 minutes to deploy all of the aid.<br/><br/>
if the aid is deployed you will be rewarded with logistics points, civilian tolerance, and a completed objective.
if the region is also stable, the region will become fortified.
Fortified regions have their instability gain frozen for 7 days.<br/><br/>
Aid rewards<br/>
	- 1 logistics<br/>
	- increased civ tolerance<br/>
	- completed objective
"
	]
];
player createDiaryRecord	
[
	"missionMechanics",
	[
"Armory",
"
By default the armory has no equipment in it, 
however, it has many containers to store equipment. 
It is highly recommended that you look here first for equipment before requisitioning more, 
and that when you are done with your missions to deposit all excess weapons/equipment here for safe keeping.
"
	]
];
player createDiaryRecord	
[
	"missionMechanics",
	[
"Vehicle Requisition",
"
All vehicles available can be requisitioned at the computer in the garage.
The vehicles will be spawned in the garage and will need to be moved before you can requisition more.
Vehicle service is also located at each helipad and near the garage (look for orange cones).
"
	]
];
player createDiaryRecord	
[
	"missionMechanics",
	[
"Gear Requisition",
"
All weapons, munitions, and accessories can be requisitioned in the armory at the requisition computer.
Uniforms/vests/helmets will be aquired in the 'uniforms' box via a menu (these are free).
Equipment requisitioned will either be placed in the box next to the computer or in its appropriate armory box.
"
	]
];
player createDiaryRecord	
[
	"missionMechanics",
	[
"Headquarters",
"
The headquarters is the main hub for commanders.
All of the menu options are described below.<br/><br/>
Situation Report - This is where you will request a report on region stability.<br/><br/>
Time of Day - This is where you can select a particular time of day.<br/><br/>
Database - This is where you can save and reset the database.
Saving will preserve any equipment and vehicles at base as well as any placed objects at your FOB.
Reseting the database will wipe all information (use this if you wish to change faction AND restart the mission file).<br/><br/>
Faction - This is where you can select which faction you wish to play as.
Inventory - This is where all available resources are displayed.
Supply Drop - This shows the current ETA for the next supply drop.
"
	]
];
player createDiaryRecord	
[
	"missionMechanics",
	[
"Resources",
"
Resources are used to add a progresion element to the mission.
This will also punish you should you die in the field and lose valuable gear.
Most of the cosmetic and basic equipment is free, but all specialized gear will cost you.
Resources used are detailed below.<br/><br/>
Logistcs - Logistics points are accumulated through the completion of objectives around the map.
Some objectives include clearing insurgent hideouts,
completed side missions assigned by civilians,
and delivering aid to regions.
Logistics points are only used in the aquisition of vehicles.<br/><br/>
Fuel - Fuel is only aquired through periodic supply drops.
This is mainly used in the aquisition of vehicles and refueling of vehicles.<br/><br/>
Supplies - This is the most important resource that you will use.
Supplies are gained in periodic supply drops and through the accomplishment of objectives.
Most extra supplies gained through objectives will be diverted on the next available supply drop.
the exception being clearing an insurgent stronghold.
Supplies are used to aquire weapons, munitions, accessories, and vehicles.
Use this resource wisely.
"
	]
];
player createDiaryRecord	
[
	"missionMechanics",
	[
"Basic Tenets (please read)",
"
- Secure volatile and destabalizing regions (persistent combat).<br/><br/>
- Interact with civilians (intel and side missions).<br/><br/>
- seek out insurgent hideouts and strongholds (persistent combat).<br/><br/>
- defend regions from incursions (defence combat).<br/><br/>
- setup FOB's (safe haven).<br/><br/>
- deliver aid to civilians (humanitarian).
"
	]
];