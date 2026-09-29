#define MyAppName "ClassiPod"
#define MyAppPublisher "Adeeteya"
#define MyAppPublisherURL "https://github.com/adeeteya/"
#define MyAppURL "https://github.com/adeeteya/Classipod"
#define MyAppExeName "Classipod.exe"
#define MyAppContact "adeeteya@gmail.com"
#define MyAppCopyright "Copyright (C) 2025 Adeeteya"
#define Workspace GetEnv("GITHUB_WORKSPACE")

[Setup]
AppId={{94F37DBE-FC81-4E38-B1F1-701EEE9C3D0A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppPublisherURL}
AppSupportURL={#MyAppURL}
AppReadmeFile={#MyAppURL}/README.md
AppUpdatesURL={#MyAppURL}/releases/latest
AppComments={#MyAppName}
AppContact={#MyAppContact}
AppCopyright={#MyAppCopyright}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputDir={#Workspace}
OutputBaseFilename=Classipod-Windows
SetupIconFile={#Workspace}\windows\runner\resources\app_icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
VersionInfoProductName={#MyAppName}
VersionInfoDescription={#MyAppName} Setup
VersionInfoCompany={#MyAppPublisher}
VersionInfoVersion={#MyAppVersion}.0
VersionInfoProductTextVersion={#MyAppVersion}
VersionInfoCopyright={#MyAppCopyright}
UninstallDisplayIcon={app}\{#MyAppExeName}
UninstallDisplayName={#MyAppName}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#Workspace}\build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{app}\uninstall-{#MyAppName}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
; Hive databases (including library_v1, playlists, exclusions and Subsonic).
; Only remove app data here: users may also put music in this directory.
Type: files; Name: "{userdocs}\ClassiPod\*.hive"
Type: files; Name: "{userdocs}\ClassiPod\*.hivec"
Type: files; Name: "{userdocs}\ClassiPod\*.lock"
Type: filesandordirs; Name: "{userdocs}\ClassiPod\artwork-v1"
Type: dirifempty; Name: "{userdocs}\ClassiPod"
; Preferences share this directory with secure storage; preserve other files.
Type: files; Name: "{userappdata}\com.adeeteya\classipod\shared_preferences.json"
Type: dirifempty; Name: "{userappdata}\com.adeeteya\classipod"
Type: filesandordirs; Name: "{localappdata}\com.adeeteya\classipod"
; just_audio's temporary directory is shared: remove only our cached asset.
Type: files; Name: "{%TEMP}\just_audio_cache\assets\assets\sounds\ipod_click.wav"
