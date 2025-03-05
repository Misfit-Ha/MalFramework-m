#include "script_component.hpp"

if !(GVARMAIN(moduleIntro)) exitWith {};

// Run intro at mission start
call FUNC(runIntro);
