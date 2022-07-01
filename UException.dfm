object FException: TFException
  Left = 337
  Top = 212
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'A Aplica'#231#227'o Encontrou um erro'
  ClientHeight = 266
  ClientWidth = 446
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
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 425
    Height = 249
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 57
    Height = 74
    Caption = 'L'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -67
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 80
    Top = 32
    Width = 352
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Caption = 'A Aplica'#231#227'o encontrou um erro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 80
    Top = 64
    Width = 120
    Height = 16
    Caption = 'Classe do Erro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 86
    Width = 64
    Height = 16
    Caption = 'Mensagem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 9
    Top = 192
    Width = 425
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'Rel'#225'torio salvo no banco de dados'
    Font.Charset = ANSI_CHARSET
    Font.Color = 12615680
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 162
    Top = 222
    Width = 121
    Height = 25
    Cursor = crHandPoint
    Caption = 'Ok'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Label6: TLabel
    Left = 208
    Top = 64
    Width = 225
    Height = 16
    AutoSize = False
    Caption = 'Label6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 16
    Top = 104
    Width = 409
    Height = 81
    Cursor = crArrow
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clBtnFace
    Lines.Strings = (
      'Memo1'
      '23'
      '1'
      '23'
      '12aaaaaaaabbbbbbbbbbbbb'
      '3'
      '12'
      '3'
      '12')
    ScrollBars = ssVertical
    TabOrder = 0
    OnContextPopup = Memo1ContextPopup
    OnKeyDown = Memo1KeyDown
    OnKeyPress = Memo1KeyPress
  end
  object Timer1: TTimer
    Interval = 30
    OnTimer = Timer1Timer
    Left = 16
    Top = 208
  end
end
