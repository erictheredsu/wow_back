rem wow_backup.bat backup characters.sql and GatherMate.lua for Wow
rem notice: the file should be put to the same place with 7z.exe and 7z.dll

rem set variables
set gather_file_path="D:\Eric\entertainment\games\wow\World of Warcraft\WTF\Account\ERIC\SavedVariables\GatherMate.lua"
set mysql_path=C:\mnt\MGCN\mysql\bin

rem make stamps
rem cut off fractional seconds
set t=%time:~0,8%
rem replace colons with dashes
rem set t=%t::=%
set d=%DATE:~3,4%-%DATE:~8,2%-%DATE:~11,2%
set TimeStemp=%d%-%t%
rem remove spaces
set TimeStemp=%TimeStemp: =%
set commit_name=backup-%TimeStemp%
echo %commit_name%

rem delete old files
rem del /Q characters.sql
rem del /Q GatherMate.lua

rem dump sql from mysql
rem set path=%path%;%mysql_path%
rem mysqldump -u mangos -pmangos characters > characters.sql

rem copy files to the folder 
rem copy /Y %gather_file_path% .

rem submit to git repo
git pull
git add .
rem git cm "%commit_name%"
git cm "backup-2019-09-10-1:13:27"
git push

rem pause
