#include "script_component.hpp"

/*
    Restores player's gear from profileNamespace
    Priority: CUSTOM (Arsenal) > Current Role > Default
*/
private _unit = player;

// Attempt to restore custom Arsenal loadout
private _customGear = GETVAR(_unit,GVAR(customLoadout),[]);

if !(_customGear isEqualTo []) then {
    _unit setUnitLoadout _customGear;
    [
        COMPONENT_STR,
        "INFO",
        "Restored custom Arsenal loadout",
        false
    ] call EFUNC(main,log);
} else {
    // Fallback to role-specific gear
    private _role = GETVAR(_unit,EGVAR(gear,currentRole),"");
    if (_role != "") then {
        [_unit, _role] call EFUNC(gear,setGear);
        [
            COMPONENT_STR,
            "INFO",
            format ["Restored role loadout: %1", _role],
            false
        ] call EFUNC(main,log);
    };
};

// Add earplugs if missing
if !([_unit, "ACE_earplugs"] call BFUNC(hasItem)) then {
    _unit addItem "ACE_earplugs";
};