
set NAME=%REZ_BUILD_PROJECT_NAME%
set VER=%REZ_BUILD_PROJECT_VERSION:-beta=%

set PREBUILT_STASH=%~dp0stash
set PREBUILT_ZIP=go%VER%.windows-amd64.zip
set PREBUILT_URL=https://dl.google.com/go/%PREBUILT_ZIP%

set PREFIX_DIR=%REZ_BUILD_PATH%\pkg
set UNZIP_DIR=%REZ_BUILD_PATH%\unzip
set EMPTY_DIR=%REZ_BUILD_PATH%\empty

if not exist %PREFIX_DIR% mkdir "%PREFIX_DIR%"
if not exist %UNZIP_DIR% mkdir "%UNZIP_DIR%"
if not exist %EMPTY_DIR% mkdir "%EMPTY_DIR%"

echo.Download Prebuilt
if not exist %PREBUILT_STASH%\%PREBUILT_ZIP% call :PULL_PREBUILT %PREBUILT_URL% %PREBUILT_STASH%
call :UNZIP %PREBUILT_STASH%\%PREBUILT_ZIP% %EMPTY_DIR% %UNZIP_DIR% %PREFIX_DIR%

if "%~1"=="" exit /b 0

call robocopy %PREFIX_DIR% %REZ_BUILD_INSTALL_PATH% /MIR /R:3 /W:1
exit /b 0

:: =======================================================
:: Functions

:PULL_PREBUILT
pushd %~2
curl -O %~1
popd
EXIT /B 0

:UNZIP
robocopy %~2 %~3 /MIR /R:3 /W:1
7za x %~1 -o%~3 -aos
robocopy %~3\go %~4 /MIR /R:3 /W:1
EXIT /B 0
