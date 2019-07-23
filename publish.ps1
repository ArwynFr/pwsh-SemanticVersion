#Requires -Module StepSemVer

if($null -ne (Find-Module StepSemVer -ErrorAction SilentlyContinue) {
    $CurrentVersion = (Find-Module StepSemVer).Version
    $HasMajor = $(Build.SourceVersionMessage) -like '*#major*'
    $HasMinor = $(Build.SourceVersionMessage) -like '*#minor*'
    $Version = Step-SemVer $CurrentVersion -Major:$HasMajor -Minor:$HasMinor -Build -Revision "$(Date:yyMMdd)$(Rev:rr)"

    $File = .\StepSemVer\StepSemVer.psd1
    $Before = 'ModuleVersion[^\n]*'
    $After = "ModuleVersion = '$Version'"
    (Get-Content $File -Raw) -replace $Before,$After | Set-Content $File
}

Publish-Module -Path .\StepSemVer -NuGetApiKey "$env:NUGET_API_KEY"