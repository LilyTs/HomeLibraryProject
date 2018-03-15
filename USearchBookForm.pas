unit USearchBookForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UMainFrom, DB, SQLStrings;

type
  TSearchBookForm = class(TForm)
    cbName: TCheckBox;
    cbAuthor: TCheckBox;
    cbPubHouse: TCheckBox;
    edtSearchName: TEdit;
    edtSearchAuthor: TEdit;
    cbGenre: TCheckBox;
    edtSearchPubHouse: TEdit;
    edtSearchGenre: TEdit;
    btnSearchBook: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cbNameClick(Sender: TObject);
    procedure cbAuthorClick(Sender: TObject);
    procedure cbPubHouseClick(Sender: TObject);
    procedure cbGenreClick(Sender: TObject);
    procedure btnSearchBookClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SearchBookForm: TSearchBookForm;

implementation

{$R *.dfm}


procedure TSearchBookForm.FormShow(Sender: TObject);
begin
  edtSearchName.Visible := False;
  edtSearchAuthor.Visible := False;
  edtSearchPubHouse.Visible := False;
  edtSearchGenre.Visible := False;
end;

procedure TSearchBookForm.cbNameClick(Sender: TObject);
begin
  if cbName.Checked then
    edtSearchName.Visible := True
  else
    edtSearchName := False;
end;

procedure TSearchBookForm.cbAuthorClick(Sender: TObject);
begin     
  if cbAuthor.Checked then
    edtSearchAuthor.Visible := True
  else
    edtSearchAuthor := False;
end;

procedure TSearchBookForm.cbPubHouseClick(Sender: TObject);
begin
  if cbPubHouse.Checked then
    edtSearchPubHouse.Visible := True
  else
    edtSearchPubHouse := False;
end;

procedure TSearchBookForm.cbGenreClick(Sender: TObject);
begin
  if cbGenre.Checked then
    edtSearchGenre.Visible := True
  else
    edtSearchGenre := False;
end;

procedure TSearchBookForm.btnSearchBookClick(Sender: TObject);
var first : Boolean = True;
begin
  with MainForm.ibqBooks do
  begin
    try   
      //MainForm.dsrcBooks.DataSet := MainForm.dsSearchBook;
      SQL.Text := sqlGetBooks;
      Open;
      if cbName.Checked then
      begin
        SQL.Text := SQL.Text + ' WHERE Name =  ''  ' + edtSearchName.Text;
        First := False;
      end;

      if cbAuthor.Checked then
        if First then
        begin
          SQL.Text := SQL.Text + ' WHERE Author =  ''  ' + edtSearchAuthor.Text;
          First := False;
        end
        else
          SQL.Text := SQL.Text + ' AND Author =  ''  ' + edtSearchAuthor.Text;

      if cbPubHouse.Checked then
        if First then
        begin
          SQL.Text := SQL.Text + ' WHERE PubHouse_id =  ''  ' +
            IntToStr(MainForm.ibqPubHouses.Lookup('Name', edtSearchPubHouse.Text, 'PubHouse_id'));
          First := False;
        end
        else
          SQL.Text := SQL.Text + ' AND PubHouse_id =  ''  ' +
            IntToStr(MainForm.ibqPubHouses.Lookup('Name', edtSearchPubHouse.Text, 'PubHouse_id'));       

      if cbGenre.Checked then
        if First then
        begin
          SQL.Text := SQL.Text + ' WHERE Book_id = (SELECT book_id FROM BookGenre ' +
          + 'WHERE Genre_id = (SELECT Genre_id FROM Genre WHERE Name =  '' ' +
          + edtSearchGenre.Text + '))';
          First := False;
        end
        else
          SQL.Text := SQL.Text + ' AND Book_id = (SELECT book_id FROM BookGenre ' +
          + 'WHERE Genre_id = (SELECT Genre_id FROM Genre WHERE Name =  '' ' +
          + edtSearchGenre.Text + '))';

        if First then
          MessageDlg('Fields are not selected!', mtError, [mbOk], 0)
    except
      on E: EDatabaseError do
        begin
          Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
          Halt;
        end;
    end;
  end;
  MainForm.actRefreshBooksExecute(MainForm);
  Self.Hide;
end;

procedure TSearchBookForm.btnCancelClick(Sender: TObject);
begin
  Self.Hide;
end;

end.
