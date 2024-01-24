// The UID of the mission makers (to access the admin menu and debug console during the mission)
#define UID1 "76561198297856937"
#define UID2 "76561198308736646"

// VCOM AI
//#define VCOMAI  // Comment out this line if you don't want to load VCOM AI

// Mission parameters
class Header {
    gameType =  Coop;  // Game type (use 'Coop' for PvE and 'TDM' for TvT)
    minPlayers =  1;  // Minimum number of players
    maxPlayers = 12;  // Maximum number of players
};

// Mission selection screen
briefingName = "[CO-12] operation_name";  // Mission name on the mission selection screen (use [CO-XX] or [TVT-XX] where XX is the max. player number)
//overviewText = ""Blufor engage Opfor in Chernarus. // Assets: 1x Puma ifv (callsign: HAMMER) // Respawns: unlimited, Wave // Reinsert: RP // Arsenal mode: Alt Loadouts // Time limit: disabled // JIP: enabled"";  // Mission info on the mission selection screen (e.g. mission assets, factions, time limit etc.)


// Loading screen settings
onLoadName = "operation_name";  // Name of the operation on the loading screen (you can drop the [CO-XX] part here)
onLoadMission = "mission_description";  // Mission description on the loading screen
author = "mission_maker";  // Author of the mission
loadScreen = "mission_framework\config\img\loading_screen.jpg";  // Loading screen image (use 2:1 image ratio)
