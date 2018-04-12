@echo off

rem ----------------------------------------------------------------------------

rem Define required Zep version:
set ZEP_VER=1.15

rem Iff installed at nonstandard location, define installation location here:
rem set ZEP_DIR=C:\zep

rem ----------------------------------------------------------------------------

title Zep Console Window
color F0
mode 100,40

if "%ZEP_DIR%" == "" goto SKIP1
set INITIAL_ZEP_DIR=%ZEP_DIR%
if exist "%ZEP_DIR%\%ZEP_VER%\bin\zep.exe" goto SET_PATH
:SKIP1

set ZEP_DIR=%HOMEDRIVE%%HOMEPATH%\zep
if exist "%ZEP_DIR%\%ZEP_VER%\bin\zep.exe" goto SET_PATH

set ZEP_DIR=%USERPROFILE%\zep
if exist "%ZEP_DIR%\%ZEP_VER%\bin\zep.exe" goto SET_PATH

set ZEP_DIR=%PROGRAMFILES%\zep
if exist "%ZEP_DIR%\%ZEP_VER%\bin\zep.exe" goto SET_PATH

if not exist "%PROGRAMFILES(x86)%" goto SKIP2
set ZEP_DIR=%PROGRAMFILES(x86)%\zep
if exist "%ZEP_DIR%\%ZEP_VER%\bin\zep.exe" goto SET_PATH
:SKIP2

set ZEP_DIR=%ALLUSERSPROFILE%\zep
if exist "%ZEP_DIR%\%ZEP_VER%\bin\zep.exe" goto SET_PATH

set ZEP_DIR=

echo.
echo Unable to locate Zep %ZEP_VER% on your system. Tested following folders:
if "%INITIAL_ZEP_DIR%" == "" goto SKIP3
echo   %INITIAL_ZEP_DIR%\
:SKIP3
echo   %HOMEDRIVE%%HOMEPATH%\zep\
if "%USERPROFILE%" == "%HOMEDRIVE%%HOMEPATH%" goto SKIP4
echo   %USERPROFILE%\zep\
:SKIP4
echo   %PROGRAMFILES%\zep\
if not exist "%PROGRAMFILES(x86)%" goto SKIP5
echo   %PROGRAMFILES(x86)%\zep\
:SKIP5
echo   %ALLUSERSPROFILE%\zep\
echo.
echo Please install Zep %ZEP_VER% to any of these locations or, in case you
echo already have installed it (or want to install it) at a different
echo location, then define the installation location in windows-terminal.bat.
echo.
echo For example if you have installed Zep %ZEP_VER% at C:\MyStuff\zep, then
echo edit windows-terminal.bat and change this line:
echo   rem set ZEP_DIR=C:\zep
echo to
echo   set ZEP_DIR=C:\MyStuff\zep
echo and try again.
echo.
echo.

goto READY

:SET_PATH
rem PATH=%PATH%;%ZEP_DIR%\%ZEP_VER%\bin
PATH=%ZEP_DIR%\%ZEP_VER%\bin;%PATH%

:READY
cmd
