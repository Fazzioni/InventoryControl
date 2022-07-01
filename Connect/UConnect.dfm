object Fprincipal: TFprincipal
  Left = 336
  Top = 158
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o de Provedor do Banco de dados'
  ClientHeight = 424
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 612
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label6: TLabel
      Left = 8
      Top = 21
      Width = 168
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Provedor Configurado:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 37
      Width = 168
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Local da Base de Dados:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 180
      Top = 21
      Width = 42
      Height = 14
      Caption = 'Label8'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 180
      Top = 37
      Width = 42
      Height = 14
      Caption = 'Label9'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 1
      Top = 1
      Width = 610
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'Configura'#231#227'o de Provedor do Banco de Dados'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 57
    Width = 612
    Height = 328
    Align = alClient
    Columns = <
      item
        Caption = 'Provedores'
        Width = 590
      end>
    GridLines = True
    HideSelection = False
    RowSelect = True
    SortType = stBoth
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = ListView1DblClick
    OnEditing = ListView1Editing
  end
  object Panel2: TPanel
    Left = 0
    Top = 385
    Width = 612
    Height = 39
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 528
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Proximo'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Voltar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 336
      Top = 8
      Width = 105
      Height = 25
      Cursor = crHandPoint
      Caption = 'Testar Conex'#227'o'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Next1: TPanel
    Left = 0
    Top = 57
    Width = 612
    Height = 328
    Align = alClient
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 64
      Width = 80
      Height = 13
      Caption = 'Banco de Dados'
    end
    object SpeedButton1: TSpeedButton
      Left = 392
      Top = 80
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Caption = '...'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 16
      Top = 128
      Width = 132
      Height = 13
      Caption = 'Usu'#225'rio do Banco de dados'
    end
    object Label3: TLabel
      Left = 16
      Top = 168
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label4: TLabel
      Left = 16
      Top = 8
      Width = 160
      Height = 16
      Caption = 'Provedor selecionado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 24
      Width = 48
      Height = 16
      Cursor = crHandPoint
      Caption = 'Label5'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      OnClick = Label5Click
    end
    object Label10: TLabel
      Left = 197
      Top = 173
      Width = 109
      Height = 13
      Caption = 'Permiss'#245'es de Acesso:'
    end
    object Edit1: TEdit
      Left = 16
      Top = 80
      Width = 369
      Height = 21
      TabOrder = 0
      Text = 'C:\Users\Albino\Desktop\dados.mdb'
    end
    object Edit2: TEdit
      Left = 16
      Top = 144
      Width = 137
      Height = 21
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 16
      Top = 184
      Width = 137
      Height = 21
      TabOrder = 2
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 216
      Width = 113
      Height = 17
      Caption = 'Salvar no servidor'
      TabOrder = 3
    end
    object CheckBox7: TCheckBox
      Left = 197
      Top = 189
      Width = 225
      Height = 17
      Caption = 'Permiss'#227'o excluisva (N'#227'o recomendado)'
      TabOrder = 4
    end
  end
  object XPManifest1: TXPManifest
    Left = 536
    Top = 88
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Password="";User ID=Admin123;D' +
      'ata Source=C:\Users\Albino\Desktop\dados.mdb;Persist Security In' +
      'fo=True'
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 496
    Top = 88
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Todos os Arquivos|*.*'
    Left = 568
    Top = 88
  end
end
