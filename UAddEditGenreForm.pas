unit UAddEditGenreForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
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
  if edGenreName.Text = '' then
      MessageDlg('Field can''t be empty!', mtError, [mbOk], 0)
  else
    begin
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
            ParamByName('Name').AsString := edGenreName.Text;
            ExecSQL;
            Transaction.Commit;
            Transaction.Active := False;
            MainForm.actRefreshGenresExecute(MainForm);
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

end.
