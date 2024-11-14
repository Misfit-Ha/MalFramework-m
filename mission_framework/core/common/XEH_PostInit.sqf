#include "script_component.hpp"

// Animation change event
[QGVAR(playAnim), {
    params ["_unit", "_anim"];

    _unit switchMove _anim;
}] call CFUNC(addEventHandler);
