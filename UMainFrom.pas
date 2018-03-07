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
    PageControl: TPageControl;
    tsMain: TTabSheet;
    tsBooks: TTabSheet;
    tsFriends: TTabSheet;
    tsGenres: TTabSheet;
    tsPubHouses: TTabSheet;
    dbgridGenres: TDBGrid;
    dbnavGenres: TDBNavigator;
    dbgridBorrowings: TDBGrid;
    ibqBorrowings: TIBQuery;
    dsrcGenres: TDataSource;
    dsrcBorrowings: TDataSource;
    dbnavBorrowings: TDBNavigator;
    dbgridBooks: TDBGrid;
    dbnavBooks: TDBNavigator;
    dbgridFriends: TDBGrid;
    dbnavFriends: TDBNavigator;
    dbgridPubHouses: TDBGrid;
    dbnavPubHouses: TDBNavigator;
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
    toolBarPubHouses: TToolBar;
    actDeletePubHouse: TAction;
    actEditPubHouse: TAction;
    btnAddPubHouse: TToolButton;
    btnDeletePubHouse: TToolButton;
    btnEditPubHouse: TToolButton;
    btnRefreshPubHouses: TToolButton;
    actRerfeshPubHouses: TAction;
    ibqUpdatePubHouses: TIBQuery;
    IBTransactionUpdatePubHouses: TIBTransaction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAddPubHouseExecute(Sender: TObject);
    procedure btnRefreshPubHousesClick(Sender: TObject);
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
      IBDatabase.Close;
      IBDatabase.DatabaseName := IniFile.ReadString('Base', 'Path', '');
    finally
      IniFile.Free;
    end;
    IBDatabase.Connected := true;
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

end.

