#include "script_component.hpp"

/*
    Author:
        Lightning

    Description:
        Changes player captive state based on their equipped weapons

    Arguments:
        NONE

    Example:
        call MF_undercover_fnc_checkGuns

    Returns:
        BOOLEAN
*/

if !(hasInterface) exitWith {false};

private ["_loadout"];
_loadout = getUnitLoadout player;

if (!isNull (findDisplay 602)) then {
    if ( ((_loadout#0) isEqualTo []) && ((_loadout#1) isEqualTo []) && ((_loadout#2) isEqualTo []) ) then {
        if  ( !(player getVariable ["TFI_var_opr_isUnderCover", false]) ) then {
            [player, true] remoteExecCall ["setCaptive"];
            player setCaptive true;
            player setVariable ["TFI_var_opr_isUnderCover", true];
            ["You Went Low Profile", 1.5] call ace_common_fnc_displayTextStructured;
        };
    } else {
        if  ( (player getVariable ["TFI_var_opr_isUnderCover", false]) ) then {
            [player, false] remoteExecCall ["setCaptive"];
            player setCaptive false;
            player setVariable ["TFI_var_opr_isUnderCover", false];
           ["You Went High Profile", 1.5] call ace_common_fnc_displayTextStructured;
        };
    };
};

true
