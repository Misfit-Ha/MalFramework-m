#include "..\core\main\script_macros.hpp"  // DO NOT REMOVE

/* -------------------------------- MISSION PARAMETERS -------------------------------- */

// Debug mode
GVARMAIN(debugMode) = false;  // Debug mode for mission/framework development (turn it off before deploying the mission)

// Mission type
GVARMAIN(isTvT) = false;  // If the mission is a TvT mission

// End condition - Time limit
GVARMAIN(moduleTimeLimit) = false;  // Coop & TvT
EGVAR(end_conditions,timeLimit) = 120 MINUTES;  // Mission time limit in seconds
EGVAR(end_conditions,favouredSide) = 0;  // TvT: Favoured side (0: None, 1: BLUFOR, 2: REDFOR, 3: Side with more players)
EGVAR(end_conditions,notificationTime) = 10 MINUTES;  // Send a notification to each player X seconds before the time limit (-1: disabled)
EGVAR(end_conditions,timeLimitCheckEnabled) = true;  // Enable time limit check for players
EGVAR(end_conditions,stagingEnabled) = false;  // Coop: Don't start the mission timer until the players leave the staging area
EGVAR(end_conditions,stagingAreaMarker) = "mrk_staging";  // Coop: Marker for the staging area

// End condition - Player casualty limit
GVARMAIN(modulePlayerCasualties) = false;  // Coop & TvT
EGVAR(end_conditions,playerCasLimit) = 75;  // Coop: Percentage of the max. allowed player casualty
EGVAR(end_conditions,bluforCasLimit) = 75;  // TvT: Percentage of the max. allowed player casualty for the BLUFOR side
EGVAR(end_conditions,redforCasLimit) = 75;  // TvT: Percentage of the max. allowed player casualty for the REDFOR side

// End condition - Civilian casualty limit
GVARMAIN(moduleCivilianCasualties) = false;  // Coop & TvT
EGVAR(end_conditions,civilianCasLimit) = 50;  // Percentage of the max. allowed civilian casualty

// End condition - Side respawn tickets
GVARMAIN(moduleRespawnTickets) = false;  // TvT
GVARMAIN(respawnTicketsBlufor) = 2;  // Respawn tickets for BLUFOR (-1: disabled)
GVARMAIN(respawnTicketsRedfor) = -1;  // Respawn tickets for REDFOR (-1: disabled)

// End condition - Task limit
GVARMAIN(moduleTaskLimit) = false;  // Coop
EGVAR(end_conditions,taskLimit) = 2;  // Minimum number of completed tasks

// End condition - Extraction
GVARMAIN(moduleExtraction) = false;  // Coop
EGVAR(end_conditions,extMarker) = "mrk_ext";  // Name of the extraction marker
EGVAR(end_conditions,extTask) = "";  // Extraction task that will be automatically completed (empty string disables this functionality)
EGVAR(end_conditions,playerThreshold) = 50;  // Percentage of the alive players that have to be in the extraction zone

// Task threshold (used by Time limit, Extraction and Tactical Withdrawal)
GVARMAIN(taskThreshold) = 66;  // Percentage of the tasks that have to be completed

// Gear
GVARMAIN(moduleGear) = true;  // Coop & TvT
EGVAR(gear,useArsenalWhitelist) = false;  // Allows the creation of arsenal objects with custom whitelist based on the player's role
EGVAR(gear,saveGearInArsenal) = true;  // Should the player's gear be saved (and applied after respawn) after the arsenal is closed
EGVAR(gear,removeDefaultGear) = false;  // Should the default gear (that the unit has in the editor) be removed if pre-defined gear is disabled
EGVAR(gear,useLoadouts) = false;  // Apply the pre-defined gear (defined in config\gear\)
EGVAR(gear,enableAlternativeLoadouts) = false;  // Enable alternative loadouts
EGVAR(gear,loadoutHash) = [  // Key-value pairs (STRING - ARRAY OF STRINGS) for the alternative loadouts (defined in config\gear\)
    ["SL", ["SL-2", "SL-3"]],
    ["AR", ["AR-2"]]
];

