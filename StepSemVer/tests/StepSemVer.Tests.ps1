InModuleScope StepSemVer {
    Describe 'Step-SemVer' {
        Context 'Major' {
            It 'Increment majors properly' {
                Step-SemVer 1.2.3.4 -Major | Should Be 2.0.0.0
            }
            It 'Majors overrides other properly' {
                Step-SemVer 1.2.3.4 -Major -Minor -Build -Revision 7 | Should Be 2.0.0.7
            }
        }
        Context 'Minor' {
            It 'Increment minors properly' {
                Step-SemVer 1.2.3.4 -Minor | Should Be 1.3.0.0
            }
            It 'Minor overrides other properly' {
                Step-SemVer 1.2.3.4 -Minor -Build -Revision 7 | Should Be 1.3.0.7
            }
        }
        Context 'Build' {
            It 'Increment build properly' {
                Step-SemVer 1.2.3.4 -Build | Should Be 1.2.4.0
            }
            It 'Increment build properly with revision' {
                Step-SemVer 1.2.3.4 -Build -Revision 7 | Should Be 1.2.4.7
            }
        }
        Context 'Revision' {
            It 'Increment revision properly' {
                Step-SemVer 1.2.3.4 | Should Be 1.2.3.5
            }
            It 'Increment old revision properly' {
                Step-SemVer 1.2.3.4 -Revision 2 | Should Be 1.2.3.5
            }
            It 'Increment newer revision properly' {
                Step-SemVer 1.2.3.4 -Revision 6 | Should Be 1.2.3.6
            }
        }
    }
}