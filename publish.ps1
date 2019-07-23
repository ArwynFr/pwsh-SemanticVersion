# $HasMajor = $(Build.SourceVersionMessage) -like '*#major*'
# $HasMinor = $(Build.SourceVersionMessage) -like '*#minor*'
# $CurrentVersion = (Find-Module StepSemVer).Version
# $Version = Step-SemVer $CurrentVersion -Major:$HasMajor -Minor:$HasMinor -Build -Revision "$(Date:yyMMdd)$(Rev:rr)"

Publish-Module -Path .\StepSemVer -NuGetApiKey "$env:NUGET_API_KEY"