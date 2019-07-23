function Step-SemVer {
    param(
        [Parameter(Position = 0, Mandatory = $true)]
        [version]$Version,
        [switch]$Major,
        [switch]$Minor,
        [switch]$Build,
        [int]$Revision = 0
    )

    if ($true -eq $Major) { return [version]"$($Version.Major+1).0.0.$Revision" }
    elseif ($true -eq $Minor) { return [version]"$($Version.Major).$($Version.Minor+1).0.$Revision" }
    elseif ($true -eq $Build) { return [version]"$($Version.Major).$($Version.Minor).$($Version.Build+1).$Revision" }
    elseif ($Revision -gt $Version.Revision) { return [version]"$($Version.Major).$($Version.Minor).$($Version.Build).$Revision" }
    return [version]"$($Version.Major).$($Version.Minor).$($Version.Build).$($Version.Revision+1)"
}
