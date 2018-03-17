object AddEditBookForm: TAddEditBookForm
  Left = 485
  Top = 145
  BorderStyle = bsSingle
  Caption = 'Book'
  ClientHeight = 457
  ClientWidth = 364
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
  object lblBookName: TLabel
    Left = 64
    Top = 24
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object lblAuthor: TLabel
    Left = 64
    Top = 64
    Width = 34
    Height = 13
    Caption = 'Author:'
  end
  object lblPicAuthor: TLabel
    Left = 32
    Top = 104
    Width = 69
    Height = 13
    Caption = 'Picture author:'
  end
  object lblTranslator: TLabel
    Left = 48
    Top = 144
    Width = 50
    Height = 13
    Caption = 'Translator:'
  end
  object lblPubYear: TLabel
    Left = 16
    Top = 184
    Width = 78
    Height = 13
    Caption = 'Publication year:'
  end
  object lblPubHouse: TLabel
    Left = 16
    Top = 224
    Width = 83
    Height = 13
    Caption = 'Publishing house:'
  end
  object lblBookComment: TLabel
    Left = 48
    Top = 272
    Width = 47
    Height = 13
    Caption = 'Comment:'
  end
  object lblGenresForBook: TLabel
    Left = 56
    Top = 312
    Width = 37
    Height = 13
    Caption = 'Genres:'
  end
  object edBookName: TEdit
    Left = 104
    Top = 24
    Width = 240
    Height = 21
    MaxLength = 100
    TabOrder = 0
  end
  object edAuthor: TEdit
    Left = 104
    Top = 64
    Width = 240
    Height = 21
    MaxLength = 50
    TabOrder = 1
  end
  object edPicAuthor: TEdit
    Left = 104
    Top = 104
    Width = 240
    Height = 21
    MaxLength = 50
    TabOrder = 2
  end
  object edTranslator: TEdit
    Left = 104
    Top = 144
    Width = 240
    Height = 21
    MaxLength = 50
    TabOrder = 3
  end
  object edPubYear: TEdit
    Left = 104
    Top = 184
    Width = 240
    Height = 21
    TabOrder = 4
    OnKeyPress = edPubYearKeyPress
  end
  object cbPubHouse: TComboBox
    Left = 104
    Top = 224
    Width = 240
    Height = 21
    ItemHeight = 13
    TabOrder = 5
  end
  object edBookComment: TEdit
    Left = 104
    Top = 272
    Width = 240
    Height = 21
    MaxLength = 150
    TabOrder = 6
  end
  object btnSaveBook: TButton
    Left = 104
    Top = 408
    Width = 80
    Height = 25
    Caption = 'Save'
    Default = True
    TabOrder = 7
    OnClick = btnSaveBookClick
  end
  object btnCancelBook: TButton
    Left = 216
    Top = 408
    Width = 80
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 8
    OnClick = btnCancelBookClick
  end
  object checklistGenres: TCheckListBox
    Left = 104
    Top = 312
    Width = 240
    Height = 73
    ItemHeight = 13
    TabOrder = 9
  end
end
