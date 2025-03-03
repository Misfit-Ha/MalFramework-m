#include "script_component.hpp"

if !(GVARMAIN(moduleCbrn)) exitWith {};

[getMarkerPos "radZone_01", 2, 25, 300] call cbrn_fnc_createZone;
[getMarkerPos "radZone_02", 2, 25, 300] call cbrn_fnc_createZone;
[getMarkerPos "radZone_03", 3, 25, 300] call cbrn_fnc_createZone;
[getMarkerPos "radZone_04", 3, 25, 300] call cbrn_fnc_createZone;
