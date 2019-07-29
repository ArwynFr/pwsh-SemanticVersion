<#
.SYNOPSIS

Returns a semantic version that increments an existing value.

.DESCRIPTION

This command takes an existing semantic version and returns its next value.

.PARAMETER Build
Increments the build number (third value). This switch is ignored if **Minor**
or **Major** switch are present.

.PARAMETER Major
Increments the major version number (first value) and sets **Minor** and
**Build** numbers to zero.

.PARAMETER Minor
Increments the minor version number (second value) and sets **Build** number
to zero. This switch  is ignored if **Major** is present.

.PARAMETER Revision
Sets the revision number (fourth value) to this value. Should the value be
equal or lesser than the original version, it is incremented.

.PARAMETER Version
The previous semantic version number that shall be incremented by the command.

.INPUTS
None. You cannot pipe objects to Step-SemVer.

.OUTPUTS
System.Version. Step-Version returns an incremented value from the given
**Version** number.

.EXAMPLE

PS> Step-SemVer -Version '1.2.3.1245' -Minor -Revision 1785

Major  Minor  Build  Revision
-----  -----  -----  --------
1      3      0      1785

.LINK

https://github.com/ArwynFr/StepSemVer
#>
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
