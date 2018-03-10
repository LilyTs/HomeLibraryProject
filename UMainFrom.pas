unit UMainFrom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, DBCtrls, Grids, DBGrids, IBDatabase,
  IBCustomDataSet, IBTable, IniFiles, IBQuery, ComCtrls, IBUpdateSQL,
  ActnList, ImgList, ToolWin, SQLStrings;

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
    actRerfeshPubHouses: TAction;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAddPubHouseExecute(Sender: TObject);
    procedure actDeletePubHouseExecute(Sender: TObject);
    procedure actEditPubHouseExecute(Sender: TObject);
    procedure actAddFriendExecute(Sender: TObject);
    procedure actRefreshFriendsExecute(Sender: TObject);
    procedure actRerfeshPubHousesExecute(Sender: TObject);
    procedure actDeleteFriendExecute(Sender: TObject);
    procedure actEditFriendExecute(Sender: TObject);
  private
  
  public
    { Public declarations }
  end;

  {напоминалка:
  сделать недоступным кнопку удаления, когда грид пустой}

var
  MainForm: TMainForm;
  Name: string;

implementation

uses UAddEditPubHouseForm, UAddEditFriendForm;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
var IniFile: TIniFile;
begin
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
        SQL.Text := 'SELECT * FROM Genre';
        Open;
      end; 
    with ibqBorrowings do
      begin
        SQL.Text := 'SELECT B.Book_id AS "Book ID", Bk.Name AS "Book", B.Friend_id AS "Friend ID", F.FIO AS "Friend", B.BorrowDate AS "Borrow date", B.ReturnDate AS "Return date",  B.Comment '  //B.IsLost AS "Is lost", B.IsDamaged AS "Is damaged",
                  + 'FROM Borrowing B JOIN Friend F ON B.Friend_id = F.Friend_id JOIN Book Bk ON B.Book_id = Bk.Book_id;';
        Open;
      end;
    with ibqBooks do
      begin
        SQL.Text := 'SELECT * FROM Book';
        Open;
      end;
    with ibqFriends do
      begin
        SQL.Text := 'SELECT * FROM Friend';
        Open;
      end;
    with ibqPubHouses do
      begin
        SQL.Text := 'SELECT * FROM PublishingHouse';
        Open;
      end;
  except
    on E: EDatabaseError do
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
  try
    with ibqUpdatePubHouses do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'DELETE FROM PublishingHouse WHERE PubHouse_id = '
          + IntToStr(dbgridPubHouses.DataSource.DataSet.Fields.Fields[0].Value);
        Transaction.StartTransaction;
        ExecSQL;
        Transaction.Commit;
        Transaction.Active := False;
        actRerfeshPubHousesExecute(self);
      end;
  except on E: Exception do
      begin
        if ibqUpdatePubHouses.Transaction.Active then
          ibqUpdatePubHouses.Transaction.Rollback;
        Application.MessageBox(PChar(E.Message), 'Error. Couldn''t connect to database ', MB_ICONERROR);
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
  except on E: EDatabaseError do
    begin
      Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
    end;
  end;
end;

procedure TMainForm.actRerfeshPubHousesExecute(Sender: TObject);
begin
  try
    ibqPubHouses.Close;
    ibqPubHouses.Open;
  except on E: EDatabaseError do
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
      except on E: EDatabaseError do
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

end.

