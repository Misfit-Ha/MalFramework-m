#include "script_component.hpp"

if (GVARMAIN(isTvT) || !GVARMAIN(moduleAISpawner)) exitWith {};

TFI_var_opr_aiSpawnerList = createHashMap;
