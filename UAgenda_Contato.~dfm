object FAgenda_Contato: TFAgenda_Contato
  Left = 462
  Top = 217
  Width = 358
  Height = 308
  BorderIcons = [biSystemMenu]
  Caption = 'Contatos...'
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object ThemeDBGrid1: TThemeDBGrid
    Left = 8
    Top = 48
    Width = 300
    Height = 193
    DataSource = Banco.Agenda_Contato
    DefaultDrawing = False
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = ThemeDBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 212
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 342
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 40
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 200
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
end
