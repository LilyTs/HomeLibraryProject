unit UAddEditPubHouseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UMainFrom, SQLStrings, IB;

type
  TAddEditPubHouseForm = class(TForm)
    lblPubHouseName: TLabel;
    edPubHouseName: TEdit;
    btnSavePubHouse: TButton;
    btnCancelPubHouse: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnCancelPubHouseClick(Sender: TObject);
    procedure btnSavePubHouseClick(Sender: TObject);
  private
    IsNew: Boolean;
  public
    procedure SetIsNew(New: Boolean);
  end;

var
  AddEditPubHouseForm: TAddEditPubHouseForm;

implementation

{$R *.dfm}

procedure TAddEditPubHouseForm.FormShow(Sender: TObject);
begin
  if IsNew then
    edPubHouseName.Clear
  else
    edPubHouseName.Text := MainForm.dbgridPubHouses.DataSource.DataSet.Fields.Fields[1].Value;
end;

procedure TAddEditPubHouseForm.SetIsNew(New: Boolean);
begin
  IsNew := New;
end;

procedure TAddEditPubHouseForm.btnCancelPubHouseClick(Sender: TObject);
begin
  Hide;
end;

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

end.
