using Nuke.Common;
using Nuke.Common.Git;
using Nuke.Common.IO;
using Nuke.Common.Tooling;
using Nuke.Common.Tools.OctoVersion;
using Nuke.Common.Tools.Pwsh;

internal class Build : NukeBuild
{
    public static int Main() => Execute<Build>(x => x.Test);

    [Secret, Parameter] private readonly string NuGetApiKey;

    [OctoVersion(AutoDetectBranch = true)] private readonly OctoVersionInfo OctoVersionInfo;
    [PathVariable] private readonly Tool Gh;
    [PathVariable] private readonly Tool Git;
    [GitRepository] readonly GitRepository Repository;

    private const string ModuleName = "StepSemVer";
    private AbsolutePath TestScriptPath => RootDirectory / "tests" / "Start-Tests.ps1";
    private AbsolutePath ModulePath => RootDirectory / ModuleName;
    private AbsolutePath ManifestPath => ModulePath / $"{ModuleName}.psd1";

    Target Test => _ => _.Executes(() => PwshTasks.Pwsh(_ => _.AddFileArguments(TestScriptPath)));

    Target Publish => _ => _
        .Requires(() => NuGetApiKey)
        .DependsOn(Test)
        .Executes(() =>
        {
            PwshTasks.Pwsh(_ => _.SetCommand($"Update-ModuleManifest -ModuleVersion {OctoVersionInfo.FullSemVer} -Path {ManifestPath}"));
            PwshTasks.Pwsh(_ => _.SetCommand($"Publish-Module -Path {ModulePath} -NuGetApiKey {NuGetApiKey}"));
            Gh($"release create {OctoVersionInfo.FullSemVer} --generate-notes");
            Git($@"tag --force ""v{OctoVersionInfo.Major}.{OctoVersionInfo.Minor}""");
            Git($@"tag --force ""v{OctoVersionInfo.Major}""");
            Git($@"push {Repository.RemoteName} --tags --force");
        });

}
