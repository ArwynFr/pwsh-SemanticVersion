function ConvertTo-SemanticVersionStep {
  [CmdletBinding()]
  [OutputType([string])]
  param (
    [Parameter(Mandatory, ValueFromPipeline)]
    [string]
    $CommitMessage
  )

  Process {
    switch -Wildcard ($CommitMessage) {
      '*+semver: major*' { 'major' }
      '*+semver: minor*' { 'minor' }
      Default { 'patch' }
    }
  }
}
