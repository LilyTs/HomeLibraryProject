object MainForm: TMainForm
  Left = 229
  Top = 131
  BorderStyle = bsSingle
  Caption = 'My Library'
  ClientHeight = 489
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 804
    Height = 450
    ActivePage = tsMain
    MultiLine = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object tsMain: TTabSheet
      Caption = 'Main'
      object dbgridBorrowings: TDBGrid
        Left = 0
        Top = 0
        Width = 796
        Height = 300
        Align = alTop
        DataSource = dsrcBorrowings
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object dbnavBorrowings: TDBNavigator
        Left = 0
        Top = 300
        Width = 796
        Height = 25
        DataSource = dsrcBorrowings
        Align = alTop
        TabOrder = 1
      end
    end
    object tsBooks: TTabSheet
      Caption = 'Books'
      ImageIndex = 1
      object dbgridBooks: TDBGrid
        Left = 0
        Top = 0
        Width = 796
        Height = 300
        Align = alTop
        DataSource = dsrcBooks
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'BOOK_ID'
            Title.Caption = 'Book ID'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = 'Name'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AUTHOR'
            Title.Caption = 'Author'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PUBYEAR'
            Title.Caption = 'Publication Year'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PUBHOUSE_ID'
            Title.Caption = 'Publication House ID'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PICAUTHOR'
            Title.Caption = 'Picture author'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRANSLATOR'
            Title.Caption = 'Translator'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMMENT'
            Title.Caption = 'Comment'
            Width = 100
            Visible = True
          end>
      end
      object dbnavBooks: TDBNavigator
        Left = 0
        Top = 300
        Width = 796
        Height = 25
        DataSource = dsrcBooks
        Align = alTop
        TabOrder = 1
      end
    end
    object tsFriends: TTabSheet
      Caption = 'Friends'
      ImageIndex = 2
      object dbgridFriends: TDBGrid
        Left = 0
        Top = 0
        Width = 796
        Height = 300
        Align = alTop
        DataSource = dsrcFriends
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'FRIEND_ID'
            Title.Caption = 'Friend ID'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FIO'
            Title.Caption = 'Name'
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PHONENUMBER'
            Title.Caption = 'Phone'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SOCIALNUMBER'
            Title.Caption = 'Social number'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Title.Caption = 'E-mail'
            Width = 134
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMMENT'
            Title.Caption = 'Comment'
            Width = 200
            Visible = True
          end>
      end
      object dbnavFriends: TDBNavigator
        Left = 0
        Top = 300
        Width = 796
        Height = 25
        DataSource = dsrcFriends
        Align = alTop
        TabOrder = 1
      end
    end
    object tsGenres: TTabSheet
      Caption = 'Genres'
      ImageIndex = 3
      object dbgridGenres: TDBGrid
        Left = 0
        Top = 0
        Width = 796
        Height = 300
        Align = alTop
        DataSource = dsrcGenres
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'GENRE_ID'
            Title.Caption = 'Genre ID'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = 'Name'
            Width = 240
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PARENTGENRE_ID'
            Title.Caption = 'Parent Genre ID'
            Width = 100
            Visible = True
          end>
      end
      object dbnavGenres: TDBNavigator
        Left = 0
        Top = 300
        Width = 796
        Height = 25
        DataSource = dsrcGenres
        Align = alTop
        TabOrder = 1
      end
    end
    object tsPubHouses: TTabSheet
      Caption = 'Publishing Houses'
      ImageIndex = 4
      object dbgridPubHouses: TDBGrid
        Left = 0
        Top = 29
        Width = 796
        Height = 300
        Align = alTop
        DataSource = dsrcPubHouses
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'PUBHOUSE_ID'
            Title.Alignment = taCenter
            Title.Caption = 'Publishing house ID'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = 'Name'
            Width = 250
            Visible = True
          end>
      end
      object dbnavPubHouses: TDBNavigator
        Left = 0
        Top = 325
        Width = 796
        Height = 25
        DataSource = dsrcPubHouses
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object toolBarPubHouses: TToolBar
        Left = 0
        Top = 0
        Width = 796
        Height = 29
        ButtonHeight = 36
        ButtonWidth = 39
        Caption = 'toolBarPubHouses'
        Images = ImageList
        TabOrder = 2
        object btnAddPubHouse: TToolButton
          Left = 0
          Top = 2
          Action = actAddPubHouse
          Caption = 'Add'
        end
        object btnDeletePubHouse: TToolButton
          Left = 39
          Top = 2
          Action = actDeletePubHouse
          Caption = 'delete'
        end
        object btnEditPubHouse: TToolButton
          Left = 78
          Top = 2
          Action = actEditPubHouse
          Caption = 'edit'
        end
        object btnRefreshPubHouses: TToolButton
          Left = 117
          Top = 2
          Caption = 'refresh'
          ImageIndex = 3
          OnClick = btnRefreshPubHousesClick
        end
      end
    end
  end
  object IBDatabase: TIBDatabase
    DatabaseName = 'C:\Users\Lilia\Desktop\Studies\3_year\6 semester\LIBRARYDB.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 8
    Top = 456
  end
  object IBTransaction: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 48
    Top = 456
  end
  object ibqGenres: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from GENRE;')
    UpdateObject = ibUpdateSQlGenres
    Left = 88
    Top = 456
  end
  object ibqBorrowings: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 160
    Top = 456
  end
  object dsrcGenres: TDataSource
    DataSet = ibqGenres
    Left = 120
    Top = 456
  end
  object dsrcBorrowings: TDataSource
    DataSet = ibqBorrowings
    Left = 192
    Top = 456
  end
  object ibqBooks: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from BOOK')
    Left = 232
    Top = 456
  end
  object dsrcBooks: TDataSource
    DataSet = ibqBooks
    Left = 264
    Top = 456
  end
  object ibqFriends: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FRIEND')
    Left = 304
    Top = 456
  end
  object dsrcFriends: TDataSource
    DataSet = ibqFriends
    Left = 336
    Top = 456
  end
  object ibqPubHouses: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PUBLISHINGHOUSE')
    Left = 376
    Top = 456
  end
  object dsrcPubHouses: TDataSource
    DataSet = ibqPubHouses
    Left = 408
    Top = 456
  end
  object ibUpdateSQlGenres: TIBUpdateSQL
    RefreshSQL.Strings = (
      'SELECT * FROM Genre;')
    ModifySQL.Strings = (
      'UPDATE Genre'
      'SET  Name = :Name, ParentGenre_id = :ParentGenre_id'
      'WHERE Genre_id = :Genre_id; ')
    InsertSQL.Strings = (
      'INSERT INTO Genre VALUES(:Genre_id, :Name, :ParentGenre_id);')
    DeleteSQL.Strings = (
      'DELETE FROM Genre'
      'WHERE Genre_id = :Genre_id;')
    Left = 504
    Top = 456
  end
  object ImageList: TImageList
    Left = 460
    Top = 456
    Bitmap = {
      494C010104000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000B251D400A3A157D1E3D1E7F161F1743000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000004000000170000
      0017000000170000001700000017000000170000001700000014000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000020011000D00520115037501140375000D0054000300130000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000020F043D249A64FD0D8620FF288C29FF36873AFD030E033E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000016FAFAFAFFFAFA
      FAFFFBFBFBFFFCFCFCFFFDFDFDFFFEFEFEFFFAFAF9FFD4D3D0FA2020206C0000
      0001000000000000000000000000000000000000000000000000000000000001
      001305420B9817902CF818C22FFF0FE41EFF0CF117FF14D025FF149927F90441
      0A9D000100150000000000000000000000000000000000000000000000000000
      0000000000000017007D0B7412FF038B05FF048D08FF148419FF021F047D0000
      0000000000000000000000000000000000000000000000000000000000000102
      14371A2170E50000154900000000000000000000000000000000010118493434
      9EE5010115350000000000000000000000000000000000000017F8F8F8FFD7D8
      D8FFA3A3A3FFF5F5F5FFFCFCFCFFFEFEFEFFF9F9F9FFD9D8D8FFBFBFBEFE3435
      3580000000010000000000000000000000000000000000000000000A00290E6E
      1AE117A32CFF18AD2FFF12C423FF0CD816FF09E012FF0DD419FF13BE25FE1BA4
      34F60B5E16BC0008001E00000000000000000000000000000000000000000000
      0000000000000015007F0D7210FF15A429FF1EAE39FF168C23FF021F047F0000
      0000000000000000000000000000000000000000000000000000000013351A1C
      8FEF2E31EAFF20237DF70000104900000000000000000000104920237FF72E31
      EAFF1A1C8FEF0000143500000000000000000000000000000017F8F8F8FFF4F5
      F5FF577782FF5FA8C0FFA5C3CDFFD8DBDCFFF0F0F0FFE5E4E4FFB8B8B7FFF2F2
      F2FF343535800000000100000000000000000000000000010014096112E20A96
      13FF109E1FFF16A62CFF17B32DFF13C124FF12C622FF13BE25FE17AB2CF81189
      23D60B6815A80437097300000009000000000000000000000000000000000000
      0000000000000016007F15781BFF23B443FF30C35CFF219333FF021F057F0000
      0000000000000000000000000000000000000000000000000000182072E32A30
      E9FF0000F3FF1415ECFF1E2167F700000F4A00000E4A1E2267F71416EDFF0000
      F3FF2D31E9FF2A2B87E300000000000000000000000000000017F8F8F8FFF8F8
      F8FFB1D1DDFF5FABC3FF31819AFF28B1DCFF888E90FFB4B4B4FFD1D1D1FFBEBD
      BDFFC7C7C7FE2222216D000000010000000000000000032E069A038907FF0591
      0BFF0C9816FF12A022FF1BA134FF198D30F818882EF7189630F4118A23D80A6A
      14AC054C09820235065D001101290000000000000000000C003D0016007D0015
      007F0015007F003300BF1A7C22FF25B646FF2DC056FF259335FF08480EBF0422
      087F05250A7F06270C7D0314073C00000000000000000000000001021A491A20
      9AF70E13E2FF0000E2FF1214DBFF192057F81A2057F71215DCFF0000E2FF1014
      E2FF1E219AF707071E4900000000000000000000000000000017F8F8F7FFF7F7
      F7FFDEE8EDFF63A0B4FF242424FF16728FFF31A9CFFF8C8D8EFFBEBEBEFFE8E8
      E8FFE5E5E5FFE0DFDDFA000000140000000000020012045509F9007E00FF028D
      04FF07930DFF118220F30420085F0000000500000004020F0444093C1188043F
      076B012A034B001A0031000C011B00000000000D003C026B02FD197419FF1874
      18FF1A771BFF1C7B21FF2E9238FF20B13EFF25B648FF36A348FF299838FF299C
      39FF29A03AFF2DA641FF25AE44FD0415083C0000000000000000000000000000
      1B48141E9BF70B12D2FF0000D0FF0D13C8FF0D13C9FF0000D0FF0C12D2FF161E
      9BF700001B480000000000000000000000000000000000000017F7F7F6FFF6F6
      F6FFF3F6F7FF78D6F4FF477482FF232425FF1282A6FF44A7C6FF9F9F9FFFD6D6
      D6FFFAFAFAFFFCFCFCFF000000170000000000090153035405FF006C00FF0081
      00FF06830BFF021C055F00000000000000000000000000000000000300130112
      0226000C00180006000D0002000500000000001D007D258826FF31A337FF38AC
      3EFF3FB449FF46B954FF4BBE5CFF4CC161FF4BC162FF44BD5BFF35B348FF119D
      1FFF059009FF008300FF37B14FFF092D137D0000000000000000000000000000
      000000001D49111D9DF70A11C2FF0000BCFF0000BCFF0A11C2FF121E9DF70000
      1D49000000000000000000000000000000000000000000000017F6F6F6FFF5F5
      F5FFF7F7F7FFE9F4F7FF83D9F4FF49656DFF222829FF0E8FB9FF5CA8C0FFB2B2
      B2FFE6E6E6FFFDFDFDFF0000001700000000010C0276085208FF096209FF036F
      03FF036108F90000000600000000000000000000000000000000000000000000
      000300000001000000000000000000000000001E007D3F9B40FF48B453FF48B8
      52FF4ABB56FF4DBF5CFF4FC161FF51C465FF52C666FF52C465FF50C363FF58C1
      66FF3CAD43FF108B11FF4ABA62FF0B2E157D0000000000000000000000000000
      000000001E491520A1F73138C6FF2F2EC2FF3231C1FF323AC1FF101E9DF70000
      1E49000000000000000000000000000000000000000000000017F5F5F4FFF4F4
      F3FFF6F6F6FFF8F8F8FFDFF1F7FF7BD4F0FF43555AFF1F2C30FF0C99C7FF77AD
      BFFFC4C4C4FFF1F1F1FF0000001700000000010D0377287028FF297329FF1064
      10FF035207F9000000060000000000000000060F0A370F7819FE108B13FD167F
      19FB157519FD09660DFE05600AFC0215055E0A140A3F6BB16BFD49A04BFF3695
      3AFF37953CFF38963FFF57AE61FF58C86BFF59C96DFF5DB86BFF43AB55FF49B1
      5CFF4FB865FF64C47AFF80D296FD0F1A123F0000000000000000000000000000
      1F481822A6F74046CCFF3D3DC8FF494DC7FF484DC7FF4040C9FF595FD2FF1E26
      A7F700001F480000000000000000000000000000000000000017F4F4F3FFF2F2
      F2FFF4F4F4FFF6F6F6FFF8F8F8FFD0EDF5FF6DCBE8FF3B4548FF1B3138FF0FA1
      D0FF92B7C3FFD7D7D7FF0000001B00000000010A0254327634FF3A833AFF2972
      29FF024C04FF0315065B000000000000000000000000031B068104A306FF18B4
      18FF35AF35FF3AA23AFF308C30FF0422097F000000001C261C44031F037D001D
      017F001D027F044408BF3FA049FF60CE75FF61CE76FF47AC58FF0C531ABF0627
      0D7F08290F7F0C2C147D212C2343000000000000000000000000000021481B24
      ACF7555AD5FF5454D3FF5F62D4FF242D8CF8232C8DF85D60D4FF5454D3FF5B5F
      D6FF272EADF70000214800000000000000000000000000000017F3F3F2FFF1F1
      F0FFF3F3F2FFF4F4F4FFF6F6F6FFF7F7F7FFBBE6F3FF5DBDDBFF313638FF1336
      42FF17A8D6FFAFC5CCFF0000002900000001000200142D6B31F94B934BFF4B93
      4BFF165F16FF044609F102110459000000040000000302100456036508F7058B
      05FF42AA42FF4BA74BFF4CA04CFF05250A7F0000000000000000000000000000
      0000000000000220047F43A64EFF6AD582FF6AD582FF4CB25EFF06260C7F0000
      0000000000000000000000000000000000000000000000000000030692E3646D
      E3FF6B6BE6FF7375E5FF2930ACF70000194A00001A4A272FADF77073E5FF6B6B
      E6FF7C83E6FF020692E300000000000000000000000000000017F1F1F0FFEFEF
      EEFFF1F1F0FFF2F2F2FFF4F4F3FFF5F5F5FFF6F6F6FF9DDCF0FF49ABC9FF282A
      2BFF0B3E4FFF26AFDCFF0003044000000007000000000B33109D5B9F5BFF5CA2
      5CFF599E59FF1E661EFF014803FF023E05F6023F05F5015303FF0B700BFF48A3
      48FF5CAE5CFF5CAB5CFF5EA95EFF0425077F0000000000000000000000000000
      0000000000000222067F46AD54FF76DE93FF76DE93FF50B966FF07280D7F0000
      0000000000000000000000000000000000000000000000000000000019351B20
      ADEF8288F1FF2C33B9F7000023490000000000000000000023492A30B9F7848A
      F1FF1F25ADEF0000193500000000000000000000000000000017F0F0EFFFEDED
      ECFFEFEFEEFFF0F0EFFFF1F1F1FFF3F3F2FFF4F4F3FFF4F4F4FF7BD2EEFF3493
      B1FF212222FF054C63FF036686C70000001700000000000100162C6C30E46EB2
      6EFF6CB26CFF6EB26EFF589C58FF3D833DFF387F38FF4A934AFF69B169FF6CB5
      6CFF6EB66EFF6CB36DFF70B570FF0224057F0000000000000000000000000000
      0000000000000424087D68BE75FF84E8A6FF83E8A5FF6AC67FFF092A117D0000
      0000000000000000000000000000000000000000000000000000000000000000
      1A353235A8E30101244800000000000000000000000000000000000024483437
      A9E300001A350000000000000000000000000000000000000017EEEEEDFFEBEA
      E9FFECECECFFEEEEEDFFEFEFEEFFF0F0F0FFF1F1F1FFF2F2F1FFF0F1F2FF5AC9
      EDFF257A95FF1B1B1BFF004C7EFC010D4EA90000000000000000000C012C337C
      35E57EC07EFF7DC27DFF7DC27DFF7DC27DFF7DC27DFF7DC27DFF7DC27DFF7EC1
      7EFF368638E8084C0B986EB96FFF0124037F0000000000000000000000000000
      0000000000000714083CB4DCBAFD7CCE8CFF71CC85FFC3E5CBFD0F19113E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000016F1F1F0FFEDED
      EDFFEFEFEEFFF0F0F0FFF1F1F0FFF2F2F2FFF3F3F2FFF3F3F3FFF4F4F3FFEBF1
      F2FF45C5EEFF235D92FF1414BAFF06067FB20000000000000000000000000002
      00160E4A0E9F57A157FA8BCA8BFF99D699FF9AD69AFF8DCA8DFF58A359FB0F4D
      0FA30002001800000000163A1778162416600000000000000000000000000000
      000000000000000000000E18103D0C2B127D0B2C127D131A153E000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000020000000E0000
      000E0000000E0000000E0000000E0000000E0000000E0000000E0000000E0000
      000E010304203E46B1D827278FB2000003120000000000000000000000000000
      000000000000000400161A2B1A5A4C604C7F4D614D7F1C2C1C5C000500180000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FC3FFFFF801FF81FF81FFFFF800FE007
      F81FE3C78007C003F81FC18380038001F81FC003800180018001C00380010000
      0000E007800103C00000F00F800103E30000F00F800103000000E00780010380
      8001C00380000000F81FC00380008000F81FC18380008000F81FE3C78000C000
      F81FFFFF8000E004FC3FFFFF8000F81F00000000000000000000000000000000
      000000000000}
  end
  object actListPubHouses: TActionList
    Images = ImageList
    Left = 44
    Top = 416
    object actAddPubHouse: TAction
      Caption = 'actAddPubHouse'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = actAddPubHouseExecute
    end
    object actDeletePubHouse: TAction
      Caption = 'actDeletePubHouse'
      ImageIndex = 1
      ShortCut = 46
      OnExecute = actDeletePubHouseExecute
    end
    object actEditPubHouse: TAction
      Caption = 'actEditPubHouse'
      ImageIndex = 2
    end
    object actRerfeshPubHouses: TAction
      Caption = 'actRerfeshPubHouses'
      ImageIndex = 3
      ShortCut = 116
    end
  end
  object ibqUpdatePubHouses: TIBQuery
    Database = IBDatabase
    Transaction = IBTransactionUpdatePubHouses
    BufferChunks = 1000
    CachedUpdates = False
    Left = 116
    Top = 416
  end
  object IBTransactionUpdatePubHouses: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase
    AutoStopAction = saNone
    Left = 156
    Top = 416
  end
end
