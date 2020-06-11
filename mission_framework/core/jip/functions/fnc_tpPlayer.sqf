#include "script_component.hpp"

/*
    Author:
        Diwako (modified by Malbryn)

    Description:
        Teleport the player back to their squad

    Arguments:
        -

    Example:
        call MF_jip_fnc_tpPlayer

    Returns:
        void
*/

private ["_target", "_vicSpot"];

_target = call FUNC(chooseTarget);
_vicSpot = [_target] call FUNC(checkEmptySeat);

// Check the distance from the squad
if (((call CFUNC(players)) - [player]) findif {_x distance2D player < 50} != -1) exitWith {
    ["Warning", ["JIP TP aborted. You're too close to one of your squad members!"]] call BFUNC(showNotification);
};

// Check if there are other people in the squad
if !(count units group player > 1) exitWith {
    ["Warning", ["JIP TP aborted. You're the only one in the squad!"]] call BFUNC(showNotification);
};

// Check if there's anyone alive in the squad
if !({alive _x} count units group player > 1) exitWith {
    ["Warning", ["JIP TP aborted. No one is alive in your squad!"]] call BFUNC(showNotification);
};

// Teleport section
cutText ["You are being teleported back to your squad", "BLACK OUT", 2, true];

[{
    params ["_target", "_vicSpot"];

    if (_vicSpot) then {
        player moveInAny vehicle _target;
    } else {
        player setPosATL (_target getPos [3, getDir _target - 180]);
    };

    cutText ["", "BLACK IN", 2, true];

    // Remove JIP teleport action after the player was teleported
    GVAR(jipAvailable) = false;
    [player, 1, ["ACE_SelfActions", "Teleport to squad"]] call AFUNC(interact_menu,removeActionFromObject);
}, [_target, _vicSpot], 3] call CFUNC(waitAndExecute);