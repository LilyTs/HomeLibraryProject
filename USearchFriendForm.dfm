object SearchFriendForm: TSearchFriendForm
  Left = 519
  Top = 286
  Width = 445
  Height = 308
  Caption = 'Friends'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object chkNameFriend: TCheckBox
    Left = 48
    Top = 40
    Width = 97
    Height = 17
    Caption = 'Name'
    TabOrder = 0
  end
  object chkPhoneFriend: TCheckBox
    Left = 48
    Top = 88
    Width = 97
    Height = 17
    Caption = 'Phone'
    TabOrder = 1
  end
  object chkCommentFriend: TCheckBox
    Left = 48
    Top = 136
    Width = 97
    Height = 17
    Caption = 'Comment'
    TabOrder = 2
  end
  object edtNameFriend: TEdit
    Left = 240
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtPhoneFriend: TEdit
    Left = 240
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object edtCommentFriend: TEdit
    Left = 240
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object btnSearchFriend: TButton
    Left = 48
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Search'
    TabOrder = 6
    OnClick = btnSearchFriendClick
  end
  object btnCancelFriend: TButton
    Left = 288
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 7
    OnClick = btnCancelFriendClick
  end
end
