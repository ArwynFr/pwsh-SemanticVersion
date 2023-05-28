function Step-SemVer {
  [CmdletBinding()]
  [OutputType([semver])]
  param (
    [Parameter(ValueFromPipeline)]
    [semver]
    $Version,

    [Parameter(Mandatory)]
    [ValidateSet('major', 'minor', 'patch')]
    [string]
    $BumpType,

    [Parameter()]
    [string]
    $PreRelease = '',

    [Parameter()]
    [string]
    $Build = ''
  )

  Process {

    if ('major' -eq $BumpType) {
      return [semver]::new($Version.Major + 1, 0, 0, $PreRelease, $Build)
    }

    if ('minor' -eq $BumpType) {
      return [semver]::new($Version.Major, $Version.Minor + 1, 0, $PreRelease, $Build)
    }
    
    return [semver]::new($Version.Major, $Version.Minor, $Version.Patch + 1, $PreRelease, $Build)
  }
}