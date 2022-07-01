object FPermissoesNew: TFPermissoesNew
  Left = 539
  Top = 149
  Width = 420
  Height = 331
  BorderIcons = [biSystemMenu]
  Caption = 'Perfil de Permiss'#245'es'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ThemeDBGrid1: TThemeDBGrid
    Left = 8
    Top = 64
    Width = 233
    Height = 105
    DataSource = Permi_source
    DefaultDrawing = False
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = ThemeDBGrid1DrawColumnCell
    OnDblClick = Button2Click
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 404
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Nova'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Carregar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object TB_PermiSave: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_permifavorito')
    Left = 336
    Top = 56
    object TB_PermiSaveCodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object TB_PermiSaveDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 20
      FieldName = 'Descricao'
      Size = 255
    end
    object TB_PermiSavePermissao: TWideStringField
      DisplayWidth = 10
      FieldName = 'Permissao'
      Size = 255
    end
  end
  object Permi_source: TDataSource
    DataSet = TB_PermiSave
    Left = 368
    Top = 56
  end
end
