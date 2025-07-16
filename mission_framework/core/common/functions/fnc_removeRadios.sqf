#include "script_component.hpp"

/*
    Author:
        Malbryn, johnb43

    Description:
        Removes the unit's TFAR radios.

    Arguments:
        1: OBJECT - The unit

    Example:
        [player] call MF_common_fnc_removeRadios

    Returns:
        void
*/

params [["_unit", objNull]];

if ("ItemRadio" in (assignedItems _unit)) then {
    _unit unlinkItem "ItemRadio";

    if (GVARMAIN(moduleACRE)) then {
        _unit linkItem "ItemRadioAcreFlagged";
    };
};
