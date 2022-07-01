object FinfoConta: TFinfoConta
  Left = 315
  Top = 185
  Width = 793
  Height = 509
  BorderIcons = [biSystemMenu]
  Caption = 'Hist'#243'rico de Altera'#231#245'es'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ThemeDBGrid1: TThemeDBGrid
    Left = 0
    Top = 209
    Width = 777
    Height = 262
    Align = alClient
    DataSource = DataSource1
    DefaultDrawing = False
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = ThemeDBGrid1DrawColumnCell
    OnKeyDown = ThemeDBGrid1KeyDown
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 0
    Width = 777
    Height = 25
    Align = alTop
    TabOrder = 1
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 777
    Height = 184
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 7
      Top = 50
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'C'#243'digo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 7
      Top = 33
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'N'#186' Pedido:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 84
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Criado em:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 7
      Top = 101
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vencimento:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 7
      Top = 67
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Valor:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 7
      Top = 118
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Portador:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 268
      Top = 67
      Width = 95
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Pago em:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 268
      Top = 50
      Width = 95
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Funcion'#225'rio:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 7
      Top = 16
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Descri'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 268
      Top = 84
      Width = 95
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cliente:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 99
      Top = 50
      Width = 56
      Height = 16
      AutoSize = True
      DataField = 'Codigo'
      DataSource = Banco.Contas_source
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 99
      Top = 33
      Width = 56
      Height = 16
      Cursor = crHandPoint
      AutoSize = True
      DataField = 'NPedido'
      DataSource = Banco.Contas_source
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnMouseDown = DBText2MouseDown
    end
    object DBText3: TDBText
      Left = 99
      Top = 67
      Width = 56
      Height = 16
      AutoSize = True
      DataField = 'Valor'
      DataSource = Banco.Contas_source
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 99
      Top = 84
      Width = 56
      Height = 16
      AutoSize = True
      DataField = 'DataCreate'
      DataSource = Banco.Contas_source
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object DBText5: TDBText
      Left = 99
      Top = 118
      Width = 56
      Height = 16
      AutoSize = True
      DataField = 'PortadorVirtual'
      DataSource = Banco.Contas_source
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object DBText6: TDBText
      Left = 99
      Top = 101
      Width = 56
      Height = 16
      AutoSize = True
      DataField = 'DataVencimento'
      DataSource = Banco.Contas_source
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object DBText7: TDBText
      Left = 364
      Top = 33
      Width = 65
      Height = 17
      DataField = 'Pagada'
      DataSource = Banco.Contas_source
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object DBText8: TDBText
      Left = 99
      Top = 16
      Width = 56
      Height = 16
      AutoSize = True
      DataField = 'Descricao'
      DataSource = Banco.Contas_source
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 364
      Top = 50
      Width = 56
      Height = 16
      Caption = 'Label15'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 364
      Top = 67
      Width = 56
      Height = 16
      Caption = 'Label16'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 268
      Top = 33
      Width = 95
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Pagada:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 364
      Top = 84
      Width = 56
      Height = 16
      Cursor = crHandPoint
      Caption = 'Label17'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnMouseDown = Label17MouseDown
    end
  end
  object TB_Hist: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from tb_cont_hist')
    object TB_HistCodigo: TAutoIncField
      DisplayWidth = 12
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_HistID_Func: TIntegerField
      DisplayWidth = 12
      FieldName = 'ID_Func'
    end
    object TB_HistAlteracao: TWideStringField
      DisplayWidth = 63
      FieldName = 'Alteracao'
      Size = 255
    end
    object TB_HistData: TDateTimeField
      DisplayWidth = 22
      FieldName = 'Data'
    end
    object TB_HistID_Conta: TIntegerField
      DisplayWidth = 12
      FieldName = 'ID_Conta'
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 160
  end
  object DataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    object DataSetOldValue: TStringField
      DisplayLabel = 'Valor Antigo'
      DisplayWidth = 20
      FieldName = 'OldValue'
      Size = 255
    end
    object DataSetNewValue: TStringField
      DisplayLabel = 'Novo Valor'
      DisplayWidth = 20
      FieldName = 'NewValue'
      Size = 255
    end
    object DataSetCampo: TStringField
      DisplayWidth = 20
      FieldName = 'Campo'
      Size = 100
    end
    object DataSetFuncionario: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      DisplayWidth = 20
      FieldName = 'Funcionario'
      Size = 255
    end
    object DataSetErro: TBooleanField
      Tag = 1
      FieldName = 'Erro'
      Visible = False
    end
    object DataSetData: TStringField
      FieldName = 'Data'
    end
  end
  object TB_Func: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select codigo,nome from Funcionarios')
    Left = 32
    object TB_Funccodigo: TAutoIncField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object TB_Funcnome: TWideStringField
      FieldName = 'nome'
      Size = 150
    end
  end
  object DataSource1: TDataSource
    DataSet = DataSet
    Left = 128
  end
  object TB_Cli: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select nome_razao,codigo from cliente_Cadastro')
    Left = 64
    object TB_Clinome_razao: TWideStringField
      FieldName = 'nome_razao'
      Size = 150
    end
    object TB_Clicodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
end
