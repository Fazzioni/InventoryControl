object FEC: TFEC
  Left = 218
  Top = 122
  Width = 715
  Height = 536
  Caption = 'FEC'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object Panel2: TPanel
    Left = 0
    Top = 75
    Width = 649
    Height = 41
    TabOrder = 1
    object Button1: TButton
      Left = 12
      Top = 5
      Width = 49
      Height = 25
      Caption = 'add'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 64
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Remover'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 472
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 560
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Finalizar'
      TabOrder = 4
      OnClick = Button5Click
    end
  end
  object ListView1: TListView
    Left = 16
    Top = 128
    Width = 649
    Height = 313
    Columns = <
      item
        Caption = 'C'#243'digo'
        MaxWidth = 50
        MinWidth = 50
      end
      item
        Caption = 'Un'
        MaxWidth = 40
        MinWidth = 40
        Width = 40
      end
      item
        Caption = 'Qtd'
        MaxWidth = 50
        MinWidth = 50
      end
      item
        Caption = 'Descri'#231#227'o'
        MaxWidth = 320
        MinWidth = 320
        Width = 320
      end
      item
        Caption = 'Pre'#231'o Unit.'
        MaxWidth = 75
        MinWidth = 75
        Width = 75
      end
      item
        Caption = 'Pre'#231'o'
        MaxWidth = 75
        MinWidth = 75
        Width = 75
      end>
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ListView1DblClick
    OnEditing = ListView1Editing
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 471
    Width = 699
    Height = 27
    Panels = <
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'Registros'
        Width = 100
      end
      item
        Alignment = taCenter
        Text = 'Pre'#231'o Total'
        Width = 25
      end>
  end
  object ThemeDBGrid1: TThemeDBGrid
    Left = 23
    Top = -67
    Width = 426
    Height = 124
    DataSource = Banco.Cliente_Source
    DefaultDrawing = False
    Options = [dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnKeyPress = ThemeDBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome_Razao'
        Width = 385
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 425
    Height = 21
    TabOrder = 3
    OnKeyPress = DBComboBox1KeyPress
  end
end