// Respawn
GVARMAIN(moduleRespawn) = true;  // Coop & TvT
EGVAR(respawn,timer) = 30;  // Respawn timer in seconds
EGVAR(respawn,tickets) = 3;  // Sets individual respawn tickets. 3 tickets = 3 lives total (initial life + 2 respawns). Use -1 to disable tickets.
EGVAR(respawn,waveRespawn) = OFF;  // Players will respawn in waves (OFF, AUTO: run automatically, MANUAL: requested by CO)
EGVAR(respawn,availableWaves) = 1;  // Number of available respawn waves (MANUAL respawn waves only)
EGVAR(respawn,removePlayerCorpses) = true;  // Remove the players' corpses upon respawn

// View distances
GVARMAIN(playerViewDistance) = 1500;  // Player view distance
GVARMAIN(serverViewDistance) = 1500;  // Server view distance (= AI view distance)

// Time acceleration
GVARMAIN(timeAcceleration) = 1;  // Value between 0.1 and 120

// ACE spectator
GVARMAIN(useACESpectator) = true;  // Use the ACE spectator camera instead of the vanilla one (for dead players)

// AI skills
GVARMAIN(moduleAISkill) = true;
EGVAR(ai_skills,skillSet) = [
    1,  // General (Higher = Better) all values are between 0 and 1
    1,  // Commanding (Higher = Better)
    1,  // Courage (Higher = Better)
    1,  // Aiming Accuracy (Higher = Better)
    1,  // Aiming Shake (Higher = Less)
    1,  // Aiming Speed (Higher = Faster)
    1,  // Reload Speed (Higher = Faster)
    1,  // Spotting Distance (Higher = Further)
    1   // Spotting Time (Higher = Faster)
];


/* --------------------------------- OPTIONAL MODULES --------------------------------- */


// AI Spawner
GVARMAIN(moduleAISpawner) = false;  // Coop & TvT


// Ambient fly-by
GVARMAIN(moduleFlyby) = false;  // Coop


// AO limit
GVARMAIN(moduleAOLimit) = false;  // Coop & TvT
EGVAR(ao_limit,timerLand) = 10;  // Timer for any land based vehicle/unit (-1: disabled)
EGVAR(ao_limit,timerAir) = -1;  // Timer for any air vehicle (-1: disabled)
EGVAR(ao_limit,aoMarkerAll) = "mrk_aoLimitAll";  // AO limit marker for every player
EGVAR(ao_limit,aoMarkerBlufor) = "mrk_aoLimitBlufor";  // AO limit marker for BLUFOR players
EGVAR(ao_limit,aoMarkerRedfor) = "mrk_aoLimitRedfor";  // AO limit marker for REDFOR players


// Briefing
GVARMAIN(moduleBriefing) = false;  // Coop & TvT


