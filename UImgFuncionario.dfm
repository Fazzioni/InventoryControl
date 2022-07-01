object FImgFunc: TFImgFunc
  Left = 422
  Top = 263
  Width = 547
  Height = 338
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Imagem Funcion'#225'rio'
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
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 418
    Height = 300
    Align = alClient
    TabOrder = 0
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 177
      Height = 185
      AutoSize = True
    end
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 130
      Height = 137
      Shape = bsFrame
    end
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 130
      Height = 137
      Cursor = crHandPoint
      HelpType = htKeyword
      AutoSize = False
      Transparent = True
      OnMouseDown = Label1MouseDown
      OnMouseUp = Label1MouseUp
    end
  end
  object Panel1: TPanel
    Left = 418
    Top = 0
    Width = 113
    Height = 300
    Align = alRight
    TabOrder = 1
    object Button1: TButton
      Left = 12
      Top = 136
      Width = 89
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 12
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Abrir...'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 12
      Top = 40
      Width = 89
      Height = 25
      Caption = 'Salvar como...'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 12
      Top = 72
      Width = 89
      Height = 25
      Caption = 'Limpar'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 12
      Top = 104
      Width = 89
      Height = 25
      Caption = 'Paint'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 12
      Top = 184
      Width = 89
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 5
      OnClick = Button6Click
    end
  end
  object Timer1: TTimer
    Interval = 5
    OnTimer = Timer1Timer
    Left = 40
    Top = 8
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Imagem Bitmap|*.bmp'
    Left = 8
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Imagem Bitmap|*.bmp'
    Left = 72
    Top = 8
  end
end
