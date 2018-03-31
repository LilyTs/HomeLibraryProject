unit UFriendsDAL;

interface

uses
  UMainFrom, SQLStrings, DB, IB, Variants, Dialogs, SysUtils;

procedure Insert(FIO: string; PhoneNumber: string; SocialNumber: string;
  Email: string; Comment: String);
procedure Edit(Id: Integer; FIO: string; PhoneNumber: string; SocialNumber: string;
  Email: string; Comment: String);
procedure Delete(Id: Integer);

implementation

//если Id = null то вставка, иначе редактирование
procedure InsertOrEdit(Id: Variant; FIO: string; PhoneNumber: string;
  SocialNumber: string; Email: string; Comment: String);
var IsNew: Boolean;
begin
  IsNew := (Id = Null);
  with MainForm.ibqUpdateFriends do
    begin
      try
        Close;
        if IsNew then
          SQL.Text := sqlInsertFriend
        else
          begin
            SQL.Text := sqlEditFriend;
            ParamByName('Friend_id').AsInteger := Id;
          end;
        ParamByName('FIO').AsString := Trim(FIO);
        ParamByName('PhoneNumber').AsString := Trim(PhoneNumber);
        ParamByName('SocialNumber').AsString := Trim(SocialNumber);
        ParamByName('Email').AsString := Trim(Email);
        ParamByName('Comment').AsString := Trim(Comment);
        ExecSQL;
        Transaction.Commit;
        Transaction.Active := False;
        MainForm.actRefreshFriendsExecute(MainForm);
      except on E: EIBInterBaseError do
        begin
          if Transaction.Active then
            Transaction.Rollback;
          MessageDlg(E.Message, mtError, [mbOk], 0);
        end;
      end;
    end;
end;

procedure Insert(FIO: string; PhoneNumber: string; SocialNumber: string;
  Email: string; Comment: String);
begin
  InsertOrEdit(null, FIO, PhoneNumber, SocialNumber, Email, Comment);
end;


procedure Edit(Id: Integer; FIO: string; PhoneNumber: string; SocialNumber: string;
  Email: string; Comment: String);
begin
  InsertOrEdit(Id, FIO, PhoneNumber, SocialNumber, Email, Comment);
end;

procedure Delete(Id: Integer);
begin
  with MainForm.ibqUpdateFriends do
    begin
      try
        Close;
        SQL.Text := sqlDeleteFriend;
        ParamByName('Friend_id').AsInteger := Id;
        ExecSQL;
        Transaction.Commit;
        Transaction.Active := False;
        MainForm.actRefreshFriendsExecute(MainForm);

      except on E: EIBInterBaseError do
        begin
          if Transaction.Active then
            Transaction.Rollback;
          MessageDlg(E.Message, mtError, [mbOK], 0);
        end;
      end;
    end;
end;

end.
