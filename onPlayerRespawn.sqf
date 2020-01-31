// Screen effects
cutText  ["", "BLACK FADED", 5, true];
uiSleep 1;
cutText  ["", "BLACK IN", 5, true];

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 3;

// Close the spectator mode
["Terminate"] call BIS_fnc_EGSpectator;

// Exit the spectator voice channel
[player, false] call TFAR_fnc_forceSpectator;

// Load the player's loadout
private _loadout = player getVariable "MF_var_current_loadout";
player setUnitLoadout _loadout;

// Remaining respawn tickets hint
if (MF_var_respawn_tickets == -1) exitWith {};
[format ["Respawns available:<br/>%1", MF_var_respawn_tickets], 2, ace_player, 12] call ace_common_fnc_displayTextStructured;

// Start the snow script if enabled
if (MF_var_snowfall_enabled) then {
  [] spawn MF_fnc_startSnowfall;
};