#define AuthUID "xxxxxxxxxxxxxxxxx" // Add your UID here, run "getPlayerUID player" in a multiplayer session to get the code (to access the admin menu and debug console during the mission)
#define OprName "Example Name"  // Mission name
#define OprAuth "Example Name"  // Author name
#define OprInfo "Example Description"  // Short description of The Mission (e.g. NATO assualt to take back the main airport.)
#define OprLoad "mission_framework\config\load.jpg"  // Loading screen image (use 2:1 image ratio, Can be .paa or .jpg)


// Mission parameters
class Header {
    gameType =  TFI_OP;  // Game type
    minPlayers =  1;  // Minimum number of players
    maxPlayers = 32;  // Maximum number of players
};


// VCOM AI
//#define VCOMAI  // Comment in this line if you want to load VCOM AI


/* Summary Text, Put the text below to (Attributes > Multiplayer > Summary) with details about your mission

Faction: xxxx // Assets: 4x xxxx - 1x xxxx - and so on // Respawns: AUTO || Manual, How many Lives // Reinsert: HAB ||RP || PARA || VEHC || NONE // Arsenal: Prebuilt || Specify restrictions, Loot Allowed || Loot If Necessary || No Looting // Time limit: Time || NONE

*/