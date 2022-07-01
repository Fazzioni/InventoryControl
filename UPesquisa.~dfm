object FPesquisa: TFPesquisa
  Left = 322
  Top = 160
  Width = 648
  Height = 350
  BorderIcons = [biSystemMenu]
  Caption = 'Filtrando dados...'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 427
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
  object Label3: TLabel
    Left = 64
    Top = 16
    Width = 79
    Height = 13
    Caption = 'Nome do Campo'
  end
  object Label8: TLabel
    Left = 224
    Top = 16
    Width = 47
    Height = 13
    Caption = 'Opera'#231#227'o'
  end
  object Label9: TLabel
    Left = 336
    Top = 16
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Button2: TButton
    Left = 360
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 0
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 64
    Top = 32
    Width = 153
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    Text = 'ComboBox1'
    OnSelect = ComboBox1Select
  end
  object Button3: TButton
    Left = 272
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Limpar Filtros'
    TabOrder = 2
    OnClick = Button3Click
  end
  object DBComboBox1: TDBLookupComboBox
    Left = 336
    Top = 32
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'Cidade'
    ListField = 'Cidade'
    ListSource = Banco.Municipio_Source
    ParentFont = False
    TabOrder = 3
    OnEnter = DBComboBox1Enter
  end
  object ComboBox3: TComboBox
    Left = 336
    Top = 32
    Width = 49
    Height = 24
    CharCase = ecUpperCase
    Color = 16776176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    MaxLength = 2
    ParentFont = False
    TabOrder = 4
    Text = 'SC'
    Visible = False
    OnSelect = ComboBox3Select
    Items.Strings = (
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO'
      'EX')
  end
  object Button4: TButton
    Left = 520
    Top = 64
    Width = 89
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 5
    OnClick = Button4Click
  end
  object ComboBox5: TComboBox
    Left = 224
    Top = 32
    Width = 105
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 6
    Text = 'ComboBox5'
    Items.Strings = (
      'Igual'
      'Diferente'
      'Maior'
      'Menor'
      'Contendo'
      'Come'#231'ando'
      'Terminando')
  end
  object RadioGroup4: TRadioGroup
    Left = 8
    Top = 8
    Width = 49
    Height = 49
    ItemIndex = 0
    Items.Strings = (
      'E'
      'Ou')
    TabOrder = 7
  end
  object Edit: TEdit
    Left = 336
    Top = 32
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object DataEdit: TDateTimePicker
    Left = 336
    Top = 32
    Width = 177
    Height = 24
    Date = 41977.487027013890000000
    Time = 41977.487027013890000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object Button1: TButton
    Left = 440
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Aplicar'
    TabOrder = 10
    OnClick = Button1Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 336
    Top = 32
    Width = 73
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'codigo'
    ListField = 'Forma'
    ListSource = Banco.Forma_Pagamento
    ParentFont = False
    TabOrder = 11
    Visible = False
    OnClick = DBLookupComboBox1Click
    OnEnter = DBLookupComboBox1Enter
    OnExit = DBLookupComboBox1Exit
  end
  object Lista: TRichEdit
    Left = 8
    Top = 64
    Width = 296
    Height = 160
    Cursor = crArrow
    DragCursor = crArrow
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Lista')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 12
    OnKeyDown = ListaKeyDown
    OnKeyPress = ListaKeyPress
    OnMouseDown = ListaMouseDown
    OnMouseUp = ListaMouseUp
  end
  object Button6: TButton
    Left = 520
    Top = 96
    Width = 89
    Height = 25
    Caption = 'Excluir Linha'
    TabOrder = 13
    OnClick = Button6Click
  end
end
