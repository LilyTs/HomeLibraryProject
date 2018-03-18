object SearchGenreForm: TSearchGenreForm
  Left = 574
  Top = 238
  Width = 536
  Height = 307
  Caption = 'Genres'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblNameGenre: TLabel
    Left = 80
    Top = 88
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object btnSearchGenre: TButton
    Left = 96
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Search'
    TabOrder = 0
    OnClick = btnSearchGenreClick
  end
  object btnCancelGenre: TButton
    Left = 328
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelGenreClick
  end
  object edtNameGenre: TEdit
    Left = 216
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 2
  end
end
