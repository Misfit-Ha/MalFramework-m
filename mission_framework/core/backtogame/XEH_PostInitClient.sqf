#include "script_component.hpp"

if !(GVARMAIN(moduleBackToGame)) exitWith {};
if (!hasInterface) exitWith {};

// Handle reconnection
[{
    if (didJIP) exitWith {};  // Only for reconnecting players
    
    // Restore gear and add teleport option
    call FUNC(restoreGear);
    call FUNC(addReconnectMenu);
}, []] call CFUNC(waitUntil);