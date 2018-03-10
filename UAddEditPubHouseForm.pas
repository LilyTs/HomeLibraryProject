unit UAddEditPubHouseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBDatabase, IBQuery, UMainFrom, SQLStrings;

type
  TAddEditPubHouseForm = class(TForm)
    edPubHouseName: TEdit;
    lblPubHouseName: TLabel;
    btnSavePubHouse: TButton;
    btnCancelPubHouse: TButton;
    lblPubHouseID: TLabel;
    edPubHouseID: TEdit;
    procedure btnSavePubHouseClick(Sender: TObject);
    procedure edPubHouseIDKeyPress(Sender: TObject; var Key: Char);
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
  if (edPubHouseName.Text = '') or (edPubHouseID.Visible and (edPubHouseID.Text = '')) then
    MessageDlg('Field can''t be empty!', mtError, [mbOk], 0)
  else
    begin
      with MainForm.ibqUpdatePubHouses do
        begin
          try
            Close;
            SQL.Clear;
            if IsNew then
              begin
                SQL.Text := sqlInsertPubHouse;
                ParamByName('PubHouse_id').AsInteger := StrToInt(edPubHouseID.Text);
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
          except on E: EDatabaseError do
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

procedure TAddEditPubHouseForm.edPubHouseIDKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ; // цифра
    #8 : ; // клавиша <Back Space>
    #13 : edPubHouseName.SetFocus ; // клавиша <Enter>, переводим фокус на следующий Edit
    // остальные символы Ч запрещены
    else Key := Chr(0); // символ не отображать
  end;
end;

procedure TAddEditPubHouseForm.btnCancelPubHouseClick(Sender: TObject);
begin
  edPubHouseID.Text := '';
  edPubHouseName.Text := '';
  Self.Hide;
end;

procedure TAddEditPubHouseForm.SetIsNew(New: Boolean);
begin
  IsNew := New;
end;

procedure TAddEditPubHouseForm.FormShow(Sender: TObject);
begin
  lblPubHouseID.Visible := IsNew;
  edPubHouseID.Visible := IsNew;
  edPubHouseID.Clear;
  edPubHouseName.Clear;
end;

end.
