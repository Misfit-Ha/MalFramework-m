#include "script_component.hpp"

if (!GVARMAIN(moduleAISkill)) exitWith {};

// Workaround for the issue where AI skills do not get set properly
[
    {CBA_MissionTime > 1},
    {
        ["CAManBase", "init", {
            params ["_unit"];
            [_unit] call EFUNC(ai_skills,setAISkills);
        }, true, [], true] call CFUNC(addClassEventHandler);

        ["CAManBase", "respawn", {
            params ["_unit"];
            [_unit] call EFUNC(ai_skills,setAISkills);
        }, true, [], true] call CFUNC(addClassEventHandler);
    }
] call CFUNC(waitUntilAndExecute);