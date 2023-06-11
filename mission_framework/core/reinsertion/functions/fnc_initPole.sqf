#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds different options to an object ("TP pole") for reinsertion.
        Also adds the rally point menu to the squad leader(s).

    Arguments:
        -

    Example:
        call MF_reinsertion_fnc_initPole

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _tpPoles = [];
private _pole = objNull;

GVAR(TPPoles) apply {
    _pole = call compile _x;
    _tpPoles pushBack _pole;
};

if (_tpPoles isEqualTo []) exitWith {
    [COMPONENT_STR, "ERROR", "The teleport pole array is empty", true] call EFUNC(main,log);
};

_tpPoles apply {
    if (isNull _x) exitWith {
        [COMPONENT_STR, "ERROR", format ["Teleport pole object (%1) does not exist", _x], true] call EFUNC(main,log);
    };

    // Option #1 - Paradrop
    if (GVARMAIN(moduleHALO)) then {
        _x addAction ["Reinsertion - Paradrop", {
            [] spawn FUNC(tpToHALO);
        }, nil, 1, true, true, "", "true", 12];
    };

    // Option #2 - MRV
    if (GVARMAIN(moduleMRV)) then {
        _x addAction ["Reinsertion - MRV", {
            [] spawn FUNC(tpToMRV);
        }, nil, 1, true, true, "", "true", 12];
    };

    // Option #3 - Squad rally point
    if (GVARMAIN(moduleRP)) then {
        _x addAction ["Reinsertion - Squad Rally Point", {
            [] spawn FUNC(tpToRP);
        }, nil, 1, true, true, "", "true", 12];
    };

    // Option #4 - Platoon HAB
    if (GVARMAIN(moduleHAB)) then {
        _x addAction ["Reinsertion - Platoon HAB", {
            ["Reinsertion - Platoon HAB"] spawn FUNC(tpToHAB);
        }, nil, 1, true, true, "", "true", 12];
    };

    //Add a helper text on top of teleporter, not tested on server
    _targetPositionAGLTop = _x modelToWorldVisual [0, 0, 3.5];

    addMissionEventHandler ["Draw3D", {
        if (player distance _thisArgs <= 100 ) then {
            drawIcon3D ["\A3\modules_f\data\portraitModule_ca.paa", [1, 1, 1, 0.8],_thisArgs , 0.3 / (getResolution select 5), 0.3 / (getResolution select 5), 0, "Use mouse scroll here to teleport", true, 0.02 / (getResolution select 5), "PuristaBold", "center"];
        };
    }, _targetPositionAGLTop];
};

// Assigning the RP menu to the squad leaders
if (GVARMAIN(moduleRP) && GETVAR(player,EGVAR(player,isSL),false)) then {
    call FUNC(addRPMenu);
};

// Assigning the HAB menu to the COs
if (GVARMAIN(moduleHAB) && GETVAR(player,EGVAR(player,isCO),false)) then {
    call FUNC(addHABMenu);
};