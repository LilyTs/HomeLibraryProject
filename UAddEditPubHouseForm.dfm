object AddEditPubHouseForm: TAddEditPubHouseForm
  Left = 550
  Top = 294
  BorderStyle = bsSingle
  Caption = 'Publishing House'
  ClientHeight = 128
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblPubHouseName: TLabel
    Left = 16
    Top = 24
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object edPubHouseName: TEdit
    Left = 56
    Top = 24
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object btnSavePubHouse: TButton
    Left = 24
    Top = 72
    Width = 80
    Height = 25
    Caption = 'Save'
    Default = True
    TabOrder = 1
    OnClick = btnSavePubHouseClick
  end
  object btnCancelPubHouse: TButton
    Left = 136
    Top = 72
    Width = 80
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelPubHouseClick
  end
end
