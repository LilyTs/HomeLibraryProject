program HomeLibrary;

uses
  Forms,
  UMainFrom in 'UMainFrom.pas' {MainForm},
  UAddEditPubHouseForm in 'UAddEditPubHouseForm.pas' {AddEditPubHouseForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'My Library';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddEditPubHouseForm, AddEditPubHouseForm);
  AddEditPubHouseForm.Hide;
  Application.Run;
end.
