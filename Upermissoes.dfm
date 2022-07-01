object FPermissoes: TFPermissoes
  Left = 439
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Permiss'#245'es'
  ClientHeight = 449
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 93
    Height = 13
    Caption = 'Selecione o usu'#225'rio'
  end
  object Bevel2: TBevel
    Left = 14
    Top = 168
    Width = 440
    Height = 241
  end
  object EditFunc: TDBLookupComboBox
    Left = 16
    Top = 24
    Width = 377
    Height = 24
    DropDownRows = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'codigo'
    ListField = 'Nome'
    ListSource = DataSource1
    ParentFont = False
    TabOrder = 0
    OnClick = EditFuncClick
    OnKeyPress = EditFuncKeyPress
    OnMouseDown = EditFuncMouseDown
  end
  object Button1: TButton
    Left = 16
    Top = 64
    Width = 105
    Height = 25
    Caption = 'Adicionar Senha'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 64
    Width = 113
    Height = 25
    Caption = 'Remover acesso'
    TabOrder = 2
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 14
    Top = 106
    Width = 441
    Height = 57
    Caption = 'Permiss'#245'es'
    Columns = 3
    Items.Strings = (
      'Clientes'
      'Estoque'
      'Funcion'#225'rios'
      'Contas'
      'Pedidos'
      'Agenda')
    TabOrder = 3
    OnClick = RadioGroup1Click
  end
  object ListOut: TCheckListBox
    Left = 592
    Top = 112
    Width = 225
    Height = 81
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 16
    Items.Strings = (
      'Acesso ao m'#243'dulo'
      'Altera'#231#245'es Tipo'
      'Altera'#231#245'es Contato'
      'Editar'
      'Excluir'
      'Novo'
      'Relat'#243'rio')
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object ListCont: TCheckListBox
    Left = 600
    Top = 112
    Width = 225
    Height = 153
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 16
    Items.Strings = (
      'Acesso ao m'#243'dulo'
      'Novo'
      'Editar'
      'Excluir'
      'Hist'#243'rico de Contas'
      'Altera'#231#245'es Portador'
      'Altera'#231#245'es Faturas'
      'Altera'#231#245'es Parcelamentos'
      'Receber conta')
    ParentFont = False
    TabOrder = 5
    Visible = False
  end
  object ListFunc: TCheckListBox
    Left = 600
    Top = 112
    Width = 225
    Height = 137
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 16
    Items.Strings = (
      'Acesso ao m'#243'dulo'
      'Novo'
      'Editar'
      'Excluir'
      'Altera'#231#245'es Permiss'#245'es'
      'Visualizar Auditoria'
      'Altera'#231#245'es Setor'
      'Altera'#231#245'es Emitente'
      'Mala Direta'
      'Config. Global '
      'Config Backup')
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object ListEst: TCheckListBox
    Left = 608
    Top = 112
    Width = 217
    Height = 137
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 16
    Items.Strings = (
      'Acesso ao m'#243'dulo'
      'Novo'
      'Editar'
      'Excluir'
      'Altera'#231#245'es Un de Medidas')
    ParentFont = False
    TabOrder = 7
    Visible = False
  end
  object ListClie: TCheckListBox
    Left = 32
    Top = 192
    Width = 353
    Height = 193
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 16
    Items.Strings = (
      'Acesso ao m'#243'dulo'
      'Altera'#231#245'es Logradouro'
      'Editar'
      'Excluir'
      'Mala Direta'
      'Novo'
      'Relat'#243'rio'
      'Visualizar Hist'#243'rico')
    ParentFont = False
    TabOrder = 8
    Visible = False
    OnKeyDown = ListClieKeyDown
  end
  object BitBtn1: TBitBtn
    Left = 319
    Top = 410
    Width = 136
    Height = 30
    Cursor = crHandPoint
    Caption = 'Salvar Permiss'#245'es'
    TabOrder = 9
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0DED081A4824E80503E743F39703A3970
      3A3F743F4E805080A381CEDCCEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3E0D45B885C356D36467D47447E45
      3674382D6C2E2D6A2E366F37447745467947356D3659885AD1DED2FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9AB69A316A324C854E30
      78330D5F10005404005102005003004D03004A010048020C500E3069314C7E4D
      316A3297B497FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84A884376F
      394487470A640E005A03055C09065A0A065809065609065409065208064F0805
      4C07004701094E0B43774439703A80A580FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      9DB99D376F393C884100620405620907610B065F0B045B0802580606580A0656
      09065409065208064F08064D08044B060047013A713C396F3A99B799FFFFFFFF
      FFFFFFFFFFD9E4D92D662E458D4800670506670B07660B07640B045E0709610D
      14661800550206590A065609065409065208064F08064D08064C080046014377
      442E692FD5E1D5FFFFFFFFFFFF5B8A5C4C8A4F0B7311056B0A076A0C07680C03
      6307035E04A2C4A4D4E3D41F6B2100530006590A065609065409065208064F08
      064D08044B06094E0B4C7E4D578659FFFFFFD6E2D6326D34328B37006D05076E
      0D076C0C0367070263059CC29DFFFFFFFFFFFFD3E3D4216C2300530006580A06
      5609065409065208064F08064D08004701306A31326D34D3DFD387A8874D894F
      2085260C751108710D026B070569089EC5A0FFFFFFFFFFFFFFFFFFFFFFFFD6E5
      D7226D2400530006590A065609065409065208064F08054C070C510E45794681
      A582508151569959268A2B1E82230C76120B710FA6CCA9FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFD6E5D7226D2400530006590A065609065409065208064F
      080049024378454D804F3C723E62A7653492392B8A3028872EAED2B1FFFFFFFC
      FDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6E5D7226D2400530006590A
      065609065409065208004B013770393E753F376F396DB071449C4938943EB1D4
      B3FFFFFFF0F7F1F6FAF6FFFFFF96C19864A166FDFEFDFFFFFFFFFFFFFFFFFFD6
      E5D7226D2400530006590A065609065409004E022E6C3038703A386F397AB87D
      55A75B499E4E7CB87FE9F2E8F4F9F3FBFDFC8DBE90016A0500600062A165FDFE
      FDFFFFFFFFFFFFFFFFFFD6E5D7226D2400530006590A0656090050032E6E3038
      703A3A713C84BC8767B26B5EAB63499E4D7DB980EBF4EC99C69C0A7510006C06
      066E0C00620062A165FDFEFDFFFFFFFFFFFFFFFFFFD6E5D7226D240053000659
      0A00520237763A3F74404E804E81B3847BBF806EB57264AE6854A45967AD6B45
      994938903D167B1C036E09056E0B00620062A165FDFEFDFFFFFFFFFFFFFFFFFF
      D6E5D7267028025705015504447E464F805089A98969996B96CF9A7DBE8274B8
      786AB16E5BA86055A3594E9D5243964720812606700C036D0900620062A165FD
      FEFDFFFFFFFFFFFFFFFFFFC4DAC6065A080C5F10447C4784A785D8E3D8326C34
      A8D4AB8EC89184C1887ABB7E70B47466AE6A5CA76053A0584B9A4F338C381378
      19046C0A00610061A064FCFDFCFFFFFFEEF4EE488A4A005600317934326B34D6
      E2D6FFFFFF5C895C7EAA80ACDBAF93CA978AC48E80BE8477B87B6DB17163AA66
      58A45D519E554496492D873216771B00640065A368DEEBDE418A450058000B65
      0F4C844E5A885CFFFFFFFFFFFFDDE7DD28632AAED1B0ABD9AE9ACD9D90C79487
      C18A7CBB8073B47669AE6C5EA76255A0594C9A504292463287371E79232A7F2E
      07680D05660A4688482D682FD9E5D9FFFFFFFFFFFFFFFFFFA4BDA4386F39BDDC
      BEB2DCB4A0CFA397CA9A8DC49082BE8679B77C6FB17265AA685AA35F509C5447
      954B3D8E422D8331247D294E9252356E37A0BCA0FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF8CAB8C386F39B5D4B6BFE4C2A8D4AA9CCD9F93C79689C18C7FBB8275B4
      786BAE6E61A765569F5A49974D4A984F639F66366F3888A888FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA2BBA22C652D87AD88C0DFC2BCE1BFA9D6AC
      9BCD9E8FC59284BE887BB97E74B57773B47777B17A6597673068319EB99EFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAE5DA5D895D35
      6D36749E759AC09CA9CEABA8D0AAA0CBA294C29680B082639465356D365D8A5E
      D8E3D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFD6E2D68AA98A4E7F4F3A713C376F39376F393B713C4F805188
      A888D4E0D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object ListPed: TCheckListBox
    Left = 600
    Top = 112
    Width = 217
    Height = 153
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 16
    Items.Strings = (
      'Acesso ao m'#243'dulo'
      'Novo'
      'Editar'
      'Excluir'
      'Historico de Contas'
      'Altera'#231#245'es Situa'#231#227'o')
    ParentFont = False
    TabOrder = 10
    Visible = False
  end
  object Button3: TButton
    Left = 16
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 11
    OnClick = Button3Click
  end
  object TBFuncionario: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select Nome, codigo, password, ativo  from funcionarios'
      'where ativo = true')
    Left = 264
    Top = 56
    object TBFuncionarioNome: TWideStringField
      FieldName = 'Nome'
      Size = 150
    end
    object TBFuncionariocodigo: TAutoIncField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object TBFuncionariopassword: TWideStringField
      FieldName = 'password'
      Size = 255
    end
    object TBFuncionarioativo: TBooleanField
      FieldName = 'ativo'
    end
  end
  object DataSource1: TDataSource
    DataSet = TBFuncionario
    Left = 296
    Top = 56
  end
  object TB_Permis: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from logperm')
    Left = 328
    Top = 56
    object TB_PermisID_User: TIntegerField
      FieldName = 'ID_User'
    end
    object TB_PermisValor: TWideStringField
      FieldName = 'Valor'
      Size = 255
    end
  end
end
