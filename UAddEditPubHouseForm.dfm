object AddEditPubHouseForm: TAddEditPubHouseForm
  Left = 849
  Top = 261
  BorderStyle = bsSingle
  Caption = 'Publishing House'
  ClientHeight = 123
  ClientWidth = 271
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
  object lblPubHouseName: TLabel
    Left = 32
    Top = 24
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object edPubHouseName: TEdit
    Left = 72
    Top = 24
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object btnSavePubHouse: TButton
    Left = 40
    Top = 72
    Width = 80
    Height = 25
    Caption = 'Save'
    Default = True
    TabOrder = 1
    OnClick = btnSavePubHouseClick
  end
  object btnCancelPubHouse: TButton
    Left = 152
    Top = 72
    Width = 80
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelPubHouseClick
  end
end
