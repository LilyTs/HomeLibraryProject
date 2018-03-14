unit UAddEditGenreForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, SQLStrings, UMainFrom;

type
  TAddEditGenreForm = class(TForm)
    lblGenreName: TLabel;
    edGenreName: TEdit;
    lblParentGenre: TLabel;
    cbParentGenre: TComboBox;
    btnSaveGenre: TButton;
    btnCancelGenre: TButton;
    lblGenreID: TLabel;
    edGenre_id: TEdit;
    procedure btnCancelGenreClick(Sender: TObject);
    procedure btnSaveGenreClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edGenre_idKeyPress(Sender: TObject; var Key: Char);
  private
    IsNew: Boolean;
  public
    procedure SetIsNew(New: Boolean);
  end;

var
  AddEditGenreForm: TAddEditGenreForm;

implementation

{$R *.dfm}

procedure TAddEditGenreForm.btnCancelGenreClick(Sender: TObject);
begin
  Self.Hide;
end;

procedure TAddEditGenreForm.SetIsNew(New: Boolean);
begin
  IsNew := New;
end;

procedure TAddEditGenreForm.btnSaveGenreClick(Sender: TObject);
begin
  if (edGenreName.Text = '') or (edGenre_id.Visible and (edGenre_id.Text = '')) then
      MessageDlg('Field can''t be empty!', mtError, [mbOk], 0)
  else
    begin
      with MainForm.ibqUpdateGenres do
        begin
          try
            Close;
            SQL.Clear;
            if IsNew then
              begin
                if cbParentGenre.ItemIndex < 0 then
                  SQL.Text := sqlInsertGenreWithoutParent
                else
                  begin
                    SQL.Text := sqlInsertGenre;
                    ParamByName('ParentGenre_id').AsInteger := MainForm.ibqGenres.Lookup('Name', cbParentGenre.Items[cbParentGenre.ItemIndex], 'Genre_id');
                  end;
                ParamByName('Genre_id').AsInteger := StrToInt(edGenre_id.Text);
              end
            else
              begin
                SQL.Text := sqlEditGenre;
                ParamByName('Genre_id').AsInteger := MainForm.dbgridGenres.DataSource.DataSet.Fields.Fields[0].Value;
                ParamByName('ParentGenre_id').AsInteger := MainForm.ibqGenres.Lookup('Name', cbParentGenre.Items[cbParentGenre.ItemIndex], 'Genre_id');
              end;
            ParamByName('Name').AsString := edGenreName.Text;
            ExecSQL;
            Transaction.Commit;
            Transaction.Active := False;
            MainForm.actRefreshGenresExecute(MainForm);
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

procedure TAddEditGenreForm.FormShow(Sender: TObject);
var i: Integer;
    prevParentGenreID: String;
begin
  if IsNew then
    begin
      edGenreName.Clear;
      edGenre_id.Clear;
    end
  else
    begin
      edGenreName.Text := MainForm.dbgridGenres.DataSource.DataSet.Fields.Fields[1].Value;
      prevParentGenreID := MainForm.dbgridGenres.DataSource.DataSet.Fields.Fields[2].Value;
    end;
  lblGenreID.Visible := IsNew;
  edGenre_id.Visible := IsNew;
  cbParentGenre.Items.Clear;
  MainForm.ibqGenres.First;
  for i := 0 to MainForm.ibqGenres.RecordCount - 1 do
    begin
      cbParentGenre.Items.Add(MainForm.ibqGenres.Fields.Fields[1].Value);
      MainForm.ibqGenres.Next;
    end;
  if not IsNew then
    cbParentGenre.ItemIndex := cbParentGenre.Items.IndexOf(MainForm.dbgridGenres.DataSource.DataSet.Lookup('Genre_id', prevParentGenreID, 'Name'));
end;

procedure TAddEditGenreForm.edGenre_idKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ; // цифра
    #8 : ;    // клавиша <Back Space>
      // остальные символы Ч запрещены
    else
      Key := Chr(0); // символ не отображать
  end;
end;

end.
