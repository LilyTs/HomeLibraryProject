unit UAddEditBorrowingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ComCtrls, UMainFrom, SQLStrings, IB;

type
  TAddEditBorrowingForm = class(TForm)
    lblBookName: TLabel;
    lblFriend: TLabel;
    lblBorrowDate: TLabel;
    lblReturnDate: TLabel;
    lblBookComment: TLabel;
    btnSaveBook: TButton;
    btnCancelBook: TButton;
    cbBookNames: TComboBox;
    cbFriends: TComboBox;
    chBoxIsLost: TCheckBox;
    chBoxIsDamaged: TCheckBox;
    dtpReturnDate: TDateTimePicker;
    dtpBorrowDate: TDateTimePicker;
    memoComment: TMemo;
    procedure btnCancelBookClick(Sender: TObject);
    procedure btnSaveBookClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    IsNew: Boolean;
  public
    procedure SetIsNew(New: Boolean);
  end;

var
  AddEditBorrowingForm: TAddEditBorrowingForm;

implementation

{$R *.dfm}

procedure TAddEditBorrowingForm.btnCancelBookClick(Sender: TObject);
begin
  Self.Hide;
end;

procedure TAddEditBorrowingForm.SetIsNew(New: Boolean);
begin
  IsNew := New;
end;

procedure TAddEditBorrowingForm.btnSaveBookClick(Sender: TObject);
begin
  if IsNew and (cbBookNames.ItemIndex = -1) then
    MessageDlg('Book name field can''t be empty!', mtError, [mbOk], 0)
  else
    if IsNew and (cbFriends.ItemIndex = -1) then
      MessageDlg('Friend name field can''t be empty!', mtError, [mbOk], 0)
    else  
      with MainForm.ibqUpdateBorrowings do
          try
            Close;
            if IsNew then
              begin
                SQL.Text := sqlInsertBorrowing;
                ParamByName('Book_id').AsInteger := MainForm.ibqBooks.Lookup('Name', cbBookNames.Items[cbBookNames.ItemIndex], 'Book_id');
                ParamByName('Friend_id').AsInteger := MainForm.ibqFriends.Lookup('FIO', cbFriends.Items[cbFriends.ItemIndex], 'Friend_id');
                ParamByName('BorrowDate').AsDate := dtpBorrowDate.Date;
              end
            else
              begin
                SQL.Text := sqlEditBorrowing;
                ParamByName('Book_id').AsInteger := MainForm.dbgridBooks.DataSource.DataSet.Lookup('Name', MainForm.dbgridBorrowings.DataSource.DataSet.Fields.Fields[0].Value, 'Book_id');
                ParamByName('Friend_id').AsInteger := MainForm.dbgridFriends.DataSource.DataSet.Lookup('FIO', MainForm.dbgridBorrowings.DataSource.DataSet.Fields.Fields[1].Value, 'Friend_id');
                ParamByName('BorrowDate').AsDate := MainForm.dbgridBorrowings.DataSource.DataSet.Fields.Fields[2].Value;
              end;
            ParamByName('IsLost').AsString := BoolToStr(chBoxIsLost.Checked, True);
            ParamByName('IsDamaged').AsString := BoolToStr(chBoxIsDamaged.Checked, True);
            ParamByName('ReturnDate').AsDate := dtpReturnDate.Date;
            ParamByName('Comment').AsString := memoComment.Text;
            ExecSQL; 
            Transaction.Commit;
            Transaction.Active := False;
            MainForm.actRefreshBorrowingsExecute(MainForm);
          except on E: EIBInterBaseError do
            begin
              if Transaction.Active then
                Transaction.Rollback;
              Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
            end;
          end;
    Self.Hide;
end;

procedure TAddEditBorrowingForm.FormShow(Sender: TObject);
begin
  dtpBorrowDate.Date := Now;
  dtpReturnDate.Date := Now; 
  cbBookNames.Visible := IsNew;
  cbFriends.Visible := IsNew;
  dtpBorrowDate.Visible := IsNew;
  lblBookName.Visible := IsNew;
  lblFriend.Visible := IsNew;
  lblBorrowDate.Visible := IsNew;
  cbBookNames.Items.Clear;
  MainForm.ibqBooks.First;
  while not MainForm.ibqBooks.Eof do
    begin
      cbBookNames.Items.Add(MainForm.ibqBooks.FieldValues['Name']);
      MainForm.ibqBooks.Next;
    end;
  cbFriends.Items.Clear;
  MainForm.ibqFriends.First;
  while not MainForm.ibqFriends.Eof do
    begin
      cbFriends.Items.Add(MainForm.ibqFriends.FieldValues['FIO']);
      MainForm.ibqFriends.Next;
    end;
  if IsNew then
    begin
      memoComment.Lines.Clear;
      cbBookNames.ItemIndex := -1;
      cbFriends.ItemIndex := -1;
      chBoxIsLost.Checked := False; 
      chBoxIsDamaged.Checked := False;
    end
  else
    begin
      chBoxIsLost.Checked := (MainForm.dbgridBorrowings.DataSource.DataSet.FieldValues['IsLost'] = '+');
      chBoxIsDamaged.Checked := (MainForm.dbgridBorrowings.DataSource.DataSet.FieldValues['IsDamaged'] = '+');
      dtpReturnDate.Date := MainForm.dbgridBorrowings.DataSource.DataSet.FieldValues['ReturnDate'];
      memoComment.Text := MainForm.dbgridBorrowings.DataSource.DataSet.FieldValues['Comment'];
    end;
end;

end.
