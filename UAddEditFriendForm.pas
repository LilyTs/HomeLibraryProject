unit UAddEditFriendForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UMainFrom, SQLStrings, DB;

type
  TAddEditFriendForm = class(TForm)
    lblFIO: TLabel;
    edFriendFIO: TEdit;
    lblPhoneFriend: TLabel;
    edFriendPhone: TEdit;
    lblSocialNumberFriend: TLabel;
    edFriendSocialNumber: TEdit;
    lblEmailFriend: TLabel;
    edFriendEmail: TEdit;
    lblFriendComment: TLabel;
    edFriendComment: TEdit;
    btnSaveFriend: TButton;
    btnCancelFriend: TButton;
    procedure btnSaveFriendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edFriendPhoneKeyPress(Sender: TObject; var Key: Char);
  private
    IsNew: Boolean;
  public
    procedure SetIsNew(New: Boolean);
  end;

var
  AddEditFriendForm: TAddEditFriendForm;

implementation

{$R *.dfm}

procedure TAddEditFriendForm.btnSaveFriendClick(Sender: TObject);
begin
  if (edFriendFIO.Text = '') then
      MessageDlg('Fullname field can''t be empty!', mtError, [mbOk], 0)
  else
    begin
      with MainForm.ibqUpdateFriends do
        begin
          try
            Close;
            SQL.Clear;
            if IsNew then
              SQL.Text := sqlInsertFriend
            else
              begin
                SQL.Text := sqlEditFriend;
                ParamByName('Friend_id').AsInteger := MainForm.dbgridFriends.DataSource.DataSet.Fields.Fields[0].Value;
              end;
            ParamByName('FIO').AsString := edFriendFIO.Text;
            ParamByName('PhoneNumber').AsString := edFriendPhone.Text;
            ParamByName('SocialNumber').AsString := edFriendSocialNumber.Text;
            ParamByName('Email').AsString := edFriendEmail.Text;
            ParamByName('Comment').AsString := edFriendComment.Text;
            ExecSQL;
            Transaction.Commit;
            Transaction.Active := False;
            MainForm.actRefreshFriendsExecute(self);
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

procedure TAddEditFriendForm.SetIsNew(New: Boolean);
begin
  IsNew := New;
end;

procedure TAddEditFriendForm.FormShow(Sender: TObject);
begin
  if IsNew then
    begin
      edFriendFIO.Clear;
      edFriendPhone.Clear;
      edFriendSocialNumber.Clear;
      edFriendEmail.Clear;
      edFriendComment.Clear;
    end
  else
    begin
      edFriendFIO.Text := MainForm.dbgridFriends.DataSource.DataSet.Fields.Fields[1].Value;
      edFriendPhone.Text := MainForm.dbgridFriends.DataSource.DataSet.Fields.Fields[2].Value;
      edFriendSocialNumber.Text := MainForm.dbgridFriends.DataSource.DataSet.Fields.Fields[3].Value;
      edFriendEmail.Text := MainForm.dbgridFriends.DataSource.DataSet.Fields.Fields[4].Value;
      edFriendComment.Text := MainForm.dbgridFriends.DataSource.DataSet.Fields.Fields[5].Value;
    end;
end;

procedure TAddEditFriendForm.edFriendPhoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ; // цифра
    #8 : ;    // клавиша <Back Space>
    #32 : ;   // пробел
    #40 : ;   // '('
    #41 : ;   // ')'
    #43 : ;   // '+'
    #13 : edFriendSocialNumber.SetFocus ; // клавиша <Enter>, переводим фокус на следующий Edit
      // остальные символы Ч запрещены
    else Key := Chr(0); // символ не отображать
  end;
end;

end.
