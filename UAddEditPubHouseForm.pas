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
  private
  
  public
  
  end;

var
  AddEditPubHouseForm: TAddEditPubHouseForm;

implementation

{$R *.dfm}

{ TAddEditPubHouseForm }

procedure TAddEditPubHouseForm.btnSavePubHouseClick(Sender: TObject);
begin
  if (edPubHouseName.Text = '') or (edPubHouseID.Text = '') then
    MessageDlg('Field can''t be empty!', mtError, [mbOk], 0)
  else
    begin
      try
        with MainForm.ibqUpdatePubHouses do
        begin
          SQL.Text := 'INSERT INTO PublishingHouse VALUES('
            + edPubHouseID.Text + ' , ''' + edPubHouseName.Text + ''');';
          Transaction.StartTransaction;
          ExecSQL;
          Transaction.Commit;
          Transaction.Active := False;
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

end.
