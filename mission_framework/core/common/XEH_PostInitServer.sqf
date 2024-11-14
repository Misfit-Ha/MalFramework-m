#include "script_component.hpp"

[QGVARMAIN(initFramework), {
    if (GVARMAIN(isTvT)) then {
        // Disconnected event
        call FUNC(eventHandleDisconnect);
    };
    // View distance
    setViewDistance GVARMAIN(serverViewDistance);
    setObjectViewDistance [GVARMAIN(serverViewDistance), 10];
}] call CFUNC(addEventHandler);

[QGVAR(sideValueSet), {
    params ["_side", "_changeTotal", "_changeCurrent", "_changeTickets"];

    [_side, _changeTotal, _changeCurrent, _changeTickets] call FUNC(setSideValue);
}] call CFUNC(addEventHandler);
