object Fsituacao_New: TFsituacao_New
  Left = 348
  Top = 290
  BorderStyle = bsDialog
  Caption = 'Fsituacao_New'
  ClientHeight = 209
  ClientWidth = 409
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
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 393
    Height = 193
  end
  object Label1: TLabel
    Left = 14
    Top = 46
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 14
    Top = 15
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'C'#243'digo'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 14
    Top = 79
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Cor da Fonte'
  end
  object Label4: TLabel
    Left = 14
    Top = 111
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Cor do Fundo'
  end
  object DBEdit1: TDBEdit
    Left = 84
    Top = 46
    Width = 301
    Height = 21
    DataField = 'Descri'
    DataSource = Banco.Situacao_Source
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 84
    Top = 15
    Width = 69
    Height = 21
    DataField = 'Codigo'
    DataSource = Banco.Situacao_Source
    Enabled = False
    TabOrder = 1
  end
  object DBCheckBox1: TDBCheckBox
    Left = 84
    Top = 142
    Width = 97
    Height = 17
    Caption = 'BaixaEstoque'
    DataField = 'BaixaEstoque'
    DataSource = Banco.Situacao_Source
    TabOrder = 2
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object BitBtn2: TBitBtn
    Left = 193
    Top = 154
    Width = 97
    Height = 31
    Cursor = crHandPoint
    Caption = 'Cancelar'
    TabOrder = 3
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
  object BitBtn1: TBitBtn
    Left = 292
    Top = 155
    Width = 97
    Height = 30
    Cursor = crHandPoint
    Caption = 'Adicionar'
    TabOrder = 4
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
  object Edit1: TEdit
    Left = 84
    Top = 79
    Width = 133
    Height = 21
    Cursor = crHandPoint
    TabOrder = 5
    OnContextPopup = Edit2ContextPopup
    OnKeyPress = Edit1KeyPress
    OnMouseDown = Edit1MouseDown
  end
  object Edit2: TEdit
    Left = 84
    Top = 111
    Width = 133
    Height = 21
    Cursor = crHandPoint
    TabOrder = 6
    OnContextPopup = Edit2ContextPopup
    OnKeyPress = Edit1KeyPress
    OnMouseDown = Edit2MouseDown
  end
end
