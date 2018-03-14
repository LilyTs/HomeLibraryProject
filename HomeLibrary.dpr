program HomeLibrary;

uses
  Forms,
  UMainFrom in 'UMainFrom.pas' {MainForm},
  UAddEditPubHouseForm in 'UAddEditPubHouseForm.pas' {AddEditPubHouseForm},
  SQLStrings in 'SQLStrings.pas',
  UAddEditFriendForm in 'UAddEditFriendForm.pas' {AddEditFriendForm},
  UAddEditBookForm in 'UAddEditBookForm.pas' {AddEditBookForm},
  UAddEditGenreForm in 'UAddEditGenreForm.pas' {AddEditGenreForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'My Library';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddEditPubHouseForm, AddEditPubHouseForm);
  Application.CreateForm(TAddEditFriendForm, AddEditFriendForm);
  Application.CreateForm(TAddEditBookForm, AddEditBookForm);
  Application.CreateForm(TAddEditGenreForm, AddEditGenreForm);
  AddEditPubHouseForm.Hide;
  AddEditFriendForm.Hide;
  AddEditBookForm.Hide;
  Application.Run;
end.
