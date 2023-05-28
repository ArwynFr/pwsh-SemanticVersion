InModuleScope StepSemVer {
    Describe 'Step-SemVer' {
        Context 'Major' {
            It 'Increment majors properly' {
                Step-SemVer 1.2.3 -BumpType major | Should -Be 2.0.0
            }
            It 'Supports piping the version' {
                ([semver] '1.2.3') | Step-SemVer -BumpType major | Should -Be 2.0.0
            }
        }
        Context 'Minor' {
            It 'Increment minors properly' {
                Step-SemVer 1.2.3 -BumpType minor | Should -Be 1.3.0
            }
            It 'Supports piping the version' {
                ([semver] '1.2.3') | Step-SemVer -BumpType minor | Should -Be 1.3.0
            }
        }
        Context 'Patch' {
            It 'Increment build properly' {
                Step-SemVer 1.2.3 -BumpType patch | Should -Be 1.2.4
            }
            It 'Supports piping the version' {
                ([semver] '1.2.3') | Step-SemVer -BumpType patch | Should -Be 1.2.4
            }
        }
    }
}