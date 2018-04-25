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
  with MainForm.IBDataSetFriends do
    begin
      try
        Open;
        if IsNew then
          Insert
        else
          begin
            Edit;
            FieldByName('Friend_id').AsInteger := Id;
          end;
        FieldByName('FIO').AsString := Trim(FIO);
        FieldByName('PhoneNumber').AsString := Trim(PhoneNumber);
        FieldByName('SocialNumber').AsString := Trim(SocialNumber);
        FieldByName('Email').AsString := Trim(Email);
        FieldByName('Comment').AsString := Trim(Comment);
        Post;
        Transaction.Commit;
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
  with MainForm.IBDataSetFriends do
    begin
      try
        Open;
        Locate('Friend_id', Id, []);
        Delete;
        Transaction.Commit;
        MainForm.actRefreshFriendsExecute(MainForm);
        MainForm.actRefreshBorrowingsExecute(MainForm);
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
