InModuleScope ArwynFr.SemanticVersion {
  Describe 'ConvertTo-SemanticVersionStep' {
    Context 'Major' {
      It 'Finds major semver message' {
        ConvertTo-SemanticVersionStep -CommitMessage 'fix: test +semver: major another' | Should -Be 'major'
      }
      It 'Supports piping the message' {
        'fix: test +semver: major another' | ConvertTo-SemanticVersionStep | Should -Be 'major'
      }
      It 'Supports multiline messages' {
        ([string]"fix: test

        +semver: major") | ConvertTo-SemanticVersionStep | Should -Be 'major'
      }
    }
    Context 'Minor' {
      It 'Finds minor semver message' {
        ConvertTo-SemanticVersionStep -CommitMessage 'fix: test +semver: minor another' | Should -Be 'minor'
      }
      It 'Supports piping the message' {
        'fix: test +semver: minor another' | ConvertTo-SemanticVersionStep | Should -Be 'minor'
      }
      It 'Supports multiline messages' {
        ([string]"fix: test

        +semver: minor") | ConvertTo-SemanticVersionStep | Should -Be 'minor'
      }
    }
    Context 'Patch' {
      It 'Defaults to patch semver message' {
        ConvertTo-SemanticVersionStep -CommitMessage 'fix: test +another: major another' | Should -Be 'patch'
      }
      It 'Supports piping the message' {
        'fix: test +another: major another' | ConvertTo-SemanticVersionStep | Should -Be 'patch'
      }
      It 'Supports multiline messages' {
        ([string]"fix: test

        +another: major") | ConvertTo-SemanticVersionStep | Should -Be 'patch'
      }
    }
  }
}