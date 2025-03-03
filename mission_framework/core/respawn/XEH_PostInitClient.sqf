#include "script_component.hpp"


// Killed event
[player, "Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];

    [_unit, _killer, _instigator, _useEffects] call FUNC(eventKilled);
}] call CFUNC(addBISEventHandler);

// Respawn event
[player, "Respawn", {
    params ["_unit", "_corpse"];

    [_unit, _corpse] call FUNC(eventRespawned);
}] call CFUNC(addBISEventHandler);

// Respawn player
[QGVAR(respawnPlayer), {
    call FUNC(handleRespawn);
}] call CFUNC(addEventHandler);

if (GVAR(waveRespawn)==MANUAL) then {
    call FUNC(addCallRespawnMenu);
};

// Transfer respawn menu
[QGVAR(transferRespawnMenu), {
    call FUNC(addCallRespawnMenu);
}] call CFUNC(addEventHandler);

// Set the respawn tickets
[player, MF_respawn_tickets, true] remoteExecCall ["MF_respawn_fnc_setRespawnTickets", 2];
[
    {
        [format ["Respawns available:<br/>%1", (player getVariable ["MF_respawn_playerTickets", MF_respawn_tickets]) - 1], 2, player, 12] call ace_common_fnc_displaytextstructured;
    }, [], 3
] call CBA_fnc_waitAndExecute;

// Init player's status
SETVAR(player,GVAR(isDead),false);
