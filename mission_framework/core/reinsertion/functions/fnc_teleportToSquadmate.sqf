#include "script_component.hpp"

/*
    Author:
        Misfit (adapted from Crowdedlight)
    
    Description:
        Performs teleport to selected squad member with safety checks.
        
    Arguments:
        0: OBJECT - Player to teleport
        1: OBJECT - Target squad member (player or AI)
        
    Example:
        [player, squadMember] call MF_reinsertion_fnc_doSquadmateTeleport
        
    Returns:
        void
*/

params ["_player", "_member"];

// Check if target is valid
if (!alive _member) exitWith {
    ["Error", ["Squad member is no longer alive!"]] call BFUNC(showNotification);
};

// Enemy proximity check (same as RP deployment)
if (allUnits findIf {
    side _x != civilian && 
    side _x getFriend (side _member) < 0.6 && 
    _x distance _member < 50
} != -1) exitWith {
    ["Warning", ["Cannot teleport to squadmate when enemies are near teammate"]] call BFUNC(showNotification);
};

// Get target's side
private _targetSide = side _member;


// Blackout effect
"MF_blackout" cutText [format["Teleporting to %1", name _member], "BLACK OUT", 0.5, true];

[{
    params ["_player", "_member"];
    
    // Reset velocity
    _player setVelocity [0, 0, 0];
    
    private _success = false;
    
    // Teleport logic (based on MF_admin_fnc_teleportToPlayer)
    if (vehicle _member != _member) then {
        // If target is in a vehicle and there is a free seat, move player in
        private _vicSpot = [_member] call EFUNC(common,checkEmptySeat);
        if (_vicSpot) then {
            _player moveInAny vehicle _member;
            _success = true;
        } else {
            // No free seat, teleport next to vehicle
            _player setPosATL (_member getPos [2, getDir _member]);
            _success = true;
        };
    } else {
        // Not in vehicle, teleport to position near member
        _player setPosATL (_member getPos [2, getDir _member]);
        _success = true;
    };
    
    // Fade in
    "MF_blackout" cutText ["", "BLACK IN", 3, true];
    
}, [_player, _member], 1] call CFUNC(waitAndExecute);