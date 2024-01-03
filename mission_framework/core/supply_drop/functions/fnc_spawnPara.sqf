#include "script_component.hpp"

/*
        Author:
            KillzoneKid, Misfit
    
        Description:
            Spawns a parachute
    
        Arguments:
            0: OBJECT - Crate or vehicle to be dropped
    
        Example:
            tank1 call MF_SpawnPara
    
        Returns:
            void
*/

if !(isServer) exitWith {};

private ["_para", "_paras", "_p", "_veh", "_vel", "_time"];

_para = createVehicle ["B_Parachute_02_F", [0, 0, 0], [], 0, "FLY"];
_para setDir getDir _this;
_para setPos getPos _this;
_paras = [_para];
_this attachTo [_para, [0, 0, 0.5]];


       // if is a land vehicle use 4 more parachutes to look more epic
if (_this isKindOf "LandVehicle") then {
    {
        _p = createVehicle ["B_Parachute_02_F", [0, 0, 0], [], 0, "FLY"];
        _paras set [count _paras, _p];
        _p attachTo [_para, [0, 0, 0]];
        _p setVectorUp _x;
        } count [
            [0.5, 0.4, 0.6], [-0.5, 0.4, 0.6], [0.5, -0.4, 0.6], [-0.5, -0.4, 0.6]
        ];
    };
    0 = [_this, _paras] spawn {
        _veh = _this select 0;

        // spawn smoke/flare
        if (GVAR(useFlare)) then {
            _signal = "F_40mm_Green" createVehicle position _veh;
            _signal attachTo [_veh, [0, 0, 0.1]];
        };

        waitUntil {
            getPos _veh select 2 < 4
        };
        _vel = velocity _veh;
        detach _veh;
        _veh setVelocity _vel;

                   // spawn smoke or checmight when hits the ground
        if (GVAR(useFlare)) then {
            _signal = "Chemlight_green" createVehicle position _veh;
        } else {
            _signal = "SmokeShellYellow" createVehicle position _veh;
        };
                   // _signal attachTo [_veh, [0, 0, 0.1]];
        playSound3D [
            "a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss",
            _veh
        ];
        {
            detach _x;
            
        } count (_this select 1);
        _time = time + 5;
        waitUntil {
            time > _time
        };
        {
            if (!isNull _x) then {
                deleteVehicle _x
            };
        } count (_this select 1);
    };