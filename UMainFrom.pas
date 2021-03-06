unit UMainFrom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IB, ExtCtrls, DBCtrls, Grids, DBGrids, IBDatabase,
  IBCustomDataSet, IBTable, IniFiles, IBQuery, ComCtrls, IBUpdateSQL,
  ActnList, ImgList, ToolWin, SQLStrings, AppEvnts, DB, IBSQL, IBStoredProc;

type
  TMainForm = class(TForm)
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    ibqGenres: TIBQuery;
    ibqBorrowings: TIBQuery;
    dsrcGenres: TDataSource;
    dsrcBorrowings: TDataSource;
    ibqBooks: TIBQuery;
    dsrcBooks: TDataSource;
    ibqFriends: TIBQuery;
    dsrcFriends: TDataSource;
    ibqPubHouses: TIBQuery;
    dsrcPubHouses: TDataSource;
    ImageList: TImageList;
    actListPubHouses: TActionList;
    actAddPubHouse: TAction;
    actDeletePubHouse: TAction;
    actEditPubHouse: TAction;
    actRefreshPubHouses: TAction;
    IBTransactionUpdatePubHouses: TIBTransaction;
    PageControl: TPageControl;
    tsMain: TTabSheet;
    dbgridBorrowings: TDBGrid;
    dbnavBorrowings: TDBNavigator;
    tsBooks: TTabSheet;
    dbnavBooks: TDBNavigator;
    tsFriends: TTabSheet;
    dbgridFriends: TDBGrid;
    dbnavFriends: TDBNavigator;
    tsGenres: TTabSheet;
    dbgridGenres: TDBGrid;
    dbnavGenres: TDBNavigator;
    tsPubHouses: TTabSheet;
    dbgridPubHouses: TDBGrid;
    dbnavPubHouses: TDBNavigator;
    toolBarPubHouses: TToolBar;
    btnAddPubHouse: TToolButton;
    btnDeletePubHouse: TToolButton;
    btnEditPubHouse: TToolButton;
    btnRefreshPubHouses: TToolButton;
    toolBarFriends: TToolBar;
    btnAddFriend: TToolButton;
    btnDeleteFriend: TToolButton;
    btnEditFriend: TToolButton;
    btnRefreshFriends: TToolButton;
    actListFriends: TActionList;
    actAddFriend: TAction;
    actDeleteFriend: TAction;
    actEditFriend: TAction;
    actRefreshFriends: TAction;
    IBTransactionUpdateFriends: TIBTransaction;
    toolBarBooks: TToolBar;
    btnAddBook: TToolButton;
    btnDeleteBook: TToolButton;
    btnEditBook: TToolButton;
    btnRefreshBook: TToolButton;
    ibqUpdateBooks: TIBQuery;
    IBTransactionUpdateBooks: TIBTransaction;
    actListBooks: TActionList;
    actAddBook: TAction;
    actDeleteBook: TAction;
    actEditBook: TAction;
    actRefreshBooks: TAction;
    toolBarGenres: TToolBar;
    btnAddGenre: TToolButton;
    btnDeleteGenre: TToolButton;
    btnEditGenre: TToolButton;
    btnRefreshGenres: TToolButton;
    actListGenres: TActionList;
    ibqUpdateGenres: TIBQuery;
    IBTransactionUpdateGenres: TIBTransaction;
    actAddGenre: TAction;
    actDeleteGenre: TAction;
    actEditGenre: TAction;
    actRefreshGenres: TAction;
    btnSearchBook: TToolButton;
    actSearchBook: TAction;
    ApplicationEvents: TApplicationEvents;
    ibqGenresForBook: TIBQuery;
    btnSearchFriends: TToolButton;
    actSearchFriend: TAction;
    actSearchPubHouse: TAction;
    btnSearchPubHouse: TToolButton;
    actSearchGenre: TAction;
    btnSearchGenre: TToolButton;
    ibqUpdateBookGenre: TIBQuery;
    IBTransactionUpdateBookGenre: TIBTransaction;
    toolBarBorrowings: TToolBar;
    btnAddBorrowing: TToolButton;
    btnDeleteBorrowing: TToolButton;
    btnEditBorrowing: TToolButton;
    btnRefreshBorrowings: TToolButton;
    btnSearchBorrowings: TToolButton;
    actListBorrowings: TActionList;
    ibqUpdateBorrowings: TIBQuery;
    IBTransactionUpdateBorrowings: TIBTransaction;
    actAddBorrowing: TAction;
    actDeleteBorrowing: TAction;
    actEditBorrowing: TAction;
    actRefreshBorrowings: TAction;
    actSearchBorrowings: TAction;
    dbgridBooks: TDBGrid;
    IBDataSetPubHouses: TIBDataSet;
    IBDataSetFriends: TIBDataSet;
    IBStoredProcGenreChilds: TIBStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAddPubHouseExecute(Sender: TObject);
    procedure actDeletePubHouseExecute(Sender: TObject);
    procedure actEditPubHouseExecute(Sender: TObject);
    procedure actAddFriendExecute(Sender: TObject);
    procedure actRefreshFriendsExecute(Sender: TObject);
    procedure actRefreshPubHousesExecute(Sender: TObject);
    procedure actDeleteFriendExecute(Sender: TObject);
    procedure actEditFriendExecute(Sender: TObject);
    procedure actAddBookExecute(Sender: TObject);
    procedure actAddGenreExecute(Sender: TObject);
    procedure actDeleteGenreExecute(Sender: TObject);
    procedure actRefreshGenresExecute(Sender: TObject);
    procedure actEditGenreExecute(Sender: TObject);
    procedure actSearchBookExecute(Sender: TObject);
    procedure actRefreshBooksExecute(Sender: TObject);
    procedure actDeleteBookExecute(Sender: TObject);
    procedure actEditBookExecute(Sender: TObject);
    procedure actSearchFriendExecute(Sender: TObject);
    procedure actSearchGenreExecute(Sender: TObject);
    procedure actSearchPubHouseExecute(Sender: TObject);
    procedure actAddBorrowingExecute(Sender: TObject);
    procedure actRefreshBorrowingsExecute(Sender: TObject);
    procedure actEditBorrowingExecute(Sender: TObject);
    procedure actDeleteBorrowingExecute(Sender: TObject);
    procedure actSearchBorrowingsExecute(Sender: TObject);
  private
    procedure InitDataSetsQueries;
  public
    procedure MyIdle(Sender: TObject; var Done: boolean);
  end;

