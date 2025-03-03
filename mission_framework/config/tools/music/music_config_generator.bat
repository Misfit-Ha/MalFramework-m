@echo off
setlocal enabledelayedexpansion

rem Set output file
set "outputFile=cfgMusic.hpp"

rem Create or clear the output file
echo // This file is auto-generated, put ogg files in this folder and run the music_config_generator.bat to auto generate music config without further setup. > "%outputFile%"
echo. >> "%outputFile%"

rem Loop through .ogg files in the current directory
for %%F in (*.ogg) do (
    rem Get the file name without the extension
    set "fileName=%%~nF"

    rem Write to the output file using the template
    (
        echo class !fileName! {
        echo    name = "!fileName!";
        echo    sound[] = {"mission_framework\config\tools\music\!fileName!.ogg", 1, 1};
        echo    titles[] = {};
        echo };
        echo.
    ) >> "%outputFile%"
)

endlocal
