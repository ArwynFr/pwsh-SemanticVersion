[CmdletBinding()]
param ()

$RootPath = Convert-Path $PSScriptRoot/..
$ModulePath = Convert-Path $RootPath/StepSemVer

Import-Module -Force Pester
Import-Module -Force PSScriptAnalyzer
Import-Module -Force $ModulePath

Test-ModuleManifest $ModulePath/StepSemVer.psd1
Invoke-ScriptAnalyzer -Recurse -Severity Warning $ModulePath

$configuration = [PesterConfiguration]@{
  Run          = @{
    Path = "$RootPath/tests/"
  }
  CodeCoverage = @{
    CoveragePercentTarget = 100
    Enabled               = $true
    Path                  = "$ModulePath/StepSemVer.psm1"
    OutputPath            = "$RootPath/coverage.xml"
  }
  TestResult   = @{
    Enabled    = $true
    OutputPath = "$RootPath/output.xml"
  }
}

Invoke-Pester -Configuration $configuration