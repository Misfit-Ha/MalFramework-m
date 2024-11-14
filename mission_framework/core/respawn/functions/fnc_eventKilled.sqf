#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an event handler that fires when the player dies.

    Arguments:
        0: OBJECT - Object the event handler is assigned to
        1: OBJECT - Object that killed the unit, contains the unit itself in case of collisions
        2: OBJECT - Person who pulled the trigger
        3: BOOLEAN - Same as useEffects in setDamage alt syntax

    Example:
        [player] call MF_respawn_fnc_eventKilled

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params [["_unit", player], "_killer", "_instigator", "_useEffects"];

// Set timer
setPlayerRespawnTime 10e10;

// Side update
if (GVARMAIN(isTvT)) then {
    call FUNC(updateSides);
};

// Check friendly-fire
private _killer = GETVAR(_unit,ace_medical_lastDamageSource,objNull);

if (isPlayer _killer && {(side _killer) == playerSide}) then {
    [QEGVAR(admin,onFriendlyFire), [name _unit, name _killer]] call CFUNC(globalEvent);
};

// Disconnect connected UAV's
if (!isNull getConnectedUAV _unit) then {
    _unit connectTerminalToUAV objNull;
};

[{
	// Screen effects
	"TFI_hud_respawnFade" cutText ["", "WHITE OUT", 3];
}, [], 3] call CFUNC(waitAndExecute);

// Wait for screen effects to finish

[{
	params ["_unit", "_killer"];

	// Spectator settings
	private _allowAllSides = false;
	private _allowFreeCam = false;

	// Set respawn timer
	switch (GVAR(waveRespawn)) do {
		case AUTO: {
			private _diff = CBA_missionTime % GVAR(timer);
			setPlayerRespawnTime (GVAR(timer) - _diff);
		};
		case MANUAL: {
			[QGVARMAIN(notification_2), ["Info", format ["Remaining respawn waves: %1", GVAR(availableWaves)]]] call CFUNC(localEvent);
		};
		default {
			setPlayerRespawnTime GVAR(timer);
		};
	};

	// Check player tickets
	if (GETVAR(_unit,GVAR(playerTickets),-1) == 0) then {
		[QGVARMAIN(notification_2), ["Warning", "You have no more respawn tickets!"]] call CFUNC(localEvent);
		setPlayerRespawnTime 10e10;

		// Set spectator options
		_allowAllSides = true;
		_allowFreeCam = true;
	};

	// Check side tickets
	if (GETVAR(_unit,GVAR(playerTickets),-1) == 0 || (GVAR(waveRespawn) == MANUAL && GVAR(availableWaves) == 0)) then {
		// Transfer leader modules (SL & CO)
		call FUNC(transferLeaderModules);

		// Set spectator options
		_allowAllSides = true;
		_allowFreeCam = true;
	};

	// Save death location of the player
	SETVAR(_unit,EGVAR(reinsertion,deathPos),getPos _unit);

	// Init spectator screen
	[_allowAllSides, _allowFreeCam] call EFUNC(common,startSpectator);

	// Check if the mission is ending
	if (EGVAR(end_mission,outroIsRunning)) then {
		setPlayerRespawnTime 10e10;
	};

	// Set player's status
	SETVAR(_unit,GVAR(isDead),true);

	// Screen effects
	"TFI_hud_respawnFade" cutText ["", "WHITE IN", 0.5];
}, [_unit, _killer], 8] call CFUNC(waitAndExecute);
