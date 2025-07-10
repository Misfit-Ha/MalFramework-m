#include "script_component.hpp"

/*
    Author:
        Misfit (adapted from Crowdedlight)
    
    Description:
        Creates menu for teleporting to squad members.
        
    Arguments:
        -
        
    Example:
        call MF_reinsertion_fnc_teleportToSquadmate
        
    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _squadMembers = (units group player) - [player];
if (_squadMembers isEqualTo []) exitWith {
    ["Info", ["No squad members available"]] call BFUNC(showNotification);
};

private _actions = [];
{
    private _member = _x;
    private _name = name _member;
    private _icon = "";
    
    // Add role indicators
    if (_member == leader group _member) then {
        _name = format ["%1 (Squad Leader)", _name];
        _icon = "\a3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa";
    };
    
    // Add vehicle indicator
    if (!isNull objectParent _member) then {
        _name = format ["%1 [In Vehicle]", _name];
        _icon = "\a3\ui_f\data\igui\cfg\actions\getincargo_ca.paa";
    };
    
    private _action = [
        format["member_%1", netId _member],
        _name,
        _icon,
        {
            params ["_target", "_player", "_member"];
            [_player, _member] call FUNC(doSquadmateTeleport);
        },
        {alive _this},
        {},
        _x
    ] call ACE_interact_menu_fnc_createAction;
    
    _actions pushBack [_action, [], _player];
} forEach _squadMembers;

// Add cancel action
private _cancelAction = [
    "cancel_teleport",
    "Cancel",
    "\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_cancel_ca.paa",
    {},
    {true}
] call ACE_interact_menu_fnc_createAction;

_actions pushBack [_cancelAction, [], _player];

// Open menu
[_actions] call ACE_interact_menu_fnc_openMenu;