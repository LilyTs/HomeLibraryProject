unit UAddEditBookForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UMainFrom, SQLStrings, IB, CheckLst, DB;

type
  TAddEditBookForm = class(TForm)
    lblBookName: TLabel;
    edBookName: TEdit;
    lblAuthor: TLabel;
    edAuthor: TEdit;
    lblPicAuthor: TLabel;
    edPicAuthor: TEdit;
    lblTranslator: TLabel;
    edTranslator: TEdit;
    lblPubYear: TLabel;
    edPubYear: TEdit;
    lblPubHouse: TLabel;
    cbPubHouse: TComboBox;
    lblBookComment: TLabel;
    edBookComment: TEdit;
    btnSaveBook: TButton;
    btnCancelBook: TButton;
    lblGenresForBook: TLabel;
    checklistGenres: TCheckListBox;
    procedure edPubYearKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelBookClick(Sender: TObject);
    procedure btnSaveBookClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    IsNew: Boolean;
  public
    procedure SetIsNew(New: Boolean);
  end;

var
  AddEditBookForm: TAddEditBookForm;

implementation

{$R *.dfm}

procedure TAddEditBookForm.edPubYearKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ; // цифра
    #8 : ; // клавиша <Back Space>
    // остальные символы запрещены
    else Key := Chr(0); // символ не отображать
  end;
end;

procedure TAddEditBookForm.btnCancelBookClick(Sender: TObject);
begin
  Self.Hide;
end;

procedure TAddEditBookForm.SetIsNew(New: Boolean);
begin
  IsNew := New;
end;

procedure TAddEditBookForm.btnSaveBookClick(Sender: TObject);
var i: Integer;
begin
  if (edBookName.Text = '') or (edPubYear.Text = '') or (edAuthor.Text = '') or (cbPubHouse.ItemIndex < 0) then
    MessageDlg('Field can''t be empty!', mtError, [mbOk], 0)
  else
    begin
        try
          with MainForm.ibqUpdateBooks do
            begin
              Close;
              if IsNew then
                begin
                  SQL.Text := sqlInsertBook;
                end
              else
                begin
                  SQL.Text := sqlEditBook;
                  ParamByName('Book_id').AsInteger := MainForm.dbgridBooks.DataSource.DataSet.Fields.Fields[0].Value;
                end;
              ParamByName('Name').AsString := edBookName.Text;
              ParamByName('Author').AsString := edAuthor.Text;
              ParamByName('PicAuthor').AsString := edPicAuthor.Text;
              ParamByName('Translator').AsString := edTranslator.Text;
              ParamByName('PubYear').AsInteger := StrToInt(edPubYear.Text);
              ParamByName('Comment').AsString := edBookComment.Text;
              ParamByName('PubHouse_id').AsInteger := MainForm.ibqPubHouses.Lookup('Name', cbPubHouse.Items[cbPubHouse.ItemIndex], 'PubHouse_id');
              Transaction.Active := True;
              ExecSQL;
              Transaction.Commit;
              Transaction.Active := False; 
              MainForm.actRefreshBooksExecute(MainForm);
              MainForm.dbgridBooks.DataSource.DataSet.Locate('Name', edBookName.Text, []);
            end;
          with MainForm.ibqUpdateBookGenre do
            begin
              Close;
              if not IsNew then
                begin
                  SQL.Text := sqlDeleteGenresForBook;
                  ParamByName('Book_id').Value := MainForm.dbgridBooks.DataSource.DataSet.Fields.Fields[0].Value;
                  ExecSQL;
                end;
              SQL.Text := sqlInsertBookGenre;
              ParamByName('Book_id').Value := MainForm.dbgridBooks.DataSource.DataSet.Fields.Fields[0].Value;
              for i := 0 to checklistGenres.Items.Count - 1 do
                begin
                  if checklistGenres.Checked[i] then
                    begin
                      ParamByName('Genre_id').Value := MainForm.ibqGenres.Lookup('Name', checklistGenres.Items[i] , 'Genre_id');
                      if ParamByName('Genre_id').Value <> Null then
                        ExecSQL;
                    end;
                end;
              Transaction.Commit;
              Transaction.Active := False;
            end;
          MainForm.actRefreshBooksExecute(MainForm);
        except on E: EIBInterBaseError do
          begin
            if MainForm.ibqUpdateBooks.Transaction.Active then
              MainForm.ibqUpdateBooks.Transaction.Rollback;
            if MainForm.ibqUpdateBookGenre.Transaction.Active then
              MainForm.ibqUpdateBookGenre.Transaction.Rollback;
            Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
          end;
        end;
    end;
    Self.Hide;
end;

procedure TAddEditBookForm.FormShow(Sender: TObject);
var i: Integer;
begin
  cbPubHouse.Items.Clear;
  MainForm.ibqPubHouses.First;
  while not MainForm.ibqPubHouses.Eof do
    begin
      cbPubHouse.Items.Add(MainForm.ibqPubHouses.Fields.Fields[1].Value);
      MainForm.ibqPubHouses.Next;
    end;
  checklistGenres.Clear;
  MainForm.ibqGenres.First;
  while not MainForm.ibqGenres.Eof do
    begin
      checklistGenres.Items.Add(MainForm.ibqGenres.Fields.Fields[1].Value);
      MainForm.ibqGenres.Next;
    end;
  if IsNew then
    begin
      edBookName.Clear;
      edAuthor.Clear;
      edPicAuthor.Clear;
      edTranslator.Clear;
      edPubYear.Clear;
      edBookComment.Clear;
    end
  else
    begin
      edBookName.Text := MainForm.dbgridBooks.DataSource.DataSet.FieldValues['Name'];
      edAuthor.Text := MainForm.dbgridBooks.DataSource.DataSet.FieldValues['Author'];
      edPubYear.Text := MainForm.dbgridBooks.DataSource.DataSet.FieldValues['PubYear'];
      cbPubHouse.ItemIndex := cbPubHouse.Items.IndexOf(MainForm.dbgridBooks.DataSource.DataSet.FieldValues['PubHouseName']);
      edPicAuthor.Text := MainForm.dbgridBooks.DataSource.DataSet.FieldValues['PicAuthor'];
      edTranslator.Text := MainForm.dbgridBooks.DataSource.DataSet.FieldValues['Translator'];
      edBookComment.Text := MainForm.dbgridBooks.DataSource.DataSet.FieldValues['Comment'];
      with MainForm.ibqGenresForBook do
        begin
          Close;
          SQL.Text := sqlGetGenresForBook;
          ParamByName('Book_id').AsInteger := MainForm.dbgridBooks.DataSource.DataSet.Fields.Fields[0].Value;
          Open;
        end;   
      for i := 0 to checklistGenres.Items.Count - 1 do
        begin
          if MainForm.ibqGenresForBook.Locate('Name', checklistGenres.Items[i], [loCaseInsensitive]) then
            checklistGenres.Checked[i] := True;
        end;
    end;
end;

end.
