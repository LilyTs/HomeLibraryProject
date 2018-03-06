object MainForm: TMainForm
  Left = 316
  Top = 156
  Width = 736
  Height = 480
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 720
    Height = 120
    Align = alTop
    DataSource = DataSource2
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
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = 'Name'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARENTGENRE_ID'
        Title.Caption = 'Parent Genre ID'
        Width = 80
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 120
    Width = 720
    Height = 25
    Align = alTop
    TabOrder = 1
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'LIBRARYDB.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 472
    Top = 184
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 472
    Top = 240
  end
  object DataSource2: TDataSource
    DataSet = IBQuery1
    Left = 344
    Top = 256
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 384
    Top = 256
  end
end