var
  MainForm: TMainForm;
  Name: string;

implementation

uses UAddEditPubHouseForm, UAddEditFriendForm, UAddEditBookForm,
     UAddEditGenreForm, USearchBookForm, USearchFriendForm,
  USearchGenreForm, USearchPubHouseForm, UAddEditBorrowingForm,
  USearchBorrowingsForm, UFriendsDAL;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
var IniFile: TIniFile;
begin
  ApplicationEvents.OnIdle := MyIdle;
  PageControl.ActivePage := tsMain;
  try
    IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)
      + 'Config.ini');
    try
      IBDatabase.DatabaseName := IniFile.ReadString('Base', 'Path', '');
    finally
      IniFile.Free;
    end;
    IBDatabase.Connected := true;
    IBTransaction.StartTransaction;
    InitDataSetsQueries;
    with ibqGenres do
      begin
        SQL.Text := sqlGetGenresWithParentName; 
        Open;
      end; 
    with ibqBorrowings do
      begin
        SQL.Text := sqlGetBorrowings;
        Open;
      end;
    with ibqBooks do
      begin
        SQL.Text := sqlGetBooksWithPubHouseAndGenres;
        Open;
        First;
      end;
    with ibqFriends do
      begin
        SQL.Text := sqlGetFriends;
        Open;
      end;
    with ibqPubHouses do
      begin
        SQL.Text := sqlGetPubHouses;
        Open;
      end;
  except
    on E: EIBInterBaseError do
      begin
        Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
        Halt;
      end;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ibqGenres.Close;
  ibqBorrowings.Close;
  ibqBooks.Close;
  ibqFriends.Close;
  ibqPubHouses.Close;
  ibqGenresForBook.Close;
  IBDataSetPubHouses.Close;
  IBDataSetFriends.Close;
  IBDatabase.Close;
end;

procedure TMainForm.actAddPubHouseExecute(Sender: TObject);
begin
  AddEditPubHouseForm.SetIsNew(True);
  AddEditPubHouseForm.Show;
end;

