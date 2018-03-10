object AddEditFriendForm: TAddEditFriendForm
  Left = 457
  Top = 205
  Width = 376
  Height = 324
  Caption = 'Friend'
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
  object lblFIO: TLabel
    Left = 40
    Top = 24
    Width = 45
    Height = 13
    Caption = 'Fullname:'
  end
  object lblPhoneFriend: TLabel
    Left = 16
    Top = 64
    Width = 72
    Height = 13
    Caption = 'Phone number:'
  end
  object lblSocialNumberFriend: TLabel
    Left = 16
    Top = 104
    Width = 73
    Height = 13
    Caption = 'Social network:'
  end
  object lblEmailFriend: TLabel
    Left = 56
    Top = 144
    Width = 31
    Height = 13
    Caption = 'E-mail:'
  end
  object lblFriendComment: TLabel
    Left = 40
    Top = 184
    Width = 47
    Height = 13
    Caption = 'Comment:'
  end
  object edFriendFIO: TEdit
    Left = 96
    Top = 24
    Width = 241
    Height = 21
    MaxLength = 60
    TabOrder = 0
  end
  object edFriendPhone: TEdit
    Left = 96
    Top = 64
    Width = 241
    Height = 21
    MaxLength = 16
    TabOrder = 1
    OnKeyPress = edFriendPhoneKeyPress
  end
  object edFriendSocialNumber: TEdit
    Left = 96
    Top = 104
    Width = 241
    Height = 21
    MaxLength = 30
    TabOrder = 2
  end
  object edFriendEmail: TEdit
    Left = 96
    Top = 144
    Width = 241
    Height = 21
    MaxLength = 50
    TabOrder = 3
  end
  object edFriendComment: TEdit
    Left = 96
    Top = 184
    Width = 241
    Height = 21
    MaxLength = 150
    TabOrder = 4
  end
  object btnSaveFriend: TButton
    Left = 96
    Top = 232
    Width = 80
    Height = 25
    Caption = 'Save'
    Default = True
    TabOrder = 5
    OnClick = btnSaveFriendClick
  end
  object btnCancelFriend: TButton
    Left = 208
    Top = 232
    Width = 80
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 6
  end
end
