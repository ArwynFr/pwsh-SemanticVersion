@{
    Author            = 'Arwyn'
    CompanyName       = 'www.gsri.team'
    Copyright         = '(c) 2019-2023 - ArwynFr - MIT license'

    ModuleVersion     = '0.1.0'
    GUID              = 'b4209e98-7072-45f3-bb89-ce520a182558'
    Description       = 'StepSemVer pwsh module used to increment semantic versions number.'
    HelpInfoURI       = 'https://github.com/ArwynFr/pwsh-StepSemVer#readme'
    
    PrivateData       = @{
        ProjectUri = 'https://github.com/ArwynFr/pwsh-StepSemVer'
        LicenseUri = 'https://github.com/ArwynFr/pwsh-StepSemVer/blob/main/LICENSE'
    }

    RootModule        = 'StepSemVer.psm1'
    FunctionsToExport = @(
        'Step-SemVer'
    )
}