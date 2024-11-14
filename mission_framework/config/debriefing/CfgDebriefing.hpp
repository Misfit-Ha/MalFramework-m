/* ----------------------------------- COOP ENDINGS ----------------------------------- */

// Generic - Major Success
class MissionSuccess {
    title = "Mission Success";              									 // Closing shot - Main title
    subtitle = OprName;          												// Closing shot - Short description
    description = "MISSION COMPLETE!";    								       // Debriefing - Summary of the mission
    pictureBackground = OprLoad;                  							  // Debriefing - 2:1 picture as background
    picture = "mil_end";                    								 // Closing shot - 1:1 icon in the middle of the screen
    pictureColor[] = {0, 0.8, 0, 1};       								    // Closing shot - Icon colour
};

// Generic - Minor success
class MinorSuccess {
    title = "Minor Success";
    subtitle = OprName;
    description = "We Won! Kinda...";
    pictureBackground = OprLoad;
    picture = "mil_flag";
    pictureColor[] = {0, 0.8, 0, 1};
};

// Generic - Minor fail
class MinorFail {
    title = "Minor Defeat";
    subtitle = OprName;
    description = "Better Luck Next Time!";
    pictureBackground = OprLoad;
    picture = "mil_flag";
    pictureColor[] = {0.9, 0, 0, 1};
};

// Generic - Major Fail
class MissionFail {
    title = "Mission Failed";
    subtitle = OprName;
    description = "Mission Failed Successfully!";
    pictureBackground = OprLoad;
    picture = "KIA";
    pictureColor[] = {0.6, 0.1, 0.2, 1};
};

// Time limit - Minor success
class TimeLimitMinorSuccess {
    title = "Minor Success";
    subtitle = OprName;
    description = "Time Limit Reached!";
    pictureBackground = OprLoad;
    picture = "mil_flag";
    pictureColor[] = {0, 0.8, 0, 1};
};

// Time limit - Minor fail
class TimeLimitMinorFail {
    title = "Minor Defeat";
    subtitle = OprName;
    description = "Time Limit Reached!";
    pictureBackground = OprLoad;
    picture = "mil_flag";
    pictureColor[] = {0.9, 0, 0, 1};
};

// Player casualty
class PlayerCasLimit {
    title = "Mission Failed";
    subtitle = OprName;
    description = "Your unit suffered serious casualties.";
    pictureBackground = OprLoad;
    picture = "KIA";
    pictureColor[] = {0.6, 0.1, 0.2, 1};
};

// Civilian casualty
class CivCasLimit {
    title = "Mission Failed";
    subtitle = OprName;
    description = "The number of civilian casualties were too high.";
    pictureBackground = OprLoad;
    picture = "KIA";
    pictureColor[] = {0.6, 0.1, 0.2, 1};
};

// Withdrawal - Minor success
class WithdrawalMinorSuccess {
    title = "Minor Success";
    subtitle = OprName;
    description = "The NCO called tactical withdrawal ending the mission earlier. Consider this a minor success.";
    pictureBackground = OprLoad;
    picture = "mil_flag";
    pictureColor[] = {0, 0.8, 0, 1};
};

// Withdrawal - Minor fail
class WithdrawalMinorFail {
    title = "Minor Defeat";
    subtitle = OprName;
    description = "The NCO called tactical withdrawal ending the mission earlier. Consider this a minor defeat.";
    pictureBackground = OprLoad;
    picture = "mil_flag";
    pictureColor[] = {0.9, 0, 0, 1};
};


/* ----------------------------------- TvT ENDINGS ----------------------------------- */

// Generic success
class BluforWin {
    title = "blufor_faction Win";
    subtitle = OprName;
    description = "blufor_faction defeated redfor_faction";
    pictureBackground = OprLoad;
    picture = "b_unknown";
    pictureColor[] = {0, 0.3, 0.6, 1};
};

// Generic fail
class RedforWin {
    title = "redfor_faction Win";
    subtitle = OprName;
    description = "redfor_faction defeated blufor_faction";
    pictureBackground = OprLoad;
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};

// Time limit - Blufor win
class TimeLimitBlufor {
    title = "blufor_faction Win";
    subtitle = OprName;
    description = "redfor_faction ran out of time. blufor_faction win.";
    pictureBackground = OprLoad;
    picture = "b_unknown";
    pictureColor[] = {0, 0.3, 0.6, 1};
};

// Time limit - Redfor win
class TimeLimitRedfor {
    title = "redfor_faction Win";
    subtitle = OprName;
    description = "blufor_faction ran out of time. redfor_faction win.";
    pictureBackground = OprLoad;
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};

// Time limit - Draw
class TimeLimitDraw {
    title = "Draw";
    subtitle = OprName;
    description = "Time's up. Both sides have the same amount of players. It's a draw.";
    pictureBackground = OprLoad;
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};

// Player casualty - Blufor win
class PlayerCasLimitBlufor {
    title = "blufor_faction Win";
    subtitle = OprName;
    description = "redfor_faction suffered serious casualties. blufor_faction win.";
    pictureBackground = OprLoad;
    picture = "b_unknown";
    pictureColor[] = {0, 0.3, 0.6, 1};
};

// Player casualty - Redfor win
class PlayerCasLimitRedfor {
    title = "redfor_faction Win";
    subtitle = OprName;
    description = "blufor_faction suffered serious casualties. redfor_faction win.";
    pictureBackground = OprLoad;
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};

// Civilian casualty - Blufor win
class CivCasLimitBlufor {
    title = "blufor_faction Win";
    subtitle = OprName;
    description = "redfor_faction reached the civilian casualty limit. blufor_faction win.";
    pictureBackground = OprLoad;
    picture = "b_unknown";
    pictureColor[] = {0, 0.3, 0.6, 1};
};

// Civilian casualty - Redfor win
class CivCasLimitRedfor {
    title = "redfor_faction Win";
    subtitle = OprName;
    description = "blufor_faction reached the civilian casualty limit. redfor_faction win.";
    pictureBackground = OprLoad;
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};

// Withdrawal - Blufor win
class WithdrawalBlufor {
    title = "blufor_faction Win";
    subtitle = OprName;
    description = "redfor_faction called tactical withdrawal. blufor_faction win.";
    pictureBackground = OprLoad;
    picture = "b_unknown";
    pictureColor[] = {0, 0.3, 0.6, 1};
};

// Withdrawal - Redfor win
class WithdrawalRedfor {
    title = "redfor_faction Win";
    subtitle = OprName;
    description = "blufor_faction called tactical withdrawal. redfor_faction win.";
    pictureBackground = OprLoad;
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};

// Respawn tickets - Blufor win
class TicketsBlufor {
    title = "blufor_faction Win";
    subtitle = OprName;
    description = "redfor_faction ran out of manpower. blufor_faction win.";
    pictureBackground = OprLoad;
    picture = "b_unknown";
    pictureColor[] = {0, 0.3, 0.6, 1};
};

// Respawn tickets - Redfor win
class TicketsRedfor {
    title = "redfor_faction Win";
    subtitle = OprName;
    description = "blufor_faction ran out of manpower. redfor_faction win.";
    pictureBackground = OprLoad;
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};


/* --------------------------- GAME MASTER ENDING --------------------------- */

// Game master
class MissionTerminated {
    title = "Mission Terminated";
    subtitle = OprName;
    description = "Due to technical reasons the mission was terminated.";
    pictureBackground = OprLoad;
    picture = "mil_warning";
    pictureColor[] = {0.9, 0, 0, 1};
};


/* ----------------------------- CUSTOM ENDINGS ----------------------------- */
