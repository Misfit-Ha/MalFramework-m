#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Deploys the HAB for the platoon.

    Arguments:
        -

    Example:
        call MF_reinsertion_fnc_deployHAB

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Check if it is enabled
if !(GVARMAIN(moduleHAB)) exitWith {
    ["Warning", ["HAB reinsertion is not available in this mission"]] call BFUNC(showNotification);
};

// Check if the HAB is already deployed
if !(isNil {GETMVAR(GVAR(HAB),nil)}) then {
    private _id = GETMVAR(GVAR(HAB),nil);
    private _HAB = objectFromNetId _id;
    deleteVehicle _HAB;
    SETPMVAR(GVAR(HAB),nil);

    // Remove marker
    if GVAR(markHAB) then {
        deleteMarker "MF_mrk_HAB";
    };
};

// Check if there's enemy nearby
if (allUnits findIf {side _x != civilian && side _x getFriend playerSide < 0.6 && _x distance player < 50} != -1) exitWith {
    ["Warning", ["Cannot deploy a HAB when enemies are nearby"]] call BFUNC(showNotification);
};

// Play animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";

// Display ACE progress bar
[12, [], {
    // Create HAB and save the netId so other people can access it
    private _HAB = createVehicle [GVAR(HABObject), [0,0,0], [], 0, "CAN_COLLIDE"];
    _HAB setPos (player modelToWorld [0,7,0]);
    _HAB setDir ((getDir player) + 180);
    private _id = netId _HAB;
    SETPMVAR(GVAR(HAB),_id);

    // Add TP to RP option
    if (GVARMAIN(moduleRP) && GVAR(allowTPFromHAB)) then {
        [QGVAR(addTPToRPOption), [_HAB], QGVAR(HABID)] call CFUNC(globalEventJIP);
        [QGVAR(HABID), _HAB] call CFUNC(removeGlobalEventJIP); // Remove JIP ID when the object is deleted
    };

    // Mark on map
    if GVAR(markHAB) then {
        private _marker = createMarker ["MF_mrk_HAB", _HAB];
        "MF_mrk_HAB" setMarkerText "HAB";

        switch (side player) do {
            case west : {
                "MF_mrk_HAB" setMarkerType "b_hq";
                "MF_mrk_HAB" setMarkerColor "ColorWEST";
            };

            case east : {
                "MF_mrk_HAB" setMarkerType "o_hq";
                "MF_mrk_HAB" setMarkerColor "ColorEAST";
            };

            default {
                "MF_mrk_HAB" setMarkerType "n_hq";
                "MF_mrk_HAB" setMarkerColor "ColorGUER";
            };
        };
    };

    // Add remove action
    [QGVAR(addRemoveHABOption), [_HAB]] call CFUNC(globalEvent);
}, {
    // Stop the animation if the progress bar was cancelled
    [player, ""] remoteExec ["switchMove", 0];
}, "Building HAB"] call AFUNC(common,progressBar);