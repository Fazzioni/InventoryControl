object FAniversario: TFAniversario
  Left = 398
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Anivers'#225'riantes do Dia'
  ClientHeight = 349
  ClientWidth = 522
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 73
    Top = 8
    Width = 376
    Height = 46
    Caption = 'Anivers'#225'riantes do Dia'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Bell MT'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 12
    Top = 64
    Width = 497
    Height = 225
    DataSource = Banco.Cliente_Source
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_cliente'
        Title.Caption = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Width = 270
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nascimento'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 308
    Width = 522
    Height = 41
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 1
  end
end
