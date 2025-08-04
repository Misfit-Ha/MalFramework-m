#include "script_component.hpp"

// Identical to JIP module's teleport function
private _target = objNull;
private _leader = leader group player;

if (alive _leader && {_leader != player}) then {
    _target = _leader;
} else {
    _target = [units group player select {alive _x && _x != player}, [player], {_x distance player}] call BFUNC(findMin);
};

if (isNull _target) exitWith {
    ["No valid squadmates found"] call BFUNC(showNotification);
};

private _vicSpot = [_target] call EFUNC(common,checkEmptySeat);
private _pos = getPosATL _target;

"MF_blackout" cutText ["Rejoining squad...", "BLACK OUT", 0.5];
[{
    params ["_target", "_vicSpot", "_pos"];
    
    if (_vicSpot) then {
        player moveInAny vehicle _target;
    } else {
        player setPosATL (_pos getPos [3, random 360]);
    };
    
    "MF_blackout" cutText ["", "BLACK IN", 3];
    [player, 1, ["ACE_SelfActions", "ReconnectTeleport"]] call ace_interact_menu_fnc_removeActionFromObject;
}, [_target, _vicSpot, _pos], 2] call CFUNC(waitAndExecute);