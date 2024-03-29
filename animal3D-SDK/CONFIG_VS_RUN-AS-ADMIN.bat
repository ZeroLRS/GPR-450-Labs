@echo off
set ANIMAL3D_SDK=%~dp0
set "cfgproj=animal3D-VSSetPath"
cd "%ANIMAL3D_SDK%\utility\win\%cfgproj%\"

rem instructions
echo A3: BEGIN CONFIG_VS: Utility to configure VS for animal3D.
echo A3: ALWAYS RUN THIS UTILITY (CONFIG_VS) AS ADMINISTRATOR!
echo A3:   1. READ these instructions.
echo A3:       (always read instructions)
echo A3:   2. UPGRADE project to latest settings.
echo A3:       (e.g. Win10 SDK and v142 toolset for VS 2019)
echo A3:   3. BUILD project (F7).
echo A3:       (build fails if config_vs not run as admin)
echo A3:   4. CLOSE VS when build is finished.
echo A3:       (confirm success first by building again)
echo A3:   5. DO NOT CLOSE this console/cmd window.
echo A3:       (it is still working and will close on its own)
echo A3:   6. HAVE FUN!
echo A3:       (you know you will)

echo A3: Opening config project...
echo A3: DO NOT CLOSE THIS CONSOLE/CMD WINDOW

rem open solution file
".\%cfgproj%.sln"

echo A3: Closed config project...
echo A3: Cleaning config project directory...

rem revert project file and clean directory
hg revert -C ".\%cfgproj%.vcxproj"
del /q /f ".\*.user"
rd /q /s ".\build"
rd /q /s ".\lib"
rd /q /s ".\.vs"

echo A3: END CONFIG_VS
rem pause