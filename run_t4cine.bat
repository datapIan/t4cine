@echo off
set gamepath=G:\SteamLibrary\steamapps\common\Call of Duty World at War
cd /D %LOCALAPPDATA%\Plutonium
start /wait /abovenormal bin\plutonium-bootstrapper-win32.exe t4mp "%gamepath%" -lan +name "name" +set fs_game "mods/mp_t4cine" 