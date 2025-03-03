#include "script_component.hpp"

if (!GVARMAIN(moduleAISkill)) exitWith {};

[
	{ ( ( CBA_MissionTime > 1 ) ) },
	{
        ["CAManBase", "init", {
            params ["_unit"];
            [_unit] call MF_ai_skills_fnc_setAISkills;
        }, true, [], true] call CBA_fnc_addClassEventHandler;
        
        ["CAManBase", "respawn", {
            params ["_unit"];
            [_unit] call MF_ai_skills_fnc_setAISkills;
        }, true, [], true] call CBA_fnc_addClassEventHandler;
	}
] call CBA_fnc_waitUntilAndExecute;
