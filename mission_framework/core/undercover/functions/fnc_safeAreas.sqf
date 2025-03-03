#include "script_component.hpp"

/*
    Author:
        Lightning

    Description:
        Checks a area for player activity, If they are in it, They will be undercover.

    Arguments:
        0: OBJECT,STRING,LOCATION - Safe area boundries

    Example:
        [safeArea_01] call MF_undercover_fnc_safeAreas;

    Returns:
        NONE
*/

params ["_area"];

if ( !(player getVariable ["TFI_var_opr_inSafeArea", false]) ) then {
    [player, true] remoteExecCall ["setCaptive"];
    player setCaptive true;
    private _ehId = [
        "ace_firedPlayer",
        {
            ["ace_firedPlayer", player getVariable ["TFI_var_opr_safeAreaEH", -1]] call CBA_fnc_removeEventHandler;
            [player, false] remoteExecCall ["setCaptive"];
            player setCaptive false;
            player setVariable ["TFI_var_opr_isUnderCover", false];
            player setVariable ["TFI_var_opr_safeAreaEH", -1];
            ["You Went High Profile", 1.5] call ace_common_fnc_displayTextStructured;
        }
    ] call CBA_fnc_addEventHandler;
    player setVariable ["TFI_var_opr_isUnderCover", true];
    player setVariable ["TFI_var_opr_inSafeArea", true];
    player setVariable ["TFI_var_opr_safeAreaEH", _ehId];
    ["IntelAdded", ["You Are Entering a Safe Area, Using Any Weapon Will Compromise You"]] call BIS_fnc_showNotification;
    [
        {
            params ["_area"];
            !(player inArea _area)
        },
        {
            [player, false] remoteExecCall ["setCaptive"];
            player setCaptive false;
            player setVariable ["TFI_var_opr_isUnderCover", false];
            player setVariable ["TFI_var_opr_inSafeArea", false];
            player setVariable ["TFI_var_opr_safeAreaEH", -1];
            ["IntelAdded", ["You Are Exiting The Safe Area, You're HIGH Profile Now"]] call BIS_fnc_showNotification;
        },
        [_area]
    ] call CBA_fnc_waitUntilAndExecute;
};
