
@ECHO OFF
REM Main
ECHO Is running the Minecraft Unlocker ...
CALL :MakeSure
CALL :SLEEP 5
ECHO.
ECHO This program will attempt to unlock Minecraft.  This is NOT a virus.
ECHO However, failure may result in errors with the Microsoft Marketplace, Minecraft, or both.
ECHO.
CALL :SLEEP 2
SET /P "confirmation=Do you wish to proceed? (Y/N): "
IF /I "%confirmation%" NEQ "Y" (
    ECHO Operation cancelled.
    EXIT /B 1
)
ECHO Proceeding...
CALL :SLEEP 2
ECHO.
CALL :IOBitDelete "%WINDIR%\System32\Windows.ApplicationModel.Store.dll"
CALL :SLEEP 2
CALL :IOBitDelete "%WINDIR%\SysWOW64\Windows.ApplicationModel.Store.dll"
CALL :SLEEP 2
CALL :IOBitCopy "%~dp0source\System32\Windows.ApplicationModel.Store.dll" "%WINDIR%\System32\"
CALL :SLEEP 2
CALL :IOBitCopy "%~dp0source\SysWOW64\Windows.ApplicationModel.Store.dll" "%WINDIR%\SysWOW64\"
CALL :SLEEP 3
ECHO Minecraft has been successfully opened!Have a nice play!
ECHO.
ECHO Credits:
ECHO YouTube: Aliyo Ariel
ECHO GitHub: aliyoariel
CALL :SLEEP 3
start "" "https://www.youtube.com/@aliyoariel"

REM Functions
:SLEEP
ping 127.0.0.1 -n %~1 -w 1000 > NUL
GOTO :EOF

:IOBitDelete
SET "file_path=%~1"
"%~dp0source\IObit Unlocker\IObitUnlocker.exe" /Delete /Advanced "%file_path%"
GOTO :EOF

:IOBitCopy
SET "file_path=%~1"
SET "dir_path=%~2"
"%~dp0source\IObit Unlocker\IObitUnlocker.exe" /Copy /Advanced "%file_path%" "%dir_path%"
GOTO :EOF

:MakeSure
SET "file_path1=%~dp0source\System32\Windows.ApplicationModel.Store.dll"
SET "file_path2=%~dp0source\SysWOW64\Windows.ApplicationModel.Store.dll"
SET "iobit=%~dp0source\IObit Unlocker\IObitUnlocker.exe"
IF EXIST "%iobit%" (
        IF EXIST "%file_path1%" (
            IF EXIST "%file_path2%" (
                GOTO :EOF
            ) ELSE (
                ECHO The file "%file_path2%" was not found.
                EXIT /B 1
            )
        ) ELSE (
            ECHO The file "%file_path1%" was not found.
            EXIT /B 1
        )
    ) ELSE (
        ECHO The file "%iobit%" was not found.
        EXIT /B 1
    )
GOTO :EOF

