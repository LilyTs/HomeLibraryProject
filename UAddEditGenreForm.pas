unit UAddEditGenreForm;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IB, SQLStrings, UMainFrom, DBCtrls;

type
  TAddEditGenreForm = class(TForm)
    lblGenreName: TLabel;
    edGenreName: TEdit;
    lblParentGenre: TLabel;
    cbParentGenre: TComboBox;
    btnSaveGenre: TButton;
    btnCancelGenre: TButton;
    procedure btnCancelGenreClick(Sender: TObject);
    procedure btnSaveGenreClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    IsNew: Boolean;
    IsFromAddEditBookForm: Boolean;
  public
    procedure SetIsNew(New: Boolean);
    procedure SetIsFromAddEditBookForm(FromAddEditBookForm: Boolean);
  end;

var
  AddEditGenreForm: TAddEditGenreForm;

implementation

uses UAddEditBookForm;

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
var GenreChilds: string;
begin
  if Trim(edGenreName.Text) = '' then
      MessageDlg('Field can''t be empty!', mtError, [mbOk], 0)
  else
    begin
      if not IsNew then
        begin
          MainForm.IBStoredProcGenreChilds.ParamByName('Genre_id').AsInteger := MainForm.ibqGenres.FieldValues['Genre_id'];
          MainForm.IBStoredProcGenreChilds.ExecProc;
          GenreChilds := MainForm.IBStoredProcGenreChilds.ParamByName('childs').AsString;
        end;
      if not IsNew and AnsiContainsStr(GenreChilds, cbParentGenre.Items[cbParentGenre.ItemIndex]) then
        MessageDlg('Child genre can''t be parent at the same time!', mtError, [mbOk], 0)
      else
        with MainForm.ibqUpdateGenres do
          begin
            try
              Close;
              if IsNew then
                begin
                  SQL.Text := sqlInsertGenre;
                  if cbParentGenre.ItemIndex < 0 then
                      ParamByName('ParentGenre_id').Value := Null
                  else
                    ParamByName('ParentGenre_id').AsInteger := MainForm.ibqGenres.Lookup('Name', cbParentGenre.Items[cbParentGenre.ItemIndex], 'Genre_id');
                end
              else
                begin
                  SQL.Text := sqlEditGenre;
                  ParamByName('Genre_id').AsInteger := MainForm.ibqGenres.FieldValues['Genre_id'];
                  if cbParentGenre.ItemIndex < 0 then
                    ParamByName('ParentGenre_id').Value := Null
                  else
                    ParamByName('ParentGenre_id').AsInteger := MainForm.ibqGenres.Lookup('Name', cbParentGenre.Items[cbParentGenre.ItemIndex], 'Genre_id');
                end;
              ParamByName('Name').AsString := Trim(edGenreName.Text);
              Transaction.StartTransaction;
              ExecSQL;
              Transaction.Commit;
              MainForm.actRefreshGenresExecute(MainForm);
              if IsFromAddEditBookForm then
                AddEditBookForm.AddedNewCheckListGenreItem;
              Self.Hide;
            except on E: EIBInterBaseError do
              begin
                if Transaction.Active then
                  Transaction.Rollback;
                Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
              end;
            end;
          end;
    end;
end;

procedure TAddEditGenreForm.FormShow(Sender: TObject);
var prevParentGenre, GenreID: Variant;
begin
  if IsNew then
    begin
      edGenreName.Clear;
    end
  else
    begin
      edGenreName.Text := MainForm.ibqGenres.FieldValues['Name'];
      prevParentGenre := MainForm.ibqGenres.FieldValues['ParentGenre'];
      GenreID :=  MainForm.ibqGenres.FieldValues['Genre_id'];
    end;
  cbParentGenre.Items.Clear;
  MainForm.ibqGenres.First;
  while not MainForm.ibqGenres.Eof do
    begin
      cbParentGenre.Items.Add(MainForm.ibqGenres.FieldValues['Name']);
      MainForm.ibqGenres.Next;
    end;
  MainForm.ibqGenres.Locate('Genre_id', GenreID, []);
  if not IsNew and (prevParentGenre <> Null) then
    cbParentGenre.ItemIndex := cbParentGenre.Items.IndexOf(prevParentGenre)
  else
    cbParentGenre.ItemIndex := -2;
end;

procedure TAddEditGenreForm.SetIsFromAddEditBookForm(
  FromAddEditBookForm: Boolean);
begin
  IsFromAddEditBookForm := FromAddEditBookForm;
end;

end.
