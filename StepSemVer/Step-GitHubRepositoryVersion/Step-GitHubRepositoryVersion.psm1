function Step-GitHubRepositoryVersion {
  [CmdletBinding()]
  [OutputType([semver])]
  param (
    [Parameter()]
    [string]
    $PreRelease
  )

  Process {

    $CurrentVersion = (gh release view --json tagName | ConvertFrom-Json).tagName
    $CommitMessage = [string] (git log -1 --pretty=%B)
    $Increment = $CommitMessage | ConvertTo-SemanticVersionStep
    $TargetVersion = $CurrentVersion | Step-SemanticVersion -BumpType $Increment -PreRelease $PreRelease

    "Increment type: $Increment" | Write-Verbose
    "Current version: $CurrentVersion" | Write-Verbose
    "Target version: $TargetVersion" | Write-Verbose

    $TargetVersion
  }
}