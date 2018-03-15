object AddEditGenreForm: TAddEditGenreForm
  Left = 554
  Top = 298
  Width = 361
  Height = 229
  Caption = 'Genre'
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
  object lblGenreName: TLabel
    Left = 48
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object lblParentGenre: TLabel
    Left = 16
    Top = 96
    Width = 64
    Height = 13
    Caption = 'Parent genre:'
  end
  object lblGenreID: TLabel
    Left = 56
    Top = 24
    Width = 14
    Height = 13
    Caption = 'ID:'
  end
  object edGenreName: TEdit
    Left = 88
    Top = 56
    Width = 240
    Height = 21
    TabOrder = 0
  end
  object cbParentGenre: TComboBox
    Left = 88
    Top = 96
    Width = 240
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object btnSaveGenre: TButton
    Left = 88
    Top = 144
    Width = 80
    Height = 25
    Caption = 'Save'
    Default = True
    TabOrder = 2
    OnClick = btnSaveGenreClick
  end
  object btnCancelGenre: TButton
    Left = 200
    Top = 144
    Width = 80
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelGenreClick
  end
  object edGenre_id: TEdit
    Left = 88
    Top = 16
    Width = 240
    Height = 21
    TabOrder = 4
    OnKeyPress = edGenre_idKeyPress
  end
end
