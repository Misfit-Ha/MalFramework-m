/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates ACE self-interaction menu for the logged-in admin which opens the ACE Arsenal
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Admin\performance_check\addCheckPerformanceMenu.sqf"
 *
 */

if (!hasInterface) exitWith {};

if (serverCommandAvailable "#kick") then {
  private _menu = ['Check Performance', 'Check Performance', '', {
    [] spawn MF_fnc_checkPerformance;
  }, {true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Admin Menu"], _menu] call ace_interact_menu_fnc_addActionToObject;
};
