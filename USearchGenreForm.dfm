object SearchGenreForm: TSearchGenreForm
  Left = 359
  Top = 283
  BorderStyle = bsSingle
  Caption = 'Get'
  ClientHeight = 124
  ClientWidth = 323
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
  object lblNameGenre: TLabel
    Left = 24
    Top = 24
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object btnSearchGenre: TButton
    Left = 64
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Search'
    Default = True
    TabOrder = 0
    OnClick = btnSearchGenreClick
  end
  object btnCancelGenre: TButton
    Left = 176
    Top = 72
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelGenreClick
  end
  object edtNameGenre: TEdit
    Left = 64
    Top = 24
    Width = 240
    Height = 21
    TabOrder = 2
  end
end
