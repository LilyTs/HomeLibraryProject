unit USearchGenreForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UMainFrom, IB, SQLStrings, StdCtrls, StrUtils;

type
  TSearchGenreForm = class(TForm)
    btnSearchGenre: TButton;
    btnCancelGenre: TButton;
    lblNameGenre: TLabel;
    edtNameGenre: TEdit;
    procedure btnCancelGenreClick(Sender: TObject);
    procedure btnSearchGenreClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SearchGenreForm: TSearchGenreForm;

implementation

{$R *.dfm}

procedure TSearchGenreForm.btnCancelGenreClick(Sender: TObject);
begin
  Self.Hide;
end;

procedure TSearchGenreForm.btnSearchGenreClick(Sender: TObject);
begin
  with MainForm.ibqGenres do
    begin
      try     
        MainForm.ibqGenres.Close;
        MainForm.ibqGenres.SQL.Text := sqlGetGenresWithParentName;

        MainForm.ibqGenres.SQL.Text := MainForm.ibqGenres.SQL.Text + ' WHERE LOWER(G1.Name) LIKE ''%' + AnsiLowerCase(edtNameGenre.Text) + '%''';

        MainForm.ibqGenres.Open;

        if edtNameGenre.Text = '' then
          MessageDlg('The field is empty!!', mtError, [mbOk], 0);
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

procedure TSearchGenreForm.FormShow(Sender: TObject);
begin
  edtNameGenre.Clear;
  edtNameGenre.SetFocus;
end;

end.
