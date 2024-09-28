PaliaTools2
Del_registre_singularity 6

This is the latest version, it works for error OS codes 5, 2, 3, 32, and 424: Documentation

The following images come from a user who tested the tool to demonstrate what happens: this will delete the game and the registry.

I had it tested on a French user other than myself to explain the process to you; the procedure is the same in English. The images are there just to show you the process, as an image is worth a thousand words.

    ⚠️ The images are a little dated, as everything is now translated into English on the .bat site.

image
Why am I getting this message?

To answer your question about a .bat file: most computers report .bat files downloaded from the internet as extremely dangerous and prevent you from running them. This is why it is often preferable to create your own file. I'll provide you with the .bat file for convenience, but there's nothing to stop you from reading it if you have any doubts—it's normal in today's world.
How do I view the file?

In GitHub, simply left-click on Del_registre_singularity 6.bat.

image image image image image
Script de suppression de clés de registre

batch

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

Notes

    Assurez-vous d'exécuter le script en tant qu'administrateur pour qu'il puisse effectuer les modifications nécessaires.
    Pour toute question ou problème, n'hésitez pas à demander de l'aide.
