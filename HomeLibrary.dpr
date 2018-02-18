program HomeLibrary;

uses
  Forms,
  UMainFrom in 'UMainFrom.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
