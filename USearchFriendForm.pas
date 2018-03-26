unit USearchFriendForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UMainFrom, IB, SQLStrings, StdCtrls;

type
  TSearchFriendForm = class(TForm)
    chkNameFriend: TCheckBox;
    chkPhoneFriend: TCheckBox;
    chkCommentFriend: TCheckBox;
    edtNameFriend: TEdit;
    edtPhoneFriend: TEdit;
    edtCommentFriend: TEdit;
    btnSearchFriend: TButton;
    btnCancelFriend: TButton;
    procedure btnCancelFriendClick(Sender: TObject);
    procedure btnSearchFriendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkNameFriendClick(Sender: TObject);
    procedure chkPhoneFriendClick(Sender: TObject);
    procedure chkCommentFriendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SearchFriendForm: TSearchFriendForm;

implementation

{$R *.dfm}

procedure TSearchFriendForm.btnCancelFriendClick(Sender: TObject);
begin
  Self.Hide;
end;

procedure TSearchFriendForm.btnSearchFriendClick(Sender: TObject);
var isFirst: Boolean;
begin
  with MainForm.ibqFriends do
    begin
      try
        isFirst := True;
        MainForm.ibqFriends.Close;
        MainForm.ibqFriends.SQL.Text := sqlGetFriends;
        if chkNameFriend.Checked then
          begin
            MainForm.ibqFriends.SQL.Text := MainForm.ibqFriends.SQL.Text + ' WHERE FIO LIKE ''%' + edtNameFriend.Text + '%''';
            isFirst := False;
          end;

        if chkPhoneFriend.Checked then
          if isFirst then
            begin
              MainForm.ibqFriends.SQL.Text := MainForm.ibqFriends.SQL.Text + ' WHERE PhoneNumber LIKE ''%' + edtPhoneFriend.Text + '%''';
              isFirst := False;
            end
          else
            MainForm.ibqFriends.SQL.Text := MainForm.ibqFriends.SQL.Text + ' AND PhoneNumber LIKE ''%' + edtPhoneFriend.Text + '%''';

        if chkCommentFriend.Checked then
          if isFirst then
            begin
              MainForm.ibqFriends.SQL.Text := MainForm.ibqFriends.SQL.Text + ' WHERE Comment LIKE ''%' + edtCommentFriend.Text + '%''';
              isFirst := False;
            end
          else
            MainForm.ibqFriends.SQL.Text := MainForm.ibqFriends.SQL.Text + ' AND Comment LIKE ''%' + edtCommentFriend.Text + '%''';

          MainForm.ibqFriends.Open;

          if isFirst then
            MessageDlg('Fields are not selected!', mtError, [mbOk], 0);
      except
        on E: EIBInterBaseError do
          begin
            Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
            Halt;
          end;
      end;
    end;
  Self.Hide;
end;

procedure TSearchFriendForm.FormShow(Sender: TObject);
begin
  edtNameFriend.Visible := False;
  edtPhoneFriend.Visible := False;
  edtCommentFriend.Visible := False;
  chkNameFriend.Checked := False;
  chkPhoneFriend.Checked := False;
  chkCommentFriend.Checked := False;

  edtNameFriend.Clear;
  edtPhoneFriend.Clear;
  edtCommentFriend.Clear;
end;

procedure TSearchFriendForm.chkNameFriendClick(Sender: TObject);
begin
  if chkNameFriend.Checked then
    edtNameFriend.Visible := True
  else
    edtNameFriend.Visible := False;
end;

procedure TSearchFriendForm.chkPhoneFriendClick(Sender: TObject);
begin
  if chkPhoneFriend.Checked then
    edtPhoneFriend.Visible := True
  else
    edtPhoneFriend.Visible := False;
end;

procedure TSearchFriendForm.chkCommentFriendClick(Sender: TObject);
begin
  if chkCommentFriend.Checked then
    edtCommentFriend.Visible := True
  else
    edtCommentFriend.Visible := False;
end;

end.
