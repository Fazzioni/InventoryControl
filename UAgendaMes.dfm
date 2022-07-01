object FAgenda_Mes: TFAgenda_Mes
  Left = 318
  Top = 181
  Width = 517
  Height = 412
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Calend'#225'rio...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 89
    Width = 501
    Height = 285
    Align = alClient
    BevelOuter = bvNone
    Caption = 'panel4'
    TabOrder = 3
    OnMouseDown = Panel4MouseDown
  end
  object Panel1: TPanel
    Tag = 4
    Left = 0
    Top = 0
    Width = 501
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    OnMouseDown = Panel1MouseDown
    OnMouseMove = Panel1MouseMove
    object SpeedButton1: TSpeedButton
      Left = 376
      Top = 6
      Width = 30
      Height = 30
      Cursor = crHandPoint
      Caption = '>>'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Algerian'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
      OnMouseMove = SpeedButton1MouseMove
    end
    object SpeedButton2: TSpeedButton
      Left = 344
      Top = 6
      Width = 30
      Height = 30
      Cursor = crHandPoint
      Caption = '<<'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Algerian'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton2Click
      OnMouseMove = SpeedButton2MouseMove
    end
    object SpeedButton3: TSpeedButton
      Left = -1
      Top = -1
      Width = 29
      Height = 29
      Caption = '?'
      Flat = True
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Wingdings'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      OnClick = SpeedButton3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 501
    Height = 285
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object A1: TPanel
      Tag = 1
      Left = 64
      Top = 88
      Width = 20
      Height = 20
      Color = clBtnShadow
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 0
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object A2: TPanel
      Tag = 1
      Left = 84
      Top = 88
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 1
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object A3: TPanel
      Tag = 1
      Left = 104
      Top = 88
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 2
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object A4: TPanel
      Tag = 1
      Left = 124
      Top = 88
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 3
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object A5: TPanel
      Tag = 1
      Left = 144
      Top = 88
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 4
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object A6: TPanel
      Tag = 1
      Left = 164
      Top = 88
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 5
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object A7: TPanel
      Tag = 1
      Left = 184
      Top = 88
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 6
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object B1: TPanel
      Tag = 1
      Left = 64
      Top = 108
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 7
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object B2: TPanel
      Tag = 1
      Left = 84
      Top = 108
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 8
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object B3: TPanel
      Tag = 1
      Left = 104
      Top = 108
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 9
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object B4: TPanel
      Tag = 1
      Left = 124
      Top = 108
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 10
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object B5: TPanel
      Tag = 1
      Left = 144
      Top = 108
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 11
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object B6: TPanel
      Tag = 1
      Left = 164
      Top = 108
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 12
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object B7: TPanel
      Tag = 1
      Left = 184
      Top = 108
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 13
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object C1: TPanel
      Tag = 1
      Left = 64
      Top = 128
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 14
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object C2: TPanel
      Tag = 1
      Left = 84
      Top = 128
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 15
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object C3: TPanel
      Tag = 1
      Left = 104
      Top = 128
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 16
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object C4: TPanel
      Tag = 1
      Left = 124
      Top = 128
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 17
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object C5: TPanel
      Tag = 1
      Left = 144
      Top = 128
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 18
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object C6: TPanel
      Tag = 1
      Left = 164
      Top = 128
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 19
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object C7: TPanel
      Tag = 1
      Left = 184
      Top = 128
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 20
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object D1: TPanel
      Tag = 1
      Left = 64
      Top = 148
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 21
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object D2: TPanel
      Tag = 1
      Left = 84
      Top = 148
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 22
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object D3: TPanel
      Tag = 1
      Left = 104
      Top = 148
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 23
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object D4: TPanel
      Tag = 1
      Left = 124
      Top = 148
      Width = 21
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 24
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object D5: TPanel
      Tag = 1
      Left = 144
      Top = 148
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 25
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object D6: TPanel
      Tag = 1
      Left = 164
      Top = 148
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 26
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object D7: TPanel
      Tag = 1
      Left = 184
      Top = 148
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 27
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object E1: TPanel
      Tag = 1
      Left = 64
      Top = 168
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 28
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object E2: TPanel
      Tag = 1
      Left = 84
      Top = 168
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 29
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object E3: TPanel
      Tag = 1
      Left = 104
      Top = 168
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 30
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object E4: TPanel
      Tag = 1
      Left = 124
      Top = 168
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 31
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object E5: TPanel
      Tag = 1
      Left = 144
      Top = 168
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 32
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object E6: TPanel
      Tag = 1
      Left = 164
      Top = 168
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 33
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object E7: TPanel
      Tag = 1
      Left = 184
      Top = 168
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 34
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object F1: TPanel
      Tag = 1
      Left = 64
      Top = 188
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 35
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object F2: TPanel
      Tag = 1
      Left = 84
      Top = 188
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 36
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object F3: TPanel
      Tag = 1
      Left = 104
      Top = 188
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 37
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object F4: TPanel
      Tag = 1
      Left = 124
      Top = 188
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 38
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object F5: TPanel
      Tag = 1
      Left = 144
      Top = 188
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 39
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object F6: TPanel
      Tag = 1
      Left = 164
      Top = 188
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 40
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
    object F7: TPanel
      Tag = 1
      Left = 184
      Top = 188
      Width = 20
      Height = 20
      ParentBackground = False
      PopupMenu = PopupMenu2
      TabOrder = 41
      OnDblClick = A1DblClick
      OnMouseDown = A1MouseDown
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 48
    Width = 501
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object T1: TPanel
      Tag = 3
      Left = 64
      Top = 13
      Width = 20
      Height = 20
      Caption = 'Domingo'
      Color = 16746751
      ParentBackground = False
      TabOrder = 0
      OnMouseMove = Panel1MouseMove
    end
    object T2: TPanel
      Tag = 3
      Left = 84
      Top = 13
      Width = 20
      Height = 20
      Caption = 'Segunda'
      Color = 16746751
      ParentBackground = False
      TabOrder = 1
      OnMouseMove = Panel1MouseMove
    end
    object T3: TPanel
      Tag = 3
      Left = 104
      Top = 13
      Width = 20
      Height = 20
      Caption = 'Ter'#231'a'
      Color = 16746751
      ParentBackground = False
      TabOrder = 2
      OnMouseMove = Panel1MouseMove
    end
    object T4: TPanel
      Tag = 3
      Left = 124
      Top = 13
      Width = 20
      Height = 20
      Caption = 'Quarta'
      Color = 16746751
      ParentBackground = False
      TabOrder = 3
      OnMouseMove = Panel1MouseMove
    end
    object T5: TPanel
      Tag = 3
      Left = 144
      Top = 13
      Width = 20
      Height = 20
      Caption = 'Quinta'
      Color = 16746751
      ParentBackground = False
      TabOrder = 4
      OnMouseMove = Panel1MouseMove
    end
    object T6: TPanel
      Tag = 3
      Left = 164
      Top = 13
      Width = 21
      Height = 20
      Caption = 'Sexta'
      Color = 16746751
      ParentBackground = False
      TabOrder = 5
      OnMouseMove = Panel1MouseMove
    end
    object T7: TPanel
      Tag = 3
      Left = 184
      Top = 13
      Width = 20
      Height = 20
      Caption = 'S'#225'bado'
      Color = 16746751
      ParentBackground = False
      TabOrder = 6
      OnMouseMove = Panel1MouseMove
    end
  end
  object XPManifest1: TXPManifest
    Left = 464
    Top = 64
  end
  object ADOConnection1: TADOConnection
    Connected = True
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
      'alse;Jet OLEDB:Support Complex Data=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 432
    Top = 64
  end
  object TBAgenda: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select data from tb_Agenda')
    Left = 400
    Top = 64
    object TBAgendadata: TDateTimeField
      FieldName = 'data'
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 368
    Top = 65
    object Color1: TMenuItem
      Caption = 'Cores'
      object tulo1: TMenuItem
        Caption = 'T'#237'tulo'
        OnClick = tulo1Click
      end
      object tulodaSemana1: TMenuItem
        Caption = 'T'#237'tulo da Semana'
        OnClick = tulodaSemana1Click
      end
      object FinaldeSemana1: TMenuItem
        Caption = 'Final de Semana'
        OnClick = FinaldeSemana1Click
      end
      object Selecionado1: TMenuItem
        Caption = 'Selecionado'
        OnClick = Selecionado1Click
      end
      object Diasnormais1: TMenuItem
        Caption = 'Dias normais'
        OnClick = Diasnormais1Click
      end
      object DiasBloqueados1: TMenuItem
        Caption = 'Dias Bloqueados'
        OnClick = DiasBloqueados1Click
      end
      object SubTtulo11: TMenuItem
        Caption = 'Sub T'#237'tulo 1'
        OnClick = SubTtulo11Click
      end
    end
    object Borda1: TMenuItem
      Caption = 'Utilizar Borda'
      OnClick = Borda1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MostrarProgressodeatualizao1: TMenuItem
      Caption = 'Mostrar Progresso de atualiza'#231#227'o'
      OnClick = MostrarProgressodeatualizao1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 376
    Top = 129
    object VisualizarRegistros1: TMenuItem
      Caption = 'Visualizar Registros'
      OnClick = VisualizarRegistros1Click
    end
  end
end
