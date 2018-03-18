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
            MainForm.ibqFriends.SQL.Text := MainForm.ibqFriends.SQL.Text + ' WHERE FIO =  ''' + edtNameFriend.Text + '''';
            isFirst := False;
          end;

        if chkPhoneFriend.Checked then
          if isFirst then
            begin
              MainForm.ibqFriends.SQL.Text := MainForm.ibqFriends.SQL.Text + ' WHERE PhoneNumber =  ''' + edtPhoneFriend.Text + '''';
              isFirst := False;
            end
          else
            MainForm.ibqFriends.SQL.Text := MainForm.ibqFriends.SQL.Text + ' AND PhoneNumber =  ''' + edtPhoneFriend.Text + '''';

        if chkCommentFriend.Checked then
          if isFirst then
            begin
              MainForm.ibqFriends.SQL.Text := MainForm.ibqFriends.SQL.Text + ' WHERE Comment =  ''' + edtCommentFriend.Text + '''';
              isFirst := False;
            end
          else
            MainForm.ibqFriends.SQL.Text := MainForm.ibqFriends.SQL.Text + ' AND Comment =  ''' + edtCommentFriend.Text + '''';

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

end.
