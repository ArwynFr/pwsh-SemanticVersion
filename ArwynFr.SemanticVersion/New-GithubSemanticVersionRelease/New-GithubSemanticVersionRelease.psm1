function New-GithubSemanticVersionRelease {
  [CmdletBinding(SupportsShouldProcess)]
  [OutputType([semver])]
  param (
    [Parameter()]
    [switch]
    $AddTags
  )
  
  $CurrentVersion = (gh release view --json tagName | ConvertFrom-Json).tagName
  $Increment = [string] (git log -1 --pretty=%B) | ConvertTo-SemanticVersionStep
  $TargetVersion = $CurrentVersion | Step-SemanticVersion -BumpType $Increment -PreRelease $PreRelease
  
  "Increment      = $Increment" | Write-Verbose
  "CurrentVersion = $CurrentVersion" | Write-Verbose
  "TargetVersion  = $TargetVersion" | Write-Verbose
  
  if ($PSCmdlet.ShouldProcess($TargetVersion, 'gh release create')) {
    gh release create $TargetVersion --generate-notes
  }

  if ($AddTags -and $PSCmdlet.ShouldProcess($TargetVersion, 'git tags major / minor versions')) {
    git tag --force "v$($TargetVersion.Major).$($TargetVersion.Minor)"
    git tag --force "v$($TargetVersion.Major)"
    git push origin --tags --force
  }

  $TargetVersion
}
