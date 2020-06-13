#include "script_component.hpp"

if (isServer) then {
    // Terminate the end condition checking loop if there's no condition defined
    if !(GVARMAIN(moduleTimeLimit) || GVARMAIN(modulePlayerCasualties) || GVARMAIN(moduleTaskLimit) || GVARMAIN(moduleExtraction) || GVARMAIN(moduleCivilianCasualties)) exitWith {};

    [QGVARMAIN(initFramework), {
        // Check the tasks array
        if ((GVARMAIN(moduleTaskLimit) && (count GVAR(tasks) == 0)) ||
        (GVARMAIN(moduleExtraction) && (count GVAR(tasks) == 0))) then {
            [QGVARMAIN(systemMessage), ["WARNING", "The task array is empty. The end conditions will not work properly! Add your tasks to the tasks array."]] call CFUNC(globalEvent);
            GVARMAIN(moduleTaskLimit) = false;
            GVARMAIN(moduleExtraction) = false;
        };

        // Register the civilians
        if (GVARMAIN(moduleCivilianCasualties)) then {
            GVAR(civs) = [];

            {
                if ((side _x) == civilian) then {
                    PUSH(GVAR(civs),_x);
                };
            } forEach allUnits;
        };

        // Add per frame handler
        if (GVARMAIN(isTvT)) then {
            GVAR(endConditionCheckTvT) = [{
                call FUNC(checkEndConditionsTvT);
            }, 3] call CFUNC(addPerFrameHandler);
        } else {
            GVAR(endConditionCheck) = [{
                call FUNC(checkEndConditionsCoop);
            }, 10] call CFUNC(addPerFrameHandler);
        };
    }] call CFUNC(addEventHandler);
};
