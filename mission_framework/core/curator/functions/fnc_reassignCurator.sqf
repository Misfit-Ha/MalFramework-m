#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Reassign the curator module

    Arguments:
        0: OBJECT - Player unit who has curator access

    Example:
        [_unit] call MF_curator_fnc_reassignCurator

    Returns:
        void
*/

params ["_unit"];
private ["_logic"];

_logic = GETVAR(_unit,GVAR(curatorLogic),objNull);

if (isNull _logic) exitWith {
    ERROR_2("Curator object does not exist!",_unit,_logic);

    [QGVARMAIN(systemMessage), ["ERROR", "Curator object does not exist!"], _unit] call CFUNC(targetEvent);
};

unassignCurator _logic;

[{isNull (getAssignedCuratorLogic (_this#0))}, {
    _this#0 assignCurator _this#1;

    [QGVARMAIN(systemMessage), ["INFO", "Game Master: Registered as Curator"], _this#0] call CFUNC(targetEvent);
}, [_unit, _logic]] call CFUNC(waitUntilAndExecute);