procedure TMainForm.actDeletePubHouseExecute(Sender: TObject);
begin
  if MessageDlg('Delete this record?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    if MessageDlg('Books of this publishing house will be automatically deleted. Do you want to continue?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
      with IBDataSetPubHouses do
        try
          Open;
          Locate('PubHouse_id', ibqPubHouses.FieldValues['PubHouse_id'], []);
          Delete;
          Transaction.Commit;
          actRefreshPubHousesExecute(self);
          actRefreshBooksExecute(self);
        except on E: EIBInterBaseError do
          begin
            if Transaction.Active then
              Transaction.Rollback;
            Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
          end;
        end;
end;

procedure TMainForm.actEditPubHouseExecute(Sender: TObject);
begin
  AddEditPubHouseForm.SetIsNew(False);
  AddEditPubHouseForm.Show;
end;

procedure TMainForm.actAddFriendExecute(Sender: TObject);
begin
  AddEditFriendForm.SetIsNew(True);
  AddEditFriendForm.Show;
end;

procedure TMainForm.actRefreshFriendsExecute(Sender: TObject);
begin
  try
    ibqFriends.Close;
    ibqFriends.SQL.Text := sqlGetFriends;
    ibqFriends.Open;
  except on E: EIBInterBaseError do
    begin
      Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
    end;
  end;
end;

procedure TMainForm.actRefreshPubHousesExecute(Sender: TObject);
begin
  try
    ibqPubHouses.Close;
    ibqPubHouses.SQL.Text := sqlGetPubHouses;
    ibqPubHouses.Open;
  except on E: EIBInterBaseError do
    begin
      Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
    end;
  end;
end;

procedure TMainForm.actDeleteFriendExecute(Sender: TObject);
begin
  if MessageDlg('Delete this record?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    if MessageDlg('Borrowings to this friend will be automatically deleted. Do you want to continue?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
      UFriendsDAL.Delete(ibqFriends.FieldValues['Friend_id']);
end;

procedure TMainForm.actEditFriendExecute(Sender: TObject);
begin
  AddEditFriendForm.SetIsNew(False);
  AddEditFriendForm.Show;
end;

procedure TMainForm.actAddBookExecute(Sender: TObject);
begin
  AddEditBookForm.setIsNew(True);
  AddEditBookForm.Show;
end;

procedure TMainForm.actAddGenreExecute(Sender: TObject);
begin
  AddEditGenreForm.SetIsNew(true);
  AddEditGenreForm.Show;
end;

procedure TMainForm.actDeleteGenreExecute(Sender: TObject);
begin
  if MessageDlg('Delete this record?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    with ibqUpdateGenres do
      begin
        try
          Close;
          SQL.Text := sqlDeleteGenre;
          ParamByName('Genre_id').AsInteger := dbgridGenres.DataSource.DataSet.Fields.Fields[0].Value;
          Transaction.StartTransaction;
          ExecSQL;
          Transaction.Commit;
          actRefreshGenresExecute(self);
          actRefreshBooksExecute(self);
        except on E: EIBInterBaseError do
          begin
            if Transaction.Active then
              Transaction.Rollback;
            Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
          end;
        end;
      end;
end;

procedure TMainForm.actRefreshGenresExecute(Sender: TObject);
begin   
  with ibqGenres do
    begin
      Close;
      SQL.Text := sqlGetGenresWithParentName; 
      Open;
    end
end;

procedure TMainForm.actEditGenreExecute(Sender: TObject);
begin
  AddEditGenreForm.SetIsNew(False);
  AddEditGenreForm.Show;
end;

procedure TMainForm.actSearchBookExecute(Sender: TObject);
begin
  SearchBookForm.Show;
end;

procedure TMainForm.actRefreshBooksExecute(Sender: TObject);
begin
  with ibqBooks do
    begin
      Close;
      SQL.Text := sqlGetBooksWithPubHouseAndGenres;
      Open;
    end;
end;

procedure TMainForm.MyIdle(Sender: TObject; var Done: boolean);
begin
  Done := True;
  actDeleteBook.Enabled := not ibqBooks.IsEmpty;
  actEditBook.Enabled := actDeleteBook.Enabled;
  actSearchBook.Enabled := actDeleteBook.Enabled;
  actDeleteFriend.Enabled := not ibqFriends.IsEmpty;
  actEditFriend.Enabled := actDeleteFriend.Enabled;
  actSearchFriend.Enabled := actDeleteFriend.Enabled;
  actDeleteGenre.Enabled := not ibqGenres.IsEmpty;
  actEditGenre.Enabled := actDeleteGenre.Enabled;
  actSearchGenre.Enabled := actDeleteGenre.Enabled;
  actDeletePubHouse.Enabled := not ibqPubHouses.IsEmpty;
  actEditPubHouse.Enabled := actDeletePubHouse.Enabled;
  actSearchPubHouse.Enabled := actDeletePubHouse.Enabled;
  actDeleteBorrowing.Enabled := not ibqBorrowings.IsEmpty;
  actEditBorrowing.Enabled := actDeleteBorrowing.Enabled;
  actSearchBorrowings.Enabled := actDeleteBorrowing.Enabled;
end;

procedure TMainForm.actDeleteBookExecute(Sender: TObject);
begin
  if MessageDlg('Borrowings of this book will be automatically deleted. Do you want to continue?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    with ibqUpdateBooks do
      begin
        try
          Close;
          SQL.Text := sqlDeleteBook;
          ParamByName('Book_id').AsInteger := dbgridBooks.DataSource.DataSet.Fields.Fields[0].Value;
          Transaction.StartTransaction;
          ExecSQL;
          Transaction.Commit;
          actRefreshBooksExecute(self);
          actRefreshBorrowingsExecute(self);
        except on E: EIBInterBaseError do
          begin
            if Transaction.Active then
              Transaction.Rollback;
            Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
          end;
        end;
      end;
end;

procedure TMainForm.actEditBookExecute(Sender: TObject);
begin
  AddEditBookForm.SetIsNew(False);
  AddEditBookForm.Show;
end;

procedure TMainForm.actSearchFriendExecute(Sender: TObject);
begin
  SearchFriendForm.Show;
end;

procedure TMainForm.actSearchGenreExecute(Sender: TObject);
begin
  SearchGenreForm.Show;
end;

procedure TMainForm.actSearchPubHouseExecute(Sender: TObject);
begin
  SearchPubHouseForm.Show;
end;

procedure TMainForm.actAddBorrowingExecute(Sender: TObject);
begin
  AddEditBorrowingForm.SetIsNew(True);
  AddEditBorrowingForm.Show;
end;

procedure TMainForm.actRefreshBorrowingsExecute(Sender: TObject);
begin
  with ibqBorrowings do
    begin
      Close;
      SQL.Text := sqlGetBorrowings;
      Open;
    end;
end;

procedure TMainForm.actEditBorrowingExecute(Sender: TObject);
begin
  AddEditBorrowingForm.SetIsNew(False);
  AddEditBorrowingForm.Show;
end;

procedure TMainForm.actDeleteBorrowingExecute(Sender: TObject);
begin
  if MessageDlg('Delete this record?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    with ibqUpdateBorrowings do
      begin
        try
          Close;
          SQL.Text := sqlDeleteBorrowing;
          ParamByName('Book_id').AsInteger := MainForm.dbgridBooks.DataSource.DataSet.Lookup('Name', MainForm.dbgridBorrowings.DataSource.DataSet.Fields.Fields[0].Value, 'Book_id');
          ParamByName('Friend_id').AsInteger := MainForm.dbgridFriends.DataSource.DataSet.Lookup('FIO', MainForm.dbgridBorrowings.DataSource.DataSet.Fields.Fields[1].Value, 'Friend_id');
          ParamByName('BorrowDate').AsDate := MainForm.dbgridBorrowings.DataSource.DataSet.Fields.Fields[2].Value;
          Transaction.StartTransaction;
          ExecSQL;
          Transaction.Commit;
          actRefreshBorrowingsExecute(self);
        except on E: EIBInterBaseError do
          begin
            if Transaction.Active then
              Transaction.Rollback;
            Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
          end;
        end;
      end;
end;

procedure TMainForm.actSearchBorrowingsExecute(Sender: TObject);
begin
  SearchBorrowingForm.Show;
end;

procedure TMainForm.InitDataSetsQueries;
begin
  IBDataSetPubHouses.InsertSQL.Text := sqlInsertPubHouse;
  IBDataSetPubHouses.ModifySQL.Text := sqlEditPubHouse;
  IBDataSetPubHouses.DeleteSQL.Text := sqlDeletePubHouse;
  IBDataSetPubHouses.Prepare;

  IBDataSetFriends.SelectSQL.Text := sqlGetFriends;
  IBDataSetFriends.InsertSQL.Text := sqlInsertFriend;
  IBDataSetFriends.ModifySQL.Text := sqlEditFriend;
  IBDataSetFriends.DeleteSQL.Text := sqlDeleteFriend;
  IBDataSetFriends.Prepare;
end;

end.

