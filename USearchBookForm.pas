unit USearchBookForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UMainFrom, IB, SQLStrings, StrUtils;

type
  TSearchBookForm = class(TForm)
    cbName: TCheckBox;
    cbAuthor: TCheckBox;
    cbPubHouse: TCheckBox;
    edtSearchName: TEdit;
    edtSearchAuthor: TEdit;
    cbGenre: TCheckBox;
    edtSearchGenre: TEdit;
    btnSearchBook: TButton;
    btnCancel: TButton;
    cbYear: TCheckBox;
    cbTranslator: TCheckBox;
    edtTranslator: TEdit;
    edtPicAutor: TEdit;
    cbPicAuthor: TCheckBox;
    edtYearFrom: TEdit;
    cbbPubHouse: TComboBox;
    edtYearTo: TEdit;
    lblYearFrom: TLabel;
    lblYearTo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cbNameClick(Sender: TObject);
    procedure cbAuthorClick(Sender: TObject);
    procedure cbPubHouseClick(Sender: TObject);
    procedure cbGenreClick(Sender: TObject);
    procedure btnSearchBookClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cbPicAuthorClick(Sender: TObject);
    procedure cbTranslatorClick(Sender: TObject);
    procedure cbYearClick(Sender: TObject);
    procedure edtYearFromKeyPress(Sender: TObject; var Key: Char);
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
  cbbPubHouse.Visible := False;
  edtSearchGenre.Visible := False;
  edtTranslator.Visible := False;
  edtPicAutor.Visible := False;
  edtYearTo.Visible := False;
  edtYearFrom.Visible := False;
  lblYearTo.Visible := False;
  lblYearFrom.Visible := False;

  edtSearchName.Clear;
  edtSearchAuthor.Clear;
  cbbPubHouse.Clear;
  edtSearchGenre.Clear;
  edtTranslator.Clear;
  edtPicAutor.Clear;
  edtYearTo.Clear;
  edtYearFrom.Clear;

  cbName.Checked := False;
  cbAuthor.Checked := False;
  cbPicAuthor.Checked := False;
  cbTranslator.Checked := False;
  cbGenre.Checked := False;
  cbPubHouse.Checked := False;
  cbYear.Checked := False;

  cbbPubHouse.Items.Clear;
  MainForm.ibqPubHouses.First;
  while not MainForm.ibqPubHouses.Eof do
    begin
      cbbPubHouse.Items.Add(MainForm.ibqPubHouses.Fields.Fields[1].Value);
      MainForm.ibqPubHouses.Next;
    end;
end;

procedure TSearchBookForm.cbNameClick(Sender: TObject);
begin
  if cbName.Checked then
    edtSearchName.Visible := True
  else
    edtSearchName.Visible := False;
end;

procedure TSearchBookForm.cbAuthorClick(Sender: TObject);
begin
  if cbAuthor.Checked then
    edtSearchAuthor.Visible := True
  else
    edtSearchAuthor.Visible := False;
end;

procedure TSearchBookForm.cbPubHouseClick(Sender: TObject);
begin
  if cbPubHouse.Checked then
    cbbPubHouse.Visible := True
  else
    cbbPubHouse.Visible := False;
end;

procedure TSearchBookForm.cbGenreClick(Sender: TObject);
begin
  if cbGenre.Checked then
    edtSearchGenre.Visible := True
  else
    edtSearchGenre.Visible := False;
end;

