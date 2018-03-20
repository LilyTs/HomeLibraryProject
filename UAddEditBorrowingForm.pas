unit UAddEditBorrowingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ComCtrls;

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

end.
