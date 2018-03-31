object SearchPubHouseForm: TSearchPubHouseForm
  Left = 370
  Top = 227
  BorderStyle = bsSingle
  Caption = 'Search publishing houses'
  ClientHeight = 122
  ClientWidth = 322
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
  object lblNamePubHouse: TLabel
    Left = 24
    Top = 24
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object btnSearchPubHouse: TButton
    Left = 64
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Search'
    Default = True
    TabOrder = 0
    OnClick = btnSearchPubHouseClick
  end
  object btnCancelPubHouse: TButton
    Left = 176
    Top = 72
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelPubHouseClick
  end
  object edtNamePubHouse: TEdit
    Left = 64
    Top = 24
    Width = 240
    Height = 21
    TabOrder = 2
  end
end
