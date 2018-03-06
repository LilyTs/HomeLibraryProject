object MainForm: TMainForm
  Left = 232
  Top = 137
  Width = 820
  Height = 528
  Caption = 'My Library'
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
    ActivePage = tsPubHouses
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
        Align = alTop
        TabOrder = 1
      end
    end
    object tsPubHouses: TTabSheet
      Caption = 'Publishing Houses'
      ImageIndex = 4
      object dbgridPubHouses: TDBGrid
        Left = 0
        Top = 0
        Width = 796
        Height = 300
        Align = alTop
        DataSource = dsrcPubHouses
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
        Top = 300
        Width = 796
        Height = 25
        Align = alTop
        TabOrder = 1
      end
    end
  end
  object IBDatabase: TIBDatabase
    DatabaseName = 
      'C:\Users\Lilia\Desktop\Studies\3_year\6 semester\DataBases ('#1050#1072#1096#1080 +
      #1088#1089#1082#1072#1103' '#1048'.'#1048'.)\Delphi project for report\HomeLibraryProject\App\LIB' +
      'RARYDB.FDB'
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
      
        'select B.BOOK_ID, Bk.Name, B.FRIEND_ID, F.FIO, B.BORROWDATE, B.R' +
        'ETURNDATE, B.ISLOST, B.ISDAMAGED, B.COMMENT from BORROWING B JOI' +
        'N FRIEND F ON B.Friend_id = F.Friend_id JOIN Book Bk ON B.Book_i' +
        'd = Bk.Book_id')
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
end
