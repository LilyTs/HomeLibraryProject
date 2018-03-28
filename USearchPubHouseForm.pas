unit USearchPubHouseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UMainFrom, IB, SQLStrings, StrUtils;

type
  TSearchPubHouseForm = class(TForm)
    btnSearchPubHouse: TButton;
    btnCancelPubHouse: TButton;
    lblNamePubHouse: TLabel;
    edtNamePubHouse: TEdit;
    procedure btnCancelPubHouseClick(Sender: TObject);
    procedure btnSearchPubHouseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
        if edtNamePubHouse.Text = '' then
          MessageDlg('Field can''t be empty!', mtError, [mbOk], 0)
        else
          begin
            MainForm.ibqPubHouses.Close;
            MainForm.ibqPubHouses.SQL.Text := sqlGetPubHouses;

            MainForm.ibqPubHouses.SQL.Text := MainForm.ibqPubHouses.SQL.Text
              + ' WHERE LOWER(Name) LIKE ''%'
              + AnsiLowerCase(edtNamePubHouse.Text) + '%''';

            MainForm.ibqPubHouses.Open;
          end;
        Self.Hide;
      except
        on E: EIBInterBaseError do
          begin
            Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
            Halt;
          end;
      end;
    end;
end;

procedure TSearchPubHouseForm.FormShow(Sender: TObject);
begin
  edtNamePubHouse.Clear;
  edtNamePubHouse.SetFocus;
end;

end.
