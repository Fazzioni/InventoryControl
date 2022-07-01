object FVisible: TFVisible
  Left = 449
  Top = 166
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Colunas'
  ClientHeight = 402
  ClientWidth = 256
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
  object CheckListBox1: TCheckListBox
    Left = 0
    Top = 0
    Width = 256
    Height = 360
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 360
    Width = 256
    Height = 42
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 121
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
