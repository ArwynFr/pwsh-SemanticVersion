InModuleScope StepSemVer {
  Describe 'Step-GitHubRepositoryVersion' {
    Context 'No pre-release' {
      It 'Returns a semver' {
        Step-GitHubRepositoryVersion | Should -BeOfType [semver]
      }
      It 'Returns a release semver' {
        (Step-GitHubRepositoryVersion).PreReleaseLabel | Should -BeNullOrEmpty
      }
    }
    Context 'Pre-release' {
      It 'Returns a semver' {
        Step-GitHubRepositoryVersion -PreRelease test | Should -BeOfType [semver]
      }
      It 'Returns a release semver' {
        (Step-GitHubRepositoryVersion -PreRelease test).PreReleaseLabel | Should -Be 'test'
      }
    }
  }
}