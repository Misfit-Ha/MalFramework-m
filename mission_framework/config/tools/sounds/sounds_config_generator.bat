@echo off
setlocal enabledelayedexpansion

rem Set output file
set "outputFile=cfgSounds.hpp"

rem Create or clear the output file
echo // This file is auto-generated, put ogg files in this folder and run the sounds_config_generator.bat to auto generate sounds config without further setup. > "%outputFile%"
echo. >> "%outputFile%"

rem Loop through .ogg files in the current directory
for %%F in (*.ogg) do (
    rem Get the file name without the extension
    set "fileName=%%~nF"

    rem Write to the output file using the template
    (
        echo class !fileName! {
        echo    name = "!fileName!";
        echo    sound[] = {"mission_framework\config\tools\sounds\!fileName!.ogg", 1, 1};
        echo    titles[] = {};
        echo };
        echo.
    ) >> "%outputFile%"
)

endlocal
