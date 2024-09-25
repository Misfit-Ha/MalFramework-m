#include "script_component.hpp"

/*
    Author:
        Misfit

    Description:
        Respawn every dead player without any restriction.

    Arguments:
        -

    Example:
        call MF_respawn_fnc_manualRespawsn

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _deadPlayers = allPlayers select {!alive _x};
private _count = 0;

_count = count _deadPlayers;

if (_count == 0) exitWith {
    [["There are no dead players or dead players with respawn tickets"], 2, ace_player, 12] call AFUNC(common,displayTextStructured);
};

[["Reinforcements:<br/>%1 player(s)", _count], 2, ace_player, 12] call AFUNC(common,displayTextStructured);

[QGVAR(respawnPlayer), [], _deadPlayers] call CFUNC(targetEvent);