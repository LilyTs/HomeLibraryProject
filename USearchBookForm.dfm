object SearchBookForm: TSearchBookForm
  Left = 903
  Top = 230
  BorderStyle = bsSingle
  Caption = 'Search Books'
  ClientHeight = 351
  ClientWidth = 344
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
    Top = 184
    Width = 121
    Height = 17
    Caption = 'Publishing House'
    TabOrder = 2
    OnClick = cbPubHouseClick
  end
  object edtSearchName: TEdit
    Left = 192
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtSearchAuthor: TEdit
    Left = 192
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object cbGenre: TCheckBox
    Left = 32
    Top = 224
    Width = 97
    Height = 17
    Caption = 'Genre'
    TabOrder = 5
    OnClick = cbGenreClick
  end
  object edtSearchPubHouse: TEdit
    Left = 192
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object edtSearchGenre: TEdit
    Left = 192
    Top = 224
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object btnSearchBook: TButton
    Left = 32
    Top = 312
    Width = 80
    Height = 25
    Caption = 'Search'
    Default = True
    TabOrder = 8
    OnClick = btnSearchBookClick
  end
  object btnCancel: TButton
    Left = 240
    Top = 312
    Width = 80
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 9
    OnClick = btnCancelClick
  end
  object cbYear: TCheckBox
    Left = 32
    Top = 264
    Width = 97
    Height = 17
    Caption = 'Publication Year'
    TabOrder = 10
  end
  object cbTranslator: TCheckBox
    Left = 32
    Top = 144
    Width = 97
    Height = 17
    Caption = 'Translator'
    TabOrder = 11
    OnClick = cbTranslatorClick
  end
  object edtTranslator: TEdit
    Left = 192
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 12
  end
  object edtPicAutor: TEdit
    Left = 192
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 13
  end
  object cbPicAuthor: TCheckBox
    Left = 32
    Top = 104
    Width = 97
    Height = 17
    Caption = 'Picture Author'
    TabOrder = 14
    OnClick = cbPicAuthorClick
  end
end
