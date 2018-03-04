unit UMainFrom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, DBCtrls, Grids, DBGrids, IBDatabase,
  IBCustomDataSet, IBTable;

type
  TMainForm = class(TForm)
    IBTable1: TIBTable;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

end.

