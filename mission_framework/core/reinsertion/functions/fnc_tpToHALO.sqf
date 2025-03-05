#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Teleports the player to their death location using HALO drop.

    Arguments:
        -

    Example:
        call MF_reinsertion_fnc_tpToHALO

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _result = ["Reinsertion - Paradrop"] call FUNC(confirmTP);

if !(_result) exitWith {};

private _pos = (GETVAR(player,GVAR(deathPos),""));

if (_pos isEqualTo "") exitWith {
    ["Warning", ["Target destination does not exist!"]] call BFUNC(showNotification);
};

"MF_blackout" cutText ["You are being paradropped into the AO", "BLACK OUT", 0.5, true];

[{
    // Get a random position in a radius
    private _randomPos = [[[_this, 250]], []] call BFUNC(randomPos);

    _randomPos set [2, 1500];
    player setPos _randomPos;
    [player] call FUNC(addParachute);

    [{
        "MF_blackout" cutText ["", "BLACK IN", 0.5, true];
    }, [], 1] call CFUNC(waitAndExecute);
}, _pos, 2] call CFUNC(waitAndExecute);
