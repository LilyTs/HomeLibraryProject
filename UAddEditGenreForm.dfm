object AddEditGenreForm: TAddEditGenreForm
  Left = 419
  Top = 374
  BorderStyle = bsSingle
  Caption = 'Genre'
  ClientHeight = 165
  ClientWidth = 345
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
  object lblGenreName: TLabel
    Left = 48
    Top = 24
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object lblParentGenre: TLabel
    Left = 16
    Top = 64
    Width = 64
    Height = 13
    Caption = 'Parent genre:'
  end
  object edGenreName: TEdit
    Left = 88
    Top = 24
    Width = 240
    Height = 21
    TabOrder = 0
  end
  object cbParentGenre: TComboBox
    Left = 88
    Top = 64
    Width = 240
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object btnSaveGenre: TButton
    Left = 88
    Top = 112
    Width = 80
    Height = 25
    Caption = 'Save'
    Default = True
    TabOrder = 2
    OnClick = btnSaveGenreClick
  end
  object btnCancelGenre: TButton
    Left = 200
    Top = 112
    Width = 80
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelGenreClick
  end
end
