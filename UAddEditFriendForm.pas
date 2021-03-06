unit UAddEditFriendForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UMainFrom, SQLStrings, IB, UFriendsDAL;

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
    procedure btnCancelFriendClick(Sender: TObject);
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
  if Trim(edFriendFIO.Text) = '' then
      MessageDlg('Fullname field can''t be empty!', mtError, [mbOk], 0)
  else
    begin
      if IsNew then
        UFriendsDAL.Insert(edFriendFIO.Text, edFriendPhone.Text,
          edFriendSocialNumber.Text, edFriendEmail.Text, edFriendComment.Text)
      else
        UFriendsDAL.Edit(MainForm.ibqFriends.FieldValues['Friend_id'],
          edFriendFIO.Text, edFriendPhone.Text, edFriendSocialNumber.Text,
          edFriendEmail.Text, edFriendComment.Text);
      Hide;
    end;
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
      edFriendFIO.Text := MainForm.ibqFriends.FieldValues['FIO'];
      edFriendPhone.Text := MainForm.ibqFriends.FieldValues['PhoneNumber'];
      edFriendSocialNumber.Text := MainForm.ibqFriends.FieldValues['SocialNumber'];
      edFriendEmail.Text := MainForm.ibqFriends.FieldValues['Email'];
      edFriendComment.Text := MainForm.ibqFriends.FieldValues['Comment'];
    end;
end;

procedure TAddEditFriendForm.edFriendPhoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ; // �����
    #8 : ;    // ������� <Back Space>
    #32 : ;   // ������
    #40 : ;   // '('
    #41 : ;   // ')'
    #43 : ;   // '+'
    #13 : edFriendSocialNumber.SetFocus ; // ������� <Enter>, ��������� ����� �� ��������� Edit
      // ��������� ������� � ���������
    else Key := Chr(0); // ������ �� ����������
  end;
end;

procedure TAddEditFriendForm.btnCancelFriendClick(Sender: TObject);
begin
  Self.Hide;
end;

end.
