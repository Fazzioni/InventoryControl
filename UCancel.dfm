object Fcancel: TFcancel
  Left = 481
  Top = 280
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cancelando Altera'#231#245'es'
  ClientHeight = 144
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 88
    Width = 329
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 48
    Top = 8
    Width = 225
    Height = 23
    Caption = 'Cancelando Altera'#231#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 112
    Width = 329
    Height = 17
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 60
    Left = 304
    Top = 24
  end
end
