object FAuditoria: TFAuditoria
  Left = 247
  Top = 131
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Auditoria'
  ClientHeight = 499
  ClientWidth = 949
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 177
    Top = 0
    Width = 772
    Height = 499
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 0
    object ThemeDBGrid1: TThemeDBGrid
      Left = 0
      Top = 49
      Width = 772
      Height = 450
      Align = alClient
      DataSource = DataSource1
      DefaultDrawing = False
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = ThemeDBGrid1DrawColumnCell
      OnDblClick = ThemeDBGrid1DblClick
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 772
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 50
        Height = 16
        Caption = 'Usu'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 216
        Top = 6
        Width = 33
        Height = 33
        Cursor = crHandPoint
        Caption = '/'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -33
        Font.Name = 'Wingdings 2'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object Label2: TLabel
        Left = 288
        Top = 16
        Width = 32
        Height = 16
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton2: TSpeedButton
        Left = 518
        Top = 6
        Width = 33
        Height = 33
        Caption = 'L'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Webdings'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton2Click
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 64
        Top = 12
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'codigo'
        ListField = 'nome'
        ListSource = Func_Source
        ParentFont = False
        TabOrder = 0
        OnClick = DBLookupComboBox1Click
        OnKeyDown = DBLookupComboBox1KeyDown
      end
      object DateTimePicker1: TDateTimePicker
        Left = 328
        Top = 12
        Width = 186
        Height = 24
        Date = 41974.778889386570000000
        Time = 41974.778889386570000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = DateTimePicker1Change
      end
    end
    object ThemeDBGrid2: TThemeDBGrid
      Left = 0
      Top = 49
      Width = 772
      Height = 450
      Align = alClient
      DataSource = Log_source
      DefaultDrawing = False
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      OnDrawColumnCell = ThemeDBGrid1DrawColumnCell
    end
    object GRID_Pedido: TThemeDBGrid
      Left = 0
      Top = 49
      Width = 772
      Height = 450
      Align = alClient
      DataSource = Pedido_Source
      DefaultDrawing = False
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      OnDrawColumnCell = codCell
    end
    object Grid_Erro: TThemeDBGrid
      Left = 0
      Top = 49
      Width = 772
      Height = 450
      Align = alClient
      DataSource = Erro_Source
      DefaultDrawing = False
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      OnDrawColumnCell = Grid_ErroDrawColumnCell
    end
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 177
    Height = 499
    Align = alLeft
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Indent = 19
    MultiSelectStyle = [msControlSelect, msVisibleOnly, msSiblingOnly]
    ParentFont = False
    ParentShowHint = False
    RightClickSelect = True
    RowSelect = True
    ShowHint = False
    TabOrder = 1
    OnClick = TreeView1Click
    OnEditing = TreeView1Editing
    Items.Data = {
      04000000250000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
      0C20202041756469746F726961290000000000000000000000FFFFFFFFFFFFFF
      FF0000000000000000104572726F7320646F2053697374656D61230000000000
      000000000000FFFFFFFFFFFFFFFF00000000050000000A416C74657261E7F565
      73210000000000000000000000FFFFFFFFFFFFFFFF000000000000000008436C
      69656E746573250000000000000000000000FFFFFFFFFFFFFFFF000000000000
      00000C46756E63696F6EE172696F73200000000000000000000000FFFFFFFFFF
      FFFFFF0000000000000000074573746F717565200000000000000000000000FF
      FFFFFFFFFFFFFF00000000000000000750656469646F731F0000000000000000
      000000FFFFFFFFFFFFFFFF0000000000000000064167656E6461280000000000
      000000000000FFFFFFFFFFFFFFFF00000000000000000F48697374F37269636F
      204C6F67696E}
  end
  object TB_Auditoria: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    BeforeOpen = TB_AuditoriaBeforeOpen
    AfterOpen = TB_AuditoriaAfterOpen
    BeforeClose = TB_AuditoriaBeforeClose
    Parameters = <>
    SQL.Strings = (
      'Select * from TB_auditoria')
    Left = 16
    Top = 216
    object TB_AuditoriaCodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_AuditoriaData: TDateTimeField
      DisplayWidth = 22
      FieldName = 'Data'
    end
    object TB_AuditoriaTipoVirtual: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkLookup
      FieldName = 'TipoVirtual'
      LookupDataSet = TB_Tipo
      LookupKeyFields = 'codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'tipo'
      Size = 255
      Lookup = True
    end
    object TB_AuditoriaModuloVirtual: TStringField
      DisplayLabel = 'Modulo'
      FieldKind = fkLookup
      FieldName = 'ModuloVirtual'
      LookupDataSet = TB_Modulo
      LookupKeyFields = 'codigo'
      LookupResultField = 'descricao'
      KeyFields = 'modulo'
      Size = 255
      Lookup = True
    end
    object TB_Auditoriareg: TIntegerField
      DisplayLabel = 'C'#243'd. Reg.'
      DisplayWidth = 12
      FieldName = 'reg'
    end
    object TB_AuditoriaCampo: TWideStringField
      DisplayWidth = 9
      FieldName = 'Campo'
      Size = 255
    end
    object TB_AuditoriaOldValue: TWideStringField
      DisplayLabel = 'Valor Antigo'
      DisplayWidth = 19
      FieldName = 'OldValue'
      Size = 255
    end
    object TB_AuditoriaNewValue: TWideStringField
      DisplayLabel = 'Valor Novo'
      DisplayWidth = 306
      FieldName = 'NewValue'
      Size = 255
    end
    object TB_AuditoriaUserVirtual: TStringField
      DisplayLabel = 'Usu'#225'rio'
      DisplayWidth = 306
      FieldKind = fkLookup
      FieldName = 'UserVirtual'
      LookupDataSet = TB_Func
      LookupKeyFields = 'codigo'
      LookupResultField = 'nome'
      KeyFields = 'user'
      Size = 255
      Lookup = True
    end
    object TB_AuditoriaUser: TIntegerField
      Tag = 1
      DisplayWidth = 12
      FieldName = 'User'
    end
    object TB_AuditoriaTipo: TIntegerField
      Tag = 1
      DisplayWidth = 12
      FieldName = 'Tipo'
    end
    object TB_Auditoriamodulo: TIntegerField
      Tag = 1
      DisplayWidth = 12
      FieldName = 'modulo'
    end
  end
  object TB_Func: TADOQuery
    Active = True
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select nome,codigo from funcionarios'
      'order by nome asc')
    Left = 16
    Top = 248
    object TB_Funcnome: TWideStringField
      FieldName = 'nome'
      Size = 150
    end
    object TB_Funccodigo: TAutoIncField
      FieldName = 'codigo'
      ReadOnly = True
    end
  end
  object TB_Modulo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 17
    Top = 184
    object TB_ModuloCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object TB_ModuloDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = TB_Auditoria
    Left = 49
    Top = 216
  end
  object TB_Tipo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 49
    Top = 184
    object TB_TipoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object TB_TipoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
  end
  object Func_Source: TDataSource
    DataSet = TB_Func
    Left = 48
    Top = 248
  end
  object TB_Login: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    BeforeOpen = TB_LoginBeforeOpen
    AfterOpen = TB_LoginAfterOpen
    BeforeClose = TB_LoginBeforeClose
    Parameters = <>
    SQL.Strings = (
      'select * from tb_login')
    Left = 16
    Top = 280
    object TB_LoginCodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_LoginUsuario: TStringField
      FieldKind = fkLookup
      FieldName = 'Usuario'
      LookupDataSet = TB_Func
      LookupKeyFields = 'codigo'
      LookupResultField = 'nome'
      KeyFields = 'User'
      Size = 255
      Lookup = True
    end
    object TB_LoginData: TDateTimeField
      FieldName = 'Data'
    end
    object TB_LoginUser: TIntegerField
      Tag = 1
      FieldName = 'User'
    end
    object TB_LoginMac: TIntegerField
      Tag = 1
      FieldName = 'Mac'
      Visible = False
    end
    object TB_LoginIp: TIntegerField
      Tag = 1
      FieldName = 'Ip'
      Visible = False
    end
    object TB_LoginIPVirtual: TStringField
      DisplayLabel = 'IP'
      FieldKind = fkLookup
      FieldName = 'IPVirtual'
      LookupDataSet = TB_IP
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Ip'
      Size = 255
      Lookup = True
    end
    object TB_LoginMACVirtual: TStringField
      DisplayLabel = 'MAC'
      FieldKind = fkLookup
      FieldName = 'MACVirtual'
      LookupDataSet = TB_MAC
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'mac'
      Size = 255
      Lookup = True
    end
  end
  object Log_source: TDataSource
    DataSet = TB_Login
    Left = 48
    Top = 280
  end
  object TB_IP: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_loginIP')
    Left = 16
    Top = 312
    object TB_IPCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_IPDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 255
    end
  end
  object TB_MAC: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_loginMAC')
    Left = 16
    Top = 344
    object TB_MACCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_MACDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 255
    end
  end
  object TB_Audi_Pedido: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    AfterOpen = TB_Audi_PedidoAfterOpen
    BeforeClose = TB_Audi_PedidoBeforeClose
    Parameters = <>
    SQL.Strings = (
      'select * from tb_auditoria_mercadoria')
    Left = 16
    Top = 376
    object TB_Audi_PedidoCodigo: TAutoIncField
      Tag = 1
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      ReadOnly = True
      Visible = False
    end
    object TB_Audi_PedidoID_Pedido: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'ID_Pedido'
    end
    object TB_Audi_PedidoID_Mercadoria: TIntegerField
      Tag = 1
      FieldName = 'ID_Mercadoria'
      Visible = False
    end
    object TB_Audi_PedidoID_Mercadoria_Estoque: TIntegerField
      DisplayLabel = 'Mercadoria'
      FieldName = 'ID_Mercadoria_Estoque'
    end
    object TB_Audi_PedidoCampo: TWideStringField
      FieldName = 'Campo'
      Size = 255
    end
    object TB_Audi_PedidoNewValue: TWideStringField
      DisplayLabel = 'Novo Valor'
      FieldName = 'NewValue'
      Size = 255
    end
    object TB_Audi_PedidoOldValue: TWideStringField
      DisplayLabel = 'Valor Antigo'
      FieldName = 'OldValue'
      Size = 255
    end
    object TB_Audi_PedidoTipo: TIntegerField
      Tag = 1
      FieldName = 'Tipo'
      Visible = False
    end
    object TB_Audi_PedidoID_Auditoria: TIntegerField
      Tag = 1
      FieldName = 'ID_Auditoria'
      Visible = False
    end
    object TB_Audi_PedidoTipoVirtual: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkLookup
      FieldName = 'TipoVirtual'
      LookupDataSet = TB_Tipo
      LookupKeyFields = 'codigo'
      LookupResultField = 'descricao'
      KeyFields = 'Tipo'
      Size = 255
      Lookup = True
    end
  end
  object Pedido_Source: TDataSource
    DataSet = TB_Audi_Pedido
    Left = 56
    Top = 376
  end
  object TB_Erro: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    BeforeOpen = TB_ErroBeforeOpen
    AfterOpen = TB_ErroAfterOpen
    BeforeClose = TB_ErroBeforeClose
    Parameters = <>
    SQL.Strings = (
      'select * from tb_exception')
    Left = 16
    Top = 408
    object TB_ErroCodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_ErroData: TDateTimeField
      FieldName = 'Data'
    end
    object TB_ErroClasse: TWideStringField
      FieldName = 'Classe'
      Size = 255
    end
    object TB_ErroMessage: TWideStringField
      DisplayLabel = 'Mensagem'
      FieldName = 'Message'
      Size = 255
    end
    object TB_ErroVersao: TWideStringField
      DisplayLabel = 'Vers'#227'o'
      FieldName = 'Versao'
    end
    object TB_ErroRelatorio: TBlobField
      Tag = 1
      DisplayLabel = 'Relat'#243'rio'
      FieldName = 'Relatorio'
      Visible = False
    end
    object TB_ErroUser: TIntegerField
      Tag = 1
      FieldName = 'User'
      Visible = False
    end
    object TB_ErroUser_Virtual: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldKind = fkLookup
      FieldName = 'User_Virtual'
      LookupDataSet = TB_Func
      LookupKeyFields = 'codigo'
      LookupResultField = 'nome'
      KeyFields = 'user'
      Size = 255
      Lookup = True
    end
  end
  object Erro_Source: TDataSource
    DataSet = TB_Erro
    Left = 56
    Top = 408
  end
end
