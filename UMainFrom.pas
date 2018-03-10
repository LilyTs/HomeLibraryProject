unit UMainFrom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, DBCtrls, Grids, DBGrids, IBDatabase,
  IBCustomDataSet, IBTable, IniFiles, IBQuery, ComCtrls, IBUpdateSQL,
  ActnList, ImgList, ToolWin;

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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAddPubHouseExecute(Sender: TObject);
    procedure btnRefreshPubHousesClick(Sender: TObject);
    procedure actDeletePubHouseExecute(Sender: TObject);
  private
  
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Name: string;

implementation

uses UAddEditPubHouseForm;

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
    {with ibqTests do
      begin
        SQL.Text := 'SELECT * FROM Test';
        Open;
      end; }  
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
    on E: Exception do
      begin
        Application.MessageBox(PChar(E.Message), 'Error. Couldn''t connect to database ', MB_ICONERROR);
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
  AddEditPubHouseForm.Show;
end;

procedure TMainForm.btnRefreshPubHousesClick(Sender: TObject);
begin
  ibqPubHouses.Close;
  ibqPubHouses.Open;
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
        btnRefreshPubHousesClick(self);
      end;
  except on E: Exception do
      begin
        if ibqUpdatePubHouses.Transaction.Active then
          ibqUpdatePubHouses.Transaction.Rollback;
        Application.MessageBox(PChar(E.Message), 'Error. Couldn''t connect to database ', MB_ICONERROR);
      end;
  end;
end;

end.

