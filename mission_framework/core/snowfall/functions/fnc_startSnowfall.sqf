#include "script_component.hpp"

/*
    Author:
        AZCoder (originally by JW)

    Description:
        Creates a snowfall effect around the player.

    Arguments:
        NONE

    Example:
        call MF_snowfall_fnc_startSnowfall

    Returns:
        NONE
*/

setHumidity 0.2;

if (GVAR(customPreset)) then {
	[
		{
			skipTime -24;
			86400 setFog [0.1, 0, 0];
			86400 setOvercast 0.8;
			skipTime 24;
			setWind [1, 1, true];
			0 setRain 1;
			[{simulWeatherSync;}, [], 1] call CBA_fnc_waitAndExecute;
		}, [], 10
	] call CBA_fnc_waitAndExecute;
};

/* Old Snow effect
[{
	_unit = vehicle player;
	_radius  = 5;
	_pos = getPosATL _unit;
	
	if !([_unit] call EFUNC(common,isInside)) then {
		for "_i" from 0 to 10 do {
			drop ["\ca\data\cl_water", "", "Billboard", 1, 7, [((_pos#0) + (_radius - (random (2*_radius))) + ((velocity _unit#0)*1)),((_pos#1) + (_radius - (random (2*_radius))) + ((velocity _unit#0)*1)),((_pos#2) + (random [2,10,20]) )], [0,0,-1], 1, 0.0000001, 0.000, 0.7, [0.07], [[1,1,1,0], [1,1,1,1], [1,1,1,1], [1,1,1,1]], [0,0], 0.2, 1.2, "", "", ""];
		};
	};
}, 0] call CFUNC(addPerFrameHandler);
*/
