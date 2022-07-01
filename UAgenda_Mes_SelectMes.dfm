object FAgenda_Mes_SelectMes: TFAgenda_Mes_SelectMes
  Left = 431
  Top = 207
  Width = 377
  Height = 256
  BorderIcons = [biSystemMenu]
  Caption = 'Selecione o M'#234's / Ano'
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
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 361
    Height = 164
    Align = alClient
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'Janeiro'
      'Fevereiro'
      'Mar'#231'o'
      'Abril'
      'Maio'
      'Junho'
      'Julho'
      'Agosto'
      'Setembro'
      'Outubro'
      'Novembro'
      'Dezembro')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 164
    Width = 361
    Height = 54
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 56
      Top = 4
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object Button1: TButton
      Left = 200
      Top = 17
      Width = 107
      Height = 25
      Caption = 'Aplicar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object SpinEdit1: TSpinEdit
      Left = 56
      Top = 19
      Width = 97
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 2014
      OnExit = SpinEdit1Exit
    end
  end
end
