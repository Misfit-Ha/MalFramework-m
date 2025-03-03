#include "script_component.hpp"

/*
    Author:
       DreadPirate, Malbryn, johnb43, Lightning

    Description:
        Initialises the AI spawner module

    Arguments:
        0: OBJECT or GROUP - The unit or group
        1: SCALAR - The number of lives the unit/group have, use negative values for infinite spawns (Optional, default: 2)
        2: NUMBER - Respawn delay (Optional, default: 5)
        3: NUMBER - pause radius in which enemies will pause the spawner (Optional, default: 300)
        4: ARRAY - Array of markers where the unit/group will respawn randomly (Optional, default: [])
        5: STRING - Special spawn rules, for example "FLYING" (Optional, default: "NONE")
        6: BOOLEAN - Allow infinite ammo: Ammo gets replenished when a magazine has been emptied (Optional, default: true)
        7: ARRAY of OBJECTS - Exit triggers names. If activated, the respawn will stop (Optional, default: [])
        8: STRING - Init string to run upon spawning. (Use _group to reference the freshly the spawned group) (Optional, default: "")

    Example:
        [this, 2, 5, 300, [], "NONE", true, [trg_01], "systemChat str _group"] call MF_ai_spawner_fnc_main

    Returns:
        void
*/

if !(isServer) exitWith {};

params [
    "_unit",
    ["_lives", 2],
    ["_respawnDelay", 5],
    ["_radius", 300],
    ["_respawnMarkers", []],
    ["_special", "NONE"],
    ["_unlimitedAmmo", true],
    ["_exitTriggers", []],
    ["_initString", ""]
];

// Exit if exit is triggered
private _exit = false;
if (_exitTriggers isNotEqualTo []) then {
    _exitTriggers apply {
        if (triggerActivated _x) exitWith { _exit = true; };
    };
};
if (_exit) exitWith {};


// Make sure unit is a unit and not a group (Thanks to S.Crowe)
if (typeName _unit == "GROUP") then {
    _unit = leader _unit;
};

// Assign unique key to the group in the spawner hashmap
[
    {
        params ["_arg","_handle"];
        _arg params ["_unit"];
        
        private _hashKey = format ["%1", floor random 10000];
        if !(_hashKey in TFI_var_opr_aiSpawnerList) then {
            _unit setVariable ["MF_var_aiSpawnerKey", _hashKey];
            TFI_var_opr_aiSpawnerList set [_hashKey, []];
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    }, 0.1, [_unit]
] call CBA_fnc_addPerFrameHandler;

[
	{ (time > 5) },
	{
        params ["_unit", "_lives", "_respawnDelay", "_radius", "_respawnMarkers", "_special", "_unlimitedAmmo", "_exitTriggers", "_initString"];

        private ["_hashKey", "_unitSide", "_synchronizedObjectsList", "_respawnPosList", "_group", "_groupData"];
        _hashKey = _unit getVariable "MF_var_aiSpawnerKey";
        _unitSide = side _unit;
        _synchronizedObjectsList = (synchronizedObjects _unit) select {!(_x isKindOf "EmptyDetector")};
        _respawnPosList = [getPos _unit];
        _group = group _unit;

        // Call in the init script
        if (_initString != "") then {
            _group call compile ("params ['_group'];" + _initString);
        };

        if !(_group getVariable ["MF_var_aiSpawnerRunning", false]) then {

            // Set a flag to make sure that the code doesn't overlap
            _group setVariable ["MF_var_aiSpawnerRunning", true];

            // Add additional respawn positions where applicable
            _respawnMarkers apply {
                _respawnPosList pushBack (getMarkerPos _x);
            };

            // Save unit data
            _groupData = [_unit] call MF_ai_spawner_fnc_saveGroup;
            TFI_var_opr_aiSpawnerList set [_hashKey, [_groupData, _respawnPosList, _unitSide, _radius, _special, _unlimitedAmmo, _synchronizedObjectsList, _respawnDelay, _lives, _exitTriggers, _initString]];


            // Check if group is eliminated to call spawn check function
            [
                {
                    params ["_group"];
                    ( {alive _x} count (units _group) < 1 )
                },
                {
                    params ["_group", "_hashKey", "_respawnDelay"];
                    // Respawn delay
                    [
                        {
                            params ["_hashKey"];
                            private ["_hashmap", "_newLives"];
                            _hashmap = TFI_var_opr_aiSpawnerList get _hashKey;
                            _newLives = (_hashmap#8) - 1;
                            
                            // Delete key and values if out of lives, else respawn
                            if (_newLives == 0) then {
                                TFI_var_opr_aiSpawnerList deleteAt _hashKey;
                            } else {
                                _hashmap params ["_groupData", "_respawnPosList", "_unitSide", "_radius", "_special", "_unlimitedAmmo", "_synchronizedObjectsList", "_respawnDelay", "_lives", "_exitTriggers", "_initString"];
                                TFI_var_opr_aiSpawnerList set [_hashKey, [_groupData, _respawnPosList, _unitSide, _radius, _special, _unlimitedAmmo, _synchronizedObjectsList, _respawnDelay, _newLives, _exitTriggers, _initString]];
                                private _data = [_hashKey] + (TFI_var_opr_aiSpawnerList get _hashKey);
                                _data call MF_ai_spawner_fnc_mainCheck;
                            };

                        }, [_hashKey], _respawnDelay
                    ] call CBA_fnc_waitAndExecute;

                }, [_group, _hashKey, _respawnDelay]
            ] call CBA_fnc_waitUntilAndExecute;
        };

	}, [_unit, _lives, _respawnDelay, _radius, _respawnMarkers, _special, _unlimitedAmmo, _exitTriggers, _initString]
] call CBA_fnc_waitUntilAndExecute;
