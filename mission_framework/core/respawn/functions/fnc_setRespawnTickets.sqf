#include "script_component.hpp"

/*
    Author:
        Malbryn (Lightning)

    Description:
        Sets the player's respawn tickets.

    Arguments:
        0: OBJECT - The player's object
        1: SCALAR - Number of respawn tickets
        2: BOOLEAN - if set to true, set the value only if the key does not exist already

    Example:
        [player, 1, false] remoteExecCall ["MF_respawn_fnc_setRespawnTickets", 2];

    Returns:
        void
*/

if !(isServer) exitWith {};
params [["_unit", objNull], ["_amount", 0], ["_insertOnly", true]];

if !(isNull _unit) then {
    private ["_unitID", "_tickets"];
    _unitID = getPlayerUID _unit;
    TFI_var_opr_playerTicketsHash set [_unitID, _amount, _insertOnly];
    _tickets = TFI_var_opr_playerTicketsHash getOrDefault [_unitID, 0];
    [_unit, ["MF_respawn_playerTickets", _tickets]] remoteExecCall ["setVariable", _unit];

    if ( (_tickets == 0) && (alive _unit) ) exitWith { [_unit, 1] remoteExecCall ["setDamage", _unit]; };
};
