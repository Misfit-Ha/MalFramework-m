#include "script_component.hpp"

/*
    Author:
        Lightning

    Description:
        Changes rain particles to snow particles

    Arguments:
        NONE

    Example:
        call MF_snowfall_fnc_rainToSnow

    Returns:
        BOOLEAN
*/

[
	"a3\data_f\snowflake4_ca.paa", // rainDropTexture
	4, // texDropCount
	0.01, // minRainDensity
	GVAR(snowRadius), // effectRadius
	0.5, // windCoef
	5, // dropSpeed
	0.5, // rndSpeed
	0.4, // rndDir
	0.07, // dropWidth
	0.07, // dropHeight
	GVAR(snowColor), // dropColor
	0.3, // lumSunFront
	0.3, // lumSunBack
	5.5, // refractCoef
	0.3, // refractSaturation
	true, // snow
	GVAR(brightSnow) // dropColorStrong
] call BIS_fnc_setRain;
