// The UID of the mission makers (to access the admin menu and debug console during the mission)
#define UID1 "76561198297856937"
#define UID2 "76561198308736646"
#define UID3 "xxxxxxxxxxxxxxxxx" // Add your UID here, run "getPlayerUID player" in a multiplayer session to get the code
#define OprName "Example Name"  // Mission name
#define OprAuth "Author name"  // Author name
#define OprInfo "Mission Description"  // Short description of The Mission (e.g. NATO assualt to take back the main airport.)
#define OprLoad "mission_framework\config\load.jpg"  // Loading screen image (use 2:1 image ratio, Can be .paa or .jpg)

// Mission parameters
class Header {
    gameType =  TFI_OP;  // Game type (use 'Coop' for PvE and 'TDM' for TvT)
    minPlayers =  1;  // Minimum number of players
    maxPlayers = 32;  // Maximum number of players
};

// VCOM AI
//#define VCOMAI  // Comment out this line if you don't want to load VCOM AI
