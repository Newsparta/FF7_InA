class FF7
{
	tag = "FF7";
	class functions
	{
		// ACE
		class aceHealLocal {file = "functions\FF7\Ace\fn_aceheallocal.sqf";};
		class aceMedicalStatus {file = "functions\FF7\Ace\fn_acemedicalstatus.sqf";};
		class disableAceInteractions {file = "functions\FF7\Ace\fn_disableaceinteractions.sqf";};
		class setupMedicalCrate {file = "functions\FF7\Ace\fn_setupmedicalcrate.sqf";};
		
		// GENERIC
		class extSerialize {file = "functions\FF7\Generic\extSerialize.sqf";};
		class pst_registerStaticContainer {file = "functions\FF7\Generic\fn_pst_registerStaticContainer.sqf";};
		class weatherMan {file = "functions\FF7\Generic\fn_weatherMan.sqf";};
		class tfarSetup {file = "functions\FF7\Generic\fn_tfarsetup.sqf";};
		class addGlobalAction {file = "functions\FF7\Generic\fn_addglobalaction.sqf";};
		class addToCurator {file = "functions\FF7\Generic\fn_addtocurator.sqf";};
		class getMissionRoot {file = "functions\FF7\Generic\fn_getmissionroot.sqf";};
		class getRoundDec {file = "functions\FF7\Generic\fn_getrounddec.sqf";};
		class briefingHint {file = "functions\FF7\Generic\fn_briefingHint.sqf";};
		class debugLog {file = "functions\FF7\Generic\fn_debuglog.sqf";};
		class formatAddAction {file = "functions\FF7\Generic\fn_formataddaction.sqf";};
		class formatText {file = "functions\FF7\Generic\fn_formatText.sqf";};
		class formatHint {file = "functions\FF7\Generic\fn_formatHint.sqf";};
		class globalHint {file = "functions\FF7\Generic\fn_globalhint.sqf";};
		class globalHintStruct {file = "functions\FF7\Generic\fn_globalhintstruct.sqf";};
		class globalNotify {file = "functions\FF7\Generic\fn_globalnotify.sqf";};
		class globalSideChat {file = "functions\FF7\Generic\fn_globalsidechat.sqf";};
		class remAllActions {file = "functions\FF7\Generic\fn_remallactions.sqf";};
	};
};

class Helpers
{
	tag = "Helpers";
	class Helpers
	{
		// Initialization
		class composeFactionConfigs {};
		class configToArrayByStructure {};

		// Config Array Getters
		class getAllFactionNames {};

		class getFactionByClassname {};
		class getFactionProperty {};
		class getElementByConfigName {};
		
		class getProperty_FromWeapon {};
		class getProperty_FromMagazine {};
		class getProperty_FromMiscItem {};
		class getProperty_FromLandVehicle {};
		class getProperty_FromAirVehicle {};
		class getProperty_FromWaterVehicle {};
		class getProperty_FromHelmet {};
		class getProperty_FromVest {};
		class getProperty_FromUniform {};
		class getProperty_FromLoadout {};
		
		class indexOfProp_Weapon {};
		class indexOfProp_Magazine {};
		class indexOfProp_MiscItem {};
		class indexOfProp_LandVehicle {};
		class indexOfProp_AirVehicle {};
		class indexOfProp_WaterVehicle {};
		class indexOfProp_Helmet {};
		class indexOfProp_Vest {};
		class indexOfProp_Uniform {};
		class indexOfProp_Loadout {};

		// Generic helpers
		class findSubItemBySubIndex {};
		class stringPadRight {};

		class debugPrettyDumpFactions {};
	};
};

