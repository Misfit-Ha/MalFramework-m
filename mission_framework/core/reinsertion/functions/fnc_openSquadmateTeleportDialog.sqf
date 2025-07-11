#include "script_component.hpp"

/*
    Author:
        Misfit (adapted from Crowdedlight)
    
    Description:
        Shows zen dialog of squadmember.
        
    Arguments:
        0: OBJECT - Player to teleport
        
    Example:
        [player] call MF_reinsertion_fnc_openSquadmateTeleportDialog
        
    Returns:
        void
*/

params ["_caller"];

// Get alive squad members (excluding player)
private _allSquadMembers = units group _caller select { 
    alive _x && 
    _x != _caller 
};

if (_allSquadMembers isEqualTo []) exitWith {
    ["Info", ["No alive squadmates available!"]] call BFUNC(showNotification);
};

// Format names with role/vehicle indicators
private _allSquadMembersNames = _allSquadMembers apply {
    private _name = name _x;
    if (_x == leader group _x) then {
        _name = format ["%1 [%2]", _name, "Squad Leader"];
    };
    if (!isNull objectParent _x) then {
        _name = _name + " [In Vehicle]";
    };
    _name;
};

// Dialog confirmation handler
private _onConfirm = {
    params ["_dialogResult", "_args"];
    _dialogResult params ["_selectedUnit"]; 
    _args params ["_caller"];

    // Validate selection
    if (isNil "_selectedUnit" || {isNull _selectedUnit}) exitWith {
        ["Error", ["Invalid squadmate selection"]] call BFUNC(showNotification);
    };

    // Verify unit still exists and is alive
    if (!alive _selectedUnit || {!(_selectedUnit in (units group _caller))}) exitWith {
        ["Error", ["Squadmate no longer available"]] call BFUNC(showNotification);
    };

    // Perform teleport
    [_caller, _selectedUnit] call FUNC(teleportToSquadmate);
};

// Create Zen dialog 
[
    "Teleport to Squadmate", 
    [
        ["LIST", "Select Squadmate", [
            _allSquadMembers,
            _allSquadMembersNames,
            0,
            10,
            true
        ]]
    ],
    _onConfirm,
    {},
    [_caller]
] call zen_dialog_fnc_create;