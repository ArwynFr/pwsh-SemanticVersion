[CmdletBinding(SupportsShouldProcess)]
param ()


$RootPath = Join-Path $PSScriptRoot .. | Convert-Path
$ModulePath = Join-Path $RootPath ArwynFr.SemanticVersion

Import-Module $ModulePath -Force
$CurrentVersion = (gh release view --json tagName | ConvertFrom-Json).tagName
$CommitMessage = [string] (git log -1 --pretty=%B)
$Increment = $CommitMessage | ConvertTo-SemanticVersionStep
$TargetVersion = $CurrentVersion | Step-SemanticVersion -BumpType $Increment -PreRelease $PreRelease

"Increment      = $Increment" | Write-Verbose
"CurrentVersion = $CurrentVersion" | Write-Verbose
"TargetVersion  = $TargetVersion" | Write-Verbose

Get-ChildItem $ModulePath -Recurse -Filter *.psd1 | ForEach-Object {
  Update-ModuleManifest -ModuleVersion $TargetVersion -Path $_ -WhatIf:$WhatIfPreference
}

Publish-Module -Path $ModulePath -NuGetApiKey $env:PSGALLERY_APIKEY -WhatIf:$WhatIfPreference

if ($PSCmdlet.ShouldProcess($TargetVersion, 'gh release create')) {
  gh release create $TargetVersion --generate-notes
  git tag --force "v$($TargetVersion.Major).$($TargetVersion.Minor)"
  git tag --force "v$($TargetVersion.Major)"
  git push origin --tags --force
}