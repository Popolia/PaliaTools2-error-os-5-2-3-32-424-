@echo off
setlocal enabledelayedexpansion

rem Déterminer la langue du système (Determining the system language)
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Nls\Language" /v InstallLanguage ^| findstr /i "InstallLanguage"') do (
    set langue=%%a
)

rem Supprimer la clé de registre en fonction de la langue (Delete the registry key depending on the language)
if "!langue!"=="040C" (
    set "cle_de_registre=HKEY_CURRENT_USER\SOFTWARE\Singularity6"
) else if "!langue!"=="0409" (
    set "cle_de_registre=HKEY_CURRENT_USER\SOFTWARE\Singularity6"
) else (
    echo The system language is not supported.
    pause
    exit /b 1
)

rem Supprimer la clé de registre Singularity6 (Delete the Singularity6 registry key)
reg delete "!cle_de_registre!" /f

rem Vérifier si la suppression a réussi (Check if the deletion was successful)
if %errorlevel% equ 0 (
    echo Successful removal of the Singularity6 registry key.
) else (
    echo Deletion of the Singularity6 registry key has failed.
)

rem Supprimer la clé de registre Palia (Delete the Palia registry key)
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Palia" /f

rem Vérifier si la suppression a réussi (Check if the deletion was successful)
if %errorlevel% equ 0 (
    echo Successful removal of the Palia registry key.
) else (
    echo Deletion of the Palia registry key failed.
)

pause
