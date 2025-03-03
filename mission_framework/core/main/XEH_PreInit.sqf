#include "script_component.hpp"
#include "..\..\config\config.sqf"  // Import framework settings

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Log events
[QGVAR(log), {
    params ["_msg", "_syschatEnabled"];

    [_msg, _syschatEnabled] call FUNC(writeRPT);
}] call CFUNC(addEventHandler);

private _version = VERSION_BUILD;

[COMPONENT_STR, "DEBUG", "*** DEBUG MODE IS ACTIVE ***", true] call FUNC(log);
[COMPONENT_STR, "INFO", format ["MalFramework v%1", _version], false] call FUNC(log);

["a3\data_f\rainnormal_ca.paa", 1, 0.01, 25, 0.02, 19, 0, 0.1, 0.01, 0.15, [1,1,1,0.3], 0.1, 0.1, 5.5, 0.3, false, true] call BIS_fnc_setRain;