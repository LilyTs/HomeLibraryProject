object SearchFriendForm: TSearchFriendForm
  Left = 752
  Top = 247
  BorderStyle = bsSingle
  Caption = 'Search Friends'
  ClientHeight = 235
  ClientWidth = 396
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
    Left = 48
    Top = 40
    Width = 97
    Height = 17
    Caption = 'Name'
    TabOrder = 0
    OnClick = chkNameFriendClick
  end
  object chkPhoneFriend: TCheckBox
    Left = 48
    Top = 88
    Width = 97
    Height = 17
    Caption = 'Phone'
    TabOrder = 1
    OnClick = chkPhoneFriendClick
  end
  object chkCommentFriend: TCheckBox
    Left = 48
    Top = 136
    Width = 97
    Height = 17
    Caption = 'Comment'
    TabOrder = 2
    OnClick = chkCommentFriendClick
  end
  object edtNameFriend: TEdit
    Left = 176
    Top = 40
    Width = 200
    Height = 21
    TabOrder = 3
  end
  object edtPhoneFriend: TEdit
    Left = 176
    Top = 80
    Width = 200
    Height = 21
    TabOrder = 4
  end
  object edtCommentFriend: TEdit
    Left = 176
    Top = 128
    Width = 200
    Height = 21
    TabOrder = 5
  end
  object btnSearchFriend: TButton
    Left = 96
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Search'
    Default = True
    TabOrder = 6
    OnClick = btnSearchFriendClick
  end
  object btnCancelFriend: TButton
    Left = 208
    Top = 184
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 7
    OnClick = btnCancelFriendClick
  end
end
