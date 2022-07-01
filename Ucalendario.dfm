object Fcalendario: TFcalendario
  Left = 574
  Top = 308
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Selecione a nova Data'
  ClientHeight = 160
  ClientWidth = 225
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
  object MonthCalendar1: TMonthCalendar
    Left = 0
    Top = 0
    Width = 225
    Height = 160
    Align = alClient
    Date = 41909.671486064810000000
    TabOrder = 0
    OnDblClick = MonthCalendar1DblClick
  end
end
