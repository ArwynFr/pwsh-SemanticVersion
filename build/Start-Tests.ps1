[CmdletBinding()]
param ()

$RootPath = Join-Path $PSScriptRoot .. | Convert-Path
$ModulePath = Join-Path $RootPath ArwynFr.SemanticVersion
$Manifest = Join-Path $ModulePath ArwynFr.SemanticVersion.psd1
$TestsPath = Join-Path $RootPath tests
$Coverage = Join-Path $RootPath coverage.xml
$Output = Join-Path $RootPath output.xml

Import-Module -Force Pester
Import-Module -Force PSScriptAnalyzer
Import-Module -Force $ModulePath

Test-ModuleManifest $Manifest
Invoke-ScriptAnalyzer -Recurse -Severity Warning $ModulePath

$Exclusions = @(
  # Reason: would require test/mock GitHub repositories
  'New-GithubSemanticVersionRelease.psm1'
)

$Files = Get-ChildItem $ModulePath -Recurse -Include *.psm1 -Exclude $Exclusions

$configuration = [PesterConfiguration]@{
  Run          = @{ Path = $TestsPath }
  TestResult   = @{
    Enabled    = $true
    OutputPath = $Output
  }
  CodeCoverage = @{
    CoveragePercentTarget = 100
    Enabled               = $true
    Path                  = $Files
    OutputPath            = $Coverage
  }
}

Invoke-Pester -Configuration $configuration
