#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an event handler that fires when the player respawns.

    Arguments:
        1: OBJECT - The unit that respawned
        2: OBJECT - The old body of the unit

    Example:
        [player] call MF_respawn_fnc_eventRespawned

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params [["_unit", player], ["_corpse", objNull]];
private ["_selectedTPPole", "_tpPolePos"];

// TP to respawn pole(s)
switch (side _unit) do {
    case (west): { _selectedTPPole = MF_reinsertion_TPPolesBlue; };
    case (east): { _selectedTPPole = MF_reinsertion_TPPolesRed; };
    case (independent): { _selectedTPPole = MF_reinsertion_TPPolesGreen; };
    case (civilian): { _selectedTPPole = MF_reinsertion_TPPolesPurple; };
    default { _selectedTPPole = MF_reinsertion_TPPolesBlue; };
};

_tpPolePos = getPosASL (call compile (selectRandom _selectedTPPole));
_unit setPosASL [(_tpPolePos#0) + 5, (_tpPolePos#1), (_tpPolePos#2) + 0.5];
_unit setDir (getDir _unit + (_unit getRelDir _tpPolePos));

// Side update
if (GVARMAIN(isTvT)) then {
    [QEGVAR(common,sideValueSet), [playerSide, 0, 1, 0]] call CFUNC(serverEvent);
};

// Remove radios
call EFUNC(common,removeRadios);

// Screen effects
cutText ["", "BLACK FADED", 5, true];

// Wait for screen effects to finish
[{
    params ["_unit", "_corpse"];

    private ["_loadout", "_tickets"];

    // Screen effects
    cutText  ["", "BLACK IN", 5, true];

    // Stop spectator screen
    call EFUNC(common,stopSpectator);

    // Re-assigning gear
    private _role = GETVAR(_unit,EGVAR(gear,currentRole),"");
    private _gear = GETVAR(_unit,EGVAR(gear,currentGear),[]);

    if (_gear isNotEqualTo []) then {
        [_unit, _gear] call CBA_fnc_setLoadout;
    } else {
        [_unit, _role] call EFUNC(gear,setGear);
    };

    // Reassign insignia
    [{
        params ["_unit"];

        private _insignia = GETVAR(_unit,EGVAR(player,insignia),"");
        [QEGVAR(player,setInsignia), [_unit, _insignia]] call CFUNC(globalEvent);
    }, [_unit], 3] call CFUNC(waitAndExecute);

    if GVARMAIN(moduleTFAR) then {
        [QEGVAR(tfar,setRadios)] call CFUNC(localEvent);
    };

    // Reassign curator
    if (call EFUNC(admin,isGameMaster)) then {
        [_unit] remoteExecCall ["MF_admin_fnc_handleCuratorReassigned", 2];
    };

    // Delete old body
    if (GVAR(removePlayerCorpses)) then {
        deleteVehicle _corpse;
    };

    // Re-add custom channels
    if (EGVAR(custom_channel,playerCustomChannels) isNotEqualTo []) then {
        EGVAR(custom_channel,playerCustomChannels) apply {
            _x radioChannelAdd [_unit];
        };
    };

    // Show how many tickets player have
    [format ["Respawns available:<br/>%1", (_unit getVariable ["MF_respawn_playerTickets", -1]) - 1], 2, _unit, 12] remoteExecCall ["ace_common_fnc_displaytextstructured", _unit];

    // Register player's status
    SETVAR(_unit,GVAR(isDead),false);
}, [_unit, _corpse], 1] call CFUNC(waitAndExecute);
