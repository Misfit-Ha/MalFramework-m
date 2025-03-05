#include "script_component.hpp"

/*
    Author:
        Lightning

    Description:
        Runs the intro at mission start.

    Arguments:
        NONE

    Example:
        call MF_intro_fnc_runIntro

    Returns:
        NONE
*/


if (MF_intro_blackScreen) then { "TFI_hud_briefFade" cutText ["", "BLACK FADED", 999]; }; // Black screen in
if (MF_intro_freeze) then { player enableSimulation false; }; // Freeze unit lock
0 fadeSound 0;


[
	{ (!isNull findDisplay 46) },
	{
		clearRadio;
        MF_intro_delay fadeSound 1;
		[
			{
				clearRadio;
				if (MF_intro_freeze) then { player enableSimulation true; }; // Freeze unit unlock
                if (MF_intro_blackScreen) then { "TFI_hud_briefFade" cutText ["", "BLACK IN", 0.5]; }; // Black screen out


                // Run unit info code
                if (MF_intro_unitInfo) then {
                    private ["_name", "_group", "_guiPos", "_role", "_roleName"];
                    _name = parseText format["<t valign='center' shadow='1' shadowColor='#ffffff' shadowOffset='0' size = '4' font='%3'>%1 %2</t>", ((rank player) select [0,1]) + (toLowerANSI (rank player) select [1,255]) , name player, MF_intro_font];
                    _role = roleDescription player;
                    if (_role == "") then {
                        _roleName = "";
                    } else {
                        private _atIn = _role find "@";
                        _roleName = " - " + (if (_atIn == -1) then {_role} else { _role select [0, _atIn]; });
                    };
                    _group = parseText format["<t valign='center' shadow='1' shadowColor='#ffffff' shadowOffset='0' size = '4' font='%3'>%1%2</t>", groupId (group player), _roleName, MF_intro_font];
                    _guiPos = [(safeZoneX + safeZoneW)/8, (safeZoneY + safeZoneH)/4, safeZoneW, safeZoneH];
                    

                    [_name, _guiPos, 2, 3, 0.5, 0] spawn BIS_fnc_textTiles;
                    playSoundUI ["introBeep_1", 1];
                    [{ playSoundUI ["introBeep_3", 1]; }, [], 3.5] call CBA_fnc_waitAndExecute;
                    [
                        {
                            params ["_group", "_guiPos"];
                            [_group, _guiPos, 2, 2, 0.5, 0] spawn BIS_fnc_textTiles;
                            playSoundUI ["introBeep_2", 1];
                            [{ playSoundUI ["introBeep_3", 1]; }, [], 2.5] call CBA_fnc_waitAndExecute;
                        }, [_group, _guiPos], 5
                    ] call CBA_fnc_waitAndExecute;
                };

                // Run mission info code
                if (MF_intro_missionInfo) then {
                    [
                        {
                            private _oprName = MF_intro_line1 regexReplace [" ", "&#160;"];
                            [
                                [format ["<t underline='1' valign='top'    align = 'right'  shadow='1' shadowColor='#ffffff' shadowOffset='0' size = '1.4' font='%2'>%1</t>", _oprName, MF_intro_font], 0.5, 2], 
                                [format ["<t underline='0' valign='middle' align = 'right'  shadow='1' shadowColor='#ffffff' shadowOffset='0' size = '0.8' font='%2'><br/>%1<br/></t>", MF_intro_line2, MF_intro_font], 0.5, 1], 
                                [format ["<t underline='0' valign='middle' align = 'right'  shadow='1' shadowColor='#ffffff' shadowOffset='0' size = '0.8' font='%2'><br/>%1</t>", MF_intro_line3, MF_intro_font], 0.5, 1], 
                                [format ["<t underline='0' valign='bottom' align = 'right'  shadow='1' shadowColor='#ffffff' shadowOffset='0' size = '0.8' font='%2'><br/>%1</t>", MF_intro_line4, MF_intro_font], 0.5, 1], 
                                [format ["<t underline='0' valign='bottom' align = 'right'  shadow='1' shadowColor='#ffffff' shadowOffset='0' size = '0.8' font='%2'><br/>%1</t>", MF_intro_line5, MF_intro_font], 0.5, 1, 10]
                            ] spawn BIS_fnc_EXP_camp_SITREP;
                        }, [], [1, 10] select MF_intro_unitInfo // Consider if unit info is on or off
                    ] call CBA_fnc_waitAndExecute;
                };
			}, [], MF_intro_delay
		] call CBA_fnc_waitAndExecute;
	}
] call CBA_fnc_waitUntilAndExecute;