class InA
{
	tag = "InA";
	class functions
	{
		// Actions
		class actionGarageRequisition {file = "functions\InA\Actions\fn_actionGarageRequisition.sqf";};
		class actionGearRequisition {file = "functions\InA\Actions\fn_actionGearRequisition.sqf";};
		class actionHangarRequisition {file = "functions\InA\Actions\fn_actionHangarRequisition.sqf";};
		class actionHangarShelter {file = "functions\InA\Actions\fn_actionHangarShelter.sqf";};
		class actionHangarTakeOut {file = "functions\InA\Actions\fn_actionHangarTakeOut.sqf";};
		class actionHQLookAtMap {file = "functions\InA\Actions\fn_actionHQLookAtMap.sqf";};
		class actionHQMenu {file = "functions\InA\Actions\fn_actionHQMenu.sqf";};
		class actionUniformEquip {file = "functions\InA\Actions\fn_actionUniformEquip.sqf";};

		// Dialog Functions
		class handleGearDialog {file = "functions\InA\Dialogs\fn_handleGearDialog.sqf";};
		class simpleListFromItemArray {file = "functions\InA\Dialogs\fn_simpleListFromItemArray.sqf";};
		
		// Reinforcements
		class reinforcementCall {file = "functions\InA\Reinforcements\fn_reinforcementCall.sqf";};
		class insSniperAttack {file = "functions\InA\Reinforcements\fn_insSniperAttack.sqf";};
		class genLightCarAttack {file = "functions\InA\Reinforcements\fn_genLightCarAttack.sqf";};
		class insLightCarAttack {file = "functions\InA\Reinforcements\fn_insLightCarAttack.sqf";};
		class insMediumCarAttack {file = "functions\InA\Reinforcements\fn_insMediumCarAttack.sqf";};
		class insMediumTruckTransport {file = "functions\InA\Reinforcements\fn_insMediumTruckTransport.sqf";};
		class insMediumHeliTransport {file = "functions\InA\Reinforcements\fn_insMediumHeliTransport.sqf";};
		class insLightInfantryAttack {file = "functions\InA\Reinforcements\fn_insLightInfantryAttack.sqf";};
		class insLightHeliAttack {file = "functions\InA\Reinforcements\fn_insLightHeliAttack.sqf";};
		class insLightBoatAttack {file = "functions\InA\Reinforcements\fn_insLightBoatAttack.sqf";};
		class insApcTransport {file = "functions\InA\Reinforcements\fn_insApcTransport.sqf";};
		class insIfvTransport {file = "functions\InA\Reinforcements\fn_insIfvTransport.sqf";};
		class insHeavyHeliTransport {file = "functions\InA\Reinforcements\fn_insHeavyHeliTransport.sqf";};
		class insTankAttack {file = "functions\InA\Reinforcements\fn_insTankAttack.sqf";};

		// Support
		class reqEvac {file = "functions\InA\Support\fn_reqEvac.sqf";};
		
		// Export
		class diversity {file = "defines\fn_diversity.sqf";};
		
		// Misc.
		class MGNest {file = "functions\InA\Misc\fn_MGNest.sqf";};
		class instabilityUpdate {file = "functions\InA\Misc\fn_instabilityUpdate.sqf";};
		class aidProtocol {file = "functions\InA\Misc\fn_aidProtocol.sqf";};
		class aidVehicle {file = "functions\InA\Misc\fn_aidVehicle.sqf";};
		class placeUXO {file = "functions\InA\Misc\fn_placeUXO.sqf";};
		class bluCustomize {file = "functions\InA\Misc\fn_bluCustomize.sqf";};
		class targetResponse {file = "functions\InA\Misc\fn_targetResponse.sqf";};
		class defaultDB {file = "functions\InA\Misc\fn_defaultDB.sqf";};
		class save {file = "functions\InA\Misc\fn_save.sqf";};
		class regionCheck {file = "functions\InA\Misc\fn_regionCheck.sqf";};
		class sitrep {file = "functions\InA\Misc\fn_sitrep.sqf";};
		class houseLocks {file = "functions\InA\Misc\fn_houseLocks.sqf";};
		class ambientModule {file = "functions\InA\Misc\fn_ambientModule.sqf";};
		class ambientEntrance {file = "functions\InA\Misc\fn_ambientEntrance.sqf";};
		class indGarrison {file = "functions\InA\Misc\fn_indGarrison.sqf";};
		class insCustomize {file = "functions\InA\Misc\fn_insCustomize.sqf";};
		class insSniper {file = "functions\InA\Misc\fn_insSniper.sqf";};
		class agentTakeCover {file = "functions\InA\Misc\fn_agentTakeCover.sqf";};
		class agentUrbanPatrol {file = "functions\InA\Misc\fn_agentUrbanPatrol.sqf";};
		class taskUrbanPatrol {file = "functions\InA\Misc\fn_taskUrbanPatrol.sqf";};
		class spotCheck {file = "functions\InA\Misc\fn_spotCheck.sqf";};
		class civKilled {file = "functions\InA\Misc\fn_civKilled.sqf";};
		class ambientCivilians {file = "functions\InA\Misc\fn_ambientCivilians.sqf";};
		class cleanup {file = "functions\InA\Misc\fn_cleanup.sqf";};
		class mortarStrike {file = "functions\InA\Misc\fn_mortarStrike.sqf";};
		
