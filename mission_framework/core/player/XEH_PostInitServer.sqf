#include "script_component.hpp"

["ace_unconscious", {
    params ["_unit", "_state"];
    [_unit, !_state] remoteExecCall ["setPhysicsCollisionFlag"];
}] call CBA_fnc_addEventHandler;
