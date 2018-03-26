object AddEditBorrowingForm: TAddEditBorrowingForm
  Left = 401
  Top = 138
  BorderStyle = bsSingle
  Caption = 'Borrowing'
  ClientHeight = 434
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblBookName: TLabel
    Left = 32
    Top = 24
    Width = 57
    Height = 13
    Caption = 'Book name:'
  end
  object lblFriend: TLabel
    Left = 56
    Top = 64
    Width = 32
    Height = 13
    Caption = 'Friend:'
  end
  object lblBorrowDate: TLabel
    Left = 24
    Top = 104
    Width = 62
    Height = 13
    Caption = 'Borrow Date:'
  end
  object lblReturnDate: TLabel
    Left = 24
    Top = 224
    Width = 61
    Height = 13
    Caption = 'Return Date:'
  end
  object lblBookComment: TLabel
    Left = 40
    Top = 264
    Width = 47
    Height = 13
    Caption = 'Comment:'
  end
  object btnSaveBook: TButton
    Left = 96
    Top = 384
    Width = 80
    Height = 25
    Caption = 'Save'
    Default = True
    TabOrder = 0
    OnClick = btnSaveBookClick
  end
  object btnCancelBook: TButton
    Left = 208
    Top = 384
    Width = 80
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelBookClick
  end
  object cbBookNames: TComboBox
    Left = 96
    Top = 24
    Width = 240
    Height = 21
    ItemHeight = 13
    TabOrder = 2
  end
  object cbFriends: TComboBox
    Left = 96
    Top = 64
    Width = 240
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object chBoxIsLost: TCheckBox
    Left = 96
    Top = 144
    Width = 240
    Height = 17
    Caption = 'Is Lost'
    TabOrder = 5
  end
  object chBoxIsDamaged: TCheckBox
    Left = 96
    Top = 184
    Width = 240
    Height = 17
    Caption = 'Is Damaged'
    TabOrder = 6
  end
  object memoComment: TMemo
    Left = 96
    Top = 264
    Width = 240
    Height = 89
    Lines.Strings = (
      '')
    MaxLength = 150
    ParentShowHint = False
    ShowHint = False
    TabOrder = 8
  end
  object dtpReturnDate: TDateTimePicker
    Left = 96
    Top = 224
    Width = 240
    Height = 21
    Date = 0.754420231482072300
    Time = 0.754420231482072300
    TabOrder = 7
  end
  object dtpBorrowDate: TDateTimePicker
    Left = 96
    Top = 104
    Width = 240
    Height = 21
    Date = 0.754420231482072300
    Time = 0.754420231482072300
    TabOrder = 4
  end
end
