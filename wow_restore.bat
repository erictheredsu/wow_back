rem wow_restore.bat restore characters.sql and GatherMate.lua for Wow
rem notice: the file should be put to the same place with characters.sql and GatherMate

@echo off
set /p UserInput=are you sure restore all backup (Y/N)? 
IF [%UserInput%] EQU  [n]  ( GOTO:EOF)

rem set variables
set gather_file_path="D:\Eric\entertainment\games\wow\World of Warcraft\WTF\Account\ERIC\SavedVariables\GatherMate.lua"
set mysql_path=C:\mnt\MGCN\mysql\bin

rem copy GatherMate to the folder 
copy /Y .\GatherMate.lua %gather_file_path%

rem restore dump to mysql
set path=%path%;%mysql_path%
mysql -u mangos --password="mangos" characters  < characters.sql

echo restore finish!
rem pause
