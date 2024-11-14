#include "script_component.hpp"

/*
    Author:
		Lighting

    Description:
		Creates subtitles

    Arguments:
		0: STRING - Code name of the speaker
		1: STRING - Subtitle
		2: NUMBER (Optional) - Timer for subtitle presence
		3: BOOLEAN (Optional) - use sound effect?
		4: ARRAY of STRING (Optional) - Sound that you want to be played when subtitle starts, only one of the members will be selected, if none it uses the default values.

    Example:
		["Bob", "Hello World!"] call MF_subtitle_fnc_createSubtitle

    Returns:
        BOOLEAN
		
*/

if !(hasInterface) exitWith {};

params [["_speaker", "NONE"], ["_subtitle", "NONE"], ["_timer", 4], ["_useSound", true], ["_chatterSound", selectRandom ["RadioAmbient8", "RadioAmbient6", "RadioAmbient2", "rhs_usa_land_rc_18", "UAV_01", "UAV_02", "UAV_04", "UAV_05"]]];

[
	parseText format ["<t align = 'center' shadow = '0' color='#40ff00' size='0.9' font='PuristaLight'>%1: </t><t align = 'center' shadow='1' shadowColor='#ffffff' shadowOffset='0' color='#ffffff' size='0.8' font='PuristaLight'>%2 </t>",
	_speaker, _subtitle],
	-1, 1, _timer, 0.1, 0, 789
] spawn BIS_fnc_dynamicText;

if (_useSound) then {
	playSoundUI [_chatterSound, 0.05];
};
