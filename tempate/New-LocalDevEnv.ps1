$configurationFilePath = Join-Path $PSScriptRoot 'build-settings.json'
if (Test-Path $configurationFilePath) {
    $NewDevContainerPath = Join-Path $env:TEMP 'New-LocalDevEnv.ps1'
    Set-Content -Path $NewDevContainerPath -Value (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/gunnargestsson/bcbuildtemplate/master/scripts/New-LocalDevEnv.ps1").Content -Encoding UTF8 -Force
    . $NewDevContainerPath -configurationFilePath $configurationFilePath -scriptToStart $NewDevContainerPath
}
else {
    Throw "Configuration file 'build-settings.json' not found in current path"
}