// CBRN
GVARMAIN(moduleCBRN) = false;  // Coop & TvT
cbrn_maxDamage = 100; // how much damage before death, 50% starts internal contamination
cbrn_backpacks = ["B_SCBA_01_F", "B_CombinationUnitRespirator_01_F", "M2_Flamethrower_Balloons_Pipe"]; // backpacks considered oxygen tanks
cbrn_conditioning = ["B_CombinationUnitRespirator_01_F"]; // backpacks considered air conditioners; help reduce fogging
cbrn_suits = ["U_C_CBRN_Suit_01_Blue_F", "U_B_CBRN_Suit_01_MTP_F", "U_B_CBRN_Suit_01_Tropic_F", "U_C_CBRN_Suit_01_White_F", "U_B_CBRN_Suit_01_Wdl_F", "U_I_CBRN_Suit_01_AAF_F", "U_I_E_CBRN_Suit_01_EAF_F", "U_O_Wetsuit", "U_B_Wetsuit", "U_I_Wetsuit", "PLP_U_I_Wetsuit_inv", "PLP_U_O_Wetsuit_inv", "PLP_U_B_Wetsuit_inv"]; // uniforms considered CBRN suits
cbrn_masks = ["G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_sand_F", "G_AirPurifyingRespirator_01_F", "G_RegulatorMask_F", "XOF_G_Balaclava3_SND", "XOF_G_Balaclava3", "XOF_G_Balaclava3_GRY", "XOF_G_Balaclava3_GRN", "XOF_G_Balaclava3_OLI", "XOF_G_Balaclava3_WHT", "XOF_G_GP9"]; // goggles considered gas masks (filters included)
cbrn_threatMeteritem = "ACE_HuntIR_monitor"; // Item that is considered a threat meter
cbrn_threatGeiger = "ACE_HuntIR_monitor"; // Item that is considered a geiger counter
cbrn_maxOxygenTime = 60 * 30; // after how much time does the air run out in an oxygen tank (in seconds!)
cbrn_allowPassiveDamage = true; // should auto damage occur after 50% damage threshold has been reached?
cbrn_deconWaterTime = 60 * 2; // time in seconds how much water a decon shower has, in seconds
cbrn_healingRate = 0; // healing rate for each second, does nothing if 0 or below, or player while player is experiencing passive contamination
cbrn_foggingEnabled = true; // enables or disables fogging entirely
cbrn_fogStartTime = 60 * 5; // time after which the gas mask starts fogging up; default 5 mins
cbrn_fogMaxTime = 60 * 10; // maximum time after which the gas mask is fully fogged up; default 10 mins
cbrn_fogAccumulationCoef = 0.5; // fog accumulation coefficient; used when unit wears a backpack considered an air conditioner; lower means fogging accumulates slower, 0 stops it entirely; default 0.5
cbrn_fogFadeCoef = 5; // fog fading coefficient; is used in multiplication with the frame-time delta in fogPFH when the gasmask is taken off; higher means accumulated fog will fade faster; default 5
cbrn_fogMaxAlpha = 1; // max fog visibillity; value from 0 to 1, decimals allowed. Sets the maximum visibility of the fog layer; default 1
cbrn_fogFatigueEnabled = true; // whether or not fogging takes Fatigue into account
cbrn_fogFatigueCoef = 1; // Fatigue coefficient; is used in multiplication with the ACE fatigue value; higher means quicker fogging if unit has any fatigue
cbrn_vehicles = [ /*["vroomvroom", 5], ["B_Quadbike_01_F", 1]*/ ]; // configure vehicles to be CBRN proof, list of arrays, first entry vehicle class or 3den editor object name as string, second entry amount of proofing. The amount is the same measurement as zone threat levels
cbrn_kat_enabled = false; // Configuration for KAT - Advanced Medical


// Countdown
GVARMAIN(moduleCountdown) = false;  // Coop & TvT


// Custom channel
GVARMAIN(moduleCustomChannel) = false;  // Coop & TvT
EGVAR(custom_channel,channelName) = "JTAC channel";  // Name of the channel
EGVAR(custom_channel,channelColour) = [0.8, 0, 0.5, 1];  // Colour of the channel (RGBA format, default: FK pink)


// Hostage
GVARMAIN(moduleHostage) = false;  // Coop & TvT


// IED
GVARMAIN(moduleIED) = false;  // Coop


// Intel
GVARMAIN(moduleIntel) = false;  // Coop


// Intro
GVARMAIN(moduleIntro) = false;  // Coop & TvT
EGVAR(intro,blackScreen) = false;  // Black fade screen at start
EGVAR(intro,freeze) = false;  // Freeze players at start
EGVAR(intro,unitInfo) = true;  // Show player name, rank and squad name before intro text
EGVAR(intro,missionInfo) = true;  // Show mission intro text
EGVAR(intro,delay) = 15;  // Delay after loading in
EGVAR(intro,font) = "PuristaLight";  // Text font, need to be defined in arma
EGVAR(intro,line1) = "TEST TITLE";  // Line 1, Title e.g. (Operation Thunderstorm)
EGVAR(intro,line2) = "TEST Date";  // Line 2, Date e.g. (26 JUL 2035 1500)
EGVAR(intro,line3) = "TEST Faction";  // Line 3, Faction e.g. (CSAT Paratroopes)
EGVAR(intro,line4) = "TEST Description";  // Line 4, Description e.g. (ETA T minus 3 minutes)
EGVAR(intro,line5) = "TEST Location";  // Line 5, Location e.g. (Greece - Altis Island)


