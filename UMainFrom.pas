unit UMainFrom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, DBCtrls, Grids, DBGrids, IBDatabase,
  IBCustomDataSet, IBTable, IniFiles, IBQuery, ComCtrls;

type
  TMainForm = class(TForm)
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    IBDataSource: TDataSource;
    IBQuery: TIBQuery;
    PageControl: TPageControl;
    tsMain: TTabSheet;
    tsBooks: TTabSheet;
    tsFriends: TTabSheet;
    tsGenres: TTabSheet;
    tsPubHouses: TTabSheet;
    dbgridGenres: TDBGrid;
    dbnavGenres: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

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
    with IBQuery do
      begin
        SQL.Text := 'SELECT * FROM Genre';
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
  IBQuery.Close;
  IBDatabase.Connected := False;
end;

end.

