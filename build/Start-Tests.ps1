[CmdletBinding()]
param ()

$RootPath = Join-Path $PSScriptRoot .. | Convert-Path
$ModulePath = Join-Path $RootPath StepSemVer
$Manifest = Join-Path $ModulePath StepSemVer.psd1
$TestsPath = Join-Path $RootPath tests
$Coverage = Join-Path $RootPath coverage.xml
$Output = Join-Path $RootPath output.xml

Import-Module -Force Pester
Import-Module -Force PSScriptAnalyzer
Import-Module -Force $ModulePath

Test-ModuleManifest $Manifest
Invoke-ScriptAnalyzer -Recurse -Severity Warning $ModulePath

$configuration = [PesterConfiguration]@{
  Run          = @{
    Path = $TestsPath
  }
  CodeCoverage = @{
    Enabled    = $true
    Path       = Get-ChildItem $ModulePath -Recurse -Include *.psm1
    OutputPath = $Coverage
  }
  TestResult   = @{
    Enabled    = $true
    OutputPath = $Output
  }
}

Invoke-Pester -Configuration $configuration