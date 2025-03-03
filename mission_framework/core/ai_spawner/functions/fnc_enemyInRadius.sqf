#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Detects if enemy is within a given radius (planes excluded).

    Arguments:
        0: ARRAY - Position to check
        1: SIDE - Friendly side
        2: SCALAR - Radius in meters

    Example:
        [[0, 0, 0], west, 150] call MF_ai_spawner_fnc_enemyInRadius

    Returns:
        BOOLEAN
*/

if !(isServer) exitWith {};

params ["_position", "_friendlySide", "_radius"];
private ["_returnValue", "_nearestUnits", "_enemySides"];
_returnValue = false;
_nearestUnits = _position nearEntities [["CAManBase", "LandVehicle", "Helicopter", "Ship"], _radius];
_enemySides = [_friendlySide] call BIS_fnc_enemySides;
_nearestUnits apply {
    if ((side _x) in _enemySides) exitwith {
        _returnValue = true;
    };
};

_returnValue
