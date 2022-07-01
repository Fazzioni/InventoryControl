object FFinaliza: TFFinaliza
  Left = 266
  Top = 102
  Width = 918
  Height = 568
  BorderIcons = [biSystemMenu]
  Caption = 'Finalizando Venda / Or'#231'amento'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 734
    Top = 0
    Height = 489
    Align = alRight
    OnMoved = Splitter1Moved
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 734
    Height = 489
    ActivePage = TabSheet2
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object TabSheet3: TTabSheet
      Caption = 'Cliente'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 461
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        OnResize = Panel4Resize
        object Label9: TLabel
          Left = 48
          Top = 17
          Width = 32
          Height = 13
          Caption = 'Cliente'
        end
        object Label10: TLabel
          Left = 400
          Top = 17
          Width = 51
          Height = 13
          Caption = 'Comprador'
        end
        object Label13: TLabel
          Left = -320
          Top = 240
          Width = 22
          Height = 13
          Caption = 'OBS'
        end
        object Label11: TLabel
          Left = 23
          Top = 47
          Width = 58
          Height = 13
          Caption = 'CPF / CNPJ'
          FocusControl = DBEdit3
        end
        object Label20: TLabel
          Left = 14
          Top = 73
          Width = 67
          Height = 13
          Caption = 'Insc. Estadual'
          FocusControl = DBEdit14
        end
        object Label23: TLabel
          Left = 11
          Top = 99
          Width = 71
          Height = 13
          Caption = 'Insc. Municipal'
          FocusControl = DBEdit14
        end
        object Label12: TLabel
          Left = 60
          Top = 132
          Width = 21
          Height = 13
          Caption = 'CEP'
          FocusControl = DBEdit12
        end
        object Label14: TLabel
          Left = 176
          Top = 132
          Width = 14
          Height = 13
          Caption = 'UF'
        end
        object Label15: TLabel
          Left = 28
          Top = 159
          Width = 54
          Height = 13
          Caption = 'Logradouro'
          FocusControl = DBEdit6
        end
        object Label16: TLabel
          Left = 55
          Top = 190
          Width = 27
          Height = 13
          Caption = 'Bairro'
          FocusControl = DBEdit9
        end
        object Label17: TLabel
          Left = 41
          Top = 218
          Width = 43
          Height = 13
          Caption = 'Tel. Res.'
          FocusControl = DBEdit16
        end
        object Label19: TLabel
          Left = 64
          Top = 245
          Width = 17
          Height = 13
          Caption = 'Fax'
          FocusControl = DBEdit19
        end
        object Label18: TLabel
          Left = 53
          Top = 272
          Width = 28
          Height = 13
          Caption = 'E-mail'
          FocusControl = DBEdit15
        end
        object Label21: TLabel
          Left = 225
          Top = 218
          Width = 32
          Height = 13
          Caption = 'Celular'
          FocusControl = DBEdit18
        end
        object Label22: TLabel
          Left = 398
          Top = 218
          Width = 45
          Height = 13
          Caption = 'Tel. Com.'
          FocusControl = DBEdit17
        end
        object Label24: TLabel
          Left = 358
          Top = 190
          Width = 30
          Height = 13
          Caption = 'Comp.'
          FocusControl = DBEdit8
        end
        object Label36: TLabel
          Left = 464
          Top = 159
          Width = 12
          Height = 13
          Caption = 'N'#186
          FocusControl = DBEdit7
        end
        object Label37: TLabel
          Left = 59
          Top = 301
          Width = 22
          Height = 13
          Caption = 'OBS'
        end
        object Image1: TImage
          Left = 240
          Top = 43
          Width = 24
          Height = 24
          Cursor = crHandPoint
          AutoSize = True
          Picture.Data = {
            07544269746D6170C2040000424DC20400000000000042000000280000001800
            000018000000010010000300000080040000C30E0000C30E0000000000000000
            0000007C0000E00300001F0000002F210E190E190E190E190E190E190E190E19
            0E190E190E190E190E190E190E190E190E190E190E190E190E190E192F21EE18
            CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14AD10CD10CD14CD14CD14CD14
            CD14CD14CD14CD14CD14CD14EE180E19CD14CD14CD14CD14CD14CD14CD14CD14
            CD10AD102F1D0E19AD10CD14CD14CD14CD14CD14CD14CD14CD14CD140E190E19
            CD14CD14CD14CD14CD14CD14CD14CD10AD1071297C6FFA5E2F1DAD10CD14CD14
            CD14CD14CD14CD14CD14CD140E190E19CD14CD14CD14CD14CD14CD14CD10AD10
            B2319D6FFF7FFF7F5B6B7129AD10CD10CD14CD14CD14CD14CD14CD140E190E19
            CD14CD14CD14CD14CD14CD10AD10D335BD77FF7FFF7FFF7FFF7F7C6F922DCD10
            CD10CD14CD14CD14CD14CD140E190E19CD14CD14CD14CD14CD10AD10F339BE77
            FF7FFF7FFF7FFF7FFF7FFF7FBD77922DAD10CD14CD14CD14CD14CD140E190E19
            CD14CD14CD14CD10CD10143EDE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7F1A5F5025
            AD10CD10CD10CD14CD14CD140E190E19CD14CD14CD10EE145646DF7BFF7FFF7F
            FF7FFF7FFF7FFF7F9D733542CE14AD10EE182F1DCD14CD10CD14CD140E190E19
            CD14CD10AD107125BE77FF7FFF7FFF7FFF7FFF7FFF7FBE7735429129F439774E
            FA5E5C6B3546EE14AD10CD100E19EE18AD102F21EE18CD10B856FF7FFF7FFF7F
            FF7FDE7BD856764A3B67BE77FF7FFF7FFF7FFF7FFF7FD9562F21AD10EE180F19
            D3357C6F1A63712550259D73FF7FFF7F7C6F3546B22DB23156467C6FFF7FFF7F
            FF7FFF7FFF7FFF7F3B67B2310F1DB231DE7BFF7FFF7F9D7335429752BE77B852
            35461A63BE77BE771A63564697529D73FF7FFF7FFF7FFF7FFF7F7D6F35422F21
            143E5B67FF7FFF7FFF7F7C6FB8560F1DD856FF7FFF7FFF7FFF7FB8562F1D5646
            3B67DE7BFF7FFF7F3B67153E922DEE18AD100F1D56467C6FFF7FFF7FDE7B1A5F
            B8567C6F9D737D6F3B67774AFA5E7C6B922DF339F95E56462F1DAD10EE180E19
            CD14AD10AD105025764A7C6FDF7BDE7B7C6FD95A153E35421A5FBE77FF7FDE7B
            B231AD10EE18CD14CD10CD100E190E19CD14CD14CD10AD10CD103021B231922D
            F439F95A7C6FDE7BFF7F9D73F95A143E0F1DCD10CD10CD10CD14CD140E190E19
            CD14CD14CD14CD14CD10CD10AD10AD100F1DF43956465646F4397129EE18CD10
            CD10CD14CD14CD14CD14CD140E190E19CD14CD14CD14CD14CD14CD14CD14CD14
            CD10AD10AD0CAD0CAD10AD10CD10CD10CD14CD14CD14CD14CD14CD140E190E19
            CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14
            CD14CD14CD14CD14CD14CD140E190E19CD14CD14CD14CD14CD14CD14CD14CD14
            CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD140E190E19
            CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14
            CD14CD14CD14CD14CD14CD140E19EE18CD14CD14CD14CD14CD14CD14CD14CD14
            CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14CD14EE182F21
            0E190E190E190E190E190E190E190E190E190E190E190E190E190E190E190E19
            0E190E190E190E190E190E192F21}
          OnMouseDown = Image1MouseDown
        end
        object BttNew: TSpeedButton
          Left = 321
          Top = 12
          Width = 25
          Height = 27
          Cursor = crHandPoint
          Caption = '/'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -25
          Font.Name = 'Wingdings 2'
          Font.Style = []
          Layout = blGlyphBottom
          ParentFont = False
          OnClick = BttNewClick
        end
        object BttEdit: TSpeedButton
          Left = 346
          Top = 12
          Width = 25
          Height = 27
          Cursor = crHandPoint
          Caption = '?'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -25
          Font.Name = 'Wingdings'
          Font.Style = []
          Layout = blGlyphBottom
          ParentFont = False
          OnClick = BttEditClick
        end
        object BttHist: TSpeedButton
          Left = 371
          Top = 12
          Width = 25
          Height = 27
          Cursor = crHandPoint
          Caption = '7'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -25
          Font.Name = 'Wingdings 2'
          Font.Style = []
          Layout = blGlyphBottom
          ParentFont = False
          OnClick = BttHistClick
        end
        object Edit1: TEdit
          Left = 88
          Top = 16
          Width = 225
          Height = 21
          TabOrder = 0
          OnChange = Edit1Change
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyPress = Edit1KeyPress
        end
        object DBEdit2: TDBEdit
          Left = 456
          Top = 16
          Width = 153
          Height = 21
          DataField = 'Comprador_Nome'
          DataSource = Banco.Pedido_Source
          PopupMenu = Banco.PopEdit
          TabOrder = 1
          OnEnter = DBEdit2Enter
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit3: TDBEdit
          Left = 88
          Top = 44
          Width = 145
          Height = 21
          DataField = 'CPF'
          DataSource = Banco.Cliente_Source
          Enabled = False
          TabOrder = 2
          OnEnter = DBEdit2Enter
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit14: TDBEdit
          Left = 88
          Top = 70
          Width = 145
          Height = 21
          DataField = 'IE'
          DataSource = Banco.Cliente_Source
          Enabled = False
          TabOrder = 3
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit21: TDBEdit
          Left = 88
          Top = 96
          Width = 145
          Height = 21
          DataField = 'IM'
          DataSource = Banco.Cliente_Source
          Enabled = False
          TabOrder = 4
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit12: TDBEdit
          Left = 88
          Top = 129
          Width = 81
          Height = 21
          DataField = 'Cep'
          DataSource = Banco.Cliente_Source
          Enabled = False
          MaxLength = 8
          TabOrder = 5
        end
        object ComboBox1: TComboBox
          Left = 200
          Top = 127
          Width = 49
          Height = 24
          CharCase = ecUpperCase
          Color = clGradientInactiveCaption
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 16
          MaxLength = 2
          ParentFont = False
          TabOrder = 6
          Text = 'SC'
          Items.Strings = (
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO'
            'EX')
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 256
          Top = 127
          Width = 201
          Height = 24
          Color = clGradientInactiveCaption
          DataField = 'Municiopio'
          DataSource = Banco.Cliente_Source
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'Codigo'
          ListField = 'Cidade'
          ListSource = Banco.Municipio_Source_new
          ParentFont = False
          TabOrder = 7
        end
        object DBLookTipolog: TDBLookupComboBox
          Left = 88
          Top = 156
          Width = 97
          Height = 24
          DataField = 'Logr_Tipo'
          DataSource = Banco.Cliente_Source
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'Codigo'
          ListField = 'Tipo'
          ListSource = Banco.TBLOG_Source
          ParentFont = False
          TabOrder = 8
        end
        object DBEdit6: TDBEdit
          Left = 192
          Top = 156
          Width = 265
          Height = 21
          DataField = 'Logradouro'
          DataSource = Banco.Cliente_Source
          Enabled = False
          PopupMenu = Banco.PopEdit
          TabOrder = 9
        end
        object DBEdit9: TDBEdit
          Left = 88
          Top = 187
          Width = 265
          Height = 21
          DataField = 'Bairro'
          DataSource = Banco.Cliente_Source
          Enabled = False
          PopupMenu = Banco.PopEdit
          TabOrder = 10
        end
        object DBEdit5: TDBEdit
          Left = 88
          Top = 215
          Width = 26
          Height = 21
          DataField = 'DDD_Res'
          DataSource = Banco.Cliente_Source
          Enabled = False
          TabOrder = 11
        end
        object DBEdit16: TDBEdit
          Left = 120
          Top = 215
          Width = 97
          Height = 21
          DataField = 'Tel_Res'
          DataSource = Banco.Cliente_Source
          Enabled = False
          MaxLength = 9
          TabOrder = 12
        end
        object DBEdit13: TDBEdit
          Left = 88
          Top = 242
          Width = 26
          Height = 21
          DataField = 'DDD_Fax'
          DataSource = Banco.Cliente_Source
          Enabled = False
          TabOrder = 13
        end
        object DBEdit19: TDBEdit
          Left = 120
          Top = 242
          Width = 97
          Height = 21
          DataField = 'Tel_Fax'
          DataSource = Banco.Cliente_Source
          Enabled = False
          TabOrder = 14
        end
        object DBEdit15: TDBEdit
          Left = 88
          Top = 269
          Width = 305
          Height = 21
          DataField = 'Email'
          DataSource = Banco.Cliente_Source
          Enabled = False
          PopupMenu = Banco.PopEdit
          TabOrder = 15
        end
        object DBEdit11: TDBEdit
          Left = 264
          Top = 215
          Width = 26
          Height = 21
          DataField = 'DDD_Cel'
          DataSource = Banco.Cliente_Source
          Enabled = False
          TabOrder = 16
        end
        object DBEdit18: TDBEdit
          Left = 296
          Top = 215
          Width = 97
          Height = 21
          DataField = 'Tel_Cel'
          DataSource = Banco.Cliente_Source
          Enabled = False
          TabOrder = 17
        end
        object DBEdit10: TDBEdit
          Left = 448
          Top = 215
          Width = 26
          Height = 21
          DataField = 'DDD_Come'
          DataSource = Banco.Cliente_Source
          Enabled = False
          TabOrder = 18
        end
        object DBEdit17: TDBEdit
          Left = 480
          Top = 215
          Width = 97
          Height = 21
          DataField = 'Tel_Come'
          DataSource = Banco.Cliente_Source
          Enabled = False
          TabOrder = 19
        end
        object DBEdit8: TDBEdit
          Left = 392
          Top = 187
          Width = 185
          Height = 21
          DataField = 'Complemento'
          DataSource = Banco.Cliente_Source
          Enabled = False
          PopupMenu = Banco.PopEdit
          TabOrder = 20
        end
        object DBEdit7: TDBEdit
          Left = 480
          Top = 156
          Width = 97
          Height = 21
          DataField = 'Numero'
          DataSource = Banco.Cliente_Source
          Enabled = False
          PopupMenu = Banco.PopEdit
          TabOrder = 21
        end
        object DBMemo2: TDBMemo
          Left = 88
          Top = 301
          Width = 497
          Height = 132
          DataField = 'OBS'
          DataSource = Banco.Cliente_Source
          Enabled = False
          ScrollBars = ssVertical
          TabOrder = 22
        end
        object ThemeDBGrid2: TThemeDBGrid
          Left = 488
          Top = 40
          Width = 121
          Height = 49
          DataSource = Banco.Cliente_Source
          DefaultDrawing = False
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopupMenu2
          TabOrder = 23
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Visible = False
          OnDrawColumnCell = ThemeDBGrid2DrawColumnCell
          OnDblClick = ThemeDBGrid2DblClick
          OnKeyPress = ThemeDBGrid2KeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'Nome_Razao'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Codigo'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              Width = 92
              Visible = True
            end>
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Produtos'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 461
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 726
          Height = 49
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Button3: TButton
            Left = 4
            Top = 5
            Width = 77
            Height = 25
            Caption = 'add'
            TabOrder = 0
            OnClick = Button3Click
          end
          object Button4: TButton
            Left = 88
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Editar'
            TabOrder = 1
            OnClick = Button4Click
          end
          object Button5: TButton
            Left = 168
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Remover'
            TabOrder = 2
            OnClick = Button5Click
          end
          object Button1: TButton
            Left = 248
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Devolu'#231#227'o'
            TabOrder = 3
            OnClick = Button1Click
          end
        end
        object ThemeDBGrid3: TThemeDBGrid
          Left = 0
          Top = 49
          Width = 726
          Height = 412
          Align = alClient
          DataSource = Banco.Source_Vendas
          DefaultDrawing = False
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = ThemeDBGrid3DrawColumnCell
          OnKeyDown = ThemeDBGrid3KeyDown
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Pagamento'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 461
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        OnResize = Panel1Resize
        object Label6: TLabel
          Left = 456
          Top = 296
          Width = 43
          Height = 13
          Caption = 'Restante'
        end
        object Label2: TLabel
          Left = 456
          Top = 248
          Width = 25
          Height = 13
          Caption = 'Pago'
        end
        object Label5: TLabel
          Left = 456
          Top = 200
          Width = 24
          Height = 13
          Caption = 'Total'
        end
        object Label4: TLabel
          Left = 456
          Top = 152
          Width = 63
          Height = 13
          Caption = 'Desconto - %'
        end
        object Label1: TLabel
          Left = 8
          Top = 13
          Width = 68
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Situa'#231#227'o'
        end
        object Label8: TLabel
          Left = 456
          Top = 104
          Width = 43
          Height = 13
          Caption = 'SubTotal'
        end
        object Label3: TLabel
          Left = 8
          Top = 43
          Width = 68
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Fatura'
        end
        object Label7: TLabel
          Left = 8
          Top = 75
          Width = 68
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Parcelamento'
        end
        object Label25: TLabel
          Left = 376
          Top = 10
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object Image2: TImage
          Left = 400
          Top = 66
          Width = 32
          Height = 32
          Cursor = crHandPoint
          AutoSize = True
          Picture.Data = {
            07544269746D6170360C0000424D360C00000000000036000000280000002000
            0000200000000100180000000000000C0000120B0000120B0000000000000000
            0000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
            F0F0F0D8D6D6988F8F6D5F5F5647484A3B3C493B3B544545695A5C8E8283D1CF
            CEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F5F5F59C9596
            443739070808002722005651007571008683008783007A76005C57002E2A040A
            0B392C2E8C8687EAE9EAF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0B0AEAE2E222400110D
            00645505C4AE0EF3DF18FFF61CFFFF21FFFF21FFFF1EFFFF18FFF70FF7E508CD
            BA007365001A1522191BA09D9EF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F06C676800010002625010D8B7
            19F9D932F7E14BF5E655F6EC57F8F057F9F256F9F256F8F055F7EB4BF5E537F7
            E21FF9DD12E3C0057861000402534A4CECECECF0F0F0F0F0F0F0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F04A424400120C10AA8618EEC42FECCC
            44ECD346EFD942F1E03EF3E338F4E631F5E82FF4E830F3E632F2E23BF1DE46F0
            DB44ECD533ECCC18F0C311BE9600221831292CE4E4E4F0F0F0F0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0F0F0F04E4447001C1214C0901BE7B62EE1BB37E5C6
            32E8CB2FEAD126ECD422EFD840F1E166F4EA84F6EE88F6EC6FF4E647F0DD28EB
            D124E7C833E6C52FE2BB1BE7B418D09F013626302629EEEEEEF0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0787274000C0517B9841BE1A721DAAA28DFB526E1BA
            22E4BF17E5C559F1DFBAFBF5F5FCF8FFFDFEFFFFFFFFFFFFFFFFFFF4FCFCBEF7
            EE65ECD41DE1B924DFB425DBAD1BDEA51ACC9200201352494CF0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0C2C1C20000001697661DDF9B1AD49B20D8A520DBAC1ADDB0
            1BE3BD86ECD5C9DFBB9CD49E69CA8965CA8C94D49FCDE0BFFFF9F5FFFFFFFFFF
            FFFFFEFFA3F1DF20DBAF1CD8A51DD59C1EDC9919B278000000A3A0A1F0F0F0F0
            F0F0F0F0F0F0F0F03C323707462A22D78D1CCF8F1BD2961BD59C19D8A31CDBAE
            6CD7A765CD911BD19407DCAB07E3BB08E3BE08DCB018D39957CC90D5E5C5FFFF
            FFFFFEFFFFFFFFB8F2E11CD59D19D3961DD08F20DA8F0C684120161AEAEAEAF0
            F0F0F0F0F0B1AEB000050021B16E21D0861ECD891DD08F14D39313D69B31D49C
            32CD8D0BDBAB13E1B415E0B514E0B514E0B814E2B912E3BD06DEB225CC88C3E3
            C1FFFFFFFFFEFEFFFFFF99EBD113D08D1FCE8A21CC8523C57C0010058F898BF0
            F0F0F0F0F0574E52043D1E27CE7C23C77D21CA8415CB856CE0B84EDDAE11D394
            16D8A318D9A617DAA818DCAB16DCAD15DCAF17DDAF16DDAD17DCAC0EDBAC28CA
            87DFEEDAFFFFFFFFFEFEFDFEFE57DAA916CA8022C67F26D07F0C5D34352B30F0
            F0F0EAE9EA1510121C884B27C97525C4771BC57A3BD093F5FCF9D2F6E91ED296
            17D3961AD59D18D6A018D7A318D8A518D7A518D7A518D8A519D7A219D7A00AD4
            986ED5A0FFFDFDFFFEFFFFFFFFADEBD214C57923C47826C77423A45B040604D1
            D0D1B7B4B7000A0126B05F27C26C24C17119C272B5ECD3FFFFFFFFFFFF8BE6C4
            0DCE881CD3941CD3981BD39A1AD59B1AD59B1AD59B1AD59B1AD59B1BD4981AD3
            9624CD8ADEF1E1FFFFFFFFFFFFE9F9F331C98222C17028C06D2BC2670020098C
            868985808303270E2DBF6228BC661ABC6377D8A7FFFFFFFFFEFFFFFFFFF3FCF8
            4BD6A115CD871FD18F1ED1911DD2931ED3941ED3941DD3941DD2931DD19015CD
            8706C77BA8E6C6FFFFFFFFFFFFFDFEFE49CC8913BB5F23BA622FC36508421A66
            5E636C656A053D162EC15E25B75A3FC275E9F7F0FFFFFFFEFEFEFEFEFEFFFFFF
            CBF2E223CB8623CD8925CE8B25CF8D26D08E26D08E25D08E22CE8B30D08E7AE0
            B671DDAFC2EFDAFFFFFFFFFEFFFEFEFEA0E1BD79D7A35EC9842AC05B0F562351
            484E615A5F0945182FBD5629B557BBE8CCFFFFFFFEFEFEFEFEFEFEFEFEFFFFFF
            FFFFFF8FE3C121C87F2DCB852CCB872DCC882DCC882DCC882BCC872CC67BC9E4
            C5FFFFFFFFFFFFFEFEFEFEFEFEFDFEFDFFFFFFFFFEFF66C17327BD52145E2445
            3E43615A600944132BB94B63C377EAF0DDEDF3E4FEFEFEFEFEFEFEFEFEF6F9F3
            EAEFDDDFECD648CC882EC87E32CA8032C98232C98232CA8133CA802CC87D49C3
            73EDF4E7FFFFFFFEFEFEFEFEFEFEFEFEFFFFFFABD5A42CB14C31BC50145D2046
            3E456E686D06360C30B74841B14E4BAE4866BD64F9FCF9FFFFFFFFFFFFC7E6CC
            41B3544AB65B41C4753AC97E3AC97E3AC87F3AC87F3AC87E3BC87D3AC67C2EC2
            7288CE92FFFEFDFFFFFFFEFEFEFFFFFFDFEDD947B55636B65434B94912511852
            4B508C878C011F0334B03F3AB34D47B96151BE6AEAF5EAFFFFFFFFFFFFE0F6E8
            45C5793EC47643C67843C67B43C77C44C67C43C77C43C77C43C67B45C57A43C5
            783DBB62C6E1BDFFFFFFFFFFFFFAFAF77BC37A43B85C40B45235B5410B380C69
            6468C2C0C20007002D99313FB34855BB624AB759C4E3C3FFFFFFFFFEFFFDFEFD
            7CD09647C16E4EC4774DC5784DC6794CC6794FC67A50C67A4EC5794EC5774EC4
            7548C17066BF70F0F5EAFFFFFFB3D8AA48B65556BC6542B24D33AA3601180096
            9296F0F0F01B161B1F6C1C3EB13D5DBB6153B95E94D093FFFFFFFEFEFEFFFFFF
            CCECD451C06E57C47558C47758C57858C57858C67959C57959C57859C47759C3
            7559C3754EBC669BCF95E7EEDB63BC6359BC665FBB6440B2422B8825060605D9
            D9DAF0F0F0625C6205270239AD2D5EB85A69BE6C64BB62D8E9CEFFFFFFFEFEFE
            FEFEFDA3DBAC57C06D63C57864C67A63C57964C67A63C67A63C57962C47862C4
            7561C37467C47969C06E74BB6662BD6869BF6B62BA613EB03310410B3F3840F0
            F0F0F0F0F0C0BEC00102012C841C4EB24276C1716DBF6C80C174F2F6ECFFFFFF
            FFFFFFFBFDFBA8DCAE6BC47669C4776FC67B70C77D70C77D6EC67C6AC5776AC5
            7689CD8C7CC57B6EC3736CC16E73C27077C37256B54B3399210007009C999DF0
            F0F0F0F0F0F0F0F04B454D0725013DA72470BC6282C67D75C16D8FC479EFF4E9
            FFFFFFFFFFFFFFFFFFCFEBD294D3997AC98077C87D78C77C7BC87F8ED194B7DF
            B696C88477C2737DC57C7EC57882C67977BF6A42AC2915430729222AF0F0F0F0
            F0F0F0F0F0F0F0F0D1D1D205010722610C4CB02E85C57A91CC8584C4758AC171
            CBE1BCFFFEFEFFFFFFFFFFFFFFFFFFECF7EDE0F4E3E0F4E4E5F3E5CCE2C198C7
            7F84C6798ACB848AC9828ECB818CC87E54B2382A7812000000B2B1B2F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F09290930000002B780C59B23896CB869FD19394CE88
            85C16E9DCB86B9D6A6D8E8CCEBF4E4EEF5E7E1ECD5C3DBB1A6CD9287C07192CC
            8797CF8D97CE8B9BD08F9CCF8D63B64432890E0009006B686CF0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0F0F0F06864690006002B760959B13199CB84AFD6A0
            AAD69EA1D19493C77E8FC47791C47891C4788FC47692C67CA0D192A7D59CA6D3
            99A7D49AAED7A19FCE8B61B43B33860D021300474148F0F0F0F0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0686469000300225F0347A11A83C063
            B1D7A0BFDEB1BDDEB0B8DCACB6DCAAB6DBA9B7DBABB7DCA9B5DAA8B9DCADBFDE
            B1B5D8A58EC56F4FA720286C03000A004B474EF4F5F4F0F0F0F0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F092909309080B0825002F7A02
            52A61F81C05BA8D38FC0DFAFC7E2BAC9E3BDCAE3BEC8E1BBC4DEB2AFD5968AC3
            655AAA263683040E3300020302777479F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0CECDCE4D4950030701
            062300215E003D860658A22165AD316CB3396EB33B66AF3459A6243F8B092565
            00092A000005003D3940C0BFC1F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0BCBBBD
            6360671C191E000700021900092B000B33000B3300082D00021C000008001614
            1856535AAEACAFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
            F0F0F0EDEDEEC1BFC28C898F6D6971615C65605B646C686F858288B8B7B9E8E7
            E8F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
            F0F0}
          OnMouseDown = Image2MouseDown
        end
        object CurrencyEdit4: TCurrencyEdit
          Left = 456
          Top = 120
          Width = 121
          Height = 21
          AutoSize = False
          Enabled = False
          TabOrder = 0
        end
        object CurrencyEdit3: TCurrencyEdit
          Left = 456
          Top = 216
          Width = 121
          Height = 21
          AutoSize = False
          Enabled = False
          TabOrder = 1
          OnExit = CurrencyEdit3Exit
          OnKeyPress = DBLookCidKeyPress
        end
        object CurrencyEdit2: TCurrencyEdit
          Left = 456
          Top = 312
          Width = 121
          Height = 21
          AutoSize = False
          Color = clRed
          Enabled = False
          TabOrder = 2
          OnChange = CurrencyEdit2Change
        end
        object CurrencyEdit1: TCurrencyEdit
          Left = 456
          Top = 264
          Width = 121
          Height = 21
          AutoSize = False
          Enabled = False
          TabOrder = 3
        end
        object DBEdit1: TDBEdit
          Left = 456
          Top = 168
          Width = 121
          Height = 21
          DataField = 'Desconto'
          DataSource = Banco.Pedido_Source
          TabOrder = 4
          OnChange = DBEdit1Change
          OnExit = DBEdit1Exit
          OnKeyPress = DBLookCidKeyPress
        end
        object DBLookCid: TDBLookupComboBox
          Left = 80
          Top = 8
          Width = 209
          Height = 24
          DataField = 'situacao'
          DataSource = Banco.Pedido_Source
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'Codigo'
          ListField = 'Descri'
          ListSource = Banco.Situacao_Source
          NullValueKey = 46
          ParentFont = False
          TabOrder = 5
          OnKeyPress = DBLookCidKeyPress
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 80
          Top = 40
          Width = 209
          Height = 24
          DataField = 'Fatura'
          DataSource = Banco.Pedido_Source
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'Codigo'
          ListField = 'Forma'
          ListSource = Banco.Forma_Pagamento
          ParentFont = False
          TabOrder = 6
          OnClick = DBLookupComboBox2Click
          OnCloseUp = DBLookupComboBox2Click
          OnDropDown = DBLookupComboBox2DropDown
          OnEnter = DBLookupComboBox2Enter
          OnKeyPress = DBLookCidKeyPress
          OnKeyUp = DBLookupComboBox2KeyUp
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 80
          Top = 72
          Width = 313
          Height = 24
          DataField = 'Parcelamento'
          DataSource = Banco.Pedido_Source
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'Codigo'
          ListField = 'Descricao'
          ListSource = Banco.Parcelamento_Source
          ParentFont = False
          TabOrder = 7
          OnClick = DBLookupComboBox3Click
          OnCloseUp = DBLookupComboBox3Click
          OnDropDown = DBLookupComboBox3DropDown
          OnEnter = DBLookupComboBox3Enter
          OnExit = DBLookupComboBox3Exit
          OnKeyPress = DBLookCidKeyPress
        end
        object ListView1: TListView
          Left = 8
          Top = 104
          Width = 425
          Height = 289
          Columns = <
            item
              Caption = 'Vencimento'
              Width = 100
            end
            item
              Caption = 'Valor'
              Width = 100
            end
            item
              Caption = 'Portador'
              Width = 150
            end>
          ColumnClick = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          GridLines = True
          RowSelect = True
          ParentFont = False
          TabOrder = 8
          ViewStyle = vsReport
          OnCustomDrawItem = ListView1CustomDrawItem
          OnCustomDrawSubItem = ListView1CustomDrawSubItem
          OnDblClick = ListView1DblClick
          OnEditing = ListView1Editing
          OnMouseDown = ListView1MouseDown
        end
        object CheckBox1: TCheckBox
          Left = 8
          Top = 400
          Width = 225
          Height = 17
          Caption = 'Somar casas decimais na primeira parcela'
          Checked = True
          State = cbChecked
          TabOrder = 9
        end
        object DBComboBox1: TDBLookupComboBox
          Left = 216
          Top = 160
          Width = 145
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'Descricao'
          ListField = 'Descricao'
          ListSource = Banco.Portador_Source
          ParentFont = False
          TabOrder = 10
          Visible = False
          OnExit = DBComboBox1Exit
          OnKeyDown = DBComboBox1KeyDown
          OnKeyPress = DBComboBox1KeyPress
        end
        object Edit3: TEdit
          Left = 408
          Top = 8
          Width = 169
          Height = 21
          TabOrder = 11
          Text = 'Edit3'
          OnChange = Edit3Change
          OnContextPopup = Edit3ContextPopup
          OnKeyDown = Edit3KeyDown
          OnKeyPress = DBLookCidKeyPress
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Descri'#231#227'o'
      ImageIndex = 3
      object DBMemo1: TDBMemo
        Left = 0
        Top = 0
        Width = 726
        Height = 461
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        DataField = 'Descri'
        DataSource = Banco.Pedido_Source
        PopupMenu = PopupMenu1
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object Panel5: TPanel
    Left = 737
    Top = 0
    Width = 165
    Height = 489
    Align = alRight
    BevelOuter = bvNone
    ParentBackground = True
    TabOrder = 1
    OnResize = Panel5Resize
    object Label26: TLabel
      Left = 1
      Top = 25
      Width = 163
      Height = 24
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeftReadingOnly
      Caption = 'Informa'#231#245'es do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label27: TLabel
      Left = 0
      Top = 56
      Width = 68
      Height = 13
      Caption = 'Ultima Compra'
    end
    object Label28: TLabel
      Left = 0
      Top = 72
      Width = 169
      Height = 17
      AutoSize = False
      Caption = 'Label28'
    end
    object Label29: TLabel
      Left = 2
      Top = 118
      Width = 169
      Height = 17
      AutoSize = False
      Caption = 'Label28'
    end
    object Label30: TLabel
      Left = 0
      Top = 104
      Width = 143
      Height = 13
      Caption = 'Total de compras ja efetuadas'
    end
    object Label31: TLabel
      Left = 0
      Top = 153
      Width = 54
      Height = 13
      Caption = 'Falta Pagar'
    end
    object Label32: TLabel
      Left = -4
      Top = 167
      Width = 169
      Height = 17
      AutoSize = False
      Caption = 'Label28'
    end
    object Label33: TLabel
      Left = 0
      Top = 201
      Width = 51
      Height = 13
      Caption = 'Total pago'
    end
    object Label34: TLabel
      Left = -4
      Top = 215
      Width = 169
      Height = 17
      AutoSize = False
      Caption = 'Label28'
    end
    object SpeedButton2: TSpeedButton
      Left = 1
      Top = 259
      Width = 25
      Height = 22
      Cursor = crHandPoint
      BiDiMode = bdLeftToRight
      Caption = '>>'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Wide Latin'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      ParentBiDiMode = False
      Spacing = 0
      OnClick = SpeedButton2Click
    end
    object Label38: TLabel
      Left = 1
      Top = 305
      Width = 163
      Height = 24
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeftReadingOnly
      Caption = 'Contas Atrasadas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label41: TLabel
      Left = -4
      Top = 343
      Width = 169
      Height = 17
      AutoSize = False
      Caption = 'Label28'
    end
    object Label42: TLabel
      Left = 0
      Top = 329
      Width = 51
      Height = 13
      Caption = 'Valor Total'
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 489
    Width = 902
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel6'
    TabOrder = 2
    object StatusBar1: TStatusBar
      Left = 0
      Top = 0
      Width = 902
      Height = 41
      Align = alClient
      Panels = <
        item
          Alignment = taCenter
          Text = 'Registros'
          Width = 150
        end
        item
          Alignment = taCenter
          Text = 'Pre'#231'o Total'
          Width = 300
        end
        item
          Width = 50
        end>
    end
    object BitBtn1: TBitBtn
      Left = 554
      Top = 7
      Width = 97
      Height = 30
      Cursor = crHandPoint
      Caption = 'Finalizar'
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0DED081A4824E80503E743F39703A3970
        3A3F743F4E805080A381CEDCCEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3E0D45B885C356D36467D47447E45
        3674382D6C2E2D6A2E366F37447745467947356D3659885AD1DED2FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9AB69A316A324C854E30
        78330D5F10005404005102005003004D03004A010048020C500E3069314C7E4D
        316A3297B497FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84A884376F
        394487470A640E005A03055C09065A0A065809065609065409065208064F0805
        4C07004701094E0B43774439703A80A580FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9DB99D376F393C884100620405620907610B065F0B045B0802580606580A0656
        09065409065208064F08064D08044B060047013A713C396F3A99B799FFFFFFFF
        FFFFFFFFFFD9E4D92D662E458D4800670506670B07660B07640B045E0709610D
        14661800550206590A065609065409065208064F08064D08064C080046014377
        442E692FD5E1D5FFFFFFFFFFFF5B8A5C4C8A4F0B7311056B0A076A0C07680C03
        6307035E04A2C4A4D4E3D41F6B2100530006590A065609065409065208064F08
        064D08044B06094E0B4C7E4D578659FFFFFFD6E2D6326D34328B37006D05076E
        0D076C0C0367070263059CC29DFFFFFFFFFFFFD3E3D4216C2300530006580A06
        5609065409065208064F08064D08004701306A31326D34D3DFD387A8874D894F
        2085260C751108710D026B070569089EC5A0FFFFFFFFFFFFFFFFFFFFFFFFD6E5
        D7226D2400530006590A065609065409065208064F08054C070C510E45794681
        A582508151569959268A2B1E82230C76120B710FA6CCA9FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFD6E5D7226D2400530006590A065609065409065208064F
        080049024378454D804F3C723E62A7653492392B8A3028872EAED2B1FFFFFFFC
        FDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6E5D7226D2400530006590A
        065609065409065208004B013770393E753F376F396DB071449C4938943EB1D4
        B3FFFFFFF0F7F1F6FAF6FFFFFF96C19864A166FDFEFDFFFFFFFFFFFFFFFFFFD6
        E5D7226D2400530006590A065609065409004E022E6C3038703A386F397AB87D
        55A75B499E4E7CB87FE9F2E8F4F9F3FBFDFC8DBE90016A0500600062A165FDFE
        FDFFFFFFFFFFFFFFFFFFD6E5D7226D2400530006590A0656090050032E6E3038
        703A3A713C84BC8767B26B5EAB63499E4D7DB980EBF4EC99C69C0A7510006C06
        066E0C00620062A165FDFEFDFFFFFFFFFFFFFFFFFFD6E5D7226D240053000659
        0A00520237763A3F74404E804E81B3847BBF806EB57264AE6854A45967AD6B45
        994938903D167B1C036E09056E0B00620062A165FDFEFDFFFFFFFFFFFFFFFFFF
        D6E5D7267028025705015504447E464F805089A98969996B96CF9A7DBE8274B8
        786AB16E5BA86055A3594E9D5243964720812606700C036D0900620062A165FD
        FEFDFFFFFFFFFFFFFFFFFFC4DAC6065A080C5F10447C4784A785D8E3D8326C34
        A8D4AB8EC89184C1887ABB7E70B47466AE6A5CA76053A0584B9A4F338C381378
        19046C0A00610061A064FCFDFCFFFFFFEEF4EE488A4A005600317934326B34D6
        E2D6FFFFFF5C895C7EAA80ACDBAF93CA978AC48E80BE8477B87B6DB17163AA66
        58A45D519E554496492D873216771B00640065A368DEEBDE418A450058000B65
        0F4C844E5A885CFFFFFFFFFFFFDDE7DD28632AAED1B0ABD9AE9ACD9D90C79487
        C18A7CBB8073B47669AE6C5EA76255A0594C9A504292463287371E79232A7F2E
        07680D05660A4688482D682FD9E5D9FFFFFFFFFFFFFFFFFFA4BDA4386F39BDDC
        BEB2DCB4A0CFA397CA9A8DC49082BE8679B77C6FB17265AA685AA35F509C5447
        954B3D8E422D8331247D294E9252356E37A0BCA0FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8CAB8C386F39B5D4B6BFE4C2A8D4AA9CCD9F93C79689C18C7FBB8275B4
        786BAE6E61A765569F5A49974D4A984F639F66366F3888A888FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFA2BBA22C652D87AD88C0DFC2BCE1BFA9D6AC
        9BCD9E8FC59284BE887BB97E74B57773B47777B17A6597673068319EB99EFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAE5DA5D895D35
        6D36749E759AC09CA9CEABA8D0AAA0CBA294C29680B082639465356D365D8A5E
        D8E3D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFD6E2D68AA98A4E7F4F3A713C376F39376F393B713C4F805188
        A888D4E0D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object BitBtn2: TBitBtn
      Left = 455
      Top = 7
      Width = 97
      Height = 31
      Cursor = crHandPoint
      Caption = 'Voltar'
      TabOrder = 2
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C30E0000C30E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D7DA9CA1B0717A995F6B91606C
        92737D999FA4B0D8D9DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5AAB745568C09237D031C7C
        031C7D031B7B031B7C031D80021F830A268248598CAAAEB7FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADBE04B5D9402238D02
        2597012BA70131BA0136C80137CB0137CA0134C0012DAD022598022392022593
        50618FDDDDDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C6D11A37
        92022AA70135C80040E80045F60046F90046F90046F90046F90046F90045F700
        42EE0139D3022CAB0229A41D3B91C5C6CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        D1D4DD11339A0130BF003CE40041F30038EF003CF00040EE003FEE003FEE003F
        EE003FEE0040EE0040F00038F1003CED0133C6022DB2153798D5D6D7FFFFFFFF
        FFFFFFFFFFF2F3F52D489B0132C9003BE7003BEB0032E94A70E5204ACC0033E9
        003BE8003BE8003BE8003BE8003AE80033E85174E11342D00037EE0035D1012F
        C1334B91F4F4F4FFFFFFFFFFFF7D8AB5002FC30036E10036E40232E25575E1FE
        FEFBD3D5E31A3CC5002EE30036E30036E20035E2002AE0738FEDFFFFFEBBC2DC
        163CCB0034E60032D2012CC1838B9FFFFFFFE8EAF01232A4002FD90031DE002D
        DC1C45DDD9DADCEDECE3FFFFFFCED2E21938C10028E00030DF0023DC6E87EAFF
        FFFFFFFFFFFFFFFF7B90DA0026D9002FD90024C8173198ECECEC979FBE011DC4
        0124CF002BD4002BD50127D64963DAD9D9DBEBEAE4FFFFFFD3D6E41E3AC20017
        DB768BEBFFFFFFFFFFFFFFFFFFA8B6F10E31D90028D30024CB011AC7011CC1A1
        A5AF5363A20214CD0218C30120C80125D00126D6001BD94158DCD6D6DBEDECE5
        FFFFFFCDD1E58A96DFFFFFFFFFFFFFFFFFFFA4B0F00624D9001FD50121CC0119
        C10214C40216CF5D69952A40A80212C40213BF0217C6011DD10120D70121D900
        15D93B50DAD4D5DBEBEAE6FFFFFFFFFFFFFFFFFFFFFFFF9EA9EF021CD7001CD7
        011FD5011AD10215CA0213C20214C73A4B94142BAA0211BD0213C40116D20119
        D6011BD6011DD6011ED7000FD7394DD9D9D9DAE9E9E7FFFFFFFFFFFFABB2E400
        10D30019D7011DD6011BD60119D70117D40214C90213C32B3D971329A60212C1
        0116D10119D80119D80119D7011BD70018D70013D77883D9E0E0DCF3F3F1FFFF
        FFFFFFFFD5D8E82637BD000ED6011AD80119D70119D80119D70118D40214CA2A
        3C96243AAB0215CE0119D9011AD9011AD9011AD90016D90012D97E88DAEAE8DD
        F5F5F3FFFFFFF8F8FEFFFFFFFFFFFFDFE1E92E3DBE000CD7011ADA011AD9011A
        D9011AD90218D8384893495CB60219DA011ADC011ADB011BDB0017DB0215DB84
        8DDBEBE9DDF6F6F5FFFFFF8793EC3446E2E1E4FBFFFFFFFFFFFFE3E5EB3443C0
        000ED8011BDC011BDB001ADD021BDB586392A7B0D60018D70018DE0018DD0019
        DE0A1EDE8E96DBEDEBDDF6F6F5FFFFFFAAB3F22E46E3263DE25569E9E8EBFCFF
        FFFFFFFFFFE7E9EC3948C20015DD001BDE041FE30620CC979BA9F6F7F91933C5
        263EEA2840E60016E01D36E2CBCFE2FCFBF6FFFFFFC0C7F57383EE7A8AF07989
        EF6679ED7F8EF0EDEFFDFFFFFFFFFFFF6575E40011DD021EE11D37EC182D9FE6
        E6E6FFFFFF96A1D27E8FF1909EF42B44E93A52EB8898F3EAEDFED0D6F895A2F4
        9DA9F59DA9F598A4F5909EF47C8DF28F9DF4E7EAFC9FAAF31834E8001DE52944
        EE2C45DD777D99FFFFFFFFFFFFF9F9FB697BCBC2CBFF7788F37587F399A6F7AB
        B6F8B2BCF8BBC5F9BFC8FABBC5F9B3BEF9A8B3F89BA8F78697F58393F4687BF2
        3A54EE3953F05A70F7324395EEEEEEFFFFFFFFFFFFFFFFFFE3E5EF6C7FD998A7
        FF7084F6A4B0F9BAC5FACFD7FCDEE3FDE3E7FDDCE2FDCFD6FCBDC7FBACB7FA9A
        A7F98193F77083F6778AF88294FF3348B1C7C7CBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD5DAEA6C7FD6A7B4FFCED6FFC0C9FCC6CFFCE1E6FEF1F3FEE6EBFED3DA
        FDBDC8FDA7B4FB95A4FA97A7FAAFBCFFA0AEFF4052B0B2B3BBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE9EBF28A97CBB8C3F2E2E7FFD3DAFFC0CAFE
        C2CCFEBCC7FEB8C3FDB8C3FEBFC9FFD0D8FFCED8FF8D9DEA53619BCCCCCFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFDC4CAE095
        A1CFAEB8E3D6DCFAE6EBFFE9EEFFEAEFFFE1E7FFC6CFFA8E9CDA6370AB9296A9
        F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFDFDFEE3E5EFA7AFD2909BC68991C1828CBF7681B0848DB0BF
        C1CAF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Arquivos de Textos|*.txt|Todos os Arquivos|*.*'
    Left = 4
    Top = 456
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Todos os Arquivos|*.*|Arquivos de Textos|*.txt'
    Left = 32
    Top = 456
  end
  object PopupMenu1: TPopupMenu
    Left = 60
    Top = 456
    object CopiarTUdo1: TMenuItem
      Caption = 'Copiar Tudo'
      OnClick = CopiarTUdo1Click
    end
    object Limpar1: TMenuItem
      Caption = 'Limpar'
      OnClick = Limpar1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Abrir1: TMenuItem
        Caption = 'Abrir...'
        OnClick = Abrir1Click
      end
      object Salvar1: TMenuItem
        Caption = 'Salvar como...'
        OnClick = Salvar1Click
      end
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 92
    Top = 456
    object OpesdaTabela1: TMenuItem
      Caption = 'Op'#231#245'es da Tabela'
      OnClick = OpesdaTabela1Click
      object Largura1: TMenuItem
        Caption = 'Altura...'
        OnClick = Largura1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Fonte1: TMenuItem
        Caption = 'Fonte...'
        OnClick = Fonte1Click
      end
      object Colunas1: TMenuItem
        Caption = 'Colunas...'
        OnClick = Colunas1Click
      end
      object Cor1: TMenuItem
        Caption = 'Cor...'
        OnClick = Cor1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object IxibirTtulo1: TMenuItem
        Caption = 'Exibir T'#237'tulo'
        OnClick = IxibirTtulo1Click
      end
    end
  end
end
