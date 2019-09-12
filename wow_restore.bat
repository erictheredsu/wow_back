rem wow_backup.bat backup characters.sql and GatherMate.lua for Wow
rem notice: the file should be put to the same place with 7z.exe and 7z.dll

rem set variables
set gather_file_path="D:\Eric\entertainment\games\wow\World of Warcraft\WTF\Account\ERIC\SavedVariables\GatherMate.lua"
set mysql_path=C:\mnt\MGCN\mysql\bin

rem copy GatherMate to the folder 
copy /Y .\GatherMate.lua %gather_file_path%

rem dump sql from mysql
rem set path=%path%;%mysql_path%
rem mysqldump -u mangos -pmangos characters > characters.sql

rem pause
