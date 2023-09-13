# Déterminer la langue du système (Determining the system language)
$language = Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Nls\Language" | Select-Object -ExpandProperty InstallLanguage

# Supprimer la clé de registre en fonction de la langue (Delete the registry key depending on the language)
if ($language -eq "040C" -or $language -eq "0409" -or $language -eq "0809") {
    $registryKey = "HKCU:\SOFTWARE\Singularity6"
} else {
    Write-Host "The system language is not supported. Supported languages are: 040C (French), 0409 (English US), and 0809 (English UK)."
    pause
    exit 1
}

# Supprimer la clé de registre Singularity6 (Delete the Singularity6 registry key)
Remove-Item -Path $registryKey -Force -ErrorAction SilentlyContinue

# Vérifier si la suppression a réussi (Check if the deletion was successful)
if ($LASTEXITCODE -eq 0) {
    Write-Host "Successful removal of the Singularity6 registry key."
} else {
    Write-Host "Deletion of the Singularity6 registry key has failed."
}

# Supprimer la clé de registre Palia (Delete the Palia registry key)
Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Palia" -Force -ErrorAction SilentlyContinue

# Vérifier si la suppression a réussi (Check if the deletion was successful)
if ($LASTEXITCODE -eq 0) {
    Write-Host "Successful removal of the Palia registry key."
} else {
    Write-Host "Deletion of the Palia registry key failed."
}

pause
