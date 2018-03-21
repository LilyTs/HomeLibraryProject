unit USearchPubHouseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UMainFrom, IB, SQLStrings;

type
  TSearchPubHouseForm = class(TForm)
    btnSearchPubHouse: TButton;
    btnCancelPubHouse: TButton;
    lblNamePubHouse: TLabel;
    edtNamePubHouse: TEdit;
    procedure btnCancelPubHouseClick(Sender: TObject);
    procedure btnSearchPubHouseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SearchPubHouseForm: TSearchPubHouseForm;

implementation

{$R *.dfm}

procedure TSearchPubHouseForm.btnCancelPubHouseClick(Sender: TObject);
begin
  Self.Hide;
end;

procedure TSearchPubHouseForm.btnSearchPubHouseClick(Sender: TObject);
begin
  with MainForm.ibqPubHouses do
    begin
      try     
        MainForm.ibqPubHouses.Close;
        MainForm.ibqPubHouses.SQL.Text := sqlGetPubHouses;

        MainForm.ibqPubHouses.SQL.Text := MainForm.ibqPubHouses.SQL.Text + ' WHERE Name LIKE ''%' + edtNamePubHouse.Text + '%''';

        MainForm.ibqPubHouses.Open;

        if edtNamePubHouse.Text = '' then
          MessageDlg('The field is empty!', mtError, [mbOk], 0);
      except
        on E: EIBInterBaseError do
          begin
            Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
            Halt;
          end;
      end;
    end;
  Self.Hide;
end;

end.
