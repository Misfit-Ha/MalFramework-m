#include "script_component.hpp"

/*
    Author:
       DreadPirate, Malbryn, johnb43, Lightning

    Description:
        Spawn unit\group with stored values

    Arguments:
        0: STRING - Hashmap key unique to the group
        1: ARRAY - Group data stored with saveGroup function
        2: ARRAY - Array of markers where the unit/group will respawn randomly
        3: SIDE - Group side (Optional, default: CIV)
        4: NUMBER - pause radius in which enemies will pause the spawner (Optional, default: 300)
        5: STRING - Special spawn rules, for example "FLYING" (Optional, default: "NONE")
        6: BOOLEAN - Allow infinite ammo: Ammo gets replenished when a magazine has been emptied (Optional, default: true)
        7: ARRAY - List of synced objects to the unit/group (Optional, default: [])
        8: NUMBER - Respawn delay (Optional, default: 5)
        9: SCALAR - The number of respawns the unit/group has (Optional, default: -1)
        10: OBJECT - Exit trigger. If activated, the respawn will stop (Optional, default: [])
        11: STRING - Init string to run upon spawning. (Use _group to reference the freshly the spawned group) (Optional, default: "")

    Example:
        ["11", this, [getPos this]] call MF_ai_spawner_fnc_mainCheck

    Returns:
        void
*/


if !(isServer) exitWith {};

params [
    "_hashKey",
    "_groupData",
    "_respawnPosList",
    ["_unitSide", civilian],
    ["_radius", 300],
    ["_special", "NONE"],
    ["_unlimitedAmmo", true],
    ["_synchronizedObjectsList", []],
    ["_respawnDelay", 5],
    ["_lives", -1],
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
if (_exit) exitWith {
    TFI_var_opr_aiSpawnerList deleteAt _hashKey;
};

// Select a random position from _respawnPosList to check as spawn point
private _tmpRespawnPos = selectRandom _respawnPosList;

[
    {
        params ["_hashKey", "_tmpRespawnPos"];
        private _hashmap = (TFI_var_opr_aiSpawnerList get _hashKey);
        ( !([_tmpRespawnPos, _hashmap#2, _hashmap#3] call MF_ai_spawner_fnc_enemyInRadius) )
    },
    {
        params ["_hashKey", "_tmpRespawnPos"];
        (TFI_var_opr_aiSpawnerList get _hashKey) params ["_groupData", "_respawnPosList", "_unitSide", "_radius", "_special", "_unlimitedAmmo", "_synchronizedObjectsList", "_respawnDelay", "_lives", "_exitTriggers", "_initString"];
        // Spawn group
        _newGroup = [_groupData, _tmpRespawnPos, _special, _unlimitedAmmo] call MF_ai_spawner_fnc_spawnGroup;
        _newGroup deleteGroupWhenEmpty true;
        _newGroup allowfleeing 0;
        _newGroup enableDynamicSimulation true;
        (leader _newGroup) synchronizeObjectsAdd _synchronizedObjectsList;

        // Call in the init script
        if (_initString != "") then {
            _newGroup call compile ("params ['_group'];" + _initString);
        };
        

        [
            {
                params ["_newGroup", "_hashKey"];

                //Check if group is eliminated
                [
                    {
                        params ["_newGroup"];
                        ( {alive _x} count (units _newGroup) < 1 )
                    },
                    {
                        params ["_newGroup", "_hashKey"];
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

                            }, [_hashKey], ((TFI_var_opr_aiSpawnerList get _hashKey)#7)
                        ] call CBA_fnc_waitAndExecute;

                    }, [_newGroup, _hashKey]
                ] call CBA_fnc_waitUntilAndExecute;

            }, [_newGroup, _hashKey], 1
        ] call CBA_fnc_waitAndExecute;

    }, [_hashKey, _tmpRespawnPos]
] call CBA_fnc_waitUntilAndExecute;
