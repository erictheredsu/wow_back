rem wow_restore.bat restore characters.sql and GatherMate.lua for Wow
rem notice: the file should be put to the same place with characters.sql and GatherMate

@echo off
set /p UserInput=are you sure restore all backup (Y/N)? 
IF [%UserInput%] EQU  [n]  ( GOTO:EOF)

rem set variables
call env.bat

git pull

rem copy GatherMate to the folder 
copy /Y .\GatherMate.lua %gather_file_path%
echo copy GatherMate.lua finish!

rem restore dump to mysql
set path=%path%;%mysql_path%
mysql -u mangos --password="mangos" characters  < characters.sql
echo restore mysql finish!

echo restore finish!
pause
