unit USearchBorrowingsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SearchBorrowingForm: TSearchBorrowingForm;

implementation

{$R *.dfm}

end.
