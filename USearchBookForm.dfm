object SearchBookForm: TSearchBookForm
  Left = 493
  Top = 243
  BorderStyle = bsSingle
  Caption = 'Search Books'
  ClientHeight = 281
  ClientWidth = 366
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
    Top = 32
    Width = 97
    Height = 17
    Caption = 'Name'
    TabOrder = 0
    OnClick = cbNameClick
  end
  object cbAuthor: TCheckBox
    Left = 32
    Top = 72
    Width = 97
    Height = 17
    Caption = 'Author'
    TabOrder = 1
    OnClick = cbAuthorClick
  end
  object cbPubHouse: TCheckBox
    Left = 32
    Top = 112
    Width = 121
    Height = 17
    Caption = 'Publishing House'
    TabOrder = 2
    OnClick = cbPubHouseClick
  end
  object edtSearchName: TEdit
    Left = 192
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtSearchAuthor: TEdit
    Left = 192
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object cbGenre: TCheckBox
    Left = 32
    Top = 152
    Width = 97
    Height = 17
    Caption = 'Genre'
    TabOrder = 5
    OnClick = cbGenreClick
  end
  object edtSearchPubHouse: TEdit
    Left = 192
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object edtSearchGenre: TEdit
    Left = 192
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object btnSearchBook: TButton
    Left = 72
    Top = 232
    Width = 80
    Height = 25
    Caption = 'Search'
    Default = True
    TabOrder = 8
    OnClick = btnSearchBookClick
  end
  object btnCancel: TButton
    Left = 208
    Top = 232
    Width = 80
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 9
    OnClick = btnCancelClick
  end
end
