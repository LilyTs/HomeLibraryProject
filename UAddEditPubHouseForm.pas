unit UAddEditPubHouseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IB, IBCustomDataSet, IBDatabase, IBQuery, UMainFrom, SQLStrings;

type
  TAddEditPubHouseForm = class(TForm)
    edPubHouseName: TEdit;
    lblPubHouseName: TLabel;
    btnSavePubHouse: TButton;
    btnCancelPubHouse: TButton;
    procedure btnSavePubHouseClick(Sender: TObject);
    procedure btnCancelPubHouseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    IsNew: Boolean;
  public
    procedure SetIsNew(New: Boolean);
  end;

var
  AddEditPubHouseForm: TAddEditPubHouseForm;

implementation

{$R *.dfm}

{ TAddEditPubHouseForm }

procedure TAddEditPubHouseForm.btnSavePubHouseClick(Sender: TObject);
begin
  if edPubHouseName.Text = '' then
    MessageDlg('Field can''t be empty!', mtError, [mbOk], 0)
  else
    begin
      with MainForm.ibqUpdatePubHouses do
        begin
          try
            Close;
            if IsNew then
              begin
                SQL.Text := sqlInsertPubHouse;
              end
            else
              begin
                SQL.Text := sqlEditPubHouse;
                ParamByName('PubHouse_id').AsInteger := MainForm.dbgridPubHouses.DataSource.DataSet.Fields.Fields[0].Value;
              end;
            ParamByName('Name').AsString := edPubHouseName.Text;
            ExecSQL;
            Transaction.Commit;
            Transaction.Active := False;
            MainForm.actRefreshPubHousesExecute(MainForm);
          except on E: EIBInterBaseError do
            begin
              if Transaction.Active then
                Transaction.Rollback;
              Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
            end;
          end;
        end;
    end;
    Self.Hide;
end;

procedure TAddEditPubHouseForm.btnCancelPubHouseClick(Sender: TObject);
begin
  Self.Hide;
end;

procedure TAddEditPubHouseForm.SetIsNew(New: Boolean);
begin
  IsNew := New;
end;

procedure TAddEditPubHouseForm.FormShow(Sender: TObject);
begin
  if IsNew then
    edPubHouseName.Clear
  else
    edPubHouseName.Text := MainForm.dbgridPubHouses.DataSource.DataSet.Fields.Fields[1].Value;
end;

end.
