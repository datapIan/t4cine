@echo off
md "%localappdata%\Activision\CoDWaW\mods"
xcopy /s "%cd%\mp_t4cine" "%localappdata%\Activision\CoDWaW\mods\mp_t4cine\"
echo t4cine (steam) installed successfully.
pause