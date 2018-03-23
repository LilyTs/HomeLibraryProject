unit USearchBorrowingsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, UMainFrom, IB, SQLStrings;

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
  {edtSearchName.Visible := False;
  edtSearchAuthor.Visible := False;
  cbbPubHouse.Visible := False;
  edtSearchGenre.Visible := False;
  edtTranslator.Visible := False;
  edtPicAutor.Visible := False;
  edtYearTo.Visible := False;
  edtYearFrom.Visible := False;
  lblYearTo.Visible := False;
  lblYearFrom.Visible := False;

  chk.Checked := False;
  cbAuthor.Checked := False;
  cbPicAuthor.Checked := False;
  cbTranslator.Checked := False;
  cbGenre.Checked := False;
  cbPubHouse.Checked := False;
  cbYear.Checked := False;    }
end;

end.
