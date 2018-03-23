object SearchBookForm: TSearchBookForm
  Left = 903
  Top = 230
  BorderStyle = bsSingle
  Caption = 'Search Books'
  ClientHeight = 405
  ClientWidth = 387
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
  object lblYearFrom: TLabel
    Left = 32
    Top = 304
    Width = 32
    Height = 20
    Caption = 'from'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblYearTo: TLabel
    Left = 200
    Top = 304
    Width = 14
    Height = 20
    Caption = 'to'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object cbName: TCheckBox
    Left = 32
    Top = 24
    Width = 97
    Height = 17
    Caption = 'Name'
    TabOrder = 0
    OnClick = cbNameClick
  end
  object cbAuthor: TCheckBox
    Left = 32
    Top = 64
    Width = 97
    Height = 17
    Caption = 'Author'
    TabOrder = 1
    OnClick = cbAuthorClick
  end
  object cbPubHouse: TCheckBox
    Left = 32
    Top = 224
    Width = 121
    Height = 17
    Caption = 'Publishing House'
    TabOrder = 2
    OnClick = cbPubHouseClick
  end
  object edtSearchName: TEdit
    Left = 160
    Top = 24
    Width = 200
    Height = 21
    TabOrder = 3
  end
  object edtSearchAuthor: TEdit
    Left = 160
    Top = 64
    Width = 200
    Height = 21
    TabOrder = 4
  end
  object cbGenre: TCheckBox
    Left = 32
    Top = 184
    Width = 97
    Height = 17
    Caption = 'Genre'
    TabOrder = 5
    OnClick = cbGenreClick
  end
  object edtSearchGenre: TEdit
    Left = 160
    Top = 184
    Width = 200
    Height = 21
    TabOrder = 6
  end
  object btnSearchBook: TButton
    Left = 64
    Top = 352
    Width = 80
    Height = 25
    Caption = 'Search'
    Default = True
    TabOrder = 7
    OnClick = btnSearchBookClick
  end
  object btnCancel: TButton
    Left = 176
    Top = 352
    Width = 80
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 8
    OnClick = btnCancelClick
  end
  object cbYear: TCheckBox
    Left = 32
    Top = 264
    Width = 97
    Height = 17
    Caption = 'Publication Year'
    TabOrder = 9
    OnClick = cbYearClick
  end
  object cbTranslator: TCheckBox
    Left = 32
    Top = 144
    Width = 97
    Height = 17
    Caption = 'Translator'
    TabOrder = 10
    OnClick = cbTranslatorClick
  end
  object edtTranslator: TEdit
    Left = 160
    Top = 144
    Width = 200
    Height = 21
    TabOrder = 11
  end
  object edtPicAutor: TEdit
    Left = 160
    Top = 104
    Width = 200
    Height = 21
    TabOrder = 12
  end
  object cbPicAuthor: TCheckBox
    Left = 32
    Top = 104
    Width = 97
    Height = 17
    Caption = 'Picture Author'
    TabOrder = 13
    OnClick = cbPicAuthorClick
  end
  object edtYearFrom: TEdit
    Left = 96
    Top = 304
    Width = 73
    Height = 21
    TabOrder = 14
    OnKeyPress = edtYearFromKeyPress
  end
  object cbbPubHouse: TComboBox
    Left = 160
    Top = 224
    Width = 200
    Height = 21
    ItemHeight = 13
    TabOrder = 15
  end
  object edtYearTo: TEdit
    Left = 240
    Top = 304
    Width = 73
    Height = 21
    TabOrder = 16
    OnKeyPress = edtYearFromKeyPress
  end
end
