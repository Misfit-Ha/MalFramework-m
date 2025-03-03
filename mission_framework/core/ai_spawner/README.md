# AI Spawner

## Description:

_This module integrates DreadPirate's awesome [Jebus - Just Editor Based Unit Spawning](https://forums.bohemia.net/forums/topic/174661-jebus-just-editor-based-unit-spawning/) script._

_It takes editor-based groups and respawns them when the group is eliminated._

## Usage:

1. _Call `MF_ai_spawner_fnc_main` in the init field of the target group or unit (or use it with triggers)._

```
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
```

## Config:

\-

## Supported mission type(s):

-   Coop
