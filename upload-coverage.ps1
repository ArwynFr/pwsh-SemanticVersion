[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$LatestUrl = 'https://api.github.com/repos/codacy/codacy-coverage-reporter/releases/latest'
$DownloadUrl = (Invoke-WebRequest -Uri $LatestUrl | ConvertFrom-Json).assets[1].browser_download_url
Invoke-WebRequest $DownloadUrl -OutFile codacy-coverage-reporter
& ./codacy-coverage-reporter report --language Powershell --force-language --report coverage.xml