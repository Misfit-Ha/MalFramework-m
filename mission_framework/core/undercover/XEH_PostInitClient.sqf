#include "script_component.hpp"

if !(GVARMAIN(moduleUndercover)) exitWith {};

// Main function init
[QGVARMAIN(initFramework), {
	call FUNC(init);
}] call CFUNC(addEventHandler);
