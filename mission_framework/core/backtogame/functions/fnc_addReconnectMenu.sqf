#include "script_component.hpp"

private _action = [
    "ReconnectTeleport", 
    "Rejoin Squad", 
    "\a3\ui_f\data\igui\cfg\actions\take_ca.paa", 
    {call FUNC(tpPlayer)}, 
    {alive player}
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// Auto-remove after timeout
[{
    [player, 1, ["ACE_SelfActions", "ReconnectTeleport"]] call ace_interact_menu_fnc_removeActionFromObject;
}, [], EGVAR(backtogame,reconnectTimeout)] call CFUNC(waitAndExecute);