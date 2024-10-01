InModuleScope StepSemVer {
  Describe 'Step-SemanticVersion' {
    Context 'Major' {
      It 'Increment majors properly' {
        Step-SemanticVersion 1.2.3 -BumpType major | Should -Be 2.0.0
      }
      It 'Supports piping the version' {
        '1.2.3' | Step-SemanticVersion -BumpType major | Should -Be 2.0.0
      }
    }
    Context 'Minor' {
      It 'Increment minors properly' {
        Step-SemanticVersion 1.2.3 -BumpType minor | Should -Be 1.3.0
      }
      It 'Supports piping the version' {
        '1.2.3' | Step-SemanticVersion -BumpType minor | Should -Be 1.3.0
      }
    }
    Context 'Patch' {
      It 'Increment build properly' {
        Step-SemanticVersion 1.2.3 -BumpType patch | Should -Be 1.2.4
      }
      It 'Supports piping the version' {
        '1.2.3' | Step-SemanticVersion -BumpType patch | Should -Be 1.2.4
      }
    }
  }
}