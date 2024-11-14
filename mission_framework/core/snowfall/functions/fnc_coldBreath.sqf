#include "script_component.hpp"

/*
    Author:
        Lightning

    Description:
        Cold breath for players and ai

    Arguments:
        NONE

    Example:
        call MF_snowfall_fnc_coldBreath

    Returns:
        BOOLEAN
*/

if !(hasInterface) exitWith {false};

[
	{
		params ["_arg","_handle"];
		{
			if !( ((eyePos _x)#2) < 0.9) then {
				[
					{
						private ["_flow" ,"_particle"];
						_flow = (vectorDir (_this#0)) vectorMultiply 0.1;
						_particle = "#particlesource" createVehicleLocal [0,0,0];
						_particle attachTo [(_this#0), [0,0,0], "head"];
						_particle setParticleParams [ ["\a3\Data_f\ParticleEffects\Universal\Universal",16,12,15,0], "", "Billboard", 0, 2, [-0.05,0.05,0.05], [_flow#0,_flow#1,-0.2], 0, 0.1, 0.0794, 0.025, [0,0.6], [[1,1,1,0.1],[1,1,1,0]], [15], 0, 0, "", "", "", 0, false, -1 ];
						_particle setParticleRandom [1, [0,0,0], [0.025,0.025,0], 3, 0.1, [0,0,0,0], 0, 0, 0, -1];
						_particle setDropInterval 0.025;
						[{ deleteVehicle (_this#0); }, [_particle], 1.5] call CBA_fnc_waitAndExecute;
					}, [_x], round (random [0,10,20])
				] call CBA_fnc_waitAndExecute;
			};
		} forEach (player nearEntities ["Man", 25]);
	}, 5, []
] call CBA_fnc_addPerFrameHandler;

true
