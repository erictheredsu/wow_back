@echo off
rem this file is for environment set
set workspace=company
if "%workspace%" == "home" (goto HOME) else (goto COMPANY)

:HOME
set gather_file_path="E:\Game_Gallery\World of Warcraft\WTF\Account\ERIC\SavedVariables\GatherMate.lua"
set mysql_path=E:\Game_Gallery\MGCN\mysql\bin
set region=en

goto display

:COMPANY
set gather_file_path="D:\Eric\entertainment\games\wow\World of Warcraft\WTF\Account\ERIC\SavedVariables\GatherMate.lua"
set mysql_path=C:\mnt\MGCN\mysql\bin
set region=en

:display
echo workspace is %workspace%
echo gather_file_path is %gather_file_path%
echo mysql_path is %mysql_path%
echo region is %region%