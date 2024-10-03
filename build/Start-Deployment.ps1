[CmdletBinding(SupportsShouldProcess)]
param ()

$RootPath = Join-Path $PSScriptRoot .. | Convert-Path
$ModulePath = Join-Path $RootPath ArwynFr.SemanticVersion
Import-Module $ModulePath -Force

$TargetVersion = New-GithubSemanticVersionRelease -WhatIf:$WhatIfPreference -AddTags
Get-ChildItem $ModulePath -Recurse -Filter *.psd1 | ForEach-Object {
  Update-ModuleManifest -ModuleVersion $TargetVersion -Path $_ -WhatIf:$WhatIfPreference
}

Publish-Module -Path $ModulePath -NuGetApiKey $env:PSGALLERY_APIKEY -WhatIf:$WhatIfPreference
