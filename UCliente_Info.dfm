object FInfo_Cliente: TFInfo_Cliente
  Left = 364
  Top = 150
  Width = 132
  Height = 115
  Caption = 'FInfo_Cliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ppReport1: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Documents and Settings\Daniel.DANIEL-PC\Desktop\22.rtm'
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 40
    Top = 24
    Version = '14.04'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 18256
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Ficha do Cliente'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = cl3DLight
        Font.Name = 'Comic Sans MS'
        Font.Size = 25
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 12319
        mmLeft = 9260
        mmTop = 3440
        mmWidth = 181505
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 243946
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 6265
        mmLeft = 9260
        mmTop = 36248
        mmWidth = 181505
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 6265
        mmLeft = 9260
        mmTop = 70115
        mmWidth = 181505
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 6265
        mmLeft = 100277
        mmTop = 27781
        mmWidth = 90488
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 6265
        mmLeft = 9260
        mmTop = 46038
        mmWidth = 181505
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 6350
        mmLeft = 9260
        mmTop = 79111
        mmWidth = 181505
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        HyperlinkColor = clBlack
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 6350
        mmLeft = 9260
        mmTop = 130175
        mmWidth = 181505
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 6350
        mmLeft = 9260
        mmTop = 89694
        mmWidth = 181505
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Tel. Residencial.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 6350
        mmLeft = 9260
        mmTop = 110331
        mmWidth = 105040
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel22: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 6350
        mmLeft = 9260
        mmTop = 119856
        mmWidth = 105040
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 6350
        mmLeft = 119327
        mmTop = 110331
        mmWidth = 71438
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'IE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 6265
        mmLeft = 9260
        mmTop = 27781
        mmWidth = 89429
        BandType = 4
        LayerName = Foreground
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 'Memo1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 92075
        mmLeft = 9260
        mmTop = 150019
        mmWidth = 181505
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'CPF / CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 6265
        mmLeft = 9260
        mmTop = 19844
        mmWidth = 181505
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Codigo Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'courier new'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 5715
        mmLeft = 9260
        mmTop = 3175
        mmWidth = 82021
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel28: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'Dados Pessoais'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = cl3DLight
        Font.Name = 'Comic Sans MS'
        Font.Size = 15
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 7366
        mmLeft = 9260
        mmTop = 11906
        mmWidth = 181505
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Endere'#231'o'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = cl3DLight
        Font.Name = 'Comic Sans MS'
        Font.Size = 15
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 7408
        mmLeft = 9260
        mmTop = 59267
        mmWidth = 181505
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Telefone / Contato'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = cl3DLight
        Font.Name = 'Comic Sans MS'
        Font.Size = 15
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 7408
        mmLeft = 9260
        mmTop = 100013
        mmWidth = 181505
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 15
        Font.Style = []
        Transparent = True
        mmHeight = 6350
        mmLeft = 124619
        mmTop = 119856
        mmWidth = 66146
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Obs'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = cl3DLight
        Font.Name = 'Comic Sans MS'
        Font.Size = 15
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 7408
        mmLeft = 9260
        mmTop = 138907
        mmWidth = 181505
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLabel27: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Emitido as 11:11 de 11/11/2014'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4995
        mmLeft = 92340
        mmTop = 2381
        mmWidth = 103717
        BandType = 8
        LayerName = Foreground
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 0
        mmWidth = 191559
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
