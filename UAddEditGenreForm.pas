unit UAddEditGenreForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IB, SQLStrings, UMainFrom;

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
                ParamByName('Genre_id').AsInteger := MainForm.dbgridGenres.DataSource.DataSet.Fields.Fields[0].Value;
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
var i: Integer;
    prevParentGenreID: Variant;
begin
  if IsNew then
    begin
      edGenreName.Clear;
    end
  else
    begin
      edGenreName.Text := MainForm.dbgridGenres.DataSource.DataSet.Fields.Fields[1].Value;
      prevParentGenreID := MainForm.dbgridGenres.DataSource.DataSet.Fields.Fields[2].Value;
    end;
  cbParentGenre.Items.Clear;
  MainForm.ibqGenres.First;
  for i := 0 to MainForm.ibqGenres.RecordCount - 1 do
    begin
      cbParentGenre.Items.Add(MainForm.ibqGenres.Fields.Fields[1].Value);
      MainForm.ibqGenres.Next;
    end;
  if not IsNew and (prevParentGenreID <> Null) then
    cbParentGenre.ItemIndex := cbParentGenre.Items.IndexOf(MainForm.dbgridGenres.DataSource.DataSet.Lookup('Genre_id', prevParentGenreID, 'Name'));
end;

end.
