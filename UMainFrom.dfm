object MainForm: TMainForm
  Left = 212
  Top = 144
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
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 720
    Height = 120
    Align = alTop
    DataSource = DataSource1
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
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'GENRE_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PARENTGENRE_ID'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_GENRE'
        Fields = 'GENRE_ID'
        Options = [ixUnique]
      end
      item
        Name = 'GENRE_PARENT_ID_FK'
        Fields = 'PARENTGENRE_ID'
      end>
    IndexFieldNames = 'GENRE_ID'
    MasterSource = DataSource1
    StoreDefs = True
    TableName = 'GENRE'
    Left = 472
    Top = 296
  end
  object IBDatabase1: TIBDatabase
    Connected = True
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
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 472
    Top = 240
  end
  object DataSource1: TDataSource
    DataSet = IBDataSet1
    Left = 528
    Top = 296
  end
  object IBDataSet1: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from GENRE')
    Active = True
    Left = 472
    Top = 344
  end
end
