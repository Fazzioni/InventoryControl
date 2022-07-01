object FPrinterContas: TFPrinterContas
  Left = 549
  Top = 309
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o...'
  ClientHeight = 182
  ClientWidth = 253
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
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 233
    Height = 129
    Caption = 'Impress'#227'o'
    Items.Strings = (
      'Recibo'
      'Duplicata'
      'Nota Promiss'#243'ria')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 168
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 80
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = Button2Click
  end
end
