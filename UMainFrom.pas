unit UMainFrom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IB, ExtCtrls, DBCtrls, Grids, DBGrids, IBDatabase,
  IBCustomDataSet, IBTable, IniFiles, IBQuery, ComCtrls, IBUpdateSQL,
  ActnList, ImgList, ToolWin, SQLStrings, AppEvnts, DB;

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
    ibUpdateSQlGenres: TIBUpdateSQL;
    ImageList: TImageList;
    actListPubHouses: TActionList;
    actAddPubHouse: TAction;
    actDeletePubHouse: TAction;
    actEditPubHouse: TAction;
    actRefreshPubHouses: TAction;
    ibqUpdatePubHouses: TIBQuery;
    IBTransactionUpdatePubHouses: TIBTransaction;
    PageControl: TPageControl;
    tsMain: TTabSheet;
    dbgridBorrowings: TDBGrid;
    dbnavBorrowings: TDBNavigator;
    tsBooks: TTabSheet;
    dbgridBooks: TDBGrid;
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
    ibqUpdateFriends: TIBQuery;
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
    ibqSearchBook: TIBQuery;
    IBTransactionSearchBook: TIBTransaction;
    dsSearchBook: TDataSource;
    ApplicationEvents: TApplicationEvents;
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
  private
  
  public
    procedure MyIdle(Sender: TObject; var Done: boolean);
  end;

var
  MainForm: TMainForm;
  Name: string;

implementation

uses UAddEditPubHouseForm, UAddEditFriendForm, UAddEditBookForm,
     UAddEditGenreForm, USearchBookForm;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
var IniFile: TIniFile;
begin
  //ApplicationEvents.OnIdle := MyIdle;
  try
    IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
    try
      IBDatabase.DatabaseName := IniFile.ReadString('Base', 'Path', '');
    finally
      IniFile.Free;
    end;
    IBDatabase.Connected := true;
    IBTransaction.Active := True;
    with ibqGenres do
      begin
        SQL.Text := sqlGetGenres;
        Open;
      end; 
    {with ibqBorrowings do
      begin
        SQL.Text := sqlGetBorrowings;
        Open;
      end;}
    with ibqBooks do
      begin
        SQL.Text := sqlGetBooks;
        Open;
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
  ibqUpdateFriends.Close;
  ibqUpdatePubHouses.Close;
  IBDatabase.Connected := False;
  IBDatabase.Close;
end;

procedure TMainForm.actAddPubHouseExecute(Sender: TObject);
begin  
  AddEditPubHouseForm.SetIsNew(True);
  AddEditPubHouseForm.Show;
end;

procedure TMainForm.actDeletePubHouseExecute(Sender: TObject);
begin
  with ibqUpdatePubHouses do
    begin
      try
        Close;
        SQL.Text := sqlDeletePubHouse;
        ParamByName('PubHouse_id').AsInteger := dbgridPubHouses.DataSource.DataSet.Fields.Fields[0].Value;
        ExecSQL;
        Transaction.Commit;
        Transaction.Active := False;
        MainForm.actRefreshPubHousesExecute(self);
      except on E: EIBInterBaseError do
        begin
          if Transaction.Active then
            Transaction.Rollback;
          Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
        end;
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
    ibqPubHouses.Open;
  except on E: EIBInterBaseError do
    begin
      Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
    end;
  end;
end;

procedure TMainForm.actDeleteFriendExecute(Sender: TObject);
begin
  with ibqUpdateFriends do
    begin
      try
        Close;
        SQL.Text := sqlDeleteFriend;
        ParamByName('Friend_id').AsInteger := dbgridFriends.DataSource.DataSet.Fields.Fields[0].Value;
        ExecSQL;
        Transaction.Commit;
        Transaction.Active := False;
        MainForm.actRefreshFriendsExecute(self);
      except on E: EIBInterBaseError do
        begin
          if Transaction.Active then
            Transaction.Rollback;
          Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
        end;
      end;
    end;
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
  with ibqUpdateGenres do
    begin
      try
        Close;
        SQL.Text := sqlDeleteGenre;
        ParamByName('Genre_id').AsInteger := dbgridGenres.DataSource.DataSet.Fields.Fields[0].Value;
        ExecSQL;
        Transaction.Commit;
        Transaction.Active := False;
        MainForm.actRefreshGenresExecute(self);
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
  ibqGenres.Close;
  ibqGenres.Open;
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
      SQL.Text := sqlGetBooks;
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
  actDeleteGenre.Enabled := not ibqGenres.IsEmpty;
  actEditGenre.Enabled := actDeleteGenre.Enabled;
  actDeletePubHouse.Enabled := not ibqPubHouses.IsEmpty;
  actEditPubHouse.Enabled := actDeletePubHouse.Enabled;
end;

end.

