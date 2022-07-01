object FAgenda_MesHora: TFAgenda_MesHora
  Left = 290
  Top = 115
  Width = 828
  Height = 459
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Agenda...'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 670
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 48
    Width = 473
    Height = 169
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 473
      Height = 41
      Align = alTop
      Caption = ' Manh'#227
      Color = clYellow
      ParentBackground = False
      TabOrder = 0
    end
    object ThemeDBGrid1: TThemeDBGrid
      Left = 0
      Top = 41
      Width = 473
      Height = 128
      Align = alClient
      DataSource = Manha_Source
      DefaultDrawing = False
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = ThemeDBGrid1DrawColumnCell
    end
  end
  object Panel3: TPanel
    Left = 320
    Top = 232
    Width = 281
    Height = 113
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 1
    Visible = False
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 281
      Height = 41
      Align = alTop
      Caption = 'Noite'
      Color = 4194368
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object ThemeDBGrid3: TThemeDBGrid
      Left = 0
      Top = 41
      Width = 281
      Height = 72
      Align = alClient
      DataSource = Noite_Source
      DefaultDrawing = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = ThemeDBGrid3DrawColumnCell
    end
  end
  object Panel2: TPanel
    Left = 32
    Top = 232
    Width = 281
    Height = 137
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 2
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 281
      Height = 41
      Align = alTop
      Caption = 'Tarde'
      Color = 8421631
      ParentBackground = False
      TabOrder = 0
    end
    object ThemeDBGrid2: TThemeDBGrid
      Left = 0
      Top = 41
      Width = 281
      Height = 96
      Align = alClient
      DataSource = Tarde_Source
      DefaultDrawing = False
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = ThemeDBGrid2DrawColumnCell
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 812
    Height = 57
    Align = alTop
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Courier New'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Left = 656
      Top = 8
      Width = 49
      Height = 41
      Cursor = crHandPoint
      Caption = 'R'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 62708
      Font.Height = -40
      Font.Name = 'Wingdings'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 712
      Top = 8
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Caption = 'I'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4703738
      Font.Height = -36
      Font.Name = 'Webdings'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 760
      Top = 8
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Caption = 'Z'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6908265
      Font.Height = -36
      Font.Name = 'Wingdings'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 8
      Top = 8
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Caption = #193
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -36
      Font.Name = 'Wingdings'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton
      Left = 56
      Top = 8
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Caption = #339
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -36
      Font.Name = 'Webdings'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      OnClick = Button2Click
    end
    object SpeedButton6: TSpeedButton
      Left = 104
      Top = 8
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Caption = #254
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -36
      Font.Name = 'Webdings'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      OnClick = Button1Click
    end
  end
  object TB_Agenda: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select '
      'A.Data,'
      'A.Efetuado,'
      'A.agTipo,'
      'A.Contato_Forma,'
      'A.Assunto, '
      'A.id_cliente,'
      'B.nome_razao, '
      'B.nome, B.UF, '
      'B.cpf '
      'from tb_Agenda A'
      'left join Cliente_cadastro B on'
      'A.id_cliente = b.codigo')
    Left = 560
    Top = 56
    object TB_AgendaData: TDateTimeField
      FieldName = 'Data'
    end
    object TB_AgendaEfetuado: TBooleanField
      FieldName = 'Efetuado'
    end
    object TB_AgendaContato_Forma: TIntegerField
      FieldName = 'Contato_Forma'
    end
    object TB_AgendaAssunto: TWideStringField
      FieldName = 'Assunto'
      Size = 255
    end
    object TB_Agendanome_razao: TWideStringField
      FieldName = 'nome_razao'
      Size = 150
    end
    object TB_Agendanome: TWideStringField
      FieldName = 'nome'
      Size = 150
    end
    object TB_AgendaUF: TWideStringField
      FieldName = 'UF'
      Size = 2
    end
    object TB_Agendacpf: TWideStringField
      FieldName = 'cpf'
      Size = 18
    end
    object TB_Agendaid_cliente: TIntegerField
      FieldName = 'id_cliente'
    end
    object TB_AgendaagTipo: TIntegerField
      FieldName = 'agTipo'
    end
  end
  object TB_Manha: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = TB_ManhaAfterOpen
    Left = 528
    Top = 88
    object TB_ManhaCodCliente: TIntegerField
      DisplayLabel = 'C'#243'd Cliente'
      FieldKind = fkCalculated
      FieldName = 'CodCliente'
      Calculated = True
    end
    object TB_ManhaRazao: TWideStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'Razao'
      Size = 30
    end
    object TB_ManhaCPF: TWideStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPF'
      Size = 30
    end
    object TB_ManhaEfetuado: TBooleanField
      FieldName = 'Efetuado'
      DisplayValues = 'Sim;N'#227'o'
    end
    object TB_ManhaHora: TTimeField
      FieldName = 'Hora'
    end
    object TB_ManhaAssunto: TWideStringField
      FieldName = 'Assunto'
      Size = 255
    end
    object TB_ManhaTipo_Virtual: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkLookup
      FieldName = 'Tipo_Virtual'
      LookupDataSet = Banco.TB_Agenda_Tipo
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Tipo'
      Size = 255
      Lookup = True
    end
    object TB_ManhaContato_Virtual: TStringField
      DisplayLabel = 'Contato'
      FieldKind = fkLookup
      FieldName = 'Contato_Virtual'
      LookupDataSet = Banco.TB_Agenda_Contato
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Contato'
      Size = 255
      Lookup = True
    end
    object TB_ManhaTipo: TIntegerField
      Tag = 1
      FieldName = 'Tipo'
    end
    object TB_ManhaContato: TIntegerField
      Tag = 1
      FieldName = 'Contato'
    end
  end
  object TB_Tarde: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = TB_TardeAfterOpen
    Left = 560
    Top = 88
    object TB_TardeCodCliente: TIntegerField
      DisplayLabel = 'C'#243'd Cliente'
      FieldKind = fkCalculated
      FieldName = 'CodCliente'
      Calculated = True
    end
    object TB_TardeRazao: TWideStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'Razao'
      Size = 30
    end
    object TB_TardeCPF: TWideStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPF'
      Size = 30
    end
    object TB_TardeEfetuado: TBooleanField
      FieldName = 'Efetuado'
      DisplayValues = 'Sim;N'#227'o'
    end
    object TB_TardeHora: TTimeField
      FieldName = 'Hora'
    end
    object TB_TardeAssunto: TWideStringField
      FieldName = 'Assunto'
      Size = 255
    end
    object TB_TardeTipo_Virtual: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkLookup
      FieldName = 'Tipo_Virtual'
      LookupDataSet = Banco.TB_Agenda_Tipo
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Tipo'
      Size = 255
      Lookup = True
    end
    object TB_TardeContato_Virtual: TStringField
      DisplayLabel = 'Contato'
      FieldKind = fkLookup
      FieldName = 'Contato_Virtual'
      LookupDataSet = Banco.TB_Agenda_Contato
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Contato'
      Size = 255
      Lookup = True
    end
    object TB_TardeTipo: TIntegerField
      Tag = 1
      FieldName = 'Tipo'
    end
    object TB_TardeContato: TIntegerField
      Tag = 1
      FieldName = 'Contato'
    end
  end
  object TB_Noite: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = TB_NoiteAfterOpen
    Left = 592
    Top = 88
    object TB_NoiteCodCliente: TIntegerField
      DisplayLabel = 'C'#243'd Cliente'
      FieldKind = fkCalculated
      FieldName = 'CodCliente'
      Calculated = True
    end
    object TB_NoiteRazao: TWideStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'Razao'
      Size = 30
    end
    object TB_NoiteCPF: TWideStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPF'
      Size = 30
    end
    object TB_NoiteEfetuado: TBooleanField
      FieldName = 'Efetuado'
      DisplayValues = 'Sim;N'#227'o'
    end
    object TB_NoiteHora: TTimeField
      FieldName = 'Hora'
    end
    object TB_NoiteAssunto: TWideStringField
      FieldName = 'Assunto'
      Size = 255
    end
    object TB_NoiteTipo_Virtual: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkLookup
      FieldName = 'Tipo_Virtual'
      LookupDataSet = Banco.TB_Agenda_Tipo
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Tipo'
      Size = 255
      Lookup = True
    end
    object TB_NoiteContato_Virtual: TStringField
      DisplayLabel = 'Contato'
      FieldKind = fkLookup
      FieldName = 'Contato_Virtual'
      LookupDataSet = Banco.TB_Agenda_Contato
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Contato'
      Size = 255
      Lookup = True
    end
    object TB_NoiteTipo: TIntegerField
      Tag = 1
      FieldName = 'Tipo'
    end
    object TB_NoiteContato: TIntegerField
      Tag = 1
      FieldName = 'Contato'
    end
  end
  object Manha_Source: TDataSource
    DataSet = TB_Manha
    Left = 528
    Top = 120
  end
  object Tarde_Source: TDataSource
    DataSet = TB_Tarde
    Left = 560
    Top = 120
  end
  object Noite_Source: TDataSource
    DataSet = TB_Noite
    Left = 592
    Top = 120
  end
end
