Install-Module Pester -Force
Import-Module $PSScriptRoot/../StepSemVer -Force

$configuration = [PesterConfiguration]@{
  Run          = @{
    Path = "$PSScriptRoot/../tests/"
  }
  CodeCoverage = @{
    Enabled    = $true
    Path       = "$PSScriptRoot/../StepSemVer/StepSemVer.psm1"
    OutputPath = "$PSScriptRoot/../coverage.xml"
  }
  TestResult   = @{
    Enabled    = $true
    OutputPath = "$PSScriptRoot/../output.xml"
  }
}

Invoke-Pester -Configuration $configuration