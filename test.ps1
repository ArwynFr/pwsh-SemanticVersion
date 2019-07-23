Install-Module Pester -Force
Import-Module .\StepSemVer -Force
Invoke-Pester .\StepSemVer\tests\*.Tests.ps1 -CodeCoverage .\StepSemVer\functions\*.ps1  -CodeCoverageOutputFile coverage.xml -OutputFile output.xml
