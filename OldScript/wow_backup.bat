rem wow_backup.bat backup characters.sql and GatherMate.lua for Wow
rem notice: the file should be put to the same place with 7z.exe and 7z.dll

rem set variables
set gather_file_path="D:\Eric\entertainment\games\wow\World of Warcraft\WTF\Account\ERIC\SavedVariables\GatherMate.lua"
set mysql_path=C:\mnt\MGCN\mysql\bin

rem make stamps
rem cut off fractional seconds
set t=%time:~0,8%
rem replace colons with dashes
set t=%t::=-%
set d=%date:~0,10%
rem replace slashes with dashes
set d=%d:/=-%
set TimeStemp=%d%-%t%
rem remove spaces
set TimeStemp=%TimeStemp: =%

set folder_name=save_%TimeStemp%
rem set characters_name=characters_%TimeStemp%.sql
rem set GatherMate_name=GatherMate_%TimeStemp%.lua
rem echo %characters_name%
rem echo %GatherMate_name%

rem dump sql from mysql
set path==%path%;%mysql_path%
mysqldump -u mangos -pmangos characters > characters.sql

rem copy files to target folder and zip
mkdir %folder_name%
copy %gather_file_path% .\%folder_name%\
copy characters.sql .\%folder_name%\characters.sql
7z.exe a %folder_name%.zip %folder_name% 

del /Q .\%folder_name%\*.*
rmdir .\%folder_name%\
rem cd.>characters.sql
del /Q characters.sql
rem pause
