object SearchBorrowingForm: TSearchBorrowingForm
  Left = 933
  Top = 154
  BorderStyle = bsSingle
  Caption = 'Borrowings'
  ClientHeight = 334
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblSearchBorrowDateFrom: TLabel
    Left = 128
    Top = 232
    Width = 26
    Height = 16
    Caption = 'from'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblSearchBorrowDateTo: TLabel
    Left = 264
    Top = 232
    Width = 11
    Height = 16
    Caption = 'to'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblSearchReturnDateFrom: TLabel
    Left = 128
    Top = 184
    Width = 26
    Height = 16
    Caption = 'from'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblSearchReturnDateTo: TLabel
    Left = 264
    Top = 184
    Width = 11
    Height = 16
    Caption = 'to'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btnSearchBorrowing: TButton
    Left = 24
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Search'
    Default = True
    TabOrder = 0
  end
  object dtpSearchFrom: TDateTimePicker
    Left = 160
    Top = 232
    Width = 89
    Height = 21
    Date = 43182.611451250000000000
    Time = 43182.611451250000000000
    TabOrder = 1
  end
  object btnCancelBorrowing: TButton
    Left = 288
    Top = 280
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
  end
  object dtpSearchBorrowDateTo: TDateTimePicker
    Left = 280
    Top = 232
    Width = 89
    Height = 21
    Date = 43182.613483229160000000
    Time = 43182.613483229160000000
    TabOrder = 3
  end
  object chkSearchBorrowDate: TCheckBox
    Left = 24
    Top = 232
    Width = 97
    Height = 17
    Caption = 'Borrow Date'
    TabOrder = 4
  end
  object edtSearchBorrowName: TEdit
    Left = 248
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object chkSearchBorrowName: TCheckBox
    Left = 24
    Top = 24
    Width = 97
    Height = 17
    Caption = 'Book name'
    TabOrder = 6
  end
  object chkSearchBorrowFriend: TCheckBox
    Left = 24
    Top = 64
    Width = 97
    Height = 17
    Caption = 'Friend'
    TabOrder = 7
  end
  object edtSearchBorrowFriend: TEdit
    Left = 248
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object dtpSearchBorrowReturnDateFrom: TDateTimePicker
    Left = 160
    Top = 184
    Width = 89
    Height = 21
    Date = 43182.620157314810000000
    Time = 43182.620157314810000000
    TabOrder = 9
  end
  object dtpSearchBorrowReturnDateTo: TDateTimePicker
    Left = 280
    Top = 184
    Width = 89
    Height = 21
    Date = 43182.624575509260000000
    Time = 43182.624575509260000000
    TabOrder = 10
  end
  object chkSearchReturnDate: TCheckBox
    Left = 24
    Top = 184
    Width = 97
    Height = 17
    Caption = 'Return Date'
    TabOrder = 11
  end
  object chkSearchIsLost: TCheckBox
    Left = 24
    Top = 104
    Width = 97
    Height = 17
    Caption = 'Is Lost'
    TabOrder = 12
  end
  object chkSearchIsDamaged: TCheckBox
    Left = 24
    Top = 144
    Width = 97
    Height = 17
    Caption = 'Is Damaged'
    TabOrder = 13
  end
  object chkSearchLostTrue: TCheckBox
    Left = 248
    Top = 104
    Width = 97
    Height = 17
    TabOrder = 14
  end
  object chkSearchIsDamagedTrue: TCheckBox
    Left = 248
    Top = 144
    Width = 97
    Height = 17
    TabOrder = 15
  end
end
