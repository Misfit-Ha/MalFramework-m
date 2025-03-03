#include "script_component.hpp"

/*
    Author:
        Lightning

    Description:
        Undercover detection for players

    Arguments:
        NONE

    Example:
        call MF_undercover_fnc_init

    Returns:
        NUMBER - The ID of the loadout change event handler.

*/

if !(hasInterface) exitWith {false};

// Main EH for player weapon changes
["loadout", {call FUNC(checkGuns);}] call CBA_fnc_addPlayerEventHandler;
// Remove player concelment if throw a frag or plant a explosive
[
	"ace_firedPlayer",
	{
		if ((_this#1) isEqualTo "Throw") then {
            ACE_player setVariable ["TFI_var_opr_isUnderCover", false];
            [ACE_player, false] remoteExecCall ["setCaptive"];
            ACE_player setCaptive false;
            ["You Went High Profile", 1.5] call ace_common_fnc_displayTextStructured;
        };
	}
] call CBA_fnc_addEventHandler;
[
	"ace_explosives_place",
	{
		ACE_player setVariable ["TFI_var_opr_isUnderCover", false];
        [ACE_player, false] remoteExecCall ["setCaptive"];
        ACE_player setCaptive false;
        ["You Went High Profile", 1.5] call ace_common_fnc_displayTextStructured;
	}
] call CBA_fnc_addEventHandler;


// Run a frame handler to check players position considering denied areas
if (GVAR(specialAreas)) then {
    [
        {
            params ["_arg","_handle"];
            if (player getVariable ["TFI_var_opr_isUnderCover", false]) then {
                MF_undercover_deniedAreasArray apply {
                    if (player inArea _x) then {
                        [_x] call MF_undercover_fnc_deniedAreas;
                    };
                };
            } else {
                MF_undercover_safeAreasArray apply {
                    if (player inArea _x) then {
                        [_x] call MF_undercover_fnc_safeAreas;
                    };
                };
            };
        }, 1, []
    ] call CBA_fnc_addPerFrameHandler;
};
