@{
  Author            = 'ArwynFr'
  CompanyName       = 'www.arwyn.fr'
  Copyright         = '(c) 2019-2023 - ArwynFr - MIT license'

  ModuleVersion     = '0.1.0'
  GUID              = 'b4209e98-7072-45f3-bb89-ce520a182558'
  Description       = 'A powershell module used to increment semantic version numbers'
  HelpInfoURI       = 'https://github.com/ArwynFr/pwsh-SemanticVersion#readme'
    
  PrivateData       = @{
    ProjectUri = 'https://github.com/ArwynFr/pwsh-SemanticVersion'
    LicenseUri = 'https://github.com/ArwynFr/pwsh-SemanticVersion/blob/main/LICENSE'
  }

  NestedModules     = @(
    'ConvertTo-SemanticVersionStep/ConvertTo-SemanticVersionStep.psd1'
    'Step-SemanticVersion/Step-SemanticVersion.psd1'
  )

  FunctionsToExport = @(
    'ConvertTo-SemanticVersionStep'
    'Step-SemanticVersion'
  )
}