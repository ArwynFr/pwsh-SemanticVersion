Install-Module Pester -Force
Import-Module .\StepSemVer -Force
Invoke-Pester .\StepSemVer\tests\*.Tests.ps1 -CodeCoverage .\StepSemVer\functions\*.ps1 -OutputFile output.xml -CodeCoverageOutputFile coverage.xml

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$LatestUrl = 'https://api.github.com/repos/codacy/codacy-coverage-reporter/releases/latest'
$DownloadUrl = (Invoke-WebRequest -Uri $LatestUrl | ConvertFrom-Json).assets[1].browser_download_url
Invoke-WebRequest $DownloadUrl -OutFile codacy-coverage-reporter
& ./codacy-coverage-reporter --language PowerShell --force-language --report coverage.xml