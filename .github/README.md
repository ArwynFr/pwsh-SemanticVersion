# StepSemVer
*   [![GitHub](https://img.shields.io/badge/-GitHub-lightgrey)](https://github.com/ArwynFr/StepSemVer) [![Azure DevOps](https://img.shields.io/badge/-Azure_DevOps-lightgrey)](https://dev.azure.com/chezsquall/StepSemVer/) [![Codacy](https://img.shields.io/badge/-Codacy-lightgrey)](https://app.codacy.com/project/ArwynFr/ArwynFr-StepSemVer/dashboard) [![PSGallery](https://img.shields.io/badge/-PowerShell_Gallery-lightgrey)](https://www.powershellgallery.com/packages/StepSemVer)
*   ![GitHub commit activity](https://img.shields.io/github/commit-activity/m/ArwynFr/StepSemVer) ![GitHub last commit](https://img.shields.io/github/last-commit/ArwynFr/StepSemVer)
*   ![Azure DevOps builds](https://img.shields.io/azure-devops/build/chezsquall/StepSemVer/16) ![Azure DevOps tests](https://img.shields.io/azure-devops/tests/chezsquall/StepSemVer/16) ![Codacy grade](https://img.shields.io/codacy/grade/6e61a35671824660b1b0d2f87af41213)
*   ![PowerShell Gallery](https://img.shields.io/powershellgallery/v/StepSemVer) ![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/StepSemVer)

## What is StepSemVer

StepSemVer is a small powershell module that adds a command to increment semantic version numbers.

## Rules and standards

The following documents provide additional information on rules and standards applying to this project :

*   [MIT License](/LICENSE)
*   [Code of conduct](CODE_OF_CONDUCT.md)
*   [Contributing to this project](CONTRIBUTING.md)

## How to use the module

This module contains a single command :

### Step-SemVer

Returns a semantic version that increments an existing value.

```Powershell
Step-SemVer
  [-Version] <Version>
  [-Major]
  [-Minor]
  [-Build]
  [-Revision <Int32>][<CommonParameters>]
```

#### Parameters

`-Build`
Increments the build number (third value). This switch is ignored if **Minor** or **Major** switch are present.

`-Major`
Increments the major version number (first value) and sets **Minor** and **Build** numbers to zero.

`-Minor`
Increments the minor version number (second value) and sets **Build** number to zero. This switch  is ignored if **Major** is present.

`-Revision`
Sets the revision number (fourth value) to this value. Should the value be equal or lesser than the original version, it is incremented.

`-Version`
The previous semantic version number that shall be incremented by the command.

## Where do I get help

_We are currently in the process of writing this documentation._
