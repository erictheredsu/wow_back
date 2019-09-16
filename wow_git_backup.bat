@echo off
rem wow_git_backup.bat backup characters.sql and GatherMate.lua for Wow
rem notice: the file should be put to the same place with characters.sql and GatherMate.lua
rem and git must prepare and pull finish

rem set variables
call env.bat

rem if "%region%"=="en" (goto Stamp_EN) else goto Stamp_CN

rem make stamps eg: 2019-09-13 or  2019/09/13 Th, 
rem in Control panel->region set short date to yyyy-MM-dd will work, not relevent to Chinese or US
set t=%time:~0,8%
rem replace colons with dashes
rem set t=%t::=-%
set d=%date:~0,10%
rem replace slashes with dashes
set d=%d:/=-%
set TimeStemp=%d%-%t%
rem remove spaces
set TimeStemp=%TimeStemp: =%
set commit_name=backup-%TimeStemp%
echo %commit_name%

goto dojob

:dojob
echo "dump sql and copy lur, then push to github..."

goto:eof

rem delete old files
rem del /Q characters.sql
rem del /Q GatherMate.lua

rem dump sql from mysql
set path=%path%;%mysql_path%
mysqldump -u mangos -pmangos characters > characters.sql

rem copy files to the folder 
copy /Y %gather_file_path% .

rem goto:eof

rem submit to git repo
rem git pull	rem !!!this step should finish before backup!!!
git add GatherMate.lua
git add characters.sql
git commit -m "%commit_name%"
git push

rem pause
