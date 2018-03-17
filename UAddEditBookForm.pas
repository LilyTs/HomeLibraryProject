unit UAddEditBookForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UMainFrom, SQLStrings, IB;

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
var c: Integer;
begin
  if (edBookName.Text = '') or (edPubYear.Text = '') or (edAuthor.Text = '') or (cbPubHouse.ItemIndex < 0) then
    MessageDlg('Field can''t be empty!', mtError, [mbOk], 0)
  else
    begin
      with MainForm.ibqUpdateBooks do
        begin
          try
            Close;
            SQL.Clear;
            if IsNew then
              begin
                SQL.Text := sqlInsertBook;
              end
            else
              begin
                SQL.Text := sqlEditBook;
              end;
            ParamByName('Name').AsString := edBookName.Text;
            ParamByName('Author').AsString := edAuthor.Text;
            ParamByName('PicAuthor').AsString := edPicAuthor.Text;
            ParamByName('Translator').AsString := edTranslator.Text;
            ParamByName('PubYear').AsInteger := StrToInt(edPubYear.Text);
            ParamByName('Comment').AsString := edBookComment.Text;
            ParamByName('PubHouse_id').AsInteger := MainForm.ibqPubHouses.Lookup('Name', cbPubHouse.Items[cbPubHouse.ItemIndex], 'PubHouse_id');
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

procedure TAddEditBookForm.FormShow(Sender: TObject);
var i: Integer;
begin
  cbPubHouse.Items.Clear;
  MainForm.ibqPubHouses.First;
  for i := 0 to MainForm.ibqPubHouses.RecordCount - 1 do
    begin
      cbPubHouse.Items.Add(MainForm.ibqPubHouses.Fields.Fields[1].Value);
      MainForm.ibqPubHouses.Next;
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
      edBookName.Text := MainForm.dbgridBooks.DataSource.DataSet.Fields.Fields[1].Value;
      edAuthor.Text := MainForm.dbgridBooks.DataSource.DataSet.Fields.Fields[2].Value;
      edPubYear.Text := MainForm.dbgridBooks.DataSource.DataSet.Fields.Fields[3].Value;
      cbPubHouse.ItemIndex := cbPubHouse.Items.IndexOf(MainForm.dbgridBooks.DataSource.DataSet.Fields.Fields[4].Value);
      edPicAuthor.Text := MainForm.dbgridBooks.DataSource.DataSet.Fields.Fields[5].Value;
      edTranslator.Text := MainForm.dbgridBooks.DataSource.DataSet.Fields.Fields[6].Value;
      edBookComment.Text := MainForm.dbgridBooks.DataSource.DataSet.Fields.Fields[7].Value;
    end;
end;

end.
