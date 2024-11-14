#include "script_component.hpp"

if !(GVARMAIN(moduleSnowfall)) exitWith {};

// Start the snowfall
[QGVARMAIN(initFramework), {
    GVAR(enabled) = true;

	call FUNC(rainToSnow);
	call FUNC(startSnowfall);
}] call CFUNC(addEventHandler);
