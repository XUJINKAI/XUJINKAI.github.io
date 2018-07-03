@echo by XUJINKAI
@echo off

set /p title=ÊäÈë±êÌâ: 
set dt=%date:~,4%-%date:~5,2%-%date:~8,2%
set time0=%time: =0%
set hms=%time0:~,2%:%time0:~3,2%:%time0:~6,2%
set fd=_posts
set file=%dt%-%title%.md
set fpath="%fd%/%file%"

echo --->> %fpath%
echo permalink: >> %fpath%
echo display: normal>> %fpath%
echo title: %title%>> %fpath%
echo tags: >> %fpath%
echo emotag: >> %fpath%
echo date: %dt% %hms% +08:00>> %fpath%
echo comment: true>> %fpath%
echo layout: post>> %fpath%
echo --->> %fpath%
echo ^<!--more--^>>> %fpath%

start "" "%fpath%"