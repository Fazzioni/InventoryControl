object FSituacao: TFSituacao
  Left = 347
  Top = 256
  Width = 501
  Height = 340
  BorderIcons = [biSystemMenu]
  Caption = 'Situa'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object ThemeDBGrid1: TThemeDBGrid
    Left = 0
    Top = 57
    Width = 485
    Height = 245
    DataSource = Banco.Situacao_Source
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'Codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descri'
        Title.Caption = 'Descri'#231#227'o'
        Width = 250
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 485
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 41
      Caption = 'Novo'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 41
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 176
      Top = 8
      Width = 75
      Height = 41
      Caption = 'excluir'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object ColorDialog1: TColorDialog
    Left = 200
    Top = 88
  end
end
