object Banco: TBanco
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 191
  Top = 113
  Height = 614
  Width = 987
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;User ID=Admin;Data Source=D:\P' +
      'rojeto Luis\Outinput\dados.mdb;Mode=Share Deny None;Persist Secu' +
      'rity Info=False;Jet OLEDB:System database="";Jet OLEDB:Registry ' +
      'Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;J' +
      'et OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk O' +
      'ps=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database' +
      ' Password="";Jet OLEDB:Create System Database=False;Jet OLEDB:En' +
      'crypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compact=Fals' +
      'e;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=F' +
      'alse;Jet OLEDB:Support Complex Data=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 392
    Top = 8
  end
  object TBClientes: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = TBClientesAfterOpen
    BeforeClose = TBClientesBeforeClose
    BeforePost = TBClientesBeforePost
    Parameters = <>
    SQL.Strings = (
      'Select * from Cliente_Cadastro')
    Left = 48
    Top = 208
    object TBClientesCodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TBClientesNome_Razao: TWideStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 60
      FieldName = 'Nome_Razao'
      Size = 150
    end
    object TBClientesNome: TWideStringField
      DisplayWidth = 60
      FieldName = 'Nome'
      Size = 150
    end
    object TBClientesNumero: TWideStringField
      DisplayLabel = 'N'#250'mero'
      DisplayWidth = 12
      FieldName = 'Numero'
      Size = 10
    end
    object TBClientesComplemento: TWideStringField
      DisplayWidth = 37
      FieldName = 'Complemento'
      Size = 100
    end
    object TBClientesBairro: TWideStringField
      DisplayWidth = 36
      FieldName = 'Bairro'
      Size = 50
    end
    object TBClientesUF: TWideStringField
      DisplayWidth = 6
      FieldName = 'UF'
      Size = 2
    end
    object TBClientesCep: TWideStringField
      DisplayWidth = 19
      FieldName = 'Cep'
      Size = 16
    end
    object TBClientesEmail: TWideStringField
      DisplayWidth = 24
      FieldName = 'Email'
      Size = 150
    end
    object TBClientesDDD_Res: TWideStringField
      DisplayLabel = 'DDD Res.'
      DisplayWidth = 10
      FieldName = 'DDD_Res'
      Size = 2
    end
    object TBClientesTel_Res: TWideStringField
      DisplayLabel = 'Tel. Res.'
      DisplayWidth = 19
      FieldName = 'Tel_Res'
      Size = 16
    end
    object TBClientesDDD_Come: TWideStringField
      DisplayLabel = 'DDD Come.'
      DisplayWidth = 12
      FieldName = 'DDD_Come'
      Size = 2
    end
    object TBClientesTel_Come: TWideStringField
      DisplayLabel = 'Tel. Come.'
      DisplayWidth = 19
      FieldName = 'Tel_Come'
      Size = 16
    end
    object TBClientesDDD_Cel: TWideStringField
      DisplayLabel = 'DDD Cel.'
      DisplayWidth = 9
      FieldName = 'DDD_Cel'
      Size = 2
    end
    object TBClientesTel_Cel: TWideStringField
      DisplayLabel = 'Tel. Cel.'
      DisplayWidth = 19
      FieldName = 'Tel_Cel'
      Size = 16
    end
    object TBClientesDDD_Fax: TWideStringField
      DisplayLabel = 'DDD Fax.'
      DisplayWidth = 10
      FieldName = 'DDD_Fax'
      Size = 2
    end
    object TBClientesTel_Fax: TWideStringField
      DisplayLabel = 'Tel. Fax.'
      DisplayWidth = 19
      FieldName = 'Tel_Fax'
      Size = 16
    end
    object TBClientesIE: TWideStringField
      DisplayWidth = 23
      FieldName = 'IE'
      Size = 50
    end
    object TBClientesIM: TWideStringField
      DisplayWidth = 13
      FieldName = 'IM'
      Size = 30
    end
    object TBClientesLogradouro: TWideStringField
      DisplayWidth = 36
      FieldName = 'Logradouro'
      Size = 150
    end
    object TBClientesLogr_Tipo: TIntegerField
      Tag = 1
      DisplayLabel = 'Tipo'
      DisplayWidth = 12
      FieldName = 'Logr_Tipo'
    end
    object TBClientesOBS: TWideStringField
      DisplayWidth = 20
      FieldName = 'OBS'
      Size = 255
    end
    object TBClientesCidade_Virtual: TStringField
      DisplayLabel = 'Munic'#237'pio'
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'Cidade_Virtual'
      LookupDataSet = TBMunicipio
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Cidade'
      KeyFields = 'Municiopio'
      Size = 255
      Lookup = True
    end
    object TBClientesMuniciopio: TIntegerField
      Tag = 1
      DisplayLabel = 'Munic'#237'pio'
      DisplayWidth = 12
      FieldName = 'Municiopio'
      Visible = False
    end
    object TBClientesLogTypeVirtual: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'LogTypeVirtual'
      LookupDataSet = TBLogra
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Tipo'
      KeyFields = 'Logr_Tipo'
      Size = 50
      Lookup = True
    end
    object TBClientesAtivo: TBooleanField
      FieldName = 'Ativo'
      DisplayValues = 'Sim;N'#227'o'
    end
    object TBClientesCPF: TWideStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPF'
      Size = 18
    end
  end
  object TBMunicipio: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = TBMunicipioBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'Select * from Cliente_local')
    Left = 48
    Top = 304
    object TBMunicipioCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TBMunicipioUF: TWideStringField
      DisplayWidth = 3
      FieldName = 'UF'
      Size = 2
    end
    object TBMunicipioCidade: TWideStringField
      DisplayWidth = 30
      FieldName = 'Cidade'
      Size = 255
    end
    object TBMunicipioDDD: TWideStringField
      DisplayWidth = 5
      FieldName = 'DDD'
      Size = 2
    end
    object TBMunicipioCEP: TWideStringField
      DisplayWidth = 19
      FieldName = 'CEP'
      EditMask = '00000\ 999;1; '
      Size = 16
    end
  end
  object Cliente_Source: TDataSource
    DataSet = TBClientes
    Left = 120
    Top = 208
  end
  object Municipio_Source: TDataSource
    DataSet = TBMunicipio
    Left = 120
    Top = 304
  end
  object TBLogra: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Cliente_Local_Aux'
    Left = 48
    Top = 352
    object TBLograCodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TBLograTipo: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Tipo'
      Size = 50
    end
  end
  object AppEvents: TApplicationEvents
    OnException = AppEventsException
    OnMessage = AppEventsMessage
    Left = 32
    Top = 8
  end
  object TBEstoque: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = TBEstoqueAfterOpen
    BeforeClose = TBEstoqueBeforeClose
    Parameters = <>
    SQL.Strings = (
      'Select * from Estoque')
    Left = 232
    Top = 96
    object TBEstoqueCodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 29
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TBEstoqueDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 81
      FieldName = 'Descricao'
      Size = 150
    end
    object TBEstoqueun_virtual: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 29
      FieldKind = fkLookup
      FieldName = 'un_virtual'
      LookupDataSet = TBEstUn
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Sinb'
      KeyFields = 'Un'
      Lookup = True
    end
    object TBEstoqueValor: TBCDField
      DisplayWidth = 29
      FieldName = 'Valor'
      currency = True
      Precision = 19
    end
    object TBEstoqueUn: TIntegerField
      Tag = 1
      DisplayLabel = 'Unidade'
      DisplayWidth = 15
      FieldName = 'Un'
    end
    object TBEstoqueAtivo: TBooleanField
      FieldName = 'Ativo'
      DisplayValues = 'Sim;N'#227'o'
    end
    object TBEstoqueQuantidade: TFloatField
      Tag = 1
      FieldKind = fkLookup
      FieldName = 'Quantidade'
      LookupDataSet = TBEstoque_Quant
      LookupKeyFields = 'ID_Merca'
      LookupResultField = 'Quant'
      KeyFields = 'Codigo'
      Lookup = True
    end
  end
  object Estoque_Source: TDataSource
    DataSet = TBEstoque
    Left = 304
    Top = 96
  end
  object TBEstUn: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Estoque_UN'
    Left = 232
    Top = 208
    object TBEstUnCodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TBEstUnSinb: TWideStringField
      DisplayLabel = 'Simbolo'
      FieldName = 'Sinb'
      Size = 8
    end
    object TBEstUnDescri: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descri'
      Size = 50
    end
  end
  object XPManifest1: TXPManifest
    Left = 96
    Top = 8
  end
  object TB_Pedido: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = TB_PedidoAfterOpen
    BeforeClose = TB_PedidoBeforeClose
    Parameters = <>
    SQL.Strings = (
      
        'Select  A.*, B.nome_razao, B.nome, B.UF, B.Municiopio, B.cpf fro' +
        'm'
      'Venda_info A inner join Cliente_cadastro B on'
      'A.id_cliente = b.codigo')
    Left = 232
    Top = 360
    object TB_PedidoID_Pedido: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'ID_Pedido'
      ReadOnly = True
    end
    object TB_PedidoData_Hora: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 14
      FieldName = 'Data_Hora'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object TB_PedidoSituacao_Virtual: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'Situacao_Virtual'
      LookupDataSet = TB_Situacao
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descri'
      KeyFields = 'situacao'
      Lookup = True
    end
    object TB_PedidoComprador_Nome: TWideStringField
      DisplayLabel = 'Comprador'
      DisplayWidth = 30
      FieldName = 'Comprador_Nome'
      Size = 255
    end
    object TB_PedidoPreco: TBCDField
      DisplayLabel = 'Pre'#231'o'
      DisplayWidth = 16
      FieldName = 'Preco'
      currency = True
      Precision = 19
    end
    object TB_PedidoDesconto: TBCDField
      DisplayWidth = 10
      FieldName = 'Desconto'
      Precision = 19
    end
    object TB_PedidoID_cliente: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      DisplayWidth = 12
      FieldName = 'ID_cliente'
    end
    object TB_Pedidonome_razao: TWideStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 50
      FieldName = 'nome_razao'
      Size = 150
    end
    object TB_Pedidonome2: TWideStringField
      DisplayLabel = 'Contato Cliente'
      DisplayWidth = 75
      FieldName = 'nome'
      Size = 150
    end
    object TB_Pedidocpf: TWideStringField
      DisplayLabel = 'CNPJ / CPF'
      FieldName = 'cpf'
      Size = 14
    end
    object TB_PedidoFaturaVirtual: TStringField
      DisplayLabel = 'Fatura'
      FieldKind = fkLookup
      FieldName = 'FaturaVirtual'
      LookupDataSet = TB_FormaPagamento
      LookupKeyFields = 'codigo'
      LookupResultField = 'Forma'
      KeyFields = 'Fatura'
      Size = 255
      Lookup = True
    end
    object TB_PedidoParcelamentoVirtual: TStringField
      DisplayLabel = 'Parcelamento'
      FieldKind = fkLookup
      FieldName = 'ParcelamentoVirtual'
      LookupDataSet = TB_Parcelamento_Lista
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Parcelamento'
      Size = 255
      Lookup = True
    end
    object TB_PedidoUF: TWideStringField
      DisplayWidth = 4
      FieldName = 'UF'
      Size = 2
    end
    object TB_PedidoMunicipioVirtual: TStringField
      DisplayLabel = 'Munic'#237'pio'
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'MunicipioVirtual'
      LookupDataSet = TBMunicipio
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Cidade'
      KeyFields = 'Municiopio'
      Size = 255
      Lookup = True
    end
    object TB_PedidoMuniciopio: TIntegerField
      Tag = 1
      DisplayLabel = 'Munic'#237'pio'
      FieldName = 'Municiopio'
    end
    object TB_PedidoColor: TIntegerField
      Tag = 1
      FieldKind = fkLookup
      FieldName = 'Color'
      LookupDataSet = TB_Situacao
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Color'
      KeyFields = 'situacao'
      Lookup = True
    end
    object TB_PedidoDescri: TMemoField
      Tag = 1
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 12
      FieldName = 'Descri'
      BlobType = ftMemo
    end
    object TB_PedidoParcelamento: TIntegerField
      Tag = 1
      FieldName = 'Parcelamento'
    end
    object TB_PedidoFatura: TIntegerField
      Tag = 1
      FieldName = 'Fatura'
      OnValidate = TB_PedidoFaturaValidate
    end
    object TB_PedidoColorBrush: TIntegerField
      Tag = 1
      FieldKind = fkLookup
      FieldName = 'ColorBrush'
      LookupDataSet = TB_Situacao
      LookupKeyFields = 'Codigo'
      LookupResultField = 'BrashColor'
      KeyFields = 'situacao'
      Visible = False
      Lookup = True
    end
    object TB_Pedidosituacao: TIntegerField
      Tag = 1
      DisplayLabel = 'Situa'#231#227'o'
      DisplayWidth = 12
      FieldName = 'situacao'
      Visible = False
    end
    object TB_PedidoTotal_Reg: TIntegerField
      Tag = 1
      DisplayWidth = 11
      FieldName = 'Total_Reg'
    end
  end
  object TB_Vendas_All: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from VENDA_ALL')
    Left = 224
    Top = 304
    object TB_Vendas_AllID_mercadoria: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_mercadoria'
    end
    object TB_Vendas_AllValor_un: TBCDField
      DisplayLabel = 'Valor Unit.'
      FieldName = 'Valor_un'
      currency = True
      Precision = 19
    end
    object TB_Vendas_AllValor_Total: TBCDField
      DisplayLabel = 'Total'
      FieldName = 'Valor_Total'
      currency = True
      Precision = 19
    end
    object TB_Vendas_AllQtd: TBCDField
      FieldName = 'Qtd'
      Precision = 19
    end
    object TB_Vendas_AllDescri: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'Descri'
      LookupDataSet = TBEstoque
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'ID_mercadoria'
      Lookup = True
    end
    object TB_Vendas_AllUNMerca: TStringField
      DisplayLabel = 'Un'
      FieldKind = fkLookup
      FieldName = 'UNMerca'
      LookupDataSet = TBEstoque
      LookupKeyFields = 'Codigo'
      LookupResultField = 'un_virtual'
      KeyFields = 'ID_mercadoria'
      Lookup = True
    end
    object TB_Vendas_AllQuantiBaixa: TBCDField
      Tag = 1
      DisplayLabel = 'Baixa'
      FieldName = 'QuantiBaixa'
      Precision = 19
    end
    object TB_Vendas_AllCodigo: TAutoIncField
      Tag = 1
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_Vendas_AllID_Pedido: TIntegerField
      Tag = 1
      DisplayLabel = 'Pedido'
      FieldName = 'ID_Pedido'
    end
    object TB_Vendas_AllCancelado: TBooleanField
      Tag = 1
      FieldName = 'Cancelado'
    end
  end
  object Pedido_Source: TDataSource
    DataSet = TB_Pedido
    Left = 296
    Top = 360
  end
  object Report: TppReport
    AutoStop = False
    DataPipeline = PP_Pipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'PDF'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PDFSettings.Author = 'Daniel Fazzioni'
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.OpenPDFFile = True
    PreviewFormSettings.PageDisplay = pdContinuous
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextFileType = ftCustom
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 664
    Top = 96
    Version = '14.04'
    mmColumnWidth = 0
    DataPipelineName = 'PP_Pipeline1'
    object ppTitleBand1: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 54769
      mmPrintPosition = 0
      object PP_Pedido: TppLabel
        UserName = 'PP_Pedido'
        AutoSize = False
        Caption = 'Pedido N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 5292
        mmLeft = 11642
        mmTop = 10054
        mmWidth = 63236
        BandType = 1
        LayerName = Foreground
      end
      object PP_Data: TppLabel
        UserName = 'PP_Data'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5292
        mmLeft = 141023
        mmTop = 10054
        mmWidth = 39688
        BandType = 1
        LayerName = Foreground
      end
      object PP_Endereco: TppLabel
        UserName = 'PP_Endereco'
        AutoSize = False
        Caption = 'PP_Endereco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 11642
        mmTop = 32015
        mmWidth = 169069
        BandType = 1
        LayerName = Foreground
      end
      object PP_CEp: TppLabel
        UserName = 'PP_CEp'
        AutoSize = False
        Caption = 'PP_CEp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 11642
        mmTop = 39423
        mmWidth = 169069
        BandType = 1
        LayerName = Foreground
      end
      object PP_Contato: TppLabel
        UserName = 'PP_Contato'
        AutoSize = False
        Caption = 'PP_Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 11642
        mmTop = 24871
        mmWidth = 169069
        BandType = 1
        LayerName = Foreground
      end
      object PP_CNPJ: TppLabel
        UserName = 'PP_CNPJ'
        AutoSize = False
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 11642
        mmTop = 17992
        mmWidth = 85725
        BandType = 1
        LayerName = Foreground
      end
      object PP_IE: TppLabel
        UserName = 'PP_IE'
        AutoSize = False
        Caption = 'IE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 98690
        mmTop = 17992
        mmWidth = 82021
        BandType = 1
        LayerName = Foreground
      end
      object PP_DESCRI: TppLabel
        UserName = 'PP_DESCRI'
        AutoSize = False
        Caption = 'PP_DESCRI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 10583
        mmTop = 2117
        mmWidth = 173302
        BandType = 1
        LayerName = Foreground
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 43921
        mmLeft = 183621
        mmTop = 8202
        mmWidth = 3175
        BandType = 1
        LayerName = Foreground
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 10583
        mmTop = 16669
        mmWidth = 173302
        BandType = 1
        LayerName = Foreground
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 10583
        mmTop = 8202
        mmWidth = 173302
        BandType = 1
        LayerName = Foreground
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 43656
        mmLeft = 10583
        mmTop = 8202
        mmWidth = 3175
        BandType = 1
        LayerName = Foreground
      end
      object PP_TEL: TppLabel
        UserName = 'PP_TEL'
        AutoSize = False
        Caption = 'PP_TEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 11642
        mmTop = 45773
        mmWidth = 169069
        BandType = 1
        LayerName = Foreground
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 10583
        mmTop = 48154
        mmWidth = 173302
        BandType = 1
        LayerName = Foreground
      end
    end
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 9261
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8467
        mmLeft = 3704
        mmTop = 1588
        mmWidth = 20638
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Qtd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8467
        mmLeft = 24077
        mmTop = 1588
        mmWidth = 10319
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Un'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8467
        mmLeft = 36248
        mmTop = 1323
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8467
        mmLeft = 48154
        mmTop = 1588
        mmWidth = 91017
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Pre'#231'o Unit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8467
        mmLeft = 143140
        mmTop = 1588
        mmWidth = 20108
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8467
        mmLeft = 166370
        mmTop = 1588
        mmWidth = 23283
        BandType = 0
        LayerName = Foreground
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 46302
        mmTop = 1323
        mmWidth = 4498
        BandType = 0
        LayerName = Foreground
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 3704
        mmTop = 1323
        mmWidth = 3175
        BandType = 0
        LayerName = Foreground
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 3704
        mmTop = 1323
        mmWidth = 188913
        BandType = 0
        LayerName = Foreground
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 35190
        mmTop = 1323
        mmWidth = 4498
        BandType = 0
        LayerName = Foreground
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 24077
        mmTop = 1323
        mmWidth = 4498
        BandType = 0
        LayerName = Foreground
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 164836
        mmTop = 1323
        mmWidth = 4498
        BandType = 0
        LayerName = Foreground
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 141023
        mmTop = 1323
        mmWidth = 4498
        BandType = 0
        LayerName = Foreground
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 3704
        mmTop = 7938
        mmWidth = 188913
        BandType = 0
        LayerName = Foreground
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 189442
        mmTop = 1323
        mmWidth = 3175
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Codigo'
        DataPipeline = PP_Pipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PP_Pipeline1'
        mmHeight = 5027
        mmLeft = 5027
        mmTop = 0
        mmWidth = 18256
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Qtd'
        DataPipeline = PP_Pipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PP_Pipeline1'
        mmHeight = 5027
        mmLeft = 25400
        mmTop = 0
        mmWidth = 7938
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'Unidade'
        DataPipeline = PP_Pipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PP_Pipeline1'
        mmHeight = 5027
        mmLeft = 36777
        mmTop = 0
        mmWidth = 8202
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'Descricao'
        DataPipeline = PP_Pipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PP_Pipeline1'
        mmHeight = 5027
        mmLeft = 48154
        mmTop = 0
        mmWidth = 91017
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PrecoUnit'
        DataPipeline = PP_Pipeline1
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PP_Pipeline1'
        mmHeight = 5027
        mmLeft = 142611
        mmTop = 0
        mmWidth = 21431
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'Total'
        DataPipeline = PP_Pipeline1
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PP_Pipeline1'
        mmHeight = 4995
        mmLeft = 166423
        mmTop = 0
        mmWidth = 24342
        BandType = 4
        LayerName = Foreground
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 24077
        mmTop = 0
        mmWidth = 4498
        BandType = 4
        LayerName = Foreground
      end
      object ppLine17: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 35190
        mmTop = 0
        mmWidth = 4498
        BandType = 4
        LayerName = Foreground
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 46302
        mmTop = 0
        mmWidth = 4498
        BandType = 4
        LayerName = Foreground
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 141023
        mmTop = 0
        mmWidth = 4498
        BandType = 4
        LayerName = Foreground
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 164836
        mmTop = 0
        mmWidth = 4498
        BandType = 4
        LayerName = Foreground
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 189442
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 3704
        mmTop = 0
        mmWidth = 4498
        BandType = 4
        LayerName = Foreground
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 3704
        mmTop = 5556
        mmWidth = 188913
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 144992
        mmTop = 0
        mmWidth = 47625
        BandType = 8
        LayerName = Foreground
      end
      object PP_Pedido1: TppLabel
        UserName = 'PP_Pedido1'
        AutoSize = False
        Caption = 'Pedido N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4995
        mmLeft = 3704
        mmTop = 0
        mmWidth = 63236
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object PPPrecoTotal: TppLabel
        UserName = 'PPPrecoTotal'
        AutoSize = False
        Caption = 'Pre'#231'o Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 73554
        mmTop = 794
        mmWidth = 119592
        BandType = 7
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object TB_GeraPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 760
    Top = 96
    object TB_GeraPedidoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object TB_GeraPedidoQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object TB_GeraPedidoUnidade: TStringField
      FieldName = 'Unidade'
      Size = 5
    end
    object TB_GeraPedidoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object TB_GeraPedidoPrecoUnit: TFloatField
      FieldName = 'PrecoUnit'
    end
    object TB_GeraPedidoTotal: TFloatField
      FieldName = 'Total'
    end
  end
  object Source_GeraPedido: TDataSource
    DataSet = TB_GeraPedido
    Left = 760
    Top = 160
  end
  object PP_Pipeline1: TppDBPipeline
    OpenDataSource = False
    AutoCreateFields = False
    UserName = 'PP_Pipeline1'
    Left = 664
    Top = 144
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 856
    Top = 96
    object ClientDataSet1Qtd: TIntegerField
      FieldName = 'Qtd'
    end
    object ClientDataSet1cod: TIntegerField
      FieldName = 'cod'
    end
  end
  object TBLOG_Source: TDataSource
    DataSet = TBLogra
    Left = 120
    Top = 360
  end
  object un_source: TDataSource
    DataSet = TBEstUn
    Left = 296
    Top = 208
  end
  object Agenda_Source: TDataSource
    DataSet = TB_Agenda
    Left = 608
    Top = 416
  end
  object Report_Info: TppReport
    AutoStop = False
    DataPipeline = ppPipeline2
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 664
    Top = 216
    Version = '14.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppPipeline2'
    object ppTitleBand2: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object PP_Info_Data: TppLabel
        UserName = 'PP_Info_Data'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5292
        mmLeft = 13758
        mmTop = 15875
        mmWidth = 166952
        BandType = 1
        LayerName = Foreground1
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 183621
        mmTop = 14023
        mmWidth = 3175
        BandType = 1
        LayerName = Foreground1
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 10583
        mmTop = 14023
        mmWidth = 173302
        BandType = 1
        LayerName = Foreground1
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 10583
        mmTop = 14023
        mmWidth = 3175
        BandType = 1
        LayerName = Foreground1
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Relat'#243'rio de Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 18
        Font.Style = []
        Transparent = True
        mmHeight = 7408
        mmLeft = 73290
        mmTop = 3704
        mmWidth = 50536
        BandType = 1
        LayerName = Foreground1
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 10583
        mmTop = 20108
        mmWidth = 173302
        BandType = 1
        LayerName = Foreground1
      end
    end
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 24077
        mmTop = 3704
        mmWidth = 23548
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 47890
        mmTop = 3704
        mmWidth = 93398
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 141023
        mmTop = 3704
        mmWidth = 26458
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 168011
        mmTop = 3704
        mmWidth = 26194
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 2910
        mmTop = 3704
        mmWidth = 21167
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 2381
        mmWidth = 191294
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6878
        mmLeft = 2646
        mmTop = 2381
        mmWidth = 1323
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 24077
        mmTop = 2381
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine29: TppLine
        UserName = 'Line301'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 47890
        mmTop = 2381
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine31: TppLine
        UserName = 'Line302'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 141023
        mmTop = 2381
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine33: TppLine
        UserName = 'Line303'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 168011
        mmTop = 2381
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine34: TppLine
        UserName = 'Line304'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 192617
        mmTop = 2381
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 2910
        mmTop = 7673
        mmWidth = 191294
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'id_cliente_vertual'
        DataPipeline = ppPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPipeline2'
        mmHeight = 4763
        mmLeft = 25665
        mmTop = 265
        mmWidth = 20373
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'nom_virtual'
        DataPipeline = ppPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPipeline2'
        mmHeight = 4763
        mmLeft = 50006
        mmTop = 265
        mmWidth = 89694
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'Data_Hora'
        DataPipeline = ppPipeline2
        DisplayFormat = 'DD/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPipeline2'
        mmHeight = 4763
        mmLeft = 142082
        mmTop = 265
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'Preco'
        DataPipeline = ppPipeline2
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPipeline2'
        mmHeight = 4763
        mmLeft = 169863
        mmTop = 265
        mmWidth = 22754
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'ID_Pedido'
        DataPipeline = ppPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPipeline2'
        mmHeight = 4763
        mmLeft = 3704
        mmTop = 265
        mmWidth = 19315
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 2646
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine37: TppLine
        UserName = 'Line305'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 24077
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 47890
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine39: TppLine
        UserName = 'Line39'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 141023
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 168011
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 192617
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine42: TppLine
        UserName = 'Line42'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 2910
        mmTop = 4498
        mmWidth = 191294
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 146579
        mmTop = 794
        mmWidth = 47625
        BandType = 8
        LayerName = Foreground1
      end
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object PP_Info_Total_Pedido: TppLabel
        UserName = 'PP_Info_Total_Pedido'
        AutoSize = False
        Caption = 'PP_Info_Total_Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4868
        mmLeft = 2646
        mmTop = 1588
        mmWidth = 78317
        BandType = 7
        LayerName = Foreground1
      end
      object PP_Info_Total_Preco: TppLabel
        UserName = 'PP_Info_Total_Pedido1'
        AutoSize = False
        Caption = 'PP_Info_Total_Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 115359
        mmTop = 1588
        mmWidth = 79111
        BandType = 7
        LayerName = Foreground1
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object ppPipeline2: TppDBPipeline
    DataSource = Pedido_Source
    UserName = 'Pipeline2'
    Left = 760
    Top = 216
  end
  object TB_Situacao: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Situacao_pedido')
    Left = 232
    Top = 256
    object TB_SituacaoDescri: TWideStringField
      FieldName = 'Descri'
      Size = 255
    end
    object TB_SituacaoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_SituacaoColor: TIntegerField
      FieldName = 'Color'
    end
    object TB_SituacaoBrashColor: TIntegerField
      FieldName = 'BrashColor'
    end
    object TB_SituacaoBaixaEstoque: TBooleanField
      FieldName = 'BaixaEstoque'
    end
  end
  object Situacao_Source: TDataSource
    DataSet = TB_Situacao
    Left = 296
    Top = 256
  end
  object Source_Vendas: TDataSource
    DataSet = TB_Vendas_All
    Left = 304
    Top = 304
  end
  object TB_Funcionarios: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = TB_FuncionariosAfterOpen
    BeforeClose = TB_FuncionariosBeforeClose
    BeforePost = TB_FuncionariosBeforePost
    Parameters = <>
    SQL.Strings = (
      'Select * from Funcionarios'
      '')
    Left = 48
    Top = 152
    object TB_FuncionariosCdigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_FuncionariosNome: TWideStringField
      FieldName = 'Nome'
      Size = 150
    end
    object TB_FuncionariosLogradouro: TWideStringField
      FieldName = 'Logradouro'
      Size = 150
    end
    object TB_FuncionariosNumero: TWideStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'Numero'
      Size = 10
    end
    object TB_FuncionariosComplemento: TWideStringField
      FieldName = 'Complemento'
      Size = 100
    end
    object TB_FuncionariosBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object TB_FuncionariosUF: TWideStringField
      FieldName = 'UF'
      Size = 2
    end
    object TB_FuncionariosCep: TWideStringField
      FieldName = 'Cep'
      Size = 8
    end
    object TB_FuncionariosOBS: TWideStringField
      Tag = 1
      FieldName = 'OBS'
      Size = 255
    end
    object TB_FuncionariosEmail: TWideStringField
      DisplayLabel = 'E-mail'
      FieldName = 'Email'
      Size = 150
    end
    object TB_FuncionariosTel_Res: TWideStringField
      DisplayLabel = 'Tel Residencial'
      FieldName = 'Tel_Res'
      Size = 16
    end
    object TB_FuncionariosTel_Cel: TWideStringField
      DisplayLabel = 'Tel Celular'
      FieldName = 'Tel_Cel'
      Size = 16
    end
    object TB_FuncionariosDDD_Res: TWideStringField
      DisplayLabel = 'DDD Residencial'
      FieldName = 'DDD_Res'
      Size = 2
    end
    object TB_FuncionariosDDD_Cel: TWideStringField
      DisplayLabel = 'DDD Celular'
      FieldName = 'DDD_Cel'
      Size = 2
    end
    object TB_FuncionariosNascimento: TDateTimeField
      FieldName = 'Nascimento'
    end
    object TB_FuncionariosRG: TWideStringField
      FieldName = 'RG'
      Size = 25
    end
    object TB_FuncionariosMuniciopio: TIntegerField
      Tag = 1
      DisplayLabel = 'Munic'#237'pio'
      FieldName = 'Municiopio'
    end
    object TB_FuncionariosLogr_Tipo: TIntegerField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'Logr_Tipo'
    end
    object TB_FuncionariosFotos: TBlobField
      Tag = 1
      FieldName = 'Fotos'
    end
    object TB_FuncionariosSetorVirtual: TStringField
      DisplayLabel = 'Setor'
      FieldKind = fkLookup
      FieldName = 'SetorVirtual'
      LookupDataSet = TB_Setor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Setor'
      Size = 50
      Lookup = True
    end
    object TB_FuncionariosCidadeVirtual: TStringField
      DisplayLabel = 'Munic'#237'pio'
      FieldKind = fkLookup
      FieldName = 'CidadeVirtual'
      LookupDataSet = TBMunicipio
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Cidade'
      KeyFields = 'Municiopio'
      ReadOnly = True
      Lookup = True
    end
    object TB_FuncionariosTb_Logra: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkLookup
      FieldName = 'Tb_Logra'
      LookupDataSet = TBLogra
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Tipo'
      KeyFields = 'Logr_Tipo'
      Size = 30
      Lookup = True
    end
    object TB_FuncionariosAtivo: TBooleanField
      FieldName = 'Ativo'
      DisplayValues = 'Sim;N'#227'o'
    end
    object TB_FuncionariosSetor: TIntegerField
      Tag = 1
      FieldName = 'Setor'
    end
    object TB_FuncionariosPIS: TWideStringField
      FieldName = 'PIS'
      Size = 255
    end
    object TB_FuncionariosCPF: TWideStringField
      FieldName = 'CPF'
      Size = 17
    end
    object TB_FuncionariosPassword: TWideStringField
      Tag = 1
      FieldName = 'Password'
      Size = 255
    end
    object TB_FuncionariosDate_Admissao2: TDateTimeField
      DisplayLabel = 'Admiss'#227'o'
      FieldName = 'Date_Admissao'
    end
    object TB_FuncionariosData_Demissao: TDateTimeField
      DisplayLabel = 'Demiss'#227'o'
      FieldName = 'Data_Demissao'
    end
  end
  object Funcionarios_Source: TDataSource
    DataSet = TB_Funcionarios
    Left = 120
    Top = 152
  end
  object TB_Setor: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Setor')
    Left = 48
    Top = 96
    object TB_SetorCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_SetorDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 255
    end
  end
  object Emprego_Source: TDataSource
    DataSet = TB_Setor
    Left = 120
    Top = 96
  end
  object TB_FormaPagamento: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from tb_forma_pagamento')
    Left = 424
    Top = 144
    object TB_FormaPagamentocodigo: TAutoIncField
      DisplayWidth = 12
      FieldName = 'codigo'
      ReadOnly = True
    end
    object TB_FormaPagamentoForma: TWideStringField
      DisplayWidth = 34
      FieldName = 'Forma'
      Size = 255
    end
  end
  object Forma_Pagamento: TDataSource
    DataSet = TB_FormaPagamento
    Left = 544
    Top = 144
  end
  object TB_Emitente: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From Emitente')
    Left = 544
    Top = 64
    object TB_EmitenteCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_EmitenteConfiName: TWideStringField
      FieldName = 'ConfiName'
      Size = 255
    end
    object TB_EmitenteValor: TWideStringField
      FieldName = 'Valor'
      Size = 255
    end
  end
  object PopEdit: TPopupMenu
    Left = 160
    Top = 8
    object FormatarString1: TMenuItem
      Caption = 'Formatar Texto'
      ShortCut = 16465
      OnClick = FormatarString1Click
    end
  end
  object TB_Fotos: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Fotos')
    Left = 608
    Top = 64
    object TB_FotosCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_FotosValor: TWideStringField
      FieldName = 'Valor'
      Size = 255
    end
    object TB_FotosFoto: TBlobField
      FieldName = 'Foto'
    end
  end
  object ColorDialog: TColorDialog
    Color = 14408667
    CustomColors.Strings = (
      'ColorA=DBDBDB'
      'ColorB=FFFFFFFF'
      'ColorC=FFFFFFFF'
      'ColorD=FFFFFFFF'
      'ColorE=FFFFFFFF'
      'ColorF=FFFFFFFF'
      'ColorG=FFFFFFFF'
      'ColorH=FFFFFFFF'
      'ColorI=DBDBDB'
      'ColorJ=FFFFFFFF'
      'ColorK=FFFFFFFF'
      'ColorL=FFFFFFFF'
      'ColorM=FFFFFFFF'
      'ColorN=FFFFFFFF'
      'ColorO=FFFFFFFF'
      'ColorP=FFFFFFFF')
    Left = 232
    Top = 8
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 304
    Top = 8
  end
  object TB_Carta: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From cartas')
    Left = 127
    Top = 536
    object TB_CartaCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_CartaModulo: TIntegerField
      FieldName = 'Modulo'
    end
    object TB_CartaDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object TB_CartaCarta: TBlobField
      FieldName = 'Carta'
    end
    object TB_CartaFavorito: TBooleanField
      FieldName = 'Favorito'
    end
  end
  object Carta_Source: TDataSource
    DataSet = TB_Carta
    Left = 128
    Top = 488
  end
  object TB_Municipio_new: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Cliente_local')
    Left = 48
    Top = 408
    object TB_Municipio_newCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_Municipio_newUF: TWideStringField
      FieldName = 'UF'
      Size = 2
    end
    object TB_Municipio_newCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 150
    end
    object TB_Municipio_newCEP: TWideStringField
      FieldName = 'CEP'
      Size = 16
    end
  end
  object Municipio_Source_new: TDataSource
    DataSet = TB_Municipio_new
    Left = 136
    Top = 408
  end
  object Rp_funcionarios: TppReport
    AutoStop = False
    DataPipeline = db_funcionarios
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Users\Albino\Desktop\123.rtm'
    Units = utScreenPixels
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'Daniel Fazzioni'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 664
    Top = 280
    Version = '14.04'
    mmColumnWidth = 0
    DataPipelineName = 'db_funcionarios'
    object ppTitleBand3: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 37306
      mmPrintPosition = 0
      object RP_Empresa: TppLabel
        UserName = 'RP_Empresa'
        AutoSize = False
        Caption = 'RP_Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 12965
        mmTop = 2910
        mmWidth = 124619
        BandType = 1
        LayerName = Foreground2
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        mmHeight = 34131
        mmLeft = 139965
        mmTop = 2910
        mmWidth = 42598
        BandType = 1
        LayerName = Foreground2
      end
      object RP_CNPJ: TppLabel
        UserName = 'RP_CNPJ'
        AutoSize = False
        Caption = 'RP_CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 12965
        mmTop = 9260
        mmWidth = 124619
        BandType = 1
        LayerName = Foreground2
      end
      object PP_TipoRelatorio: TppLabel
        UserName = 'PP_TipoRelatorio'
        AutoSize = False
        Caption = 'RP_tipo do relatorio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 12965
        mmTop = 15610
        mmWidth = 124619
        BandType = 1
        LayerName = Foreground2
      end
    end
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 5292
        mmTop = 0
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 24871
        mmTop = 0
        mmWidth = 12171
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 159544
        mmTop = 0
        mmWidth = 23019
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Setor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 111390
        mmTop = 0
        mmWidth = 29104
        BandType = 0
        LayerName = Foreground2
      end
    end
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'Codigo'
        DataPipeline = db_funcionarios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'db_funcionarios'
        mmHeight = 4763
        mmLeft = 5292
        mmTop = 0
        mmWidth = 14817
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'Nome'
        DataPipeline = db_funcionarios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'db_funcionarios'
        mmHeight = 4763
        mmLeft = 24871
        mmTop = 0
        mmWidth = 76200
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'SetorVirtual'
        DataPipeline = db_funcionarios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'db_funcionarios'
        mmHeight = 4763
        mmLeft = 111390
        mmTop = 0
        mmWidth = 39688
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'Nascimento'
        DataPipeline = db_funcionarios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'db_funcionarios'
        mmHeight = 4763
        mmLeft = 159544
        mmTop = 0
        mmWidth = 23019
        BandType = 4
        LayerName = Foreground2
      end
    end
    object ppFooterBand3: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
    end
    object ppDesignLayers3: TppDesignLayers
      object ppDesignLayer3: TppDesignLayer
        UserName = 'Foreground2'
        LayerType = ltBanded
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object db_funcionarios: TppDBPipeline
    DataSource = Funcionarios_Source
    UserName = 'db_funcionarios'
    Left = 760
    Top = 280
  end
  object Rp_Dav: TppReport
    AutoStop = False
    DataPipeline = RP_Dav_DB
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'HP LaserJet Professional P 1102w'
    PrinterSetup.SaveDeviceSettings = True
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    PrinterSetup.DevMode = {00000000}
    Units = utScreenPixels
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'PDF'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 672
    Top = 32
    Version = '14.04'
    mmColumnWidth = 0
    DataPipelineName = 'RP_Dav_DB'
    object ppTitleBand4: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 89959
      mmPrintPosition = 0
      object PP_Dav_Emit_Razao: TppLabel
        UserName = 'PP_Dav_Emit_Razao'
        Caption = 'PP_Dav_Emit_Razao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 7673
        mmWidth = 31750
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Emit_CNPJ: TppLabel
        UserName = 'PP_Dav_Emit_CNPJ'
        Caption = 'PP_Dav_Emit_CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 12171
        mmWidth = 30692
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Emit_Local: TppLabel
        UserName = 'PP_Dav_Emit_Local'
        Caption = 'PP_Dav_Emit_Local'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 16140
        mmWidth = 30692
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Emit_Cep: TppLabel
        UserName = 'PP_Dav_Emit_Cep'
        Caption = 'PP_Dav_Emit_Cep'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 19844
        mmWidth = 28310
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Emit_Contato: TppLabel
        UserName = 'PP_Dav_Emit_Contato'
        Caption = 'PP_Dav_Emit_Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 23813
        mmWidth = 34396
        BandType = 1
        LayerName = Foreground3
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 6350
        mmTop = 6350
        mmWidth = 184944
        BandType = 1
        LayerName = Foreground3
      end
      object ppLine43: TppLine
        UserName = 'Line43'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 78581
        mmLeft = 6085
        mmTop = 6615
        mmWidth = 1058
        BandType = 1
        LayerName = Foreground3
      end
      object ppLine44: TppLine
        UserName = 'Line44'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 6350
        mmTop = 28840
        mmWidth = 184944
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Title: TppLabel
        UserName = 'PP_Dav_Title'
        AutoSize = False
        Caption = 'DOCUMENTO AUXILIAR DE VENDA - PEDIDO DE VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 7673
        mmTop = 32279
        mmWidth = 182034
        BandType = 1
        LayerName = Foreground3
      end
      object ppLine45: TppLine
        UserName = 'Line45'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 78581
        mmLeft = 190236
        mmTop = 6615
        mmWidth = 1058
        BandType = 1
        LayerName = Foreground3
      end
      object ppLine46: TppLine
        UserName = 'Line46'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 6350
        mmTop = 42069
        mmWidth = 184944
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_NDoc: TppLabel
        UserName = 'PP_Dav_NDoc'
        Caption = 'N. do Documento Fiscal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 44186
        mmWidth = 37306
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Vendedor_Title: TppLabel
        UserName = 'PP_Dav_Vendedor_Title'
        Caption = 'Vendedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 48948
        mmWidth = 15610
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Vali_title: TppLabel
        UserName = 'PP_Dav_Vali_title'
        Caption = 'Validade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 53446
        mmWidth = 14023
        BandType = 1
        LayerName = Foreground3
      end
      object ppLine47: TppLine
        UserName = 'Line47'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 6350
        mmTop = 57944
        mmWidth = 184944
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Dav_Title: TppLabel
        UserName = 'PP_Dav_Dav_Title'
        Caption = 'DAV:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 44186
        mmWidth = 7144
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Date_Title: TppLabel
        UserName = 'PP_Dav_Date_Title'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 53446
        mmWidth = 7938
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Hora_Title: TppLabel
        UserName = 'PP_Dav_Hora_Title'
        Caption = 'Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 161396
        mmTop = 53446
        mmWidth = 8202
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_NDav: TppLabel
        UserName = 'PP_Dav_NDav'
        AutoSize = False
        Caption = '0000000001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 156369
        mmTop = 44186
        mmWidth = 33338
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Vendedor: TppLabel
        UserName = 'PP_Dav_Vendedor'
        AutoSize = False
        Caption = 'PP_Dav_Vendedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24077
        mmTop = 48948
        mmWidth = 104511
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Date_Validade: TppLabel
        UserName = 'PP_Dav_Date_Validade'
        AutoSize = False
        Caption = 'PP_Dav_Date_Validade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 22490
        mmTop = 53446
        mmWidth = 106098
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Data: TppLabel
        UserName = 'PP_Dav_Data'
        Caption = '10/10/2014'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 139700
        mmTop = 53446
        mmWidth = 17198
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Time: TppLabel
        UserName = 'PP_Dav_Time'
        Caption = '00:00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 53446
        mmWidth = 18785
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Solici_Title: TppLabel
        UserName = 'PP_Dav_Solici_Title'
        Caption = 'Identifica'#231#227'o do Solicitante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 59531
        mmWidth = 41275
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_Nome_Title: TppLabel
        UserName = 'PP_Dav_Soli_Nome_Title'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 63765
        mmWidth = 9790
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_Fantasia_Title: TppLabel
        UserName = 'PP_Dav_Soli_Fantasia_Title'
        Caption = 'Solicitante:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 7673
        mmTop = 67998
        mmWidth = 17145
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_Endereco_Title: TppLabel
        UserName = 'PP_Dav_Soli_Endereco_Title'
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 72231
        mmWidth = 15610
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Soli_Cep_TItle: TppLabel
        UserName = 'PP_Soli_Cep_TItle'
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 76465
        mmWidth = 7408
        BandType = 1
        LayerName = Foreground3
      end
      object ppLine48: TppLine
        UserName = 'Line48'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 6350
        mmTop = 84931
        mmWidth = 184944
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_CPF_Title: TppLabel
        UserName = 'PP_Dav_Soli_CPF_Title'
        Caption = 'CPF/CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 59531
        mmWidth = 16669
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_RG_Title: TppLabel
        UserName = 'PP_Dav_Soli_RG_Title'
        Caption = 'RG/IE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 63765
        mmWidth = 9525
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_IM_Title: TppLabel
        UserName = 'PP_Dav_Soli_IM_Title'
        Caption = 'IM:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 67998
        mmWidth = 4498
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Soli_CIDUF_Title: TppLabel
        UserName = 'PP_Soli_CIDUF_Title'
        Caption = 'Cidade-UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 72761
        mmTop = 76465
        mmWidth = 16933
        BandType = 1
        LayerName = Foreground3
      end
      object PP_DAV_Soli_TelCom_Title: TppLabel
        UserName = 'PP_DAV_Soli_TelCom_Title'
        Caption = 'Telefone Com.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 80698
        mmWidth = 22754
        BandType = 1
        LayerName = Foreground3
      end
      object PP_DAv_TelCel_Title: TppLabel
        UserName = 'PP_DAv_TelCel_Title'
        Caption = 'Celular:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 72761
        mmTop = 80698
        mmWidth = 11906
        BandType = 1
        LayerName = Foreground3
      end
      object PP_DAV_Soli_Nome: TppLabel
        UserName = 'PP_DAV_Soli_Nome'
        AutoSize = False
        Caption = 'PP_DAV_Soli_Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18521
        mmTop = 63765
        mmWidth = 110067
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_Fanta: TppLabel
        UserName = 'PP_DAV_Soli_Nome1'
        AutoSize = False
        Caption = 'PP_DAV_Soli_Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 26194
        mmTop = 67998
        mmWidth = 102394
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_Endereco: TppLabel
        UserName = 'PP_Dav_Soli_Endereco'
        AutoSize = False
        Caption = 'PP_DAV_Soli_Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 72231
        mmWidth = 103981
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_Cep: TppLabel
        UserName = 'PP_Dav_Soli_Cep'
        Caption = '89700-000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 16404
        mmTop = 76465
        mmWidth = 25665
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_TelCom: TppLabel
        UserName = 'PP_Dav_Soli_TelCom'
        AutoSize = False
        Caption = '89700-000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 32808
        mmTop = 80698
        mmWidth = 33338
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_Cel: TppLabel
        UserName = 'PP_Dav_Soli_Cel'
        AutoSize = False
        Caption = '89700-000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 85990
        mmTop = 80698
        mmWidth = 42598
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_Cid: TppLabel
        UserName = 'PP_Dav_Soli_Cel1'
        AutoSize = False
        Caption = '89700-000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 91546
        mmTop = 76465
        mmWidth = 99748
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_Bairro_Title: TppLabel
        UserName = 'PP_Dav_Soli_Bairro_Title'
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 72231
        mmWidth = 10319
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_Bairro: TppLabel
        UserName = 'PP_Dav_Soli_Bairro'
        AutoSize = False
        Caption = 'PP_DAV_Soli_Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 141288
        mmTop = 72231
        mmWidth = 50006
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_CNPJ: TppLabel
        UserName = 'PP_Dav_Soli_CNPJ'
        AutoSize = False
        Caption = '89700-000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 59531
        mmWidth = 43392
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_IE: TppLabel
        UserName = 'PP_Dav_Soli_CNPJ1'
        AutoSize = False
        Caption = '89700-000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 63765
        mmWidth = 50536
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Soli_IM: TppLabel
        UserName = 'PP_Dav_Soli_CNPJ2'
        AutoSize = False
        Caption = '89700-000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 135996
        mmTop = 67998
        mmWidth = 55298
        BandType = 1
        LayerName = Foreground3
      end
      object PP_Dav_Relacao: TppLabel
        UserName = 'PP_Dav_Relacao'
        Caption = 'Rela'#231#227'o de Produtos/Servi'#231'os'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 86254
        mmWidth = 45773
        BandType = 1
        LayerName = Foreground3
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        AutoSize = False
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 161396
        mmTop = 24077
        mmWidth = 28310
        BandType = 1
        LayerName = Foreground3
      end
    end
    object ppHeaderBand4: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 22490
        mmTop = 0
        mmWidth = 45773
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Qtd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 132027
        mmTop = 0
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 151607
        mmTop = 0
        mmWidth = 11906
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 165365
        mmTop = 0
        mmWidth = 16933
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Unid.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 139700
        mmTop = 0
        mmWidth = 6085
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 9260
        mmTop = 0
        mmWidth = 9790
        BandType = 0
        LayerName = Foreground3
      end
    end
    object ppDetailBand4: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'Descri'
        DataPipeline = RP_Dav_DB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'RP_Dav_DB'
        mmHeight = 2910
        mmLeft = 22490
        mmTop = 0
        mmWidth = 101600
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'Qtd'
        DataPipeline = RP_Dav_DB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'RP_Dav_DB'
        mmHeight = 2910
        mmLeft = 125148
        mmTop = 0
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'Valor_un'
        DataPipeline = RP_Dav_DB
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'RP_Dav_DB'
        mmHeight = 2910
        mmLeft = 151607
        mmTop = 0
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'Valor_Total'
        DataPipeline = RP_Dav_DB
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'RP_Dav_DB'
        mmHeight = 2879
        mmLeft = 165365
        mmTop = 0
        mmWidth = 16933
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'UNMerca'
        DataPipeline = RP_Dav_DB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'RP_Dav_DB'
        mmHeight = 2910
        mmLeft = 139700
        mmTop = 0
        mmWidth = 8202
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'ID_mercadoria'
        DataPipeline = RP_Dav_DB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'RP_Dav_DB'
        mmHeight = 2910
        mmLeft = 7673
        mmTop = 0
        mmWidth = 12435
        BandType = 4
        LayerName = Foreground3
      end
    end
    object ppFooterBand4: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 166423
        mmTop = 6615
        mmWidth = 24871
        BandType = 8
        LayerName = Foreground3
      end
      object PP_Dav_VEDADO: TppLabel
        UserName = 'PP_Dav_VEDADO'
        AutoSize = False
        Caption = #201' VEDADA A AUTENTICA'#199#195'O DESTE DOCUMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5419
        mmLeft = 7673
        mmTop = 1058
        mmWidth = 183621
        BandType = 8
        LayerName = Foreground3
      end
      object PP_Dav_NDav_2: TppLabel
        UserName = 'PP_Dav_NDav_2'
        Caption = 'PP_Dav_NDav_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 7673
        mmTop = 6615
        mmWidth = 22490
        BandType = 8
        LayerName = Foreground3
      end
    end
    object ppSummaryBand3: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object ppLine49: TppLine
        UserName = 'Line49'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 6350
        mmTop = 265
        mmWidth = 184944
        BandType = 7
        LayerName = Foreground3
      end
      object ppLine50: TppLine
        UserName = 'Line50'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 6085
        mmTop = 265
        mmWidth = 1058
        BandType = 7
        LayerName = Foreground3
      end
      object ppLine51: TppLine
        UserName = 'Line51'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 6350
        mmTop = 11642
        mmWidth = 184944
        BandType = 7
        LayerName = Foreground3
      end
      object ppLine52: TppLine
        UserName = 'Line501'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 190236
        mmTop = 265
        mmWidth = 1058
        BandType = 7
        LayerName = Foreground3
      end
      object PP_Dav_SubTotal: TppLabel
        UserName = 'PP_Dav_SubTotal'
        AutoSize = False
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144992
        mmTop = 529
        mmWidth = 37306
        BandType = 7
        LayerName = Foreground3
      end
      object PP_Dav_Deconto: TppLabel
        UserName = 'PP_Dav_Deconto'
        AutoSize = False
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144992
        mmTop = 4498
        mmWidth = 37306
        BandType = 7
        LayerName = Foreground3
      end
      object PP_Dav_Total: TppLabel
        UserName = 'PP_Dav_Total'
        AutoSize = False
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144992
        mmTop = 8467
        mmWidth = 37306
        BandType = 7
        LayerName = Foreground3
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'SubTotal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 127265
        mmTop = 529
        mmWidth = 15875
        BandType = 7
        LayerName = Foreground3
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'Desconto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 127265
        mmTop = 4498
        mmWidth = 15875
        BandType = 7
        LayerName = Foreground3
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 127265
        mmTop = 8467
        mmWidth = 15875
        BandType = 7
        LayerName = Foreground3
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Pagamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 7673
        mmWidth = 18256
        BandType = 7
        LayerName = Foreground3
      end
      object PP_Dav_Pagamento_Desc: TppLabel
        UserName = 'PP_Dav_Pagamento_Desc'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 26723
        mmTop = 7673
        mmWidth = 97367
        BandType = 7
        LayerName = Foreground3
      end
    end
    object ppDesignLayers4: TppDesignLayers
      object ppDesignLayer4: TppDesignLayer
        UserName = 'Foreground3'
        LayerType = ltBanded
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
  object RP_Dav_DB: TppDBPipeline
    DataSource = Source_Vendas
    UserName = 'RP_Dav_DB'
    Left = 744
    Top = 32
  end
  object TBEstoque_Quant: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from estoque_quanti')
    Left = 232
    Top = 152
    object TBEstoque_QuantID_Merca: TIntegerField
      FieldName = 'ID_Merca'
    end
    object TBEstoque_QuantLastDate: TDateTimeField
      FieldName = 'LastDate'
    end
    object TBEstoque_QuantQuant: TBCDField
      FieldName = 'Quant'
      Precision = 19
    end
    object TBEstoque_QuantCompraDate: TDateTimeField
      FieldName = 'CompraDate'
    end
  end
  object ExecSQLTB: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 472
    Top = 64
  end
  object TB_Parcelamento: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = TB_ParcelamentoAfterOpen
    BeforeClose = TB_ParcelamentoBeforeClose
    Parameters = <>
    SQL.Strings = (
      'Select * from tb_parcelamento')
    Left = 424
    Top = 200
    object TB_ParcelamentoCodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_ParcelamentoDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 50
      FieldName = 'Descricao'
      Size = 255
    end
    object TB_ParcelamentoIntervaloDias: TIntegerField
      DisplayLabel = 'Intervalo'
      DisplayWidth = 15
      FieldName = 'IntervaloDias'
    end
    object TB_Parcelamentoentrada: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'Entrada'
      DisplayWidth = 10
      FieldName = 'entrada'
      DisplayValues = 'Sim;N'#227'o'
    end
    object TB_ParcelamentoParcelas: TIntegerField
      FieldName = 'Parcelas'
    end
    object TB_Parcelamentoativo: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      FieldName = 'ativo'
      DisplayValues = 'Sim;N'#227'o'
    end
    object TB_ParcelamentoFormaPagamento: TIntegerField
      Tag = 1
      DisplayLabel = 'Fatura'
      FieldName = 'FormaPagamento'
    end
    object TB_ParcelamentoFormaPagamentoVirtual: TStringField
      DisplayLabel = 'Fatura'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'FormaPagamentoVirtual'
      LookupDataSet = TB_FormaPagamento
      LookupKeyFields = 'codigo'
      LookupResultField = 'Forma'
      KeyFields = 'FormaPagamento'
      Size = 254
      Lookup = True
    end
  end
  object Parcelamento_Source: TDataSource
    DataSet = TB_Parcelamento
    Left = 544
    Top = 192
  end
  object TB_Contas: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = TB_ContasAfterOpen
    BeforeClose = TB_ContasBeforeClose
    Parameters = <>
    SQL.Strings = (
      'Select  A.*, B.nome_razao, B.cpf from tb_contas A '
      'left join Cliente_cadastro B '
      'on A.id_cliente = b.codigo')
    Left = 232
    Top = 456
    object TB_ContasCodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_ContasNPedido: TIntegerField
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'NPedido'
    end
    object TB_ContasDataCreate: TDateTimeField
      DisplayLabel = 'Criado em'
      FieldName = 'DataCreate'
    end
    object TB_ContasDataVencimento: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'DataVencimento'
    end
    object TB_ContasValor: TBCDField
      FieldName = 'Valor'
      Precision = 19
    end
    object TB_ContasPortador: TIntegerField
      Tag = 1
      FieldName = 'Portador'
    end
    object TB_ContasPagada: TBooleanField
      DisplayLabel = 'Recebida'
      FieldName = 'Pagada'
      DisplayValues = 'Sim;N'#227'o'
    end
    object TB_ContasDataPagada: TDateTimeField
      DisplayLabel = 'Data Pagamento'
      FieldName = 'DataPagada'
    end
    object TB_ContasFuncRecebe: TIntegerField
      Tag = 1
      DisplayLabel = 'Func. Recebeu'
      FieldName = 'FuncRecebe'
    end
    object TB_ContasDuplicata: TIntegerField
      FieldName = 'Duplicata'
    end
    object TB_ContasDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 50
      FieldName = 'Descricao'
      Size = 255
    end
    object TB_ContasID_Cliente: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'ID_Cliente'
    end
    object TB_ContasPortadorVirtual: TStringField
      DisplayLabel = 'Portador'
      FieldKind = fkLookup
      FieldName = 'PortadorVirtual'
      LookupDataSet = TB_Portador
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Portador'
      Size = 255
      Lookup = True
    end
    object TB_ContasFuncVirtual: TStringField
      DisplayLabel = 'Func. Recebeu'
      FieldKind = fkLookup
      FieldName = 'FuncVirtual'
      LookupDataSet = TB_ContasFuncAux
      LookupKeyFields = 'codigo'
      LookupResultField = 'nome'
      KeyFields = 'funcrecebe'
      Size = 255
      Lookup = True
    end
  end
  object Contas_source: TDataSource
    DataSet = TB_Contas
    Left = 320
    Top = 456
  end
  object TB_ClientesInfo: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from clientes_compra')
    Left = 48
    Top = 256
    object TB_ClientesInfoID_Cliente: TIntegerField
      FieldName = 'ID_Cliente'
    end
    object TB_ClientesInfoApagar: TBCDField
      FieldName = 'Apagar'
      Precision = 19
    end
    object TB_ClientesInfoPago: TBCDField
      FieldName = 'Pago'
      Precision = 19
    end
    object TB_ClientesInfoUltimaCompra: TDateTimeField
      FieldName = 'UltimaCompra'
    end
  end
  object TB_Portador: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from tb_portador')
    Left = 424
    Top = 312
    object TB_PortadorCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_PortadorDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 255
    end
  end
  object Portador_Source: TDataSource
    DataSet = TB_Portador
    Left = 528
    Top = 328
  end
  object TB_Config: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from tb_configsis')
    Left = 472
    Top = 8
    object TB_ConfigCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object TB_ConfigValor: TWideStringField
      FieldName = 'Valor'
      Size = 255
    end
  end
  object TBParcelamentoVirtual: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = Portador_Source
    Parameters = <>
    SQL.Strings = (
      'Select * from tb_parcelamento')
    Left = 424
    Top = 376
    object TBParcelamentoVirtualCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TBParcelamentoVirtualDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object TBParcelamentoVirtualIntervaloDias: TIntegerField
      FieldName = 'IntervaloDias'
    end
    object TBParcelamentoVirtualentrada: TBooleanField
      FieldName = 'entrada'
    end
    object TBParcelamentoVirtualParcelas: TIntegerField
      FieldName = 'Parcelas'
    end
    object TBParcelamentoVirtualativo: TBooleanField
      FieldName = 'ativo'
    end
    object TBParcelamentoVirtualFormaPagamento: TIntegerField
      FieldName = 'FormaPagamento'
    end
  end
  object TB_Pedido_Histo: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = TB_PedidoAfterOpen
    BeforeClose = TB_PedidoBeforeClose
    Parameters = <>
    SQL.Strings = (
      
        'Select  A.*, B.nome_razao, B.nome, B.UF, B.Municiopio, B.cpf fro' +
        'm'
      'Venda_info A inner join Cliente_cadastro B on'
      'A.id_cliente = b.codigo')
    Left = 720
    Top = 400
    object AutoIncField1: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'ID_Pedido'
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'ID Cliente'
      DisplayWidth = 12
      FieldName = 'ID_cliente'
    end
    object WideStringField1: TWideStringField
      DisplayLabel = 'Comprador'
      DisplayWidth = 30
      FieldName = 'Comprador_Nome'
      Size = 255
    end
    object DateTimeField1: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 14
      FieldName = 'Data_Hora'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object IntegerField2: TIntegerField
      Tag = 1
      DisplayWidth = 11
      FieldName = 'Total_Reg'
    end
    object BCDField1: TBCDField
      DisplayLabel = 'Pre'#231'o'
      DisplayWidth = 16
      FieldName = 'Preco'
      currency = True
      Precision = 19
    end
    object BCDField2: TBCDField
      DisplayWidth = 10
      FieldName = 'Desconto'
      Precision = 19
    end
    object IntegerField3: TIntegerField
      Tag = 1
      DisplayLabel = 'Situa'#231#227'o'
      DisplayWidth = 12
      FieldName = 'situacao'
      Visible = False
    end
    object MemoField1: TMemoField
      DisplayWidth = 12
      FieldName = 'Descri'
      BlobType = ftMemo
    end
    object IntegerField4: TIntegerField
      Tag = 1
      FieldKind = fkLookup
      FieldName = 'Color'
      LookupDataSet = TB_Situacao
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Color'
      KeyFields = 'situacao'
      Lookup = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'Situacao_Virtual'
      LookupDataSet = TB_Situacao
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descri'
      KeyFields = 'situacao'
      Lookup = True
    end
    object WideStringField2: TWideStringField
      DisplayLabel = 'Nome Empresarial'
      FieldName = 'nome_razao'
      Size = 150
    end
    object WideStringField3: TWideStringField
      DisplayLabel = 'CNPJ / CPF'
      FieldName = 'cpf'
      Size = 14
    end
    object IntegerField5: TIntegerField
      FieldName = 'Fatura'
      OnValidate = TB_PedidoFaturaValidate
    end
    object IntegerField6: TIntegerField
      FieldName = 'Parcelamento'
    end
    object StringField2: TStringField
      FieldKind = fkLookup
      FieldName = 'FaturaVirtual'
      LookupDataSet = TB_FormaPagamento
      LookupKeyFields = 'codigo'
      LookupResultField = 'Forma'
      KeyFields = 'Fatura'
      Size = 255
      Lookup = True
    end
    object StringField3: TStringField
      FieldKind = fkLookup
      FieldName = 'ParcelamentoVirtual'
      LookupDataSet = TBParcelamentoVirtual
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Parcelamento'
      Size = 255
      Lookup = True
    end
    object IntegerField7: TIntegerField
      FieldKind = fkLookup
      FieldName = 'ColorBrush'
      LookupDataSet = TB_Situacao
      LookupKeyFields = 'Codigo'
      LookupResultField = 'BrashColor'
      KeyFields = 'situacao'
      Visible = False
      Lookup = True
    end
    object TB_Pedido_Histonome: TWideStringField
      FieldName = 'nome'
      Size = 150
    end
    object TB_Pedido_HistoUF: TWideStringField
      FieldName = 'UF'
      Size = 2
    end
    object TB_Pedido_HistoMuniciopio: TIntegerField
      FieldName = 'Municiopio'
    end
  end
  object TB_Contas_Histo: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from tb_contas')
    Left = 816
    Top = 400
    object AutoIncField2: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object IntegerField8: TIntegerField
      FieldName = 'NPedido'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DataCreate'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DataVencimento'
    end
    object BCDField3: TBCDField
      FieldName = 'Valor'
      Precision = 19
    end
    object IntegerField9: TIntegerField
      FieldName = 'Portador'
    end
    object BooleanField1: TBooleanField
      FieldName = 'Pagada'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DataPagada'
    end
    object IntegerField10: TIntegerField
      FieldName = 'FuncRecebe'
    end
    object IntegerField11: TIntegerField
      FieldName = 'Duplicata'
    end
    object WideStringField4: TWideStringField
      DisplayWidth = 50
      FieldName = 'Descricao'
      Size = 255
    end
    object IntegerField12: TIntegerField
      FieldName = 'ID_Cliente'
    end
  end
  object TB_Carta_Favorito: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From carta_favorito')
    Left = 47
    Top = 536
    object TB_Carta_FavoritoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object TB_Carta_FavoritoHotKey: TIntegerField
      FieldName = 'HotKey'
    end
    object TB_Carta_FavoritoDescricao: TStringField
      FieldKind = fkLookup
      FieldName = 'Descricao'
      LookupDataSet = TB_Carta
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Codigo'
      Size = 255
      Lookup = True
    end
    object TB_Carta_FavoritoFavorito: TBooleanField
      FieldKind = fkLookup
      FieldName = 'Favorito'
      LookupDataSet = TB_Carta
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Favorito'
      KeyFields = 'Codigo'
      Lookup = True
    end
  end
  object TB_Agenda: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = TB_AgendaAfterOpen
    BeforeClose = TB_AgendaBeforeClose
    Parameters = <>
    SQL.Strings = (
      
        'Select A.*, B.nome_razao, B.nome, B.UF, B.Municiopio, B.cpf from' +
        ' tb_Agenda A'
      'left join Cliente_cadastro B on'
      'A.id_cliente = b.codigo')
    Left = 536
    Top = 416
    object TB_AgendaCodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_AgendaData_Criado: TDateTimeField
      DisplayLabel = 'Criado'
      DisplayWidth = 22
      FieldName = 'Data_Criado'
    end
    object TB_AgendaData: TDateTimeField
      DisplayWidth = 22
      FieldName = 'Data'
    end
    object TB_AgendaConteudo: TWideStringField
      Tag = 1
      DisplayLabel = 'Conte'#250'do'
      DisplayWidth = 36
      FieldName = 'Conteudo'
      Size = 255
    end
    object TB_AgendaAssunto: TWideStringField
      DisplayWidth = 29
      FieldName = 'Assunto'
      Size = 255
    end
    object TB_AgendaEfetuado: TBooleanField
      DisplayWidth = 9
      FieldName = 'Efetuado'
      DisplayValues = 'Sim;N'#227'o'
    end
    object TB_AgendaID_Cliente: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      DisplayWidth = 12
      FieldName = 'ID_Cliente'
    end
    object TB_Agendanome_razao: TWideStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 15
      FieldName = 'nome_razao'
      Size = 150
    end
    object TB_AgendaUF: TWideStringField
      DisplayWidth = 3
      FieldName = 'UF'
      Size = 2
    end
    object TB_Agendanome: TWideStringField
      DisplayLabel = 'Cliente Contato'
      DisplayWidth = 180
      FieldName = 'nome'
      Size = 150
    end
    object TB_Agendacpf: TWideStringField
      DisplayLabel = 'CPF / CNPJ'
      DisplayWidth = 22
      FieldName = 'cpf'
      Size = 18
    end
    object TB_AgendaTipo_Virtual: TWideStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 17
      FieldKind = fkLookup
      FieldName = 'Tipo_Virtual'
      LookupDataSet = TB_Agenda_Tipo
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'AgTipo'
      Size = 255
      Lookup = True
    end
    object TB_AgendaForma_Virtual: TWideStringField
      DisplayLabel = 'Contato'
      DisplayWidth = 32
      FieldKind = fkLookup
      FieldName = 'Forma_Virtual'
      LookupDataSet = TB_Agenda_Contato
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Contato_Forma'
      Size = 255
      Lookup = True
    end
    object TB_AgendaTipo: TIntegerField
      Tag = 1
      DisplayLabel = 'Tipo'
      DisplayWidth = 12
      FieldName = 'AgTipo'
    end
    object TB_AgendaContato_Forma: TIntegerField
      Tag = 1
      DisplayLabel = 'Contato'
      DisplayWidth = 12
      FieldName = 'Contato_Forma'
    end
    object TB_AgendaMuniciopio: TIntegerField
      Tag = 1
      DisplayLabel = 'Munic'#237'pio'
      DisplayWidth = 15
      FieldName = 'Municiopio'
    end
    object TB_AgendaMunicipio_Virtual: TWideStringField
      DisplayLabel = 'Munic'#237'pio'
      FieldKind = fkLookup
      FieldName = 'Municipio_Virtual'
      LookupDataSet = TBMunicipio
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Cidade'
      KeyFields = 'Municiopio'
      Size = 255
      Lookup = True
    end
  end
  object TB_Agenda_Tipo: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from tb_Agenda_Tipo')
    Left = 536
    Top = 464
    object TB_Agenda_TipoCodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_Agenda_TipoDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 255
    end
    object TB_Agenda_TipoGregaAgenda: TBooleanField
      FieldName = 'GregaAgenda'
    end
  end
  object Agenda_Tipo: TDataSource
    DataSet = TB_Agenda_Tipo
    Left = 616
    Top = 464
  end
  object Agenda_Contato: TDataSource
    DataSet = TB_Agenda_Contato
    Left = 616
    Top = 512
  end
  object TB_Agenda_Contato: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from tb_Agenda_Contato')
    Left = 536
    Top = 512
    object TB_Agenda_ContatoCodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_Agenda_ContatoDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 255
    end
  end
  object TB_Parcelamento_Lista: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from tb_parcelamento')
    Left = 424
    Top = 248
    object TB_Parcelamento_ListaCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_Parcelamento_ListaDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object TB_Parcelamento_ListaIntervaloDias: TIntegerField
      FieldName = 'IntervaloDias'
    end
    object TB_Parcelamento_Listaentrada: TBooleanField
      FieldName = 'entrada'
    end
    object TB_Parcelamento_ListaParcelas: TIntegerField
      FieldName = 'Parcelas'
    end
    object TB_Parcelamento_Listaativo: TBooleanField
      FieldName = 'ativo'
    end
    object TB_Parcelamento_ListaFormaPagamento: TIntegerField
      FieldName = 'FormaPagamento'
    end
  end
  object Parcelamento_lista_source: TDataSource
    DataSet = TB_Parcelamento_Lista
    Left = 552
    Top = 248
  end
  object TB_ContasFuncAux: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select nome, codigo from funcionarios')
    Left = 232
    Top = 504
    object TB_ContasFuncAuxnome: TWideStringField
      FieldName = 'nome'
      Size = 150
    end
    object TB_ContasFuncAuxcodigo: TAutoIncField
      FieldName = 'codigo'
      ReadOnly = True
    end
  end
end