		// Interaction
		class aceActions {file = "functions\InA\Interact\fn_aceactions.sqf";};
		class unfoldMap {file = "functions\InA\Interact\fn_unfoldMap.sqf";};
		class assembleBoat {file = "functions\InA\Interact\fn_assembleBoat.sqf";};
		class disassembleBoat {file = "functions\InA\Interact\fn_disassembleBoat.sqf";};
		class unlockDoor {file = "functions\InA\Interact\fn_unlockDoor.sqf";};
		class civEngage {file = "functions\InA\Interact\fn_civEngage.sqf";};
		class civConverse {file = "functions\InA\Interact\fn_civConverse.sqf";};
		
		// Missions
		class intelUpdate {file = "missions\fn_intelUpdate.sqf";};
		
		// Objectives
		class HVTOfficer {file = "missions\Objective Bank\fn_HVTOfficer.sqf";};
		class weaponsCache {file = "missions\Objective Bank\fn_weaponsCache.sqf";};
		class fuelDepot {file = "missions\Objective Bank\fn_fuelDepot.sqf";};
		class commOutpost {file = "missions\Objective Bank\fn_commOutpost.sqf";};
		class AAAEmplacement {file = "missions\Objective Bank\fn_AAAEmplacement.sqf";};
		class Eliminate {file = "missions\Objective Bank\fn_Eliminate.sqf";};

		class majorActivity {file = "missions\fn_majorActivity.sqf";};
		class stronghold {file = "missions\fn_stronghold.sqf";};
		
		// Gear
		class WAD {file = "defines\Gear\fn_WAD.sqf";};
		class gearWipe {file = "defines\Gear\fn_gearWipe.sqf";};
		class baseWipe {file = "defines\Gear\fn_baseWipe.sqf";};
		
		// Structures
		class buildKit {file = "defines\Structures\fn_buildKit.sqf";};
		class fob {file = "defines\Structures\fn_fob.sqf";};
		class placeObj {file = "defines\Structures\fn_placeObj.sqf";};
		
		// Vehicles
		class vehicleService {file = "defines\Vehicles\Vehicle Service\fn_vehicleService.sqf";};
		class serviceCost {file = "defines\Vehicles\Vehicle Service\fn_serviceCost.sqf";};
		class vehicleDecommission {file = "defines\Vehicles\Vehicle Service\fn_vehicleDecommission.sqf";};
		class vehicleRepair {file = "defines\Vehicles\Vehicle Service\fn_vehicleRepair.sqf";};
		class vehicleRearm {file = "defines\Vehicles\Vehicle Service\fn_vehicleRearm.sqf";};
		class vehicleRefuel {file = "defines\Vehicles\Vehicle Service\fn_vehicleRefuel.sqf";};
		class magCostAdd {file = "defines\Vehicles\Vehicle Service\fn_magCostAdd.sqf";};
		class magCostSubtract {file = "defines\Vehicles\Vehicle Service\fn_magCostSubtract.sqf";};
	};
};