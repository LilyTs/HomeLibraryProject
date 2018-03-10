object AddEditPubHouseForm: TAddEditPubHouseForm
  Left = 773
  Top = 257
  BorderStyle = bsSingle
  Caption = 'AddEditPubHouseForm'
  ClientHeight = 171
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
    Top = 64
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object lblPubHouseID: TLabel
    Left = 24
    Top = 24
    Width = 14
    Height = 13
    Caption = 'ID:'
  end
  object edPubHouseName: TEdit
    Left = 56
    Top = 64
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object btnSavePubHouse: TButton
    Left = 24
    Top = 120
    Width = 80
    Height = 25
    Caption = 'Save'
    Default = True
    TabOrder = 1
    OnClick = btnSavePubHouseClick
  end
  object btnCancelPubHouse: TButton
    Left = 136
    Top = 120
    Width = 80
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelPubHouseClick
  end
  object edPubHouseID: TEdit
    Left = 56
    Top = 24
    Width = 169
    Height = 21
    TabOrder = 3
    OnKeyPress = edPubHouseIDKeyPress
  end
end