// JIP
GVARMAIN(moduleJIP) = true;  // Coop & TvT
EGVAR(jip,jipTimer) = 10 MINUTES;  // For how long the TP is available after joining the mission


// Killcam
GVARMAIN(moduleKillcam) = false;  // Coop & TvT


// Logistics
GVARMAIN(moduleLogistics) = false;  // Coop & TvT


// LOS Tool
GVARMAIN(moduleLOSTool) = false;  // Coop & TvT


// Map cover
GVARMAIN(moduleMapCover) = false;  // Coop & TvT
EGVAR(map_cover,aoMarker) = "mrk_ao";  // Name of the AO marker
EGVAR(map_cover,colour) = "Color4_FD_F";  // Colour of the covered area

// Mark custom objects
GVARMAIN(moduleMarkObjects) = false;  // Coop & TvT

// Marker side
GVARMAIN(moduleMarkerSide) = false;  // TvT
EGVAR(marker_side,markersBlufor) = ["mrk_blufor"];  // BLUFOR markers
EGVAR(marker_side,markersRedfor) = ["mrk_redfor"];  // REDFOR markers


// Mortar fire
GVARMAIN(moduleMortar) = false;  // Coop


// ORBAT
GVARMAIN(moduleOrbat) = true;  // Coop & TvT


// Reinsertion
GVARMAIN(moduleHAB) = true;  // Coop
GVARMAIN(moduleHALO) = false;  // Coop & TvT
GVARMAIN(moduleMRV) = false;  // Coop & TvT
GVARMAIN(moduleRP) = true;  // Coop & TvT
GVARMAIN(moduleTP) = false;  // Coop & TvT
EGVAR(reinsertion,RPPickUp) = false;  // If the player is required to pick up the previous RP
EGVAR(reinsertion,markRP) = true;  // Mark the RP location on map
EGVAR(reinsertion,RPObject) = "Land_TentA_F";  // Object used as the squad rally point
EGVAR(reinsertion,markHAB) = true;  // Mark the HAB location on map
EGVAR(reinsertion,HABObject) = "Land_HBarrierTower_F";  // Object used as the platoon HAB
EGVAR(reinsertion,allowTPFromHAB) = true;  // If TP to squad RP is allowed from the platoon HAB
EGVAR(reinsertion,TPPoles) = ["MF_tpPole_1"];  // Teleport pole object(s)


// Retreat
GVARMAIN(moduleRetreat) = false;  // Coop & TvT


// Safety start
GVARMAIN(moduleSafetyStart) = false;  // Coop & TvT


// Setup timer
GVARMAIN(moduleSetupTimer) = false;  // Coop & TvT
EGVAR(setup_timer,markerBlufor) = "mrk_setupBlufor";  // Setup area for the BLUFOR side
EGVAR(setup_timer,timerBlufor) = 60;  // Setup timer for the BLUFOR side
EGVAR(setup_timer,markerRedfor) = "mrk_setupRedfor";  // Setup area for the REDFOR side
EGVAR(setup_timer,timerRedfor) = 60;  // Setup timer for the REDFOR side


// Snowfall
GVARMAIN(moduleSnowfall) = false;  // Coop & TvT
EGVAR(snowfall,maxDensity) = 50;  // Intensity of the snowfall


// Supply drop
GVARMAIN(moduleSupplyDrop) = false;  // Coop
EGVAR(supply_drop,supplyDropPlane) = "B_T_VTOL_01_vehicle_F";  // Plane or helicopter used for the supply drop
EGVAR(supply_drop,useFlare) = false;  // Use flares to mark the crate instead of smokes (night ops)


// TFAR
GVARMAIN(moduleTFAR) = false;  // Coop & TvT


// Unit tracking
GVARMAIN(moduleUnitTracking) = false;  // Coop & TvT


// Vehicle respawn
GVARMAIN(moduleVehicleRespawn) = false;  // Coop & TvT
