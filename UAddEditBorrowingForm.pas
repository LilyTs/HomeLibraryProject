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
    btnSaveBorrowing: TButton;
    btnCancelBorrowing: TButton;
    cbBookNames: TComboBox;
    cbFriends: TComboBox;
    chBoxIsLost: TCheckBox;
    chBoxIsDamaged: TCheckBox;
    dtpReturnDate: TDateTimePicker;
    dtpBorrowDate: TDateTimePicker;
    memoComment: TMemo;
    procedure btnCancelBorrowingClick(Sender: TObject);
    procedure btnSaveBorrowingClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    IsNew: Boolean;
    procedure ChangeFormForEdit;
    procedure ReturnNormalFormView;
  public
    procedure SetIsNew(New: Boolean);
  end;

var
  AddEditBorrowingForm: TAddEditBorrowingForm;

implementation

{$R *.dfm}

procedure TAddEditBorrowingForm.btnCancelBorrowingClick(Sender: TObject);
begin
  Self.Hide;
end;

procedure TAddEditBorrowingForm.SetIsNew(New: Boolean);
begin
  IsNew := New;
end;

procedure TAddEditBorrowingForm.btnSaveBorrowingClick(Sender: TObject);
begin
  if dtpReturnDate.Date < dtpBorrowDate.Date then
    MessageDlg('Return date can''t be earlier than borrow date ('
    + DateToStr(dtpBorrowDate.Date) + ')!', mtError, [mbOk], 0)
  else
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
                  ParamByName('Book_id').AsInteger := MainForm.ibqBooks.Lookup('Name', MainForm.ibqBorrowings.FieldValues['Name'], 'Book_id');
                  ParamByName('Friend_id').AsInteger := MainForm.ibqFriends.Lookup('FIO', MainForm.ibqBorrowings.FieldValues['FIO'], 'Friend_id');
                  ParamByName('BorrowDate').AsDate := MainForm.ibqBorrowings.FieldValues['BorrowDate'];
                  ReturnNormalFormView;
                end;
              ParamByName('IsLost').AsString := BoolToStr(chBoxIsLost.Checked, True);
              ParamByName('IsDamaged').AsString := BoolToStr(chBoxIsDamaged.Checked, True);
              ParamByName('ReturnDate').AsDate := dtpReturnDate.Date;
              ParamByName('Comment').AsString := Trim(memoComment.Text);
              Transaction.StartTransaction;
              ExecSQL;
              Transaction.Commit;
              MainForm.actRefreshBorrowingsExecute(MainForm);
              Self.Hide;
            except on E: EIBInterBaseError do
              begin
                if Transaction.Active then
                  Transaction.Rollback;
                Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
              end;
            end;
end;

procedure TAddEditBorrowingForm.FormShow(Sender: TObject);
begin
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
      dtpBorrowDate.Date := Now;
      dtpReturnDate.Date := Now;
    end
  else
    begin
      chBoxIsLost.Checked := (MainForm.ibqBorrowings.FieldValues['IsLost'] = '+');
      chBoxIsDamaged.Checked := (MainForm.ibqBorrowings.FieldValues['IsDamaged'] = '+');
      dtpBorrowDate.Date := MainForm.ibqBorrowings.FieldValues['BorrowDate'];
      dtpReturnDate.Date := MainForm.ibqBorrowings.FieldValues['ReturnDate'];
      memoComment.Text := MainForm.ibqBorrowings.FieldValues['Comment'];
      ChangeFormForEdit;
    end;
end;

procedure TAddEditBorrowingForm.ReturnNormalFormView;
begin
  chBoxIsLost.Top := chBoxIsLost.Top + 120;
  chBoxIsDamaged.Top := chBoxIsDamaged.Top + 120;
  dtpReturnDate.Top := dtpReturnDate.Top + 120;
  memoComment.Top := memoComment.Top + 120;
  btnSaveBorrowing.Top := btnSaveBorrowing.Top + 120;
  btnCancelBorrowing.Top := btnCancelBorrowing.Top + 120;
  lblReturnDate.Top := lblReturnDate.Top + 120;
  lblBookComment.Top := lblBookComment.Top + 120;
  Self.Height := Self.Height + 120;
end;

procedure TAddEditBorrowingForm.ChangeFormForEdit;
begin
  chBoxIsLost.Top := chBoxIsLost.Top - 120;
  chBoxIsDamaged.Top := chBoxIsDamaged.Top - 120;
  dtpReturnDate.Top := dtpReturnDate.Top - 120;
  memoComment.Top := memoComment.Top - 120;
  btnSaveBorrowing.Top := btnSaveBorrowing.Top - 120;
  btnCancelBorrowing.Top := btnCancelBorrowing.Top - 120;
  lblReturnDate.Top := lblReturnDate.Top - 120;
  lblBookComment.Top := lblBookComment.Top - 120;
  Self.Height := Self.Height - 120;
end;

end.
