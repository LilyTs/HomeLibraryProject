program HomeLibrary;

uses
  Forms,
  UMainFrom in 'UMainFrom.pas' {MainForm},
  UAddEditPubHouseForm in 'UAddEditPubHouseForm.pas' {AddEditPubHouseForm},
  SQLStrings in 'SQLStrings.pas',
  UAddEditFriendForm in 'UAddEditFriendForm.pas' {AddEditFriendForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'My Library';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddEditPubHouseForm, AddEditPubHouseForm);
  Application.CreateForm(TAddEditFriendForm, AddEditFriendForm);
  AddEditPubHouseForm.Hide;
  AddEditFriendForm.Hide;
  Application.Run;
end.
