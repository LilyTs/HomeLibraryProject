unit UAddEditPubHouseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBDatabase, IBQuery, UMainFrom;

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
      try
        with MainForm.ibqUpdatePubHouses do
          begin
            if not IsNew then
              begin
                lblPubHouseID.Visible := False;
                edPubHouseID.Visible := False;
                SQL.Text := 'UPDATE PublishingHouse SET Name = '''
                  + edPubHouseName.Text + ''' WHERE PubHouse_id = '
                  + IntToStr(MainForm.dbgridPubHouses.DataSource.DataSet.Fields.Fields[0].Value);
              end
            else
              begin
                SQL.Text := 'INSERT INTO PublishingHouse VALUES('
                  + edPubHouseID.Text + ' , ''' + edPubHouseName.Text + ''');';
              end;
            Transaction.StartTransaction;
            ExecSQL;
            Transaction.Commit;
            Transaction.Active := False;
            MainForm.actRerfeshPubHousesExecute(MainForm);
          end;
       except
         on E: Exception do
          begin
            if MainForm.ibqUpdatePubHouses.Transaction.Active then
              MainForm.ibqUpdatePubHouses.Transaction.Rollback;
            Application.MessageBox(PChar(E.Message), 'Error. Couldn''t connect to database ', MB_ICONERROR);
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
