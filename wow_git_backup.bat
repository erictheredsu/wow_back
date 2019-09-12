rem wow_git_backup.bat backup characters.sql and GatherMate.lua for Wow
rem notice: the file should be put to the same place with characters.sql and GatherMate.lua
rem and git must prepare and pull finish

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
set path=%path%;%mysql_path%
mysqldump -u mangos -pmangos characters > characters.sql

rem copy files to the folder 
copy /Y %gather_file_path% .

rem submit to git repo
rem git pull	rem !!!this step should finish before backup!!!
git add .
git cm "%commit_name%"
git push

rem pause
