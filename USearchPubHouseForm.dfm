object SearchPubHouseForm: TSearchPubHouseForm
  Left = 374
  Top = 227
  BorderStyle = bsSingle
  Caption = 'Publishing Houses'
  ClientHeight = 211
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblNamePubHouse: TLabel
    Left = 24
    Top = 72
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object btnSearchPubHouse: TButton
    Left = 24
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Search'
    Default = True
    TabOrder = 0
    OnClick = btnSearchPubHouseClick
  end
  object btnCancelPubHouse: TButton
    Left = 192
    Top = 152
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelPubHouseClick
  end
  object edtNamePubHouse: TEdit
    Left = 144
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
  end
end
