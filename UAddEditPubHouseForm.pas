unit UAddEditPubHouseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UMainFrom, SQLStrings, IB;

type
  TAddEditPubHouseForm = class(TForm)
    lblPubHouseName: TLabel;
    edPubHouseName: TEdit;
    btnSavePubHouse: TButton;
    btnCancelPubHouse: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnCancelPubHouseClick(Sender: TObject);
    procedure btnSavePubHouseClick(Sender: TObject);
  private
    IsNew: Boolean;
    IsFromAddBookForm: Boolean;
  public
    procedure SetIsNew(New: Boolean);
    procedure SetFromAddBookForm(FromAddBookForm: Boolean);
  end;

var
  AddEditPubHouseForm: TAddEditPubHouseForm;

implementation

uses UAddEditBookForm;

{$R *.dfm}

procedure TAddEditPubHouseForm.FormShow(Sender: TObject);
begin
  if IsNew then
    edPubHouseName.Clear
  else
    edPubHouseName.Text := MainForm.ibqPubHouses.FieldValues['Name'];
end;

procedure TAddEditPubHouseForm.SetIsNew(New: Boolean);
begin
  IsNew := New;
end;

procedure TAddEditPubHouseForm.btnCancelPubHouseClick(Sender: TObject);
begin
  Hide;
end;

procedure TAddEditPubHouseForm.btnSavePubHouseClick(Sender: TObject);
begin
  if Trim(edPubHouseName.Text) = '' then
    MessageDlg('Field can''t be empty!', mtError, [mbOk], 0)
  else
    begin
      {with MainForm.ibqUpdatePubHouses do
        begin
          try
            Close;
            if IsNew then
              begin
                SQL.Text := sqlInsertPubHouse;
              end
            else
              begin
                SQL.Text := sqlEditPubHouse;
                ParamByName('PubHouse_id').AsInteger := MainForm.ibqPubHouses.FieldValues['PubHouse_id'];
              end;
            ParamByName('Name').AsString := Trim(edPubHouseName.Text);
            Transaction.StartTransaction;
            ExecSQL;
            Transaction.Commit;
            MainForm.actRefreshPubHousesExecute(MainForm);
            if IsFromAddBookForm then
              AddEditBookForm.AddedNewCBPubHouseItem;
            Self.Hide;
          except on E: EIBInterBaseError do
            begin
              if Transaction.Active then
                Transaction.Rollback;
              Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
            end;
          end;
        end;}
        with MainForm.IBDataSetPubHouses do
        begin
          Open;
          try
            if not IsNew then
              begin
                Edit;
                FieldByName('PubHouse_id').AsInteger := MainForm.ibqPubHouses.FieldValues['PubHouse_id'];
              end
            else
              begin
                Insert;
              end;
            FieldByName('Name').AsString := Trim(edPubHouseName.Text);
            Post;  
            Transaction.Commit;
            MainForm.actRefreshPubHousesExecute(MainForm);
            if IsFromAddBookForm then
              AddEditBookForm.AddedNewCBPubHouseItem;
            Self.Hide;
          except on E: EIBInterBaseError do
            begin
              if Transaction.Active then
                Transaction.Rollback;
              Application.MessageBox(PChar(E.Message), 'Error!', MB_ICONERROR);
            end;
          end;
        end;
    end;
end;

procedure TAddEditPubHouseForm.SetFromAddBookForm(
  FromAddBookForm: Boolean);
begin
  IsFromAddBookForm := FromAddBookForm;
end;

end.
