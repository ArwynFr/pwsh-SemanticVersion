#Requires -Module StepSemVer

$HasMajor = $(Build.SourceVersionMessage) -like '*#major*'
$HasMinor = $(Build.SourceVersionMessage) -like '*#minor*'
$CurrentVersion = (Find-Module $ModuleName).Version
$Version = Step-SemVer $CurrentVersion -Major:$HasMajor -Minor:$HasMinor -Build -Revision "$(Date:yyMMdd)$(Rev:rr)"
Publish-Module .\StepSemVer -NuGetApiKey $(NuGetApiKey) -FormatVersion $Version