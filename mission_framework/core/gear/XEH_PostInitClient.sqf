#include "script_component.hpp"

if !(GVARMAIN(moduleGear)) exitWith {};

// Arsenal around pole
if (GVAR(arsenalAtPole)) then {
    ["TFI Operation", "TFI_key_opr_openArsenal", ["Open Arsenal", "Only works around TP poles"], {}, {
        private _unit = call CBA_fnc_currentUnit;

        MF_reinsertion_TPPoles apply {
            if ((_unit distance2D (call compile _x)) < MF_gear_arsenalAtPoleDistance) exitWith {
                [_unit, _unit, true] call ace_arsenal_fnc_openBox;
            };
        };
    }, [0x1C, [false, true, false]]] call CBA_fnc_addKeybind;
};

// Save starting gear
if !(GVAR(removeDefaultGear)) then {
    [player] call MF_gear_fnc_saveGear;
};

// Add arsenal EH's that overwrite the pre-defined gear
if GVAR(saveGearInArsenal) then {
    ["ace_arsenal_displayClosed", {
        [player, "CUSTOM"] call FUNC(saveGear);
    }] call CFUNC(addEventHandler);

    [missionNamespace, "ArsenalClosed", {
        [player, "CUSTOM"] call FUNC(saveGear);
    }] call BFUNC(addScriptedEventHandler);
};

// Init alternative loadut hash
if GVAR(enableAlternativeLoadouts) then {
    [GVAR(loadoutHash)] call FUNC(createLoadoutHashMap);
};

// Init restricted arsenal objects
if GVAR(useArsenalWhitelist) then {
    call FUNC(initRestrictedArsenalObjects);
};
