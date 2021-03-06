; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{D116D76E-F7C6-48E9-905B-CB4D3295C6FC}
AppName=pptTeX
AppVerName={code:app} Ver.1.4
AppPublisher=Takuto NAITO
AppPublisherURL=http://naitaku.github.io/pptTeX/
AppSupportURL=http://naitaku.github.io/pptTeX/
AppUpdatesURL=http://naitaku.github.io/pptTeX/
DefaultDirName={pf}\{code:app}
DefaultGroupName={code:app}
DisableProgramGroupPage=no
OutputBaseFilename=pptTeX
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: ".\pptTeX.ppam"; DestDir: "{app}"; Flags: ignoreversion uninsrestartdelete
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
Root: HKCU; Subkey: "Software\Microsoft\Office\{code:ver}\PowerPoint\AddIns\{code:app}"; ValueType: string; ValueName: "Path"; ValueData: "{app}\pptTeX.ppam"
Root: HKCU; Subkey: "Software\Microsoft\Office\{code:ver}\PowerPoint\AddIns\{code:app}"; ValueType: dword; ValueName: "AutoLoad"; ValueData: 1
Root: HKCU; Subkey: "Software\VB and VBA Program Settings\{code:app}"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Microsoft\Office\{code:ver}\PowerPoint\AddIns\{code:app}"; Flags: uninsdeletekey

[Icons]
Name: "{group}\{cm:UninstallProgram,{code:app}}"; Filename: "{uninstallexe}"

[Code]
Const
  APPNAME = 'pptTeX';
var
  Version : String;


function InitializeSetup(): Boolean;
begin
  if RegQueryStringValue(HKEY_CLASSES_ROOT, 'PowerPoint.Application\CurVer', '', Version) then
  begin
    StringChange(Version, 'PowerPoint.Application.', '')
    Version := Version + '.0'
    Result := True;
  end else
  begin
    MsgBox(APPNAME + ' requires PowerPoint 2007.', mbError, MB_OK);
    Result := False;
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  tmppath :String;
begin
  if CurUninstallStep = usUninstall then
  begin
       if RegQueryStringValue(HKEY_CURRENT_USER, 'Software\VB and VBA Program Settings\'+ APPNAME +'\Pref', 'TempPath', tmppath) then
       begin
        if MsgBox('Are you sure you want to conpletely remove ' + tmppath, mbConfirmation, MB_YESNO) = IDYES then
        begin
          DelTree(tmppath, True, True, True);
        end;
       end;
  end;
end;



function app(Param: String): String;
begin
  Result := APPNAME
end;

function ver(Param: String): String;
begin
  Result := Version
end;


