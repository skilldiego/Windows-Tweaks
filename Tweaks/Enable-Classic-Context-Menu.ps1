# Run this script in PowerShell

$registryPathCLSID = "HKCU:\Software\Classes\CLSID"
$clsidKey = "{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}"
$inprocServer32Key = "InprocServer32"

# Explanation
Write-Host "----------------------------------------------------------------" -ForegroundColor Cyan
Write-Host "                       EXPLANATION                              " -ForegroundColor Cyan
Write-Host "----------------------------------------------------------------" -ForegroundColor Cyan
Write-Host "This script creates specific registry keys under HKCU:\Software\Classes\CLSID."
Write-Host "It creates the key '$clsidKey' and a subkey '$inprocServer32Key' within it."
Write-Host "The (Default) value of 'InprocServer32' will be left blank."
Write-Host "----------------------------------------------------------------" -ForegroundColor Cyan

# Pause for user to read
Write-Host "Press any key to apply this tweak (or Ctrl+C to cancel)..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Logic
try {
    # Create the CLSID key
    $fullClsidPath = Join-Path -Path $registryPathCLSID -ChildPath $clsidKey
    New-Item -Path $fullClsidPath -Force | Out-Null
    Write-Host "Created registry path: $fullClsidPath" -ForegroundColor Green

    # Create the InprocServer32 subkey with a blank (Default) value
    $fullInprocServer32Path = Join-Path -Path $fullClsidPath -ChildPath $inprocServer32Key
    New-Item -Path $fullInprocServer32Path -Force | Out-Null
    Write-Host "Created registry path: $fullInprocServer32Path with blank (Default) value." -ForegroundColor Green
} catch {
    Write-Error "Failed to create registry keys: $_"
}

Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")