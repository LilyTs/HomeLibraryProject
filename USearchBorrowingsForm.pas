unit USearchBorrowingsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, UMainFrom, IB, SQLStrings, StrUtils;

type
  TSearchBorrowingForm = class(TForm)
    btnSearchBorrowing: TButton;
    dtpSearchFrom: TDateTimePicker;
    btnCancelBorrowing: TButton;
    dtpSearchBorrowDateTo: TDateTimePicker;
    lblSearchBorrowDateFrom: TLabel;
    lblSearchBorrowDateTo: TLabel;
    chkSearchBorrowDate: TCheckBox;
    edtSearchBorrowName: TEdit;
    chkSearchBorrowName: TCheckBox;
    chkSearchBorrowFriend: TCheckBox;
    edtSearchBorrowFriend: TEdit;
    dtpSearchBorrowReturnDateFrom: TDateTimePicker;
    dtpSearchBorrowReturnDateTo: TDateTimePicker;
    lblSearchReturnDateFrom: TLabel;
    lblSearchReturnDateTo: TLabel;
    chkSearchReturnDate: TCheckBox;
    chkSearchIsLost: TCheckBox;
    chkSearchIsDamaged: TCheckBox;
    chkSearchLostTrue: TCheckBox;
    chkSearchIsDamagedTrue: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure chkSearchBorrowNameClick(Sender: TObject);
    procedure chkSearchBorrowFriendClick(Sender: TObject);
    procedure chkSearchIsLostClick(Sender: TObject);
    procedure chkSearchIsDamagedClick(Sender: TObject);
    procedure chkSearchReturnDateClick(Sender: TObject);
    procedure chkSearchBorrowDateClick(Sender: TObject);
    procedure btnCancelBorrowingClick(Sender: TObject);
    procedure btnSearchBorrowingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SearchBorrowingForm: TSearchBorrowingForm;

implementation

{$R *.dfm}

procedure TSearchBorrowingForm.FormShow(Sender: TObject);
begin
  edtSearchBorrowName.Visible := False;
  edtSearchBorrowFriend.Visible := False;
  chkSearchLostTrue.Visible := False;
  chkSearchIsDamagedTrue.Visible := False;
  lblSearchReturnDateFrom.Visible := False;
  dtpSearchBorrowReturnDateFrom.Visible := False;
  lblSearchReturnDateTo.Visible := False;
  dtpSearchBorrowReturnDateTo.Visible := False;
  lblSearchBorrowDateFrom.Visible := False;
  dtpSearchFrom.Visible := False;
  lblSearchBorrowDateTo.Visible := False;
  dtpSearchBorrowDateTo.Visible := False;

  edtSearchBorrowName.Clear;
  edtSearchBorrowFriend.Clear;

  chkSearchLostTrue.Checked := False;
  chkSearchIsDamagedTrue.Checked := False;
  chkSearchBorrowName.Checked := False;
  chkSearchBorrowFriend.Checked := False;
  chkSearchIsLost.Checked := False;
  chkSearchIsDamaged.Checked := False;
  chkSearchReturnDate.Checked := False;
  chkSearchBorrowDate.Checked := False;
end;

procedure TSearchBorrowingForm.chkSearchBorrowNameClick(Sender: TObject);
begin
  if chkSearchBorrowName.Checked then
    edtSearchBorrowName.Visible := True
  else
    edtSearchBorrowName.Visible := False;
end;

procedure TSearchBorrowingForm.chkSearchBorrowFriendClick(Sender: TObject);
begin
  if chkSearchBorrowFriend.Checked then
    edtSearchBorrowFriend.Visible := True
  else
    edtSearchBorrowFriend.Visible := False;
end;

procedure TSearchBorrowingForm.chkSearchIsLostClick(Sender: TObject);
begin
  if chkSearchIsLost.Checked then
    chkSearchLostTrue.Visible := True
  else
    chkSearchLostTrue.Visible := False;
end;

procedure TSearchBorrowingForm.chkSearchIsDamagedClick(Sender: TObject);
begin
  if chkSearchIsDamaged.Checked then
    chkSearchIsDamagedTrue.Visible := True
  else
    chkSearchIsDamagedTrue.Visible := False;
end;

procedure TSearchBorrowingForm.chkSearchReturnDateClick(Sender: TObject);
begin
  if chkSearchReturnDate.Checked then
  begin
    lblSearchReturnDateFrom.Visible := True;
    dtpSearchBorrowReturnDateFrom.Visible := True;
    lblSearchReturnDateTo.Visible := True;
    dtpSearchBorrowReturnDateTo.Visible := True;
  end
  else
  begin
    lblSearchReturnDateFrom.Visible := False;
    dtpSearchBorrowReturnDateFrom.Visible := False;
    lblSearchReturnDateTo.Visible := False;
    dtpSearchBorrowReturnDateTo.Visible := False;
  end
end;

procedure TSearchBorrowingForm.chkSearchBorrowDateClick(Sender: TObject);
begin
  if chkSearchBorrowDate.Checked then
  begin
    lblSearchBorrowDateFrom.Visible := True;
    dtpSearchFrom.Visible := True;
    lblSearchBorrowDateTo.Visible := True;
    dtpSearchBorrowDateTo.Visible := True;
  end
  else
  begin
    lblSearchBorrowDateFrom.Visible := False;
    dtpSearchFrom.Visible := False;
    lblSearchBorrowDateTo.Visible := False;
    dtpSearchBorrowDateTo.Visible := False;
  end
end;

procedure TSearchBorrowingForm.btnCancelBorrowingClick(Sender: TObject);
begin
  Self.Hide;
end;

procedure TSearchBorrowingForm.btnSearchBorrowingClick(Sender: TObject);
begin
  with MainForm.ibqBooks do
    begin
      try
        isFirst := True;
        MainForm.ibqBooks.Close;
        //MainForm.ibqBooks.SQL.Text := sqlGetBooksWithPubHouseAndGenres;


          MainForm.ibqBooks.Open;

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
