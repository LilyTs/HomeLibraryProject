object SearchFriendForm: TSearchFriendForm
  Left = 368
  Top = 256
  BorderStyle = bsSingle
  Caption = 'Search friends'
  ClientHeight = 220
  ClientWidth = 372
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
  object chkNameFriend: TCheckBox
    Left = 24
    Top = 24
    Width = 97
    Height = 17
    Caption = 'Name'
    TabOrder = 0
    OnClick = chkNameFriendClick
  end
  object chkPhoneFriend: TCheckBox
    Left = 24
    Top = 72
    Width = 97
    Height = 17
    Caption = 'Phone'
    TabOrder = 1
    OnClick = chkPhoneFriendClick
  end
  object chkCommentFriend: TCheckBox
    Left = 24
    Top = 120
    Width = 97
    Height = 17
    Caption = 'Comment'
    TabOrder = 2
    OnClick = chkCommentFriendClick
  end
  object edtNameFriend: TEdit
    Left = 152
    Top = 24
    Width = 200
    Height = 21
    TabOrder = 3
  end
  object edtPhoneFriend: TEdit
    Left = 152
    Top = 64
    Width = 200
    Height = 21
    TabOrder = 4
  end
  object edtCommentFriend: TEdit
    Left = 152
    Top = 112
    Width = 200
    Height = 21
    TabOrder = 5
  end
  object btnSearchFriend: TButton
    Left = 80
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Search'
    Default = True
    TabOrder = 6
    OnClick = btnSearchFriendClick
  end
  object btnCancelFriend: TButton
    Left = 216
    Top = 168
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 7
    OnClick = btnCancelFriendClick
  end
end
