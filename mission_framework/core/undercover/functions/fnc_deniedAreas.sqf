#include "script_component.hpp"

/*
    Author:
        Lightning

    Description:
        Checks a area for player activity, If they are in it, They will be compromised.

    Arguments:
        0: OBJECT,STRING,LOCATION - Denaied area boundries

    Example:
        [deniedArea_01] call MF_undercover_fnc_deniedAreas;

    Returns:
        NONE
*/

params ["_area"];

if (player getVariable ["TFI_var_opr_isUnderCover", false]) then {
    [player, false] remoteExecCall ["setCaptive"];
    player setCaptive false;
    player setVariable ["TFI_var_opr_isUnderCover", false];
    ["IntelAdded", ["You Are Entering a Denied Area"]] call BIS_fnc_showNotification;
    [
        {
            params ["_area"];
            !(player inArea _area)
        },
        {
            [player, true] remoteExecCall ["setCaptive"];
            player setCaptive true;
            player setVariable ["TFI_var_opr_isUnderCover", true];
            ["IntelAdded", ["You Are Exiting The Denied Area"]] call BIS_fnc_showNotification;
        },
        [_area]
    ] call CBA_fnc_waitUntilAndExecute;
};