procedure TSearchBookForm.btnSearchBookClick(Sender: TObject);
var isFirst: Boolean;
begin
  with MainForm.ibqBooks do
    begin
      try
        isFirst := True;
        MainForm.ibqBooks.Close;
        MainForm.ibqBooks.SQL.Text := sqlGetBooksWithPubHouseAndGenres;
        if cbName.Checked then
          begin
            MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' WHERE LOWER(Name) LIKE ''%' + AnsiLowerCase(edtSearchName.Text) + '%''';
            isFirst := False;
          end;

        if cbAuthor.Checked then
          if isFirst then
            begin
              MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' WHERE LOWER(Author) LIKE ''%' + AnsiLowerCase(edtSearchAuthor.Text) + '%''';
              isFirst := False;
            end
          else
            MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' AND LOWER(Author) LIKE ''%' + AnsiLowerCase(edtSearchAuthor.Text) + '%''';

        if cbPicAuthor.Checked then
          if isFirst then
            begin
              MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' WHERE LOWER(PicAuthor) LIKE ''%' + AnsiLowerCase(edtPicAutor.Text) + '%''';
              isFirst := False;
            end
          else
            MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' AND LOWER(PicAuthor) LIKE ''%' + AnsiLowerCase(edtPicAutor.Text) + '%''';

        if cbTranslator.Checked then
          if isFirst then
            begin
              MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' WHERE LOWER(Translator) LIKE ''%' + AnsiLowerCase(edtTranslator.Text) + '%''';
              isFirst := False;
            end
          else
            MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' AND LOWER(Translator) LIKE ''%' + AnsiLowerCase(edtTranslator.Text) + '%''';

        if cbPubHouse.Checked then
          if isFirst then
            begin
              MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' WHERE PubHouseName = ''' +
                MainForm.ibqPubHouses.Lookup('Name', cbbPubHouse.Items[cbbPubHouse.ItemIndex], 'Name') + '''';
              isFirst := False;
            end
          else
            MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' AND PubHouseName = ''' +
                MainForm.ibqPubHouses.Lookup('Name', cbbPubHouse.Items[cbbPubHouse.ItemIndex], 'Name') + '''';

        if cbGenre.Checked then
          if isFirst then
            begin
              MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' WHERE LOWER(Genres) LIKE ''%'
                + AnsiLowerCase(edtSearchGenre.Text) + '%''';
              isFirst := False;
            end
          else
            MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' AND LOWER(Genres) LIKE ''%'
              + AnsiLowerCase(edtSearchGenre.Text) + '%''';

        if cbYear.Checked then 
          if isFirst then
            begin
              if (edtYearFrom.Text <> '') and (edtYearTo.Text <> '') then
              begin
                MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' WHERE PubYear BETWEEN ' + edtYearFrom.Text + ' AND ' + edtYearTo.Text;
                isFirst := False;
              end
              else if edtYearFrom.Text <> '' then
              begin
                MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' WHERE PubYear >= ' + edtYearFrom.Text;
                isFirst := False;
              end
              else if edtYearTo.Text <> '' then
              begin
                MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' WHERE PubYear <= ' + edtYearTo.Text;
                isFirst := False;
              end
            end
          else 
            begin
              if (edtYearFrom.Text <> '') and (edtYearTo.Text <> '') then
              begin
                MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' AND PubYear BETWEEN ' + edtYearFrom.Text + ' AND ' + edtYearTo.Text;
                isFirst := False;
              end
              else if edtYearFrom.Text <> '' then
              begin
                MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' AND PubYear >= ' + edtYearFrom.Text;
                isFirst := False;
              end
              else if edtYearTo.Text <> '' then
              begin
                MainForm.ibqBooks.SQL.Text := MainForm.ibqBooks.SQL.Text + ' AND PubYear <= ' + edtYearTo.Text;
                isFirst := False;
              end
            end;

          MainForm.ibqBooks.Open;

          if isFirst then
            MessageDlg('Fields are not selected!', mtError, [mbOk], 0);
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

procedure TSearchBookForm.btnCancelClick(Sender: TObject);
begin
  Self.Hide;
end;

procedure TSearchBookForm.cbPicAuthorClick(Sender: TObject);
begin
  if cbPicAuthor.Checked then
    edtPicAutor.Visible := True
  else
    edtPicAutor.Visible := False;
end;

procedure TSearchBookForm.cbTranslatorClick(Sender: TObject);
begin
  if cbTranslator.Checked then
    edtTranslator.Visible := True
  else
    edtTranslator.Visible := False;
end;

procedure TSearchBookForm.cbYearClick(Sender: TObject);
begin
  if cbYear.Checked then
  begin
    edtYearTo.Visible := True;
    edtYearFrom.Visible := True;
    lblYearTo.Visible := True;
    lblYearFrom.Visible := True;
  end
  else
  begin
    edtYearTo.Visible := False;
    edtYearFrom.Visible := False;
    lblYearTo.Visible := False;
    lblYearFrom.Visible := False;
  end
end;

procedure TSearchBookForm.edtYearFromKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ; // цифра
    #8 : ; // клавиша <Back Space>
    // остальные символы запрещены
    else Key := Chr(0); // символ не отображать
  end;
end;

end.
