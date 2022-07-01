object FABCCliente: TFABCCliente
  Left = 241
  Top = 154
  Width = 794
  Height = 488
  Caption = 'FABCCliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 56
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Gera'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 128
    Width = 585
    Height = 289
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object CheckBox1: TCheckBox
    Left = 160
    Top = 32
    Width = 97
    Height = 17
    Caption = 'datas'
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 160
    Top = 48
    Width = 186
    Height = 21
    Date = 41929.666267916670000000
    Time = 41929.666267916670000000
    TabOrder = 3
  end
  object DateTimePicker2: TDateTimePicker
    Left = 352
    Top = 48
    Width = 186
    Height = 21
    Date = 41929.666305648150000000
    Time = 41929.666305648150000000
    TabOrder = 4
  end
  object TB_Pedido: TADOQuery
    Connection = Banco.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select  A.id_cliente, A.preco, A.data_hora, A.Situacao, B.codigo' +
        ', B.baixaestoque from'
      'Venda_info A left join situacao_pedido B on'
      'A.situacao = b.codigo')
    Left = 24
    Top = 40
    object TB_Pedidoid_cliente: TIntegerField
      FieldName = 'id_cliente'
    end
    object TB_Pedidopreco: TBCDField
      FieldName = 'preco'
      Precision = 19
    end
    object TB_PedidoSituacao: TIntegerField
      FieldName = 'Situacao'
    end
    object TB_Pedidocodigo: TAutoIncField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object TB_Pedidobaixaestoque: TBooleanField
      FieldName = 'baixaestoque'
    end
    object TB_Pedidodata_hora: TDateTimeField
      FieldName = 'data_hora'
    end
  end
  object TB_ABC: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 56
    Top = 40
    object TB_ABCCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object TB_ABCTotal: TCurrencyField
      FieldName = 'Total'
    end
    object TB_ABCUltimaCompra: TDateField
      FieldName = 'UltimaCompra'
    end
  end
  object DataSource1: TDataSource
    DataSet = TB_Pedido
    Left = 88
    Top = 40
  end
end
