object FEstoque_AUX_New: TFEstoque_AUX_New
  Left = 376
  Top = 280
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Verificando Registro...'
  ClientHeight = 158
  ClientWidth = 550
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
    Left = 23
    Top = 18
    Width = 504
    Height = 42
    Caption = 'Verificando Registros'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 59
    Top = 72
    Width = 432
    Height = 42
    Caption = 'Por favor, Aguarde'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 15
    Top = 122
    Width = 521
    Height = 17
    TabOrder = 0
  end
end
