#include "script_component.hpp"

if !(GVARMAIN(moduleSnowfall)) exitWith {};

if (GVAR(coldBreath)) then {
	// Start cold breath effect
	[QGVARMAIN(initFramework), {
		call FUNC(coldBreath);
	}] call CFUNC(addEventHandler);
};
