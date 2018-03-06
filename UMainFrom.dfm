object MainForm: TMainForm
  Left = 225
  Top = 143
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
    ActivePage = tsGenres
    TabOrder = 0
    object tsMain: TTabSheet
      Caption = 'Main'
    end
    object tsBooks: TTabSheet
      Caption = 'Books'
      ImageIndex = 1
    end
    object tsFriends: TTabSheet
      Caption = 'Friends'
      ImageIndex = 2
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
        DataSource = IBDataSource
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
    end
  end
  object IBDatabase: TIBDatabase
    DatabaseName = 'LIBRARYDB.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 64
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
    Left = 264
    Top = 456
  end
  object IBDataSource: TDataSource
    DataSet = IBQuery
    Left = 184
    Top = 456
  end
  object IBQuery: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 224
    Top = 456
  end
end
