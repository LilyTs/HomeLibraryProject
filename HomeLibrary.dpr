program HomeLibrary;

uses
  Forms,
  UMainFrom in 'UMainFrom.pas' {MainForm},
  SQLStrings in 'SQLStrings.pas',
  UAddEditFriendForm in 'UAddEditFriendForm.pas' {AddEditFriendForm},
  UAddEditBookForm in 'UAddEditBookForm.pas' {AddEditBookForm},
  UAddEditGenreForm in 'UAddEditGenreForm.pas' {AddEditGenreForm},
  USearchBookForm in 'USearchBookForm.pas' {SearchBookForm},
  USearchFriendForm in 'USearchFriendForm.pas' {SearchFriendForm},
  USearchGenreForm in 'USearchGenreForm.pas' {SearchGenreForm},
  USearchPubHouseForm in 'USearchPubHouseForm.pas' {SearchPubHouseForm},
  UAddEditBorrowingForm in 'UAddEditBorrowingForm.pas' {AddEditBorrowingForm},
  UAddEditPubHouseForm in 'UAddEditPubHouseForm.pas' {AddEditPubHouseForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'My Library';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddEditPubHouseForm, AddEditPubHouseForm);
  Application.ShowMainForm := True;
  Application.CreateForm(TAddEditFriendForm, AddEditFriendForm);
  Application.CreateForm(TAddEditBookForm, AddEditBookForm);
  Application.CreateForm(TAddEditGenreForm, AddEditGenreForm);
  Application.CreateForm(TSearchBookForm, SearchBookForm);
  Application.CreateForm(TSearchFriendForm, SearchFriendForm);
  Application.CreateForm(TSearchGenreForm, SearchGenreForm);
  Application.CreateForm(TSearchPubHouseForm, SearchPubHouseForm);
  Application.CreateForm(TAddEditBorrowingForm, AddEditBorrowingForm);
  //Application.CreateForm(TAddEditPubHouseForm, AddEditPubHouseForm);
  Application.Run;
end.
