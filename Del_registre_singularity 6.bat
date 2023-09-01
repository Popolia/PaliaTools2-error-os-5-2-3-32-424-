@echo off
setlocal enabledelayedexpansion

rem Déterminer la langue du système
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Nls\Language" /v InstallLanguage ^| findstr /i "InstallLanguage"') do (
    set langue=%%a
)

rem Supprimer la clé de registre en fonction de la langue
if "!langue!"=="040C" (
    set "cle_de_registre=HKEY_CURRENT_USER\SOFTWARE\Singularity6"
) else if "!langue!"=="0409" (
    set "cle_de_registre=HKEY_CURRENT_USER\SOFTWARE\Singularity6"
) else (
    echo La langue du système n'est pas prise en charge.
    pause
    exit /b 1
)

rem Supprimer la clé de registre Singularity6
reg delete "!cle_de_registre!" /f

rem Vérifier si la suppression a réussi
if %errorlevel% equ 0 (
    echo Suppression de la clé de registre Singularity6 réussie.
) else (
    echo La suppression de la clé de registre Singularity6 a échoué.
)

rem Supprimer la clé de registre Palia
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Palia" /f

rem Vérifier si la suppression a réussi
if %errorlevel% equ 0 (
    echo Suppression de la clé de registre Palia réussie.
) else (
    echo La suppression de la clé de registre Palia a échoué.
)

pause
