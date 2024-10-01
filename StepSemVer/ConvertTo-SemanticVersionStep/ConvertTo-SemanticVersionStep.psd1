@{
  Author            = 'Arwyn'
  CompanyName       = 'www.arwyn.fr'
  Copyright         = '(c) 2019-2024 - ArwynFr - MIT license'

  ModuleVersion     = '0.1.0'
  GUID              = '100363b2-37c6-4f16-b887-cf494ecade26'
  Description       = 'StepSemVer pwsh module used to increment semantic versions number.'
  HelpInfoURI       = 'https://github.com/ArwynFr/pwsh-StepSemVer#readme'
    
  PrivateData       = @{
    ProjectUri = 'https://github.com/ArwynFr/pwsh-StepSemVer'
    LicenseUri = 'https://github.com/ArwynFr/pwsh-StepSemVer/blob/main/LICENSE'
  }

  RootModule        = 'ConvertTo-SemanticVersionStep.psm1'
  FunctionsToExport = @(
    'ConvertTo-SemanticVersionStep'
  )
}