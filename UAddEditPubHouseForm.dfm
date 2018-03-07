object AddEditPubHouseForm: TAddEditPubHouseForm
  Left = 579
  Top = 267
  Width = 259
  Height = 169
  Caption = 'AddEditPubHouseForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object lblPubHouseName: TLabel
    Left = 16
    Top = 48
    Width = 31
    Height = 17
    Caption = 'Name:'
  end
  object lblPubHouseID: TLabel
    Left = 16
    Top = 16
    Width = 14
    Height = 13
    Caption = 'ID:'
  end
  object edPubHouseName: TEdit
    Left = 56
    Top = 48
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object btnSavePubHouse: TButton
    Left = 32
    Top = 88
    Width = 80
    Height = 25
    Caption = 'Save'
    Default = True
    TabOrder = 1
    OnClick = btnSavePubHouseClick
  end
  object btnCancelPubHouse: TButton
    Left = 128
    Top = 88
    Width = 80
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
  end
  object edPubHouseID: TEdit
    Left = 56
    Top = 16
    Width = 169
    Height = 21
    TabOrder = 3
    OnKeyPress = edPubHouseIDKeyPress
  end
  object ibqUpdatePubHouses: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 92
    Top = 416
  end
  object IBQuery1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 92
    Top = 416
  end
  object IBTransactionUpdateHouses: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 132
    Top = 416
  end
end
