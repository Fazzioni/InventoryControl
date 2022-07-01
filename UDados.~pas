unit UDados;

interface

uses
  SysUtils,Graphics, Classes, DB, ADODB, ImgList, Controls,Forms, AppEvnts, XPMan,
  ppBands, ppCache, ppClass, ppDesignLayer, ppParameter, ppDB, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppReport, DBClient, ppPrnabl, ppCtrls, dialogs,
  ppVar,Shellapi,  Inifiles, ppStrtch, ppMemo,ThemeDBGrid,dbgrids,
  Windows,Buttons,   Messages, Variants,ExtCtrls, Menus,StdCtrls,DBCtrls,ComCtrls,
  ppModule, daDataModule,DateUtils,Printers;


type
  TBanco = class(TDataModule)
    ADOConnection1: TADOConnection;
    TBClientes: TADOQuery;
    TBMunicipio: TADOQuery;
    TBMunicipioUF: TWideStringField;
    TBMunicipioCidade: TWideStringField;
    TBMunicipioDDD: TWideStringField;
    TBMunicipioCEP: TWideStringField;
    Cliente_Source: TDataSource;
    Municipio_Source: TDataSource;
    TBLogra: TADOTable;
    TBLograCodigo: TAutoIncField;
    TBLograTipo: TWideStringField;
    AppEvents: TApplicationEvents;
    TBEstoque: TADOQuery;
    Estoque_Source: TDataSource;
    TBEstUn: TADOTable;
    TBEstUnCodigo: TAutoIncField;
    TBEstUnSinb: TWideStringField;
    TBEstUnDescri: TWideStringField;
    XPManifest1: TXPManifest;
    TB_Pedido: TADOQuery;
    TB_Vendas_All: TADOQuery;
    TB_Vendas_AllCodigo: TAutoIncField;
    TB_Vendas_AllID_mercadoria: TIntegerField;
    TB_Vendas_AllID_Pedido: TIntegerField;
    Pedido_Source: TDataSource;
    Report: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    TB_GeraPedido: TClientDataSet;
    TB_GeraPedidoCodigo: TIntegerField;
    TB_GeraPedidoQtd: TIntegerField;
    TB_GeraPedidoUnidade: TStringField;
    TB_GeraPedidoDescricao: TStringField;
    Source_GeraPedido: TDataSource;
    PP_Pipeline1: TppDBPipeline;
    PP_Pedido: TppLabel;
    PP_Data: TppLabel;
    PP_Endereco: TppLabel;
    PP_CEp: TppLabel;
    PP_Contato: TppLabel;
    PP_CNPJ: TppLabel;
    PP_IE: TppLabel;
    PP_DESCRI: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    PP_TEL: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine15: TppLine;
    ppTitleBand1: TppTitleBand;
    TB_GeraPedidoPrecoUnit: TFloatField;
    TB_GeraPedidoTotal: TFloatField;
    ppSummaryBand1: TppSummaryBand;
    ppSystemVariable1: TppSystemVariable;
    ppLine23: TppLine;
    PP_Pedido1: TppLabel;
    PPPrecoTotal: TppLabel;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Qtd: TIntegerField;
    ClientDataSet1cod: TIntegerField;
    TBClientesCodigo: TAutoIncField;
    TBClientesNome: TWideStringField;
    TBClientesNome_Razao: TWideStringField;
    TBClientesLogr_Tipo: TIntegerField;
    TBClientesLogradouro: TWideStringField;
    TBClientesNumero: TWideStringField;
    TBClientesComplemento: TWideStringField;
    TBClientesBairro: TWideStringField;
    TBClientesUF: TWideStringField;
    TBClientesMuniciopio: TIntegerField;
    TBClientesCep: TWideStringField;
    TBClientesOBS: TWideStringField;
    TBClientesEmail: TWideStringField;
    TBClientesTel_Res: TWideStringField;
    TBClientesTel_Come: TWideStringField;
    TBClientesTel_Cel: TWideStringField;
    TBClientesTel_Fax: TWideStringField;
    TBClientesDDD_Res: TWideStringField;
    TBClientesDDD_Come: TWideStringField;
    TBClientesDDD_Cel: TWideStringField;
    TBClientesDDD_Fax: TWideStringField;
    TBClientesIE: TWideStringField;
    TBClientesIM: TWideStringField;
    TBClientesCidade_Virtual: TStringField;
    TBLOG_Source: TDataSource;
    TB_PedidoID_Pedido: TAutoIncField;
    TB_PedidoData_Hora: TDateTimeField;
    TB_PedidoTotal_Reg: TIntegerField;
    TB_PedidoPreco: TBCDField;
    TBClientesLogTypeVirtual: TStringField;
    un_source: TDataSource;
    Agenda_Source: TDataSource;
    Report_Info: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    PP_Info_Data: TppLabel;
    ppLine22: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLabel15: TppLabel;
    ppLine24: TppLine;
    ppPipeline2: TppDBPipeline;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppTitleBand2: TppTitleBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLine28: TppLine;
    ppLine32: TppLine;
    ppLine30: TppLine;
    ppLine29: TppLine;
    ppLine31: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppSystemVariable2: TppSystemVariable;
    PP_Info_Total_Pedido: TppLabel;
    PP_Info_Total_Preco: TppLabel;
    TB_PedidoID_cliente: TIntegerField;
    TB_Situacao: TADOQuery;
    TB_SituacaoDescri: TWideStringField;
    Situacao_Source: TDataSource;
    TB_PedidoDesconto: TBCDField;
    TB_Pedidosituacao: TIntegerField;
    TB_PedidoDescri: TMemoField;
    TBMunicipioCodigo: TAutoIncField;
    TB_Vendas_AllValor_un: TBCDField;
    TB_Vendas_AllValor_Total: TBCDField;
    TB_Vendas_AllQtd: TBCDField;
    TB_SituacaoCodigo: TAutoIncField;
    TB_SituacaoColor: TIntegerField;
    TB_PedidoColor: TIntegerField;
    TB_PedidoComprador_Nome: TWideStringField;
    Source_Vendas: TDataSource;
    TB_Vendas_AllDescri: TStringField;
    TB_Vendas_AllUNMerca: TStringField;
    TBEstoqueCodigo: TAutoIncField;
    TBEstoqueDescricao: TWideStringField;
    TBEstoqueUn: TIntegerField;
    TBEstoqueValor: TBCDField;
    TBEstoqueun_virtual: TStringField;
    TB_Funcionarios: TADOQuery;
    Funcionarios_Source: TDataSource;
    TB_FuncionariosNome: TWideStringField;
    TB_FuncionariosLogr_Tipo: TIntegerField;
    TB_FuncionariosLogradouro: TWideStringField;
    TB_FuncionariosNumero: TWideStringField;
    TB_FuncionariosComplemento: TWideStringField;
    TB_FuncionariosBairro: TWideStringField;
    TB_FuncionariosUF: TWideStringField;
    TB_FuncionariosMuniciopio: TIntegerField;
    TB_FuncionariosCep: TWideStringField;
    TB_FuncionariosOBS: TWideStringField;
    TB_FuncionariosEmail: TWideStringField;
    TB_FuncionariosTel_Res: TWideStringField;
    TB_FuncionariosTel_Cel: TWideStringField;
    TB_FuncionariosDDD_Res: TWideStringField;
    TB_FuncionariosDDD_Cel: TWideStringField;
    TB_FuncionariosFotos: TBlobField;
    TB_FuncionariosRG: TWideStringField;
    TB_Setor: TADOQuery;
    Emprego_Source: TDataSource;
    TB_FuncionariosCdigo: TAutoIncField;
    TB_FuncionariosTb_Logra: TStringField;
    TB_FuncionariosSetorVirtual: TStringField;
    TB_FuncionariosNascimento: TDateTimeField;
    TB_FuncionariosCidadeVirtual: TStringField;
    TB_PedidoSituacao_Virtual: TStringField;
    TB_Pedidonome_razao: TWideStringField;
    TB_Pedidocpf: TWideStringField;
    TB_FormaPagamento: TADOQuery;
    TB_FormaPagamentocodigo: TAutoIncField;
    TB_FormaPagamentoForma: TWideStringField;
    Forma_Pagamento: TDataSource;
    TB_FuncionariosAtivo: TBooleanField;
    TBClientesAtivo: TBooleanField;
    TBEstoqueAtivo: TBooleanField;
    TB_Emitente: TADOQuery;
    TB_EmitenteCodigo: TAutoIncField;
    TB_EmitenteConfiName: TWideStringField;
    TB_EmitenteValor: TWideStringField;
    PopEdit: TPopupMenu;
    FormatarString1: TMenuItem;
    TB_Fotos: TADOQuery;
    TB_FotosCodigo: TAutoIncField;
    TB_FotosValor: TWideStringField;
    TB_FotosFoto: TBlobField;
    ColorDialog: TColorDialog;
    FontDialog: TFontDialog;
    TB_Carta: TADOQuery;
    TB_CartaCodigo: TAutoIncField;
    TB_CartaModulo: TIntegerField;
    TB_CartaDescricao: TWideStringField;
    TB_CartaCarta: TBlobField;
    Carta_Source: TDataSource;
    TB_SetorCodigo: TAutoIncField;
    TB_SetorDescricao: TWideStringField;
    TB_FuncionariosSetor: TIntegerField;
    TB_FuncionariosPIS: TWideStringField;
    TB_FuncionariosCPF: TWideStringField;
    TBClientesCPF: TWideStringField;
    TB_Municipio_new: TADOQuery;
    TB_Municipio_newCodigo: TAutoIncField;
    TB_Municipio_newUF: TWideStringField;
    TB_Municipio_newCidade: TWideStringField;
    TB_Municipio_newCEP: TWideStringField;
    Municipio_Source_new: TDataSource;
    db_funcionarios: TppDBPipeline;
    Rp_funcionarios: TppReport;
    ppParameterList3: TppParameterList;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    RP_Empresa: TppLabel;
    ppImage1: TppImage;
    ppTitleBand3: TppTitleBand;
    RP_CNPJ: TppLabel;
    PP_TipoRelatorio: TppLabel;
    ppLabel12: TppLabel;
    ppDBText12: TppDBText;
    ppLabel13: TppLabel;
    ppDBText13: TppDBText;
    ppLabel16: TppLabel;
    ppDBText15: TppDBText;
    ppLabel18: TppLabel;
    ppDBText17: TppDBText;
    Rp_Dav: TppReport;
    RP_Dav_DB: TppDBPipeline;
    ppParameterList4: TppParameterList;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    PP_Dav_Emit_Razao: TppLabel;
    PP_Dav_Emit_CNPJ: TppLabel;
    PP_Dav_Emit_Local: TppLabel;
    PP_Dav_Emit_Cep: TppLabel;
    PP_Dav_Emit_Contato: TppLabel;
    ppLine27: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    PP_Dav_Title: TppLabel;
    ppLine45: TppLine;
    ppLine46: TppLine;
    PP_Dav_NDoc: TppLabel;
    PP_Dav_Vendedor_Title: TppLabel;
    PP_Dav_Vali_title: TppLabel;
    ppLine47: TppLine;
    PP_Dav_Dav_Title: TppLabel;
    PP_Dav_Date_Title: TppLabel;
    PP_Dav_Hora_Title: TppLabel;
    PP_Dav_NDav: TppLabel;
    PP_Dav_Vendedor: TppLabel;
    PP_Dav_Date_Validade: TppLabel;
    PP_Dav_Data: TppLabel;
    PP_Dav_Time: TppLabel;
    PP_Dav_Solici_Title: TppLabel;
    PP_Dav_Soli_Nome_Title: TppLabel;
    PP_Dav_Soli_Fantasia_Title: TppLabel;
    PP_Dav_Soli_Endereco_Title: TppLabel;
    PP_Soli_Cep_TItle: TppLabel;
    ppLine48: TppLine;
    PP_Dav_Soli_CPF_Title: TppLabel;
    PP_Dav_Soli_RG_Title: TppLabel;
    PP_Dav_Soli_IM_Title: TppLabel;
    PP_Soli_CIDUF_Title: TppLabel;
    PP_DAV_Soli_TelCom_Title: TppLabel;
    PP_DAv_TelCel_Title: TppLabel;
    PP_DAV_Soli_Nome: TppLabel;
    PP_Dav_Soli_Fanta: TppLabel;
    PP_Dav_Soli_Endereco: TppLabel;
    PP_Dav_Soli_Cep: TppLabel;
    PP_Dav_Soli_TelCom: TppLabel;
    PP_Dav_Soli_Cel: TppLabel;
    PP_Dav_Soli_Cid: TppLabel;
    PP_Dav_Soli_Bairro_Title: TppLabel;
    PP_Dav_Soli_Bairro: TppLabel;
    PP_Dav_Soli_CNPJ: TppLabel;
    PP_Dav_Soli_IE: TppLabel;
    PP_Dav_Soli_IM: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    ppTitleBand4: TppTitleBand;
    PP_Dav_Relacao: TppLabel;
    ppLabel14: TppLabel;
    ppDBText14: TppDBText;
    ppLabel17: TppLabel;
    ppDBText16: TppDBText;
    ppLabel19: TppLabel;
    ppDBText18: TppDBText;
    ppLabel20: TppLabel;
    ppDBText19: TppDBText;
    ppLabel21: TppLabel;
    ppDBText20: TppDBText;
    ppLabel22: TppLabel;
    ppDBText21: TppDBText;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    PP_Dav_VEDADO: TppLabel;
    PP_Dav_NDav_2: TppLabel;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    PP_Dav_SubTotal: TppLabel;
    PP_Dav_Deconto: TppLabel;
    PP_Dav_Total: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    TBEstoque_Quant: TADOQuery;
    TBEstoque_QuantID_Merca: TIntegerField;
    TBEstoque_QuantLastDate: TDateTimeField;
    ExecSQLTB: TADOQuery;
    TB_SituacaoBaixaEstoque: TBooleanField;
    TB_Vendas_AllQuantiBaixa: TBCDField;
    TBEstoque_QuantQuant: TBCDField;
    TBEstoque_QuantCompraDate: TDateTimeField;
    TBEstoqueQuantidade: TFloatField;
    TB_Parcelamento: TADOQuery;
    TB_ParcelamentoCodigo: TAutoIncField;
    TB_ParcelamentoDescricao: TWideStringField;
    TB_ParcelamentoIntervaloDias: TIntegerField;
    TB_Parcelamentoentrada: TBooleanField;
    TB_ParcelamentoParcelas: TIntegerField;
    TB_Parcelamentoativo: TBooleanField;
    TB_ParcelamentoFormaPagamento: TIntegerField;
    Parcelamento_Source: TDataSource;
    TB_ParcelamentoFormaPagamentoVirtual: TStringField;
    TB_Contas: TADOQuery;
    TB_ContasCodigo: TAutoIncField;
    TB_ContasNPedido: TIntegerField;
    TB_ContasDataCreate: TDateTimeField;
    TB_ContasDataVencimento: TDateTimeField;
    TB_ContasValor: TBCDField;
    TB_ContasPortador: TIntegerField;
    TB_ContasPagada: TBooleanField;
    TB_ContasDataPagada: TDateTimeField;
    TB_ContasFuncRecebe: TIntegerField;
    TB_ContasDuplicata: TIntegerField;
    TB_ContasDescricao: TWideStringField;
    TB_ContasID_Cliente: TIntegerField;
    Contas_source: TDataSource;
    TB_PedidoFatura: TIntegerField;
    TB_PedidoParcelamento: TIntegerField;
    TB_ClientesInfo: TADOQuery;
    TB_ClientesInfoID_Cliente: TIntegerField;
    TB_ClientesInfoApagar: TBCDField;
    TB_ClientesInfoPago: TBCDField;
    TB_ClientesInfoUltimaCompra: TDateTimeField;
    ppLabel23: TppLabel;
    PP_Dav_Pagamento_Desc: TppLabel;
    TB_Portador: TADOQuery;
    TB_PortadorCodigo: TAutoIncField;
    TB_PortadorDescricao: TWideStringField;
    Portador_Source: TDataSource;
    TB_PedidoFaturaVirtual: TStringField;
    TB_PedidoParcelamentoVirtual: TStringField;
    TB_SituacaoBrashColor: TIntegerField;
    TB_PedidoColorBrush: TIntegerField;
    TB_Config: TADOQuery;
    TB_ConfigCodigo: TIntegerField;
    TBParcelamentoVirtual: TADOQuery;
    TBParcelamentoVirtualCodigo: TAutoIncField;
    TBParcelamentoVirtualDescricao: TWideStringField;
    TBParcelamentoVirtualIntervaloDias: TIntegerField;
    TBParcelamentoVirtualentrada: TBooleanField;
    TBParcelamentoVirtualParcelas: TIntegerField;
    TBParcelamentoVirtualativo: TBooleanField;
    TBParcelamentoVirtualFormaPagamento: TIntegerField;
    TB_ConfigValor: TWideStringField;
    TB_Pedido_Histo: TADOQuery;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    DateTimeField1: TDateTimeField;
    IntegerField2: TIntegerField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    IntegerField3: TIntegerField;
    MemoField1: TMemoField;
    IntegerField4: TIntegerField;
    StringField1: TStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField7: TIntegerField;
    TB_Contas_Histo: TADOQuery;
    AutoIncField2: TAutoIncField;
    IntegerField8: TIntegerField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    BCDField3: TBCDField;
    IntegerField9: TIntegerField;
    BooleanField1: TBooleanField;
    DateTimeField4: TDateTimeField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    WideStringField4: TWideStringField;
    IntegerField12: TIntegerField;
    TB_Carta_Favorito: TADOQuery;
    TB_Carta_FavoritoCodigo: TIntegerField;
    TB_Carta_FavoritoHotKey: TIntegerField;
    TB_Carta_FavoritoDescricao: TStringField;
    TB_CartaFavorito: TBooleanField;
    TB_Carta_FavoritoFavorito: TBooleanField;
    TB_FuncionariosPassword: TWideStringField;
    TB_ContasPortadorVirtual: TStringField;
    TB_PedidoUF: TWideStringField;
    TB_Pedido_Histonome: TWideStringField;
    TB_Pedido_HistoUF: TWideStringField;
    TB_Pedido_HistoMuniciopio: TIntegerField;
    TB_PedidoMunicipioVirtual: TStringField;
    TB_Pedidonome2: TWideStringField;
    TB_PedidoMuniciopio: TIntegerField;
    TB_Agenda: TADOQuery;
    TB_AgendaCodigo: TAutoIncField;
    TB_AgendaContato_Forma: TIntegerField;
    TB_AgendaData_Criado: TDateTimeField;
    TB_AgendaData: TDateTimeField;
    TB_AgendaConteudo: TWideStringField;
    TB_AgendaAssunto: TWideStringField;
    TB_AgendaEfetuado: TBooleanField;
    TB_AgendaID_Cliente: TIntegerField;
    TB_Agendanome_razao: TWideStringField;
    TB_Agendanome: TWideStringField;
    TB_AgendaUF: TWideStringField;
    TB_AgendaMuniciopio: TIntegerField;
    TB_Agendacpf: TWideStringField;
    TB_AgendaTipo: TIntegerField;
    TB_Agenda_Tipo: TADOQuery;
    TB_Agenda_TipoCodigo: TAutoIncField;
    TB_Agenda_TipoDescricao: TWideStringField;
    Agenda_Tipo: TDataSource;
    Agenda_Contato: TDataSource;
    TB_Agenda_Contato: TADOQuery;
    TB_Agenda_ContatoCodigo: TAutoIncField;
    TB_Agenda_ContatoDescricao: TWideStringField;
    TB_AgendaTipo_Virtual: TWideStringField;
    TB_AgendaForma_Virtual: TWideStringField;
    TB_AgendaMunicipio_Virtual: TWideStringField;
    TB_Agenda_TipoGregaAgenda: TBooleanField;
    TB_FuncionariosDate_Admissao2: TDateTimeField;
    TB_FuncionariosData_Demissao: TDateTimeField;
    TB_Parcelamento_Lista: TADOQuery;
    Parcelamento_lista_source: TDataSource;
    TB_Parcelamento_ListaCodigo: TAutoIncField;
    TB_Parcelamento_ListaDescricao: TWideStringField;
    TB_Parcelamento_ListaIntervaloDias: TIntegerField;
    TB_Parcelamento_Listaentrada: TBooleanField;
    TB_Parcelamento_ListaParcelas: TIntegerField;
    TB_Parcelamento_Listaativo: TBooleanField;
    TB_Parcelamento_ListaFormaPagamento: TIntegerField;
    TB_ContasFuncAux: TADOQuery;
    TB_ContasFuncAuxnome: TWideStringField;
    TB_ContasFuncAuxcodigo: TAutoIncField;
    TB_ContasFuncVirtual: TStringField;
    TB_Vendas_AllCancelado: TBooleanField;
    function UFtoInt(UF: ShortString): Byte;
    Procedure Create_Erro(ErrorClassName,value:ShortString);
    procedure AppEventsException(Sender: TObject; E: Exception);
    procedure DataModuleCreate(Sender: TObject);
    Function Imprime_Pedido(Pedido:Cardinal):Byte;
    Function Format_CNPJANDCPF(Value:ShortString;Verif:Boolean):ShortString;
    function FormataCEP(CEP: ShortString): ShortString;
    Function FormataTel(DD,Telefone:ShortString):ShortString;
    Function GoToreg_Venda(COD:Cardinal; Tabela:Byte):Boolean;
    Procedure Adiciona_Agenda(value, descri : ShortString);
    Procedure Onerror;
    procedure DataModuleDestroy(Sender: TObject);
    Function FormatString(strIn : string):string;
    Procedure LoadColumns(Grid :TThemeDBGrid);
    Procedure SaveColumns(Grid :TThemeDBGrid);
    function SearchField(Table:TDataSet; Value: ShortString; Tag : Boolean): integer;
    procedure TB_PedidoAfterOpen(DataSet: TDataSet);
    procedure TB_PedidoBeforeClose(DataSet: TDataSet);
    Procedure Refresh(DataSet:TDataSet);
    procedure TBClientesAfterOpen(DataSet: TDataSet);
    procedure TBClientesBeforeClose(DataSet: TDataSet);
    procedure TB_FuncionariosAfterOpen(DataSet: TDataSet);
    procedure TB_FuncionariosBeforeClose(DataSet: TDataSet);
    procedure TBEstoqueBeforeClose(DataSet: TDataSet);
    procedure TBEstoqueAfterOpen(DataSet: TDataSet);
    procedure AppEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    function  PegaTempDir : String;
    function  isCNPJ(CNPJ: ShortString): boolean;
    Function  LoadBitmap(Field : TBlobField; Imagem:Graphics.TBitmap):Boolean;
    function  ColortoHTML(Cor: TColor): ShortString;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormDeactivate(Sender: TObject);
    function Locate(value: Smallint): Boolean;

    Procedure Image1Move(x,y:integer);
    Procedure Img1_Visible;
    Procedure Img2_Visible;
    Procedure Img3_Visible;
    Procedure Img4_Visible;
    Procedure Img5_Visible;
    Procedure Img6_Visible;
    Procedure Img7_Visible;
    Procedure Img8_Visible;
    Procedure Img9_Visible;
    Procedure Clearimg;
    Procedure CalcPos;
    procedure FormatarString1Click(Sender: TObject);
    function VerificaCNPJ(Nr_CGC:ShortString;Formata:Boolean;ISCNPJCPF:Boolean):ShortString;

    Procedure OpenCNPJCPF(value:shortstring);
    function lastcaracter(value: ShortString): ShortString;
    procedure TB_FuncionariosBeforePost(DataSet: TDataSet);
    procedure TBClientesBeforePost(DataSet: TDataSet);
    procedure TBMunicipioBeforeOpen(DataSet: TDataSet);
    procedure Copiar1Click(Sender: TObject);
    Procedure ListaQuery(Query: TDataSet; Title: ShortString;descri_view:Integer);
    Procedure LoadEmpresa;
    Procedure SearchReg(DataSet:TDataSet;Value:ShortString);
    procedure TB_PedidoFaturaValidate(Sender: TField);
    Function InverteColor(Value:Tcolor):Tcolor;
    function IsDuplicate(ErrorMsg: string): Boolean;
    Procedure CloseTableCliente;
    Function FormatTelEdit(value:ShortString;Formata:Boolean):ShortString;
    Function IsInt(value:ShortString):Boolean;
    Function RetornFieldname(value:shortstring;Dataset:TDataSet):integer;
    procedure TB_ParcelamentoAfterOpen(DataSet: TDataSet);
    procedure TB_ParcelamentoBeforeClose(DataSet: TDataSet);
    procedure HistoricoCliente(IdCliente:cardinal);
    Procedure GeraDav;
    procedure SaveIndexOf(Table:Tdataset);
    procedure LoadIndexOf(Table:Tdataset);
    Function  GetContasAtrasas(Cliente:integer):Currency;
    procedure TB_AgendaAfterOpen(DataSet: TDataSet);
    procedure TB_AgendaBeforeClose(DataSet: TDataSet);
    function VersaoExecutavel: string;
    Procedure GravaAuditoria(Table: TADOQuery; Cod:integer; Modulo,Tipo : Shortint);
    procedure NotPermissao;
    procedure SetAllPermiss(Value: Boolean);

    Function OnerrorRelatorio:TStringList;
    procedure TB_ContasAfterOpen(DataSet: TDataSet);
    procedure TB_ContasBeforeClose(DataSet: TDataSet);
    procedure OrdenaGrid(Column: TColumn);
  private
    { Private declarations }
  public
       LogSupervisor : Boolean;

       SisName : string;
       Empresa_Nome : string;
       Empresa_CNPJ : string[20];
       Empresa_Tipo_rua : ShortString;
       Empresa_rua :  ShortString;
       Empresa_bairro : ShortString;
       Empresa_Numero:shortstring;
       Empresa_Cidade : ShortString;
       empresa_UF : String[2];
       empresa_cep : string[20];
       empresa_IE, Empresa_Im : string[40];
       empresa_Fantasia:shortstring;
       empresa_Responsavel:shortstring;
       empresa_Complemento:shortstring;
       empresa_TelRes:shortstring;
       empresa_TelCom:shortstring;
       empresa_TelCel:shortstring;

       User_Vender : ShortString;

     ImgForm : TForm;
     Img : Array [1..9] of Smallint;
     ImgTop, ImgLeft, ImgWidth, ImgHeith : array [1..9] of Integer;

       Cor_Grid : Array [1..10] of TColor;
       // 1 = Funcionario    3 = Estoque     5 = Contas            7 = Frecebe Theme1        9 = Agenda
       // 2 = Fpedido        4 = Cliente     6 = Finaliza cliente  8 = Frecebe Clie The2    10 = ADD produto
               Font_Grid: Array [1..10] of TFont;
       Last_Grid_Select : Array [1..9] of Integer;
       Config_GRID_Foco : Array [1..9] of Boolean;//    true = FOCO campo inteiro. false = sem barra

       Browser_COlor : TColor;

       Grid_Finaliza_Height : Smallint;
       Grid_Finaliza_Title  : Boolean;
       Grid_Colluns         : array [0..30] of string[50]; // mofificar final para qtd d fields clientes
       Grid_Widht           : Array [0..30] of Smallint;



     App_Dir : TFileName;
     Dir_Banco:TFileName;
    Config : TIniFile;
    IniDir : TFileName;

    User_Dir : TFileName;
    User_cod : Integer;
    User_Cor : TFileName;

    Carta_Visible : Boolean;
      Carta_Salva : Boolean;
        carta_dir : TFileName;
    carta_Impr_aut: Boolean;
    Carta_Impre_MSG: Boolean;


    Const_CNPJ_Page : String; //http://www.receita.fazenda.gov.br/Aplicacoes/ATCTA/CPF/ConsultaPublica.asp
    Const_CPF_Page : string; //http://www.receita.fazenda.gov.br/PessoaJuridica/CNPJ/cnpjreva/Cnpjreva_Solicitacao.asp
    campo_cnpj,Campo_CPF:ShortString;


    Empresa_Imagem : TPicture;
    Relatorio_Font_Size : byte;
    Relatorio_Font_Name : ShortString;
    Relatorio_Color_Title : Tcolor;
    Relatorio_Color_Fundo : array [1..2] of Tcolor;

    Rela_Dav_NValidade : integer;
    Rela_Dav_Open : Boolean;
    Rela_Dav_Printer: Boolean;
    Rela_Dav_PrinterName : ShortString;

      Duplicado : string;

    Impressora_Sis : String; 

    Contas_Color_Atrasada : Tcolor;
    Contas_Color_Pagada : Tcolor;

    Pedido_InfoCLiente : Boolean;
    Pedido_InfoCliente_Width : Smallint;
    pedido_ScreenHeigth : Smallint;
    pedido_ScreenWidth  : Smallint;

    Color_Contas_active : Boolean;
    Color_Contas_Perso : array [1..6] of TColor;
  
    { Public declarations }
      Sql_Tb_contas_Default : ShortString;
      Sql_Tb_Funcio_Default : ShortString;
      Sql_Tb_Agenda_Default : ShortString;
      Sql_Tb_Pedido_Default : ShortString;

    Alter_Situacao : Smallint;

    {Variaveis de Permissoes}
    Cli_Acesso      : Boolean;
    Cli_Alter_Logr  : Boolean;
    Cli_Editar      : Boolean;
    Cli_Excluir     : Boolean;
    Cli_Mala_Direta : Boolean;
    Cli_Novo        : Boolean;
    Cli_Relatorio   : Boolean;
    Cli_Vis_Hist    : Boolean;

    Cont_Acesso     : Boolean;
    Cont_Novo       : Boolean;
    Cont_Editar     : Boolean;
    Cont_Excluir    : Boolean;
    Cont_Hist_Cont  : Boolean;
    Cont_Alter_Portador  : Boolean;
    Cont_Alter_Faturas   : Boolean;
    Cont_Alter_Parcelamentos : Boolean;
    Cont_Receber_conta   : Boolean;

    Est_Acesso      : Boolean;
    Est_Novo        : Boolean;
    Est_Editar      : Boolean;
    Est_Excluir     : Boolean;
    Est_Alter_Un    : Boolean;

    Ped_acesso      : Boolean;
    Ped_Novo        : Boolean;
    Ped_Editar      : Boolean;
    Ped_Excluir     : Boolean;
    Ped_Alter_Sit   : Boolean;

    User_Acesso     : Boolean;
    User_Novo       : Boolean;
    User_Editar     : Boolean;
    User_Excluir    : Boolean;
    User_Alter_Perm : Boolean;
    User_Visu_Auditoria   : Boolean;
    User_Alter_Setor: Boolean;
    User_Alter_Emitente   : Boolean;
    User_Config_Global    : Boolean;
    User_Config_Backup    : Boolean;
    User_MalaDireta       : Boolean;

    Agen_Acesso           : Boolean;
    Agen_Alter_Tipo       : Boolean;
    Agen_Alter_Contato    : Boolean;
    Agen_Editar     : Boolean;
    Agen_Excluir    : Boolean;
    Agen_Novo       : Boolean;
    Agen_Relatorio  : Boolean;
  {Finish Permissao}



  end;

var
  Banco: TBanco;

implementation


uses UFinfoPedido, Usituacao, UPedido, UClientes, Ufuncionario, UFestoque,
  UFcliente_New, UNewFuncionario, UEstoque_New, UEmitente, Ufinaliza,
  Uprinciapl, UParcelas, Ucontas_New, UAgenda, Ucontas, ADOInt, UException;

{$R *.dfm}



{ TBanco }
procedure TBanco.NotPermissao;
begin
MessageDlg('Você não tem permissão para executar esta ação',mtError,[mbok],0);
Abort;

end;

function Tbanco.VersaoExecutavel: string;
//var Versao: TVersionInfo;
begin
{Versao := TVersionInfo.Create(AppFileName);
Result := Versao.FileVersion;
Versao.Free;
}
  result := '0.9';
end;

Function Tbanco.RetornFieldname(value:shortstring;Dataset:TDataSet):integer;
  var i : byte;
  begin
    result := -1;
    for i := 0 to Dataset.Fields.Count - 1 do
    if LowerCase(Dataset.Fields[i].FieldName) = LowerCase(value) then
    result := i;
  end;

Function TBanco.InverteColor(Value:Tcolor):Tcolor;
  Function Invert(Input:byte):byte;
  var
    aux : Smallint;
  begin
  Result := Input;
  aux := Result - 255;
  if aux < 0 then
  aux := aux *-1;
  result := 0 + aux;
  end;
var

R,G,B : byte;
begin
R := GetRValue(Value);
G := GetGValue(Value);
B := GetBValue(Value);

Result := RGB(Invert(R),Invert(G),Invert(B));

end;

procedure TBanco.SetAllPermiss(Value: Boolean);
begin
    Banco.Cli_Acesso      := Value;
    Banco.Cli_Alter_Logr  := Value;
    Banco.Cli_Editar      := Value;
    Banco.Cli_Excluir     := Value;
    Banco.Cli_Mala_Direta := Value;
    Banco.Cli_Novo        := Value;
    Banco.Cli_Relatorio   := Value;
    Banco.Cli_Vis_Hist    := Value;
    Banco.Cont_Acesso     := Value;
    Banco.Cont_Novo       := Value;
    Banco.Cont_Editar     := Value;
    Banco.Cont_Excluir    := Value;
    Banco.Cont_Hist_Cont  := Value;
    Banco.Cont_Alter_Portador  := Value;
    Banco.Cont_Alter_Faturas   := Value;
    Banco.Cont_Alter_Parcelamentos := Value;
    Banco.Cont_Receber_conta   := Value;
    Banco.Est_Acesso      := Value;
    Banco.Est_Novo        := Value;
    Banco.Est_Editar      := Value;
    Banco.Est_Excluir     := Value;
    Banco.Est_Alter_Un    := Value;
    Banco.User_Acesso     := Value;
    Banco.User_Novo       := Value;
    Banco.User_Editar     := Value;
    Banco.User_Excluir    := Value;
    Banco.User_Alter_Perm := Value;
    Banco.User_Visu_Auditoria   := Value;
    Banco.User_Alter_Setor:= Value;
    Banco.User_Alter_Emitente   := Value;
    Banco.User_Config_Global    := Value;
    Banco.User_Config_Backup    := Value;
    User_MalaDireta             := value;
    Banco.Agen_Acesso           := Value;
    Banco.Agen_Alter_Tipo       := Value;
    Banco.Agen_Alter_Contato    := Value;
    Banco.Agen_Editar     := Value;
    Banco.Agen_Excluir    := Value;
    Banco.Agen_Novo       := Value;
    Banco.Agen_Relatorio  := Value;
    
    Banco.Ped_acesso      := Value;
    Banco.Ped_Novo        := Value;
    Banco.Ped_Editar      := Value;
    Banco.Ped_Excluir     := Value;
    Banco.Ped_Alter_Sit   := Value;

end;

function TBanco.lastcaracter(value: ShortString): ShortString;
var  Passed : Boolean;
begin
passed := false;
result := value;
  While not Passed do
  begin
    if value[Length(value)] = ' ' then
    begin
      Passed := false;
      value := copy(value,1,length(value)-1);
    end
    else
      Passed := true;

    if value = '' then
    Passed := true;
  end;


 result := value;
end;
procedure TBanco.FormDeactivate(Sender: TObject);
begin
(sender as Tform).setfocus;

end;


function TBanco.ColortoHTML(Cor: TColor): ShortString;
begin
Result := '#'+IntToHex(GetRValue(ColorToRGB(Cor)),2)
             +IntToHex(GetGValue(ColorToRGB(Cor)),2)
             +IntToHex(GetBValue(ColorToRGB(Cor)),2);
end;

function TBanco.VerificaCNPJ(Nr_CGC:ShortString;Formata:Boolean;ISCNPJCPF:Boolean):ShortString;
var
  Digito1,Digito2: String;
  S,Cont,Digito,Soma: Integer;

  aux : ShortString;
  i : byte;
begin
aux := '';

For s := 1 to Length(Nr_CGC) do
if Nr_CGC[s] in ['0'..'9'] then
aux := aux + Nr_CGC[s];

  Nr_Cgc:=aux;

  if Length(Nr_Cgc)=11 then begin
    {Primeiro Dígito } 
    Cont:=1; 
    Soma:=0; 
    for S:=9 Downto 1 do begin
      Inc(Cont); 
      Soma:=Soma + StrToInt(Nr_Cgc[S]) * Cont; 
    end; 
    Soma:=Soma * 10; 
    Digito1:=IntToStr(Soma Mod 11);
    if StrToInt(Digito1)>=10 then 
      Digito1:='0'; 
    // Segundo Dígito 
    Cont:=1; 
    Soma:=0;
    for S:=10 Downto 1 do begin 
      Inc(Cont); 
      Soma:=Soma + StrToInt(Nr_Cgc[S]) * Cont; 
    end; 
    Soma:=Soma * 10;
    Digito2:=IntToStr(Soma Mod 11); 
    if StrToInt(Digito2)>=10 then 
      Digito2:='0'; 
  end else if Length(Nr_Cgc) = 14 then begin 
    Soma:=5 * StrToInt(Nr_Cgc[1]) + 4 * StrToInt(Nr_Cgc[2]) + 3 * StrToInt(Nr_Cgc[3])+
          2 * StrToInt(Nr_Cgc[4]) + 9 * StrToInt(Nr_Cgc[5]) + 8 * StrToInt(Nr_Cgc[6])+ 
          7 * StrToInt(Nr_Cgc[7]) + 6 * StrToInt(Nr_Cgc[8]) + 5 * StrToInt(Nr_Cgc[9])+ 
          4 * StrToInt(Nr_Cgc[10])+ 3 * StrToInt(Nr_Cgc[11])+ 2 * StrToInt(Nr_Cgc[12]); 
    Digito:=Soma Mod 11; 
    if Digito>1 then
      Digito:=11-Digito 
    else 
      Digito:=0; 
    Digito1:=IntToStr(Digito); 

    Soma:=6 * StrToInt(Nr_Cgc[1]) + 5 * StrToInt(Nr_Cgc[2]) + 4 * StrToInt(Nr_Cgc[3])+ 
          3 * StrToInt(Nr_Cgc[4]) + 2 * StrToInt(Nr_Cgc[5]) + 9 * StrToInt(Nr_Cgc[6])+ 
          8 * StrToInt(Nr_Cgc[7]) + 7 * StrToInt(Nr_Cgc[8]) + 6 * StrToInt(Nr_Cgc[9])+ 
          5 * StrToInt(Nr_Cgc[10])+ 4 * StrToInt(Nr_Cgc[11])+ 3 * StrToInt(Nr_Cgc[12])+ 
          2 * StrToInt(Digito1);
    Digito:=Soma Mod 11; 
    if Digito>1 then 
      Digito:=11-Digito 
    else 
      Digito:=0;
    Digito2:=IntToStr(Digito); 
  end else begin 
    Result:=''; 
    Exit; 
  end;

  if (Copy(Nr_Cgc,Length(Nr_Cgc)-1,2) <> Digito1+Digito2) then
    Result:=''
  else
  if Formata then
  begin
    if Length(Nr_Cgc)= 11 then
      Result:=Format_CNPJANDCPF(Nr_Cgc,ISCNPJCPF)
    else
      Result:=Format_CNPJANDCPF(Nr_Cgc,ISCNPJCPF);
  end
  else
  if ISCNPJCPF then
  begin
    if Length(Nr_Cgc)=11 then
    Result := 'CPF '+ Nr_CGC
    else
    result := 'CNPJ '+Nr_CGC;

  end
  else
  Result:=Nr_Cgc;
end;




function  TBanco.PegaTempDir : String;//Pega o diretorio da Pasta Temporaria
var DiretorioTemp : PChar;
    TempBuffer    : Dword;
begin
  TempBuffer := 255;
  GetMem(DiretorioTemp,255);
  try
    GetTempPath(tempbuffer,diretoriotemp);
    result := DiretorioTemp;
  finally
    FreeMem(diretoriotemp);
  end;
end;

procedure TBanco.OrdenaGrid(Column: TColumn);
var
  FieldNameAux : ShortString;
begin
FieldNameAux := '';
if not (Column.Field.DataSet is TADOQuery) then exit;

if Column.Field.Lookup then
begin
   try
   FieldNameAux:= (Column.Field.DataSet as TADOQuery).Fields[banco.SearchField((Column.Field.DataSet as TADOQuery),Column.Field.DisplayLabel,true)].FieldName;
   except
   exit;
   end;

  if ((Column.Field.DataSet as TADOQuery).Sort<>FieldNameAux+' ASC') then
  (Column.Field.DataSet as TADOQuery).Sort:=FieldNameAux+' ASC'
  else
  (Column.Field.DataSet as TADOQuery).sort:=FieldNameAux+' DESC';
end
else
begin
  if ((Column.Field.DataSet as TADOQuery).Sort<>column.FieldName+' ASC') then
  (Column.Field.DataSet as TADOQuery).Sort:=column.FieldName+' ASC'
  else
  (Column.Field.DataSet as TADOQuery).sort:=column.fieldname+' DESC';
end;

end;


function TBanco.SearchField(Table:TDataSet; Value: ShortString; Tag : Boolean): integer;
var
  i : integer;
begin
result := -1;

if tag then
begin
  For i := 0 to Table.Fields.Count -1 do
  if (Table.Fields[i].DisplayLabel = Value) then
  if (Table.Fields[i].Tag = 1) then
    Result := i
  else
  if (Table.Fields[i].Tag = 0) and (result = -1) then
  Result := i;
end
else
begin
  For i := 0 to Table.Fields.Count -1 do
  if (Table.Fields[i].DisplayLabel = Value) then
  if (Table.Fields[i].Tag = 0) then
    Result := i
 { else
  if (Table.Fields[i].Tag = 1) and (result = -1) then
  Result := i;}
end;
end;


function TBanco.IsDuplicate(ErrorMsg: string): Boolean;
var
  StringSearch : Array [1..2] of ShortString;
  i : byte;
begin
//StringSearch[1] := 'criariam';
//StringSearch[2] := 'valores';
StringSearch[1] := 'duplicados';
StringSearch[2] := 'cascata';
result := false;

For i := low(stringSearch) to high (stringsearch) do
if pos (stringsearch[i],ErrorMsg) <> 0 then
begin
Result := true;


end;

end;


function TBanco.UFtoInt(UF: ShortString): Byte;
begin
     IF UF = 'AL' then result :=0
else IF UF = 'AP' then result :=1
else IF UF = 'AM' then result :=2
else IF UF = 'BA' then result :=3
else IF UF = 'CE' then result :=4
else IF UF = 'DF' then result :=5
else IF UF = 'ES' then result :=6
else IF UF = 'GO' then result :=7
else IF UF = 'MA' then result :=8
else IF UF = 'MT' then result :=9
else IF UF = 'MS' then result :=10
else IF UF = 'MG' then result :=11
else IF UF = 'PA' then result :=12
else IF UF = 'PB' then result :=13
else IF UF = 'PR' then result :=14
else IF UF = 'PE' then result :=15
else IF UF = 'PI' then result :=16
else IF UF = 'RJ' then result :=17
else IF UF = 'RN' then result :=18
else IF UF = 'RS' then result :=19
else IF UF = 'RO' then result :=20
else IF UF = 'RR' then result :=21
else IF UF = 'SC' then result :=22
else IF UF = 'SP' then result :=23
else IF UF = 'SE' then result :=24
else IF UF = 'TO' then result :=25
else result :=26;


end;


function TBanco.isCNPJ(CNPJ: ShortString): boolean;
var dig13, dig14: string; 
sm, i, r, peso: integer;
begin 
// length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos) 
if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111') or (CNPJ = '22222222222222') or
   (CNPJ = '33333333333333') or (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
   (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or (CNPJ = '88888888888888') or
   (CNPJ = '99999999999999') or (length(CNPJ) <> 14)) then
begin
isCNPJ := false;
exit;
end;
// "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
try { *-- Cálculo do 1o. Digito Verificador --* }
sm := 0;
peso := 2;
for i := 12 downto 1 do
begin // StrToInt converte o i-ésimo caractere do CNPJ em um número
sm := sm + (StrToInt(CNPJ[i]) * peso);
peso := peso + 1;
if (peso = 10) then
  peso := 2; end; r := sm mod 11;
if ((r = 0) or (r = 1)) then
  dig13 := '0'
else
  str((11-r):1, dig13); // converte um número no respectivo caractere numérico { *-- Cálculo do 2o. Digito Verificador --* }
sm := 0;
peso := 2;
for i := 13 downto 1 do
begin
sm := sm + (StrToInt(CNPJ[i]) * peso);
peso := peso + 1;
if (peso = 10) then
peso := 2;
end;
 r := sm mod 11;
 if ((r = 0) or (r = 1)) then
dig14 := '0'
else
str((11-r):1, dig14); { Verifica se os digitos calculados conferem com os digitos informados. }
if ((dig13 = CNPJ[13]) and (dig14 = CNPJ[14])) then isCNPJ := true else isCNPJ := false;
except
isCNPJ := false
end;
end;


Function TBanco.FormatString(strIn : string):string;
var
  i            : integer;
  tempStr, str : string;
begin
  str := strIn;
  tempStr := '';
  for i:=1 to length(str) do
  begin
    if i = 1 then
      tempStr := AnsiUpperCase(str[i])
    else
      if str[i-1] = ' ' then
      begin
        //if str[i+2] = ' ' then
        //  tempStr := tempStr + AnsiLowerCase(str[i])
       // else
          tempStr := tempStr + AnsiUpperCase(str[i]);
      end
      else
        tempStr := tempStr + AnsiLowerCase(str[i]);
  end;
  result := PChar(tempStr);

end;


procedure TBanco.Create_Erro(ErrorClassName,value:ShortString);
Var
  QueryEx : TADOQuery;
  Stream : TMemoryStream;
  Texto : TStringList;
Begin
Try
  Application.CreateForm(TFException,FException);
  FException.Label6.Caption := ErrorClassName;
  FException.Memo1.Text := value;


Try
  QueryEx := TADOQuery.Create(self);
  Stream := TMemoryStream.Create;
  OnerrorRelatorio.SaveToStream(Stream);
  Stream.Position := 0;

  try
  QueryEx.Connection := banco.ADOConnection1;
  QueryEx.DisableControls;
  queryex.SQL.Clear;
  QueryEx.SQL.Add('select * from tb_Exception');
  queryex.SQL.Add('where codigo = 0');
  QueryEx.Open;

  QueryEx.Insert;
  QueryEx.FieldByName('Data').AsDateTime := now;
  QueryEx.FieldByName('Classe').AsString := ErrorClassName;
  QueryEx.FieldByName('Message').AsString := value;
  QueryEx.FieldByName('user').AsInteger := User_cod;
  QueryEx.FieldByName('versao').AsString := VersaoExecutavel;

  (QueryEx.FieldByName('relatorio') as TBlobField).LoadFromStream(Stream);
  QueryEx.Post;

  FException.ShowModal;

  //MessageDlg('Foi encontrado um erro, Relatorio salvo no banco de dados, Classe do Erro:'+ErrorClassName+#13+value,mtError,[mbok],0);
  Except
    try
    Texto :=TStringList.Create;
    Texto.Clear;
    texto.Add('Classe do Erro '+ErrorClassName);
    Texto.Add(value);
    if not DirectoryExists(App_Dir+'Erro\') then   CreateDir(App_Dir+'Erro\');
    Texto.SaveToFile(App_Dir+'Erro\Hora_'+FormatDateTime('hh.nn.ss',Time)+'_DIA_'+FormatDateTime('DD.MM',Date)+'.txt');

    FException.Label5.Caption := 'Criado log txt';
    FException.ShowModal;
    Finally
    FreeAndNil(Texto);
    end;
  end;


Finally
 if not (QueryEx.State in [dsinactive]) then
 QueryEx.Close;

 QueryEx.Active := false;

 FreeAndNil(Stream);
 FreeAndNil(QueryEx);
end;

if FException.ModalResult = 0 then
begin
FException.Label5.Caption := 'Erro ao grava relátorio';
FException.ShowModal;
end;

Finally

FreeAndNil(FException);
end;

end;

Procedure TBanco.AppEventsException(Sender: TObject;
  E: Exception);
begin
Create_Erro(e.ClassName,e.Message);
end;

procedure TBanco.DataModuleCreate(Sender: TObject);
var
  i : integer;
begin
Color_Contas_active := false;

for i := low(Color_Contas_Perso) to high(Color_Contas_Perso) do
Color_Contas_Perso[i] := clWhite;


Alter_Situacao := -1;
Sql_Tb_contas_Default := 'Select  A.*, B.nome_razao, B.cpf from tb_contas A' +#13+'left join Cliente_cadastro B'+#13+'on A.id_cliente = b.codigo';
Sql_Tb_Funcio_Default := 'Select * from Funcionarios';
Sql_Tb_Agenda_Default := 'Select A.*, B.nome_razao, B.nome, B.UF, B.Municiopio, B.cpf from tb_Agenda A'+#13+'left join Cliente_cadastro B on'+#13+'A.id_cliente = b.codigo';
Sql_Tb_Pedido_Default := 'Select  A.*, B.nome_razao, B.nome, B.UF, B.Municiopio, B.cpf from'+#13+'Venda_info A inner join Cliente_cadastro B on'+#13+'A.id_cliente = b.codigo';



Grid_Finaliza_Height:= 220;
Grid_Finaliza_Title := false;


LogSupervisor := true; // logado form supervisor

pedido_ScreenWidth := 829;
pedido_ScreenHeigth := 568;

Pedido_InfoCliente_Width := 165;
Pedido_InfoCLiente := true;

Contas_Color_Atrasada := clRed;
Contas_Color_Pagada := clGreen;
Browser_COlor := clBtnFace;

        Impressora_Sis := 'Fax';
  Rela_Dav_PrinterName := 'Fax';

  Rela_Dav_Open := true;
  Rela_Dav_Printer:=false;
  SisName := 'NOME_DO_Sistema';
  Rela_Dav_NValidade := 0;

  User_Vender := 'Supervisor';


Duplicado := 'As alterações solicitadas para a tabela não foram satisfatórias já que criariam valores duplicados no índice, chave primária';
duplicado := Duplicado + ' ou relação. Altere os dados no campo ou campos que contêm os dados duplicados, remova o índice ou redefina o índice para possibilitar entradas duplicadas e tente novamente';

Relatorio_Font_Size := 2;
Relatorio_Font_Name := 'Tahoma';

Empresa_Imagem := TPicture.Create;
   Relatorio_Color_Title := clMoneyGreen;
Relatorio_Color_Fundo[1] := clWhite;
Relatorio_Color_Fundo[2] := clBtnFace;

    Const_CPF_Page := 'www.receita.fazenda.gov.br/Aplicacoes/ATCTA/CPF/ConsultaPublica.asp';
    Const_CNPJ_Page := 'www.receita.fazenda.gov.br/PessoaJuridica/CNPJ/cnpjreva/Cnpjreva_Solicitacao2.asp';
    campo_cnpj :='CNPJ';
    campo_CPF := '';

For i := low(Last_Grid_Select) to High(Last_Grid_Select) do
Last_Grid_Select[i] := 0;

For i := low(Config_GRID_Foco) to High(Config_GRID_Foco) do
Config_GRID_Foco[i] := false;

User_cod := 0;
    Carta_Visible := false;
      Carta_Salva := false;
        carta_dir := ExtractFilePath(Application.ExeName)+'cartas\';
    carta_Impr_aut:= false;
  Carta_Impre_MSG := false;


For i := low(Cor_Grid) to High(Cor_Grid) do
Cor_Grid[i] := clbtnface;



end;










function TBanco.Locate(value: Smallint): Boolean;
begin
result := banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,value,[]);
end;


function TBanco.FormataCEP(CEP: ShortString): ShortString;
begin
    if Length (CEP) > 5 then
    Result := Copy(cep, 1, 5)+'-'+Copy(cep, 6, 3)
    else
    Result := cep;
end;

Function TBanco.FormataTel(DD,Telefone:ShortString):ShortString;
begin
Result := Telefone;
If DD <> '' then
Result := '('+DD+')'+' '+copy(Telefone,1,4)+' '+copy(Telefone,5,length(telefone))
else
Result := copy(Telefone,1,4)+' '+copy(Telefone,5,length(telefone));

end;

function TBanco.Format_CNPJANDCPF(Value: ShortString; Verif:Boolean): ShortString;
begin
   // Result := 'CPF / CNPJ '+Value;
   Result := '';
   if  length(value) = 11 then
   begin
      if Verif then
      result := 'CPF ';

   Result :=Result +  Copy(Value,1,3)+'.'+Copy(Value,4,3)+'.'+Copy(Value,7,3)+'-'+Copy(Value,10,2);
   end
   else
   begin
      if Verif then
      result := 'CNPJ ';

    Result := result +Copy(Value,1,2)+'.'+Copy(Value,3,3)+'.'+Copy(Value,6,3)+'/'+Copy(Value,9,4)+'-'+Copy(Value,13,2);
   end;
end;





Function TBanco.Imprime_Pedido(Pedido:Cardinal):Byte;
var

  ID_Cliente : Integer;
  Registros : Integer;
  Table : Byte;
  Data : Tdate;
  Desc :ShortString;


  Total_ : Currency;



  Arquivo_Ini : TIniFile;
begin
   PP_Contato.Caption := '';

   if FileExists(App_Dir+'Pedidos\'+IntToStr(Pedido)+'.pdf') then
   if MessageDlg('O pedido Nº '+IntToStr(pedido)+' já foi salvo na pasta "Pedidos",'+#13+' deseja atualizar o pedido?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
   begin
     ShellExecute(0, nil, pchar('Pedidos\'+IntToStr(Pedido)+'.pdf'), nil, nil, 0);
     exit;
   end;

// 1- Verificando se o pedido existe

 if TB_Pedido.Active = False then
 begin
  TB_Pedido.Active := true;
 end;

  TB_Pedido.Close;
  TB_Pedido.SQL.Clear;
  TB_Pedido.SQL.Add('Select * from VENDA_INFO');
  TB_Pedido.SQL.Add('Where ID_Pedido = '+IntToStr(Pedido));
  TB_Pedido.Open;

 if TB_Pedido.RecordCount = 0 then
 begin
    if FileExists(Banco.App_Dir +'Pedidos\'+  IntToStr(Pedido) +'.ini') then
    begin
      Try
        Arquivo_Ini := TIniFile.Create(Banco.App_Dir +'Pedidos\'+  IntToStr(Pedido) +'.ini');

           ID_Cliente := Arquivo_Ini.ReadInteger('Pedido_Info','User_Cod',-1);
           Registros  := Arquivo_Ini.ReadInteger('Pedido_Info','Registro',0);
           Table      := Arquivo_Ini.ReadInteger('Pedido_Info','Lista',0);
           Data       := Arquivo_Ini.ReadDate('Pedido_Info','Data',1/1/1000);
           Desc       := Arquivo_Ini.ReadString('Pedido_Info','Desc','');
           PP_Contato.Caption := Arquivo_Ini.ReadString('Pedido_info','user_name','');

           if ID_Cliente = -1 then
           raise Exception.Create('Código do cliente não existe');


           FreeAndNil(Arquivo_Ini);
           MessageDlg('Foi encontrado um erro no pedido '+IntToStr(Pedido)+'.'+#13+'Referente ao ID do cliente foram recuperados alguns campos',mtWarning,[mbOK],0);


      Except
          MessageDlg('O arquivo de configuração é inválido',mtError,[mbOK],0);
          FreeAndNil(Arquivo_Ini);
          Onerror;
          exit;
      end;

    end
    else
    begin
    MessageDlg('O Pedido '+IntToStr(Pedido)+' não existe',mtError,[mbOK],0);
    exit;
    end
 end
 else
 begin
   ID_Cliente := TB_PedidoID_cliente.Value;
   Registros := TB_PedidoTotal_Reg.Value;
   Data := TB_PedidoData_Hora.Value;
   Desc := TB_PedidoDescri.Value;
 end;


 PP_Pedido.Caption  := 'Pedido Nº '+IntToStr(Pedido);
 PP_Pedido1.Caption  := 'Pedido Nº '+IntToStr(Pedido);

 if Data <> 1/1/1000 then  PP_Data.Caption := DateToStr(Data) else pp_data.Caption := '';
 PP_DESCRI.Caption := Desc;
// if PP_Contato.Caption ='' then  PP_Contato.Caption := TB_Pedidonom_virtual.Value;

//-----------------------------------------------------------------------------------------------------------------
    PP_CNPJ.Caption := Format_CNPJANDCPF('',true);
    PP_IE.Caption := '';
    PP_CEp.Caption := '';
    PP_TEL.Caption := '';
    PP_Endereco.Caption := '';

    // 2- Procurando Cliente
    TBClientes.Close;
    TBClientes.SQL.Clear;
    TBClientes.SQL.Add('Select * from Cliente_Cadastro');
    TBClientes.SQL.Add('Where codigo = '+IntToStr(ID_Cliente));
    TBClientes.Open;

 If TBClientes.RecordCount = 0 then
  begin
    PP_CNPJ.Caption := Format_CNPJANDCPF('',true);
    PP_IE.Caption := 'IE';
    PP_CEp.Caption := 'Cep';
    PP_TEL.Caption := 'Tel';
    PP_Endereco.Caption := 'Logradouro';

    MessageDlg('O cliente '+IntToStr(ID_Cliente)+' não está registrado, favor verificar o registro',mtWarning, [mbOK],0);
    Adiciona_Agenda('Verificar o pedido Nº '+IntToStr(Pedido),'Realizado a visualização no dia '+DateToStr(Data)+', o programa encontrou um erro no cliente '+IntToStr(ID_Cliente));
  end
  else
  begin
   PP_CNPJ.Caption := Format_CNPJANDCPF(TBClientesCPF.Value,true);

  if TBClientesIE.Value <> '' then
  PP_IE.Caption := 'IE '+TBClientesIE.Value;

  If TBClientesCep.Value <> '' then
  PP_CEp.Caption := 'Cep '+FormataCEP(TBClientesCep.Value)+'      '
  else
  PP_Cep.Caption := '';
  PP_CEp.Caption:= PP_CEp.Caption+TBClientesUF.Value + ' - '+TBClientesCidade_Virtual.Value;

  PP_Contato.Caption := TBClientesNome.Value;
  PP_Endereco.Caption := 'Bairro '+ TBClientesBairro.Value+', '+TBClientesLogTypeVirtual.Value +' '+ TBClientesLogradouro.Value;
  If      TBClientesNumero.Value <> '' then   PP_Endereco.Caption := PP_Endereco.Caption +', '+ TBClientesNumero.Value;
  If TBClientesComplemento.Value <> '' then   PP_Endereco.Caption := PP_Endereco.Caption +', '+ TBClientesComplemento.Value;
  PP_TEL.Caption := '';
  If TBClientesTel_Res.Value  <> '' then PP_TEL.Caption := 'Tel   Resi. '+FormataTel(TBClientesDDD_Res.Value,TBClientesTel_Res.Value);
  If TBClientesTel_Come.Value <> '' then PP_TEL.Caption :=PP_TEL.Caption +  '      Comerc. '+ FormataTel(TBClientesDDD_Come.Value,TBClientesTel_Come.Value);
  If TBClientesTel_Cel.Value  <> '' then PP_TEL.Caption := PP_TEL.Caption + '      Cel '+FormataTel(TBClientesDDD_Cel.Value,TBClientesTel_Cel.Value);
 end;

 //-----------------------------------------------------------------------------------------------------------------
 // O PEDIDO ESTÁ IFORMADO O NOME DO CLIENTE E INFORMAÇÕES DO MESMO

  TB_Vendas_All.Active := true;
  TB_Vendas_All.Close;
  TB_Vendas_All.SQL.Clear;
  TB_Vendas_All.SQL.Add('Select * from VENDA_ALL');
  TB_Vendas_All.SQL.Add('Where ID_PEDIDO = '+IntToStr(Pedido));
  TB_Vendas_All.Open;

  TB_Vendas_All.First;
  WHILE Not TB_Vendas_All.Eof do
  TB_Vendas_All.Next;           // reconhecer os pedidos do banco\\


  if TB_Vendas_All.RecordCount = 0 then
    if FileExists(Banco.App_Dir +'Pedidos\'+  IntToStr(Pedido) +'.xml') then
    begin
      TRY
        ClientDataSet1.CreateDataSet;
        ClientDataSet1.LoadFromFile(Banco.App_Dir +'Pedidos\'+  IntToStr(Pedido) +'.xml');
        ClientDataSet1.Open;
      Except
        on e: exception do
        begin
        MessageDlg('Não foi possível abrir arquivo XML, mensagem original'+#13+e.Message,mtError,[mbYes],0);
        Onerror;
        exit;
        end;
      end;
    end
    else
    begin
      MessageDlg('Foi encontrado um erro no banco de dados o pedido '+IntToStr(Pedido)+' não consta',mtError,[mbOK],0);
      Onerror;
      exit;
    end;

   TB_GeraPedido.CreateDataSet;
   TB_GeraPedido.Open;
   PP_Pipeline1.DataSource := Source_GeraPedido;

    Application.CreateForm(TFinfoPedido,FinfoPedido);
    FinfoPedido.Label2.Caption:= 'Nº '+IntToStr(Pedido);
    FinfoPedido.Label3.Caption := '';
    FinfoPedido.ProgressBar1.Position := 0;
    FinfoPedido.show;

      TBEstUn.Open;


  Total_ := 0;

  if TB_Vendas_All.RecordCount = 0 then
  begin
    FinfoPedido.ProgressBar1.Max :=  ClientDataSet1.RecordCount;
    ClientDataSet1.First;
    WHILE Not ClientDataSet1.Eof do
    begin
      GoToreg_Venda(ClientDataSet1cod.Value,Table);
      TB_GeraPedido.Insert;
      TB_GeraPedidoCodigo.Value    := ClientDataSet1cod.Value;
      TB_GeraPedidoQtd.Value       := ClientDataSet1Qtd.Value;
      TB_GeraPedidoUnidade.Value   := TBEstoqueun_virtual.Value;
      TB_GeraPedidoDescricao.Value := TBEstoqueDescricao.Value;
      TB_GeraPedidoPrecoUnit.Value := TBEstoqueValor.Value;
      TB_GeraPedidoTotal.Value     := TBEstoqueValor.Value * ClientDataSet1Qtd.Value;
      TB_GeraPedido.Post;
      Total_ := Total_ + (TBEstoqueValor.Value * ClientDataSet1Qtd.Value);
      ClientDataSet1.Next;
      Application.ProcessMessages;
      FinfoPedido.ProgressBar1.Position :=   FinfoPedido.ProgressBar1.Position+1;
    end;
  end
  else
  begin
    FinfoPedido.ProgressBar1.Max :=  TB_Vendas_All.RecordCount;
    TB_Vendas_All.First;
    WHILE Not TB_Vendas_All.Eof do
    begin
      GoToreg_Venda(TB_Vendas_AllID_mercadoria.Value,Table);
      TB_GeraPedido.Insert;
      TB_GeraPedidoCodigo.Value    := TB_Vendas_AllID_mercadoria.Value;
    //  TB_GeraPedidoQtd.Value       := TB_Vendas_AllQtd.Value;
      TB_GeraPedidoUnidade.Value   := TBEstoqueun_virtual.Value;
      TB_GeraPedidoDescricao.Value := TBEstoqueDescricao.Value;
      TB_GeraPedidoPrecoUnit.Value := TBEstoqueValor.Value;
      TB_GeraPedidoTotal.Value     := TBEstoqueValor.Value * TB_Vendas_AllQtd.Value;
      TB_GeraPedido.Post;
      Total_ := Total_ + (TBEstoqueValor.Value * TB_Vendas_AllQtd.Value);
      TB_Vendas_All.Next;
      Application.ProcessMessages;
      FinfoPedido.ProgressBar1.Position :=   FinfoPedido.ProgressBar1.Position+1;
    end;
  end;
   TBEstUn.Close;

  PPPrecoTotal.Caption := 'Preço Total     R$ '+formatfloat('##,###,##0.00',Total_);
  FinfoPedido.Close;

          Report.DeviceType := 'dtPDF';
          report.AllowPrintToFile := true;
          report.ShowPrintDialog := false;
          report.TextFileName := App_Dir+  'Pedidos\'+IntToStr(Pedido)+'.pdf';;
          Report.AllowPrintToArchive := true;


          if FileExists('Pedidos\'+IntToStr(Pedido)+'.pdf') then
          if not DeleteFile(pchar('Pedidos\'+IntToStr(Pedido)+'.pdf')) then
          Begin
            MessageDlg('Não foi possível gerar o pedido'+#13+'Algum aplicativo está usando o arquivo',mtError,[mbOK],0);
            PP_Pipeline1.DataSource := nil;
            TB_GeraPedido.Close;
            TB_GeraPedido.Active := false;
            FreeAndNil(FinfoPedido);
            exit;
          end;


          While FileExists('Pedidos\'+IntToStr(Pedido)+'.pdf') do
          Sleep(100);

          Report.Print;

          While not FileExists('Pedidos\'+IntToStr(Pedido)+'.pdf') do
          Sleep(100);



          ShellExecute(0, nil, pchar('Pedidos\'+IntToStr(Pedido)+'.pdf'), nil, nil, 0);


          Onerror;

end;


function TBanco.GoToreg_Venda(COD: Cardinal; Tabela: Byte): Boolean;
begin

  TBEstoque.close;
  TBEstoque.SQL.Clear;

  If Tabela = 0 then
  TBEstoque.SQL.Add('Select * from Estoque')
  else
  TBEstoque.SQL.Add('Select * from Estoque_ICMS');

  TBEstoque.SQL.Add('Where ID_Merca = '+IntToStr(COD));

  TBEstoque.Open;

  IF TBEstoque.RecordCount > 0 then
  result:= true
  else
  result:= false;

end;

procedure TBanco.Adiciona_Agenda(value,descri: ShortString);
begin
 //------------------------------------------------------------------------------------------------------------------------------------------
end;

procedure TBanco.Onerror;
begin
  PP_Pipeline1.DataSource := nil;
  TB_GeraPedido.Close;
  TB_GeraPedido.Active := false;

  ClientDataSet1.Close;
  ClientDataSet1.Active := false;

  FreeAndNil(FinfoPedido);


  TBClientes.Close;
  TBClientes.SQL.Clear;
  TBClientes.SQL.Add('Select * from Cliente_Cadastro');
  TBClientes.Open;

  TB_Pedido.Close;
  TB_Pedido.SQL.Clear;
  TB_Pedido.SQL.Add('Select * from Venda_info');
  TB_Pedido.Open;



end;


procedure TBanco.DataModuleDestroy(Sender: TObject);
var
  i : Smallint;
begin
try
FreeAndNil(Empresa_Imagem);
except
end;

if Config <> nil then
begin

try
ColorDialog.CustomColors.SaveToFile(User_Cor);
except
end;


config.WriteBool   ('Ffinaliza', 'ShowInfo',Pedido_InfoCLiente);
config.WriteInteger('Ffinaliza','widthInfo',Pedido_InfoCliente_Width);

config.WriteInteger('Ffinaliza','Screenwidth',pedido_ScreenWidth);
config.WriteInteger('Ffinaliza','Screenheigth',pedido_ScreenHeigth);


For i := 1 to High(Banco.Last_Grid_Select) do
config.WriteInteger('Select_Grid','Pos'+IntToStr(i),Last_Grid_Select[i]);

For i := 1 to High(Banco.Config_GRID_Foco) do
config.WriteBool('Foco_Grid','Pos'+IntToStr(i),Config_GRID_Foco[i]);

For i := 0 to high(Grid_Colluns) do
begin
Config.WriteString('Grid_Finally','Colluns'+IntToStr(i),Grid_Colluns[i] );
Config.WriteInteger('Grid_Finally','Colluns'+IntToStr(i)+'Width',Grid_Widht[i]);
end;

For i := 1 to High(Banco.Cor_grid) do
config.WriteString('Color_Grid','Cor_'+IntToStr(i),ColorToString(cor_grid[i]));


Config.WriteInteger('Grid_Finally','Heidht',Grid_Finaliza_Height);
//Config.WriteInteger('Grid_Finally','Width',Grid_Finaliza_Width);
Config.WriteBool('Grid_Finally','Title',Grid_Finaliza_Title);



for i := 1 to high(Font_Grid) do
begin
Config.WriteString ('Font_Grid', 'Name_'+IntToStr(i),Font_Grid[i].Name);
Config.WriteInteger ('Font_Grid','Color_'+IntToStr(i),Font_Grid[i].Color);
Config.WriteInteger ('Font_Grid', 'Size_'+IntToStr(i),Font_Grid[i].size);
end;



freeandnil(config);
end;



TBClientes.Active := false;
TBMunicipio.Active := false;
TBLogra.Active := false;
TBEstoque.Active := false;
TBEstUn.Active := false;
TB_Vendas_All.Active := false;
TB_Pedido.Active := false;
//TB_Pagamento.Active := false;
TB_Situacao.Active := false;



end;

procedure TBanco.LoadColumns(Grid: TThemeDBGrid);
var
   i : integer;
begin
{if Grid.DataSource.DataSet.Name <> TB_Pedido.Name then
if Cor_Grid <> clwhite then
Grid.Options := Grid.Options - [dgrowlines]
else
Grid.Options :=Grid.Options + [dgrowlines] ;
 }

if Grid.Columns.Count = 1 then exit;

For i := 0 to Grid.Columns.Count - 1 do
if Grid.Columns[i].Field = nil then
Grid.Columns[i].Width := Config.ReadInteger(Grid.DataSource.Name,Grid.Columns[i].Title.Caption,100)
else
if Grid.Columns[i].Field.Tag = 0 then
Grid.Columns[i].Width := Config.ReadInteger(Grid.DataSource.Name ,Grid.Columns[i].Title.Caption,100);



end;

procedure TBanco.SaveColumns(Grid: TThemeDBGrid);
var
   i : integer;
begin

if Grid.Columns.Count = 1 then
exit;

For i := 0 to Grid.Columns.Count - 1 do
if Grid.Columns[i].Field = nil then
Config.WriteInteger(Grid.DataSource.Name, Grid.Columns[i].Title.Caption, Grid.Columns[i].Width)
else
if Grid.Columns[i].Field.Tag = 0 then
Config.WriteInteger(Grid.DataSource.Name,
                    Grid.Columns[i].Title.Caption,
                    Grid.Columns[i].Width);

end;

procedure TBanco.TB_PedidoAfterOpen(DataSet: TDataSet);
begin
if FPedido <> nil then
LoadColumns(FPedido.ThemeDBGrid1);
end;

procedure TBanco.TB_PedidoBeforeClose(DataSet: TDataSet);
begin
   if FPedido <> nil then
   if FPedido.savecol then
SaveColumns(FPedido.ThemeDBGrid1);
end;

procedure TBanco.Refresh(DataSet: TDataSet);
Var
 SalvaRegistro : TBookmark;
 Sort : ShortString;
begin
sort := '';
if (DataSet is TADOQuery) then
Sort := (DataSet as TADOQuery).Sort;


SalvaRegistro := DataSet.GetBookmark;

DataSet.DisableControls;
DataSet.Close;
DataSet.Open;
DataSet.EnableControls;

try
if  Sort <> '' then
(DataSet as TADOQuery).Sort := Sort;


if DataSet.BookmarkValid(SalvaRegistro) then
DataSet.GotoBookmark(SalvaRegistro);

DataSet.FreeBookmark(SalvaRegistro);
except
//registro excluido
end;

end;

procedure TBanco.TBClientesAfterOpen(DataSet: TDataSet);
begin
if Fclientes <> nil then LoadColumns(Fclientes.ThemeDBGrid1);
end;


procedure TBanco.TBClientesBeforeClose(DataSet: TDataSet);
begin
if Fclientes <> nil then SaveColumns(Fclientes.ThemeDBGrid1);
end;
procedure TBanco.TB_FuncionariosAfterOpen(DataSet: TDataSet);
begin
if FFuncionarios <> nil then LoadColumns(FFuncionarios.ThemeDBGrid1);
end;
procedure TBanco.TB_FuncionariosBeforeClose(DataSet: TDataSet);
begin
if FFuncionarios <> nil then SaveColumns(FFuncionarios.ThemeDBGrid1);
end;
procedure TBanco.TBEstoqueBeforeClose(DataSet: TDataSet);
begin
if FEstoque <> nil then SaveColumns(FEstoque.ThemeDBGrid1);
end;
procedure TBanco.TBEstoqueAfterOpen(DataSet: TDataSet);
begin
if FEstoque <> nil then LoadColumns(FEstoque.ThemeDBGrid1);
end;

procedure TBanco.AppEventsMessage(var Msg: tagMSG; var Handled: Boolean);
begin
  if Msg.message = WM_MOUSEWHEEL then
  begin
  Msg.message := WM_NULL;
  end;
end;


procedure TBanco.Image1Move(x, y: integer);
begin
if ((x > ImgLeft[1]) and (x < ImgLeft[1]+ImgWidth[1]) and (y > ImgTop[1]) and (y< ImgTop[1]+ImgHeith[1])) then Img1_Visible  else
if ((x > ImgLeft[2]) and (x < ImgLeft[2]+ImgWidth[2]) and (y > ImgTop[2]) and (y< ImgTop[2]+ImgHeith[2])) then Img2_Visible  else
if ((x > ImgLeft[3]) and (x < ImgLeft[3]+ImgWidth[3]) and (y > ImgTop[3]) and (y< ImgTop[3]+ImgHeith[3])) then Img3_Visible  else
if ((x > ImgLeft[4]) and (x < ImgLeft[4]+ImgWidth[4]) and (y > ImgTop[4]) and (y< ImgTop[4]+ImgHeith[4])) then Img4_Visible  else
if ((x > ImgLeft[5]) and (x < ImgLeft[5]+ImgWidth[5]) and (y > ImgTop[5]) and (y< ImgTop[5]+ImgHeith[5])) then Img5_Visible  else
if ((x > ImgLeft[6]) and (x < ImgLeft[6]+ImgWidth[6]) and (y > ImgTop[6]) and (y< ImgTop[6]+ImgHeith[6])) then Img6_Visible  else
if ((x > ImgLeft[7]) and (x < ImgLeft[7]+ImgWidth[7]) and (y > ImgTop[7]) and (y< ImgTop[7]+ImgHeith[7])) then Img7_Visible  else
if ((x > ImgLeft[8]) and (x < ImgLeft[8]+ImgWidth[8]) and (y > ImgTop[8]) and (y< ImgTop[8]+ImgHeith[8])) then Img8_Visible  else
if ((x > ImgLeft[9]) and (x < ImgLeft[9]+ImgWidth[9]) and (y > ImgTop[9]) and (y< ImgTop[9]+ImgHeith[9])) then Img9_Visible  else
ClearImg;


end;


procedure TBanco.Img1_Visible;
begin
if Img[1] <> -1 then if ((ImgForm as TForm).Components[Img[1]]as TImage).Visible=false then   ((ImgForm as TForm).Components[Img[1]]as TImage).Visible:=true;
if Img[2] <> -1 then if ((ImgForm as TForm).Components[Img[2]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[2]]as TImage).Visible:=false;
if Img[3] <> -1 then if ((ImgForm as TForm).Components[Img[3]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[3]]as TImage).Visible:=false;
if Img[4] <> -1 then if ((ImgForm as TForm).Components[Img[4]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[4]]as TImage).Visible:=false;
if Img[5] <> -1 then if ((ImgForm as TForm).Components[Img[5]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[5]]as TImage).Visible:=false;
if Img[6] <> -1 then if ((ImgForm as TForm).Components[Img[6]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[6]]as TImage).Visible:=false;
if Img[7] <> -1 then if ((ImgForm as TForm).Components[Img[7]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[7]]as TImage).Visible:=false;
if Img[8] <> -1 then if ((ImgForm as TForm).Components[Img[8]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[8]]as TImage).Visible:=false;
if Img[9] <> -1 then if ((ImgForm as TForm).Components[Img[9]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[9]]as TImage).Visible:=false;
end;

procedure TBanco.Img2_Visible;
begin
if Img[1] <> -1 then if ((ImgForm as TForm).Components[Img[1]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[1]]as TImage).Visible:=false;
if Img[2] <> -1 then if ((ImgForm as TForm).Components[Img[2]]as TImage).Visible=false then   ((ImgForm as TForm).Components[Img[2]]as TImage).Visible:=true;
if Img[3] <> -1 then if ((ImgForm as TForm).Components[Img[3]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[3]]as TImage).Visible:=false;
if Img[4] <> -1 then if ((ImgForm as TForm).Components[Img[4]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[4]]as TImage).Visible:=false;
if Img[5] <> -1 then if ((ImgForm as TForm).Components[Img[5]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[5]]as TImage).Visible:=false;
if Img[6] <> -1 then if ((ImgForm as TForm).Components[Img[6]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[6]]as TImage).Visible:=false;
if Img[7] <> -1 then if ((ImgForm as TForm).Components[Img[7]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[7]]as TImage).Visible:=false;
if Img[8] <> -1 then if ((ImgForm as TForm).Components[Img[8]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[8]]as TImage).Visible:=false;
if Img[9] <> -1 then if ((ImgForm as TForm).Components[Img[9]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[9]]as TImage).Visible:=false;
end;
procedure TBanco.Img3_Visible;
begin
if Img[1] <> -1 then if ((ImgForm as TForm).Components[Img[1]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[1]]as TImage).Visible:=false;
if Img[2] <> -1 then if ((ImgForm as TForm).Components[Img[2]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[2]]as TImage).Visible:=false;
if Img[3] <> -1 then if ((ImgForm as TForm).Components[Img[3]]as TImage).Visible=false then   ((ImgForm as TForm).Components[Img[3]]as TImage).Visible:=true;
if Img[4] <> -1 then if ((ImgForm as TForm).Components[Img[4]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[4]]as TImage).Visible:=false;
if Img[5] <> -1 then if ((ImgForm as TForm).Components[Img[5]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[5]]as TImage).Visible:=false;
if Img[6] <> -1 then if ((ImgForm as TForm).Components[Img[6]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[6]]as TImage).Visible:=false;
if Img[7] <> -1 then if ((ImgForm as TForm).Components[Img[7]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[7]]as TImage).Visible:=false;
if Img[8] <> -1 then if ((ImgForm as TForm).Components[Img[8]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[8]]as TImage).Visible:=false;
if Img[9] <> -1 then if ((ImgForm as TForm).Components[Img[9]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[9]]as TImage).Visible:=false;
end;
procedure TBanco.Img4_Visible;
begin
if Img[1] <> -1 then if ((ImgForm as TForm).Components[Img[1]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[1]]as TImage).Visible:=false;
if Img[2] <> -1 then if ((ImgForm as TForm).Components[Img[2]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[2]]as TImage).Visible:=false;
if Img[3] <> -1 then if ((ImgForm as TForm).Components[Img[3]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[3]]as TImage).Visible:=false;
if Img[4] <> -1 then if ((ImgForm as TForm).Components[Img[4]]as TImage).Visible=false then   ((ImgForm as TForm).Components[Img[4]]as TImage).Visible:=true;
if Img[5] <> -1 then if ((ImgForm as TForm).Components[Img[5]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[5]]as TImage).Visible:=false;
if Img[6] <> -1 then if ((ImgForm as TForm).Components[Img[6]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[6]]as TImage).Visible:=false;
if Img[7] <> -1 then if ((ImgForm as TForm).Components[Img[7]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[7]]as TImage).Visible:=false;
if Img[8] <> -1 then if ((ImgForm as TForm).Components[Img[8]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[8]]as TImage).Visible:=false;
if Img[9] <> -1 then if ((ImgForm as TForm).Components[Img[9]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[9]]as TImage).Visible:=false;
end;
procedure TBanco.Img5_Visible;
begin
if Img[1] <> -1 then if ((ImgForm as TForm).Components[Img[1]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[1]]as TImage).Visible:=false;
if Img[2] <> -1 then if ((ImgForm as TForm).Components[Img[2]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[2]]as TImage).Visible:=false;
if Img[3] <> -1 then if ((ImgForm as TForm).Components[Img[3]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[3]]as TImage).Visible:=false;
if Img[4] <> -1 then if ((ImgForm as TForm).Components[Img[4]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[4]]as TImage).Visible:=false;
if Img[5] <> -1 then if ((ImgForm as TForm).Components[Img[5]]as TImage).Visible=false then   ((ImgForm as TForm).Components[Img[5]]as TImage).Visible:=true;
if Img[6] <> -1 then if ((ImgForm as TForm).Components[Img[6]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[6]]as TImage).Visible:=false;
if Img[7] <> -1 then if ((ImgForm as TForm).Components[Img[7]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[7]]as TImage).Visible:=false;
if Img[8] <> -1 then if ((ImgForm as TForm).Components[Img[8]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[8]]as TImage).Visible:=false;
if Img[9] <> -1 then if ((ImgForm as TForm).Components[Img[9]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[9]]as TImage).Visible:=false;
end;
procedure TBanco.Img6_Visible;
begin
if Img[1] <> -1 then if ((ImgForm as TForm).Components[Img[1]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[1]]as TImage).Visible:=false;
if Img[2] <> -1 then if ((ImgForm as TForm).Components[Img[2]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[2]]as TImage).Visible:=false;
if Img[3] <> -1 then if ((ImgForm as TForm).Components[Img[3]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[3]]as TImage).Visible:=false;
if Img[4] <> -1 then if ((ImgForm as TForm).Components[Img[4]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[4]]as TImage).Visible:=false;
if Img[5] <> -1 then if ((ImgForm as TForm).Components[Img[5]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[5]]as TImage).Visible:=false;
if Img[6] <> -1 then if ((ImgForm as TForm).Components[Img[6]]as TImage).Visible=false then   ((ImgForm as TForm).Components[Img[6]]as TImage).Visible:=true;
if Img[7] <> -1 then if ((ImgForm as TForm).Components[Img[7]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[7]]as TImage).Visible:=false;
if Img[8] <> -1 then if ((ImgForm as TForm).Components[Img[8]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[8]]as TImage).Visible:=false;
if Img[9] <> -1 then if ((ImgForm as TForm).Components[Img[9]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[9]]as TImage).Visible:=false;
end;
procedure TBanco.Img7_Visible;
begin
if Img[1] <> -1 then if ((ImgForm as TForm).Components[Img[1]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[1]]as TImage).Visible:=false;
if Img[2] <> -1 then if ((ImgForm as TForm).Components[Img[2]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[2]]as TImage).Visible:=false;
if Img[3] <> -1 then if ((ImgForm as TForm).Components[Img[3]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[3]]as TImage).Visible:=false;
if Img[4] <> -1 then if ((ImgForm as TForm).Components[Img[4]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[4]]as TImage).Visible:=false;
if Img[5] <> -1 then if ((ImgForm as TForm).Components[Img[5]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[5]]as TImage).Visible:=false;
if Img[6] <> -1 then if ((ImgForm as TForm).Components[Img[6]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[6]]as TImage).Visible:=false;
if Img[7] <> -1 then if ((ImgForm as TForm).Components[Img[7]]as TImage).Visible=false then   ((ImgForm as TForm).Components[Img[7]]as TImage).Visible:=true;
if Img[8] <> -1 then if ((ImgForm as TForm).Components[Img[8]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[8]]as TImage).Visible:=false;
if Img[9] <> -1 then if ((ImgForm as TForm).Components[Img[9]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[9]]as TImage).Visible:=false;
end;
procedure TBanco.Img8_Visible;
begin
if Img[1] <> -1 then if ((ImgForm as TForm).Components[Img[1]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[1]]as TImage).Visible:=false;
if Img[2] <> -1 then if ((ImgForm as TForm).Components[Img[2]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[2]]as TImage).Visible:=false;
if Img[3] <> -1 then if ((ImgForm as TForm).Components[Img[3]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[3]]as TImage).Visible:=false;
if Img[4] <> -1 then if ((ImgForm as TForm).Components[Img[4]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[4]]as TImage).Visible:=false;
if Img[5] <> -1 then if ((ImgForm as TForm).Components[Img[5]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[5]]as TImage).Visible:=false;
if Img[6] <> -1 then if ((ImgForm as TForm).Components[Img[6]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[6]]as TImage).Visible:=false;
if Img[7] <> -1 then if ((ImgForm as TForm).Components[Img[7]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[7]]as TImage).Visible:=false;
if Img[8] <> -1 then if ((ImgForm as TForm).Components[Img[8]]as TImage).Visible=false then   ((ImgForm as TForm).Components[Img[8]]as TImage).Visible:=true;
if Img[9] <> -1 then if ((ImgForm as TForm).Components[Img[9]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[9]]as TImage).Visible:=false;
end;
procedure TBanco.Img9_Visible;
begin
if Img[1] <> -1 then if ((ImgForm as TForm).Components[Img[1]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[1]]as TImage).Visible:=false;
if Img[2] <> -1 then if ((ImgForm as TForm).Components[Img[2]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[2]]as TImage).Visible:=false;
if Img[3] <> -1 then if ((ImgForm as TForm).Components[Img[3]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[3]]as TImage).Visible:=false;
if Img[4] <> -1 then if ((ImgForm as TForm).Components[Img[4]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[4]]as TImage).Visible:=false;
if Img[5] <> -1 then if ((ImgForm as TForm).Components[Img[5]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[5]]as TImage).Visible:=false;
if Img[6] <> -1 then if ((ImgForm as TForm).Components[Img[6]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[6]]as TImage).Visible:=false;
if Img[7] <> -1 then if ((ImgForm as TForm).Components[Img[7]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[7]]as TImage).Visible:=false;
if Img[8] <> -1 then if ((ImgForm as TForm).Components[Img[8]]as TImage).Visible=true then  ((ImgForm as TForm).Components[Img[8]]as TImage).Visible:=false;
if Img[9] <> -1 then if ((ImgForm as TForm).Components[Img[9]]as TImage).Visible=false then   ((ImgForm as TForm).Components[Img[9]]as TImage).Visible:=true;
end;
procedure TBanco.Clearimg;
begin
if Img[1] <> -1 then if ((ImgForm as TForm).Components[Img[1]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[1]]as TImage).Visible:=false;
if Img[2] <> -1 then if ((ImgForm as TForm).Components[Img[2]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[2]]as TImage).Visible:=false;
if Img[3] <> -1 then if ((ImgForm as TForm).Components[Img[3]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[3]]as TImage).Visible:=false;
if Img[4] <> -1 then if ((ImgForm as TForm).Components[Img[4]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[4]]as TImage).Visible:=false;
if Img[5] <> -1 then if ((ImgForm as TForm).Components[Img[5]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[5]]as TImage).Visible:=false;
if Img[6] <> -1 then if ((ImgForm as TForm).Components[Img[6]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[6]]as TImage).Visible:=false;
if Img[7] <> -1 then if ((ImgForm as TForm).Components[Img[7]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[7]]as TImage).Visible:=false;
if Img[8] <> -1 then if ((ImgForm as TForm).Components[Img[8]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[8]]as TImage).Visible:=false;
if Img[9] <> -1 then if ((ImgForm as TForm).Components[Img[9]]as TImage).Visible=true then   ((ImgForm as TForm).Components[Img[9]]as TImage).Visible:=false;
end;

procedure TBanco.CalcPos;
var
  i : Shortint;
begin
for i := 1 to high(img) do
begin
  if img[i] = -1 then
  begin
    imgtop[i] := -1;
   ImgLeft[i] := -1;
  ImgWidth[i] := -1;
  ImgHeith[i] := -1;
  end
  else
  begin
     ImgTop[I] := ((ImgForm as TForm).Components[Img[I]]as TImage).Top;
    ImgLeft[I] := ((ImgForm as TForm).Components[Img[I]]as TImage).Left;
   ImgWidth[I] := ((ImgForm as TForm).Components[Img[I]]as TImage).Width;
   ImgHeith[i] := ((ImgForm as TForm).Components[Img[I]]as TImage).Height;
  end;
END;
EXIT;

if Img[1] <> -1 then ImgTop[1] := ((ImgForm as TForm).Components[Img[1]]as TImage).Top;
if Img[2] <> -1 then ImgTop[2] := ((ImgForm as TForm).Components[Img[2]]as TImage).Top;
if Img[3] <> -1 then ImgTop[3] := ((ImgForm as TForm).Components[Img[3]]as TImage).Top;
if Img[4] <> -1 then ImgTop[4] := ((ImgForm as TForm).Components[Img[4]]as TImage).Top;
if Img[5] <> -1 then ImgTop[5] := ((ImgForm as TForm).Components[Img[5]]as TImage).Top;
if Img[6] <> -1 then ImgTop[6] := ((ImgForm as TForm).Components[Img[6]]as TImage).Top;
if Img[7] <> -1 then ImgTop[7] := ((ImgForm as TForm).Components[Img[7]]as TImage).Top;
if Img[8] <> -1 then ImgTop[8] := ((ImgForm as TForm).Components[Img[8]]as TImage).Top;
if Img[9] <> -1 then ImgTop[9] := ((ImgForm as TForm).Components[Img[9]]as TImage).Top;

if Img[1] <> -1 then ImgLeft[1] := ((ImgForm as TForm).Components[Img[1]]as TImage).Left;
if Img[2] <> -1 then ImgLeft[2] := ((ImgForm as TForm).Components[Img[2]]as TImage).Left;
if Img[3] <> -1 then ImgLeft[3] := ((ImgForm as TForm).Components[Img[3]]as TImage).Left;
if Img[4] <> -1 then ImgLeft[4] := ((ImgForm as TForm).Components[Img[4]]as TImage).Left;
if Img[5] <> -1 then ImgLeft[5] := ((ImgForm as TForm).Components[Img[5]]as TImage).Left;
if Img[6] <> -1 then ImgLeft[6] := ((ImgForm as TForm).Components[Img[6]]as TImage).Left;
if Img[7] <> -1 then ImgLeft[7] := ((ImgForm as TForm).Components[Img[7]]as TImage).Left;
if Img[8] <> -1 then ImgLeft[8] := ((ImgForm as TForm).Components[Img[8]]as TImage).Left;
if Img[9] <> -1 then ImgLeft[9] := ((ImgForm as TForm).Components[Img[9]]as TImage).Left;

if Img[1] <> -1 then ImgWidth[1] := ((ImgForm as TForm).Components[Img[1]]as TImage).Width;
if Img[2] <> -1 then ImgWidth[2] := ((ImgForm as TForm).Components[Img[2]]as TImage).Width;
if Img[3] <> -1 then ImgWidth[3] := ((ImgForm as TForm).Components[Img[3]]as TImage).Width;
if Img[4] <> -1 then ImgWidth[4] := ((ImgForm as TForm).Components[Img[4]]as TImage).Width;
if Img[5] <> -1 then ImgWidth[5] := ((ImgForm as TForm).Components[Img[5]]as TImage).Width;
if Img[6] <> -1 then ImgWidth[6] := ((ImgForm as TForm).Components[Img[6]]as TImage).Width;
if Img[7] <> -1 then ImgWidth[7] := ((ImgForm as TForm).Components[Img[7]]as TImage).Width;
if Img[8] <> -1 then ImgWidth[8] := ((ImgForm as TForm).Components[Img[8]]as TImage).Width;
if Img[9] <> -1 then ImgWidth[9] := ((ImgForm as TForm).Components[Img[9]]as TImage).Width;


if Img[1] <> -1 then ImgHeith[1] := ((ImgForm as TForm).Components[Img[1]]as TImage).Height;
if Img[2] <> -1 then ImgHeith[2] := ((ImgForm as TForm).Components[Img[2]]as TImage).Height;
if Img[3] <> -1 then ImgHeith[3] := ((ImgForm as TForm).Components[Img[3]]as TImage).Height;
if Img[4] <> -1 then ImgHeith[4] := ((ImgForm as TForm).Components[Img[4]]as TImage).Height;
if Img[5] <> -1 then ImgHeith[5] := ((ImgForm as TForm).Components[Img[5]]as TImage).Height;
if Img[6] <> -1 then ImgHeith[6] := ((ImgForm as TForm).Components[Img[6]]as TImage).Height;
if Img[7] <> -1 then ImgHeith[7] := ((ImgForm as TForm).Components[Img[7]]as TImage).Height;
if Img[8] <> -1 then ImgHeith[8] := ((ImgForm as TForm).Components[Img[8]]as TImage).Height;
if Img[9] <> -1 then ImgHeith[9] := ((ImgForm as TForm).Components[Img[9]]as TImage).Height;

end;

procedure TBanco.FormatarString1Click(Sender: TObject);
var
  ComponentIndex : Integer;
begin
ComponentIndex := -1;

if not (FClientes_New = nil) then
begin
  ComponentIndex := FClientes_New.focused;

  if ComponentIndex > -1 then
  if (FClientes_New.Components[ComponentIndex] is Tedit) then
  (FClientes_New.Components[ComponentIndex] as Tedit).text := FormatString((FClientes_New.Components[ComponentIndex] as Tedit).Text);

  if ComponentIndex > -1 then
  if (FClientes_New.Components[ComponentIndex] is TDBEdit) then
  if ((FClientes_New.Components[ComponentIndex] as TDBEdit).Field is TStringField) then
  (FClientes_New.Components[ComponentIndex] as TDBEdit).Field.Value := FormatString( (FClientes_New.Components[ComponentIndex] as TDBEdit).Text );
end;

if not (New_Funcionario = nil) then
begin
  ComponentIndex := New_Funcionario.focused;

  if ComponentIndex > -1 then
  if (New_Funcionario.Components[ComponentIndex] is Tedit) then
  (New_Funcionario.Components[ComponentIndex] as Tedit).text := FormatString((New_Funcionario.Components[ComponentIndex] as Tedit).Text);

  if ComponentIndex > -1 then
  if (New_Funcionario.Components[ComponentIndex] is TDBEdit) then
  if ((New_Funcionario.Components[ComponentIndex] as TDBEdit).Field is TStringField) then
  (New_Funcionario.Components[ComponentIndex] as TDBEdit).Field.Value := FormatString( (New_Funcionario.Components[ComponentIndex] as TDBEdit).Text );
end;


if not (Fconta_New = nil) then
begin
  ComponentIndex := Fconta_New.focused;

  if ComponentIndex > -1 then
  if (Fconta_New.Components[ComponentIndex] is Tedit) then
  (Fconta_New.Components[ComponentIndex] as Tedit).text := FormatString((Fconta_New.Components[ComponentIndex] as Tedit).Text);

  if ComponentIndex > -1 then
  if (Fconta_New.Components[ComponentIndex] is TDBEdit) then
  if ((Fconta_New.Components[ComponentIndex] as TDBEdit).Field is TStringField) then
  (Fconta_New.Components[ComponentIndex] as TDBEdit).Field.Value := FormatString( (Fconta_New.Components[ComponentIndex] as TDBEdit).Text );
end;



if not (FEstoque_New = nil) then
begin
  ComponentIndex := FEstoque_New.focused;

  if ComponentIndex > -1 then
  if (FEstoque_New.Components[ComponentIndex] is Tedit) then
  (FEstoque_New.Components[ComponentIndex] as Tedit).text := FormatString((FEstoque_New.Components[ComponentIndex] as Tedit).Text);

  if ComponentIndex > -1 then
  if (FEstoque_New.Components[ComponentIndex] is TDBEdit) then
  if ((FEstoque_New.Components[ComponentIndex] as TDBEdit).Field is TStringField) then
  (FEstoque_New.Components[ComponentIndex] as TDBEdit).Field.Value := FormatString( (FEstoque_New.Components[ComponentIndex] as TDBEdit).Text );
end;


if not (FEmitente = nil) then
begin
  ComponentIndex := FEmitente.focused;

  if ComponentIndex > -1 then
  if (FEmitente.Components[ComponentIndex] is Tedit) then
  (FEmitente.Components[ComponentIndex] as Tedit).text := FormatString((FEmitente.Components[ComponentIndex] as Tedit).Text);

  if ComponentIndex > -1 then
  if (FEmitente.Components[ComponentIndex] is TDBEdit) then
  if ((FEmitente.Components[ComponentIndex] as TDBEdit).Field is TStringField) then
  (FEmitente.Components[ComponentIndex] as TDBEdit).Field.Value := FormatString( (FEmitente.Components[ComponentIndex] as TDBEdit).Text );
end;


if not (FFinaliza = nil) then
begin
  ComponentIndex := FFinaliza.focused;

  if ComponentIndex > -1 then
  if (FFinaliza.Components[ComponentIndex] is Tedit) then
  (FFinaliza.Components[ComponentIndex] as Tedit).text := FormatString((FFinaliza.Components[ComponentIndex] as Tedit).Text);

  if ComponentIndex > -1 then
  if (FFinaliza.Components[ComponentIndex] is TDBEdit) then
  if ((FFinaliza.Components[ComponentIndex] as TDBEdit).Field is TStringField) then
  (FFinaliza.Components[ComponentIndex] as TDBEdit).Field.Value := FormatString( (FFinaliza.Components[ComponentIndex] as TDBEdit).Text );
end;


end;

procedure TBanco.OpenCNPJCPF(value: shortstring);
begin

value := VerificaCNPJ(value,false,false);

//ShowMessage(IntToStr(length(aux))+'"'+aux+'"');
if value = '' then
exit;

Try
if length(value) = 11 then
begin
FPrincipal.OpenPage(Const_CPF_Page,value,false)
end
else
begin
  if campo_cnpj <> '' then
    FPrincipal.OpenPage(Const_CNPJ_Page+'?'+campo_cnpj+'='+value,value,false)
  else
    FPrincipal.OpenPage(Const_CNPJ_Page,value,false);
end;


except
on e : exception do
begin
if MessageDlg('Foi encontrado um erro em uma DLL,'+#13+'Classe do Erro: '+e.ClassName+e.Message+#13+'É recomendado finalizar a aplicação, deseja continuar?',mtError,[mbNo,mbYes],0) =mryes then
Application.Terminate;


end;


end;end;

procedure TBanco.TB_FuncionariosBeforePost(DataSet: TDataSet);
begin
try
//TB_FuncionariosNome.Value       := lastcaracter(TB_FuncionariosNome.Value);
TB_FuncionariosLogradouro.Value := lastcaracter(TB_FuncionariosLogradouro.Value);
TB_FuncionariosNumero.Value     := lastcaracter(TB_FuncionariosNumero.Value);
TB_FuncionariosComplemento.Value:= lastcaracter(TB_FuncionariosComplemento.Value);
TB_FuncionariosBairro.Value     := lastcaracter(TB_FuncionariosBairro.Value);
TB_FuncionariosEmail.Value      := lastcaracter(TB_FuncionariosEmail.Value);
TB_FuncionariosTel_Res.Value    := lastcaracter(TB_FuncionariosTel_Res.Value);
TB_FuncionariosTel_Cel.Value    := lastcaracter(TB_FuncionariosTel_Cel.Value);
TB_FuncionariosRG.Value         := lastcaracter(TB_FuncionariosRG.Value);
TB_FuncionariosPIS.Value        := lastcaracter(TB_FuncionariosPIS.Value);
except
on e : exception do
Create_Erro(e.ClassName,e.Message);
end;

end;

procedure TBanco.TBClientesBeforePost(DataSet: TDataSet);
begin
try
TBClientesNome.Value       := lastcaracter(TBClientesNome.Value);
//TBClientesNome_Razao.Value := lastcaracter(TBClientesNome_Razao.Value);
TBClientesLogradouro.Value := lastcaracter(TBClientesLogradouro.Value);
TBClientesNumero.Value     := lastcaracter(TBClientesNumero.Value);
TBClientesComplemento.Value:= lastcaracter(TBClientesComplemento.Value);
TBClientesBairro.Value     := lastcaracter(TBClientesBairro.Value);
TBClientesEmail.Value      := lastcaracter(TBClientesEmail.Value);
TBClientesIE.Value         := lastcaracter(TBClientesIE.Value);
TBClientesIM.Value         := lastcaracter(TBClientesIM.Value);
except
on e : exception do
Create_Erro(e.ClassName,e.Message);
end;

end;

procedure TBanco.TBMunicipioBeforeOpen(DataSet: TDataSet);
begin
if TBMunicipio.Active then
Create_Erro('NOT_CLASS_BY_FAZZI','TABELA MUNICIPIOS NãO PODE SER ENCERRADA, POIS A MESMA LISTA AS CIDADES');

end;

procedure TBanco.Copiar1Click(Sender: TObject);
var
  ComponentIndex : Integer;
begin
ComponentIndex := -1;

if not (FClientes_New = nil) then
begin
  ComponentIndex := FClientes_New.focused;

  if ComponentIndex > -1 then
  if (FClientes_New.Components[ComponentIndex] is Tedit) then
  begin
  (FClientes_New.Components[ComponentIndex] as Tedit).SelectAll;
  (FClientes_New.Components[ComponentIndex] as Tedit).CopyToClipboard;
  end;

  if ComponentIndex > -1 then
  if (FClientes_New.Components[ComponentIndex] is TDBEdit) then
  begin
  (FClientes_New.Components[ComponentIndex] as TDBEdit).SelectAll;
  (FClientes_New.Components[ComponentIndex] as TDBEdit).CopyToClipboard;
  end;

end;

if not (New_Funcionario = nil) then
begin
  ComponentIndex := New_Funcionario.focused;

  if ComponentIndex > -1 then
  if (New_Funcionario.Components[ComponentIndex] is Tedit) then
  begin
    (New_Funcionario.Components[ComponentIndex] as Tedit).SelectAll;
    (New_Funcionario.Components[ComponentIndex] as Tedit).CopyToClipboard;
  end;




  if ComponentIndex > -1 then
  if (New_Funcionario.Components[ComponentIndex] is TDBEdit) then
  begin
    (New_Funcionario.Components[ComponentIndex] as TDBEdit).SelectAll;
    (New_Funcionario.Components[ComponentIndex] as TDBEdit).CopyToClipboard;
  end;
end;


if not (FEstoque_New = nil) then
begin
  ComponentIndex := FEstoque_New.focused;

  if ComponentIndex > -1 then
  if (FEstoque_New.Components[ComponentIndex] is Tedit) then
  begin
  (FEstoque_New.Components[ComponentIndex] as Tedit).SelectAll;
  (FEstoque_New.Components[ComponentIndex] as Tedit).CopyToClipboard;
  end;

  if ComponentIndex > -1 then
  if (FEstoque_New.Components[ComponentIndex] is TDBEdit) then
  begin
  (FEstoque_New.Components[ComponentIndex] as TDBEdit).SelectAll;
  (FEstoque_New.Components[ComponentIndex] as TDBEdit).CopyToClipboard;
  end;
end;


if not (FEmitente = nil) then
begin
  ComponentIndex := FEmitente.focused;

  if ComponentIndex > -1 then
  if (FEmitente.Components[ComponentIndex] is Tedit) then
  begin
   (FEmitente.Components[ComponentIndex] as Tedit).SelectAll;
   (FEmitente.Components[ComponentIndex] as Tedit).CopyToClipboard;
  end;

  if ComponentIndex > -1 then
  if (FEmitente.Components[ComponentIndex] is TDBEdit) then
  begin
   (FEmitente.Components[ComponentIndex] as TDBEdit).SelectAll;
   (FEmitente.Components[ComponentIndex] as TDBEdit).CopyToClipboard;
  end;
end;


if not (FFinaliza = nil) then
begin
  ComponentIndex := FFinaliza.focused;

  if ComponentIndex > -1 then
  if (FFinaliza.Components[ComponentIndex] is Tedit) then
  begin
  (FFinaliza.Components[ComponentIndex] as Tedit).SelectAll;
  (FFinaliza.Components[ComponentIndex] as Tedit).CopyToClipboard;
  end;

  if ComponentIndex > -1 then
  if (FFinaliza.Components[ComponentIndex] is TDBEdit) then
  begin
  (FFinaliza.Components[ComponentIndex] as TDBEdit).SelectAll;
  (FFinaliza.Components[ComponentIndex] as TDBEdit).CopyToClipboard;
  end;
end;


end;

Function TBanco.LoadBitmap(Field: TBlobField; Imagem: Graphics.TBitmap):Boolean;
var
  Stream : TMemoryStream;
begin
result := false;

  try
    Stream := TMemoryStream.Create;
    Field.SaveToStream(Stream);
    Imagem.LoadFromStream(Stream);
    Stream.SaveToFile('c:\$Temp~logo_Empresa.bmp');

    if FileExists('c:\$Temp~logo_Empresa.bmp') then
    begin
    Imagem.LoadFromFile('c:\$Temp~logo_Empresa.bmp');
    DeleteFile('c:\$Temp~logo_Empresa.bmp');
    end;
    
    Result := true;
    FreeAndNil(Stream);
  Except
    on e : exception do
    begin
    banco.Create_Erro(e.ClassName,e.Message);
    result := false;
    FreeAndNil(Stream);
  end;
  end;
end;



procedure TBanco.ListaQuery(Query: TDataSet; Title: ShortString;descri_view:Integer);

  Function FormataValue(Field:TField):ShortString;
  begin
  if Field.IsNull then
  result := ''
  else
  try
  result := Field.AsString;


  if Field is TFloatField then //Float
  Result := FormatFloat(',0.00',Field.Value)
  else
  if Field is TDateTimeField then // Date
  Result := FormatDateTime('DD/MM/YYYY',Field.Value);
  if Field is TBooleanField then// boolen
  begin
    if Field.Value = true then
    Result := 'Sim'
    else
    Result := 'Não';
  end;
  except
  result := '';
  end;
  end;


var
  HTML : TStringList;
  i : Integer;
  Cor_Title : ShortString;
  Color_FUndo : array [1..2] of ShortString;
  last_Color : Boolean;
  Cod_Select : integer;
  Field_Cod : Integer;

  Form_Lista_Progress : TForm;
  Label_Lista : TLabel;
  Progres_Lista : Tprogressbar;

  DisableCtrls : Boolean;
begin
  DisableCtrls := true;
  DisableCtrls := not(Query.ControlsDisabled);
  Query.DisableControls;

  cod_select:= 0;
  field_Cod := -1;

  For i := 0 to Query.Fields.Count -1 do
  if LowerCase(Query.Fields[i].FieldName) = 'codigo' then
  begin
  cod_select:= Query.Fields[i].AsInteger;
  Field_Cod := i;
  break;
  end;

  Cor_Title := ColortoHTML(banco.Relatorio_Color_Title);
  Color_FUndo[1] :=ColortoHTML(banco.Relatorio_color_fundo[1]);
  Color_FUndo[2] :=ColortoHTML(banco.Relatorio_color_fundo[2]);


if  Query.State in [dsInactive] then
Query.Open;

if Query.RecordCount = 0 then exit;

    if not DirectoryExists(banco.App_Dir+'Relatorios\') then
      if not CreateDir(banco.App_Dir+'Relatorios\') then
      begin
      MessageDlg('Erro ao criar pastas, será necessário criar manualmente'+#13+banco.App_Dir+'Relatorios\',mtError,[mbok],0);
      exit;
    end;


try
Form_Lista_Progress := TForm.Create(nil);
Form_Lista_Progress.Width  := 355;
Form_Lista_Progress.Height := 129;
Form_Lista_Progress.BorderStyle := bsDialog;
Form_Lista_Progress.BorderIcons := [];
Form_Lista_Progress.Caption := Title;
Form_Lista_Progress.Position := poDesktopCenter;
Form_Lista_Progress.KeyPreview := true;
Form_Lista_Progress.OnKeyDown := FormKeyDown;
Form_Lista_Progress.Ondeactivate := FormDeactivate;


Label_Lista := TLabel.Create(Form_Lista_Progress);
Label_Lista.Parent := Form_Lista_Progress;
Label_Lista.AutoSize := false;
Label_Lista.Width :=329;
Label_Lista.Height :=19;
Label_Lista.Font.Name :='Times New Roman';
Label_Lista.Font.Size := 12;
Label_Lista.Top := 8;
Label_Lista.Left :=8;
Label_Lista.Caption := 'Visualizando registros';
Label_Lista.Alignment := taCenter;


Progres_Lista := TProgressBar.Create(Form_Lista_Progress);
Progres_Lista.Parent := Form_Lista_Progress;
Progres_Lista.Position := 0;
Progres_Lista.Width :=325;
Progres_Lista.Height :=17;
Progres_Lista.Left :=8;
Progres_Lista.Top:= 64;


Form_Lista_Progress.Show;

Try
   HTML := TStringList.Create;
   HTML.Add('<html><head><title>Exportação de dados</title></head>');
   HTML.Add('<body bgcolor="#FFFFFF" vlink="#FF0000" leftmargin="0"><center>');
   if not Empresa_Imagem.Bitmap.Empty then
   begin
   Empresa_Imagem.SaveToFile(banco.App_Dir+'Relatorios\Empresa_Logo.bmp');
   HTML.Add('<br><img src = "'+Banco.App_Dir+'Relatorios\Empresa_Logo.bmp" height="'+IntToStr(Empresa_Imagem.Height)+'">');//
   end;

   HTML.Add('<br><font size='+IntToStr(banco.Relatorio_Font_Size + 2)+' color=#000000 face="'+banco.Relatorio_Font_Name+'"><b>'+Empresa_Nome+'</b></font>'); //
   HTML.Add('<br><font size='+IntToStr(banco.Relatorio_Font_Size + 1)+' color=#000000 face="'+banco.Relatorio_Font_Name+'"><b>'+Title+'</b></font>'); //
   HTML.Add('<br>');
   HTML.Add('<br>');
   HTML.Add('<table border=0 bgcolor=#000000 cellspacing=1 cellpadding=4>');

   //Titulo  da tabela
   HTML.Add('    <tr bgcolor='+Cor_Title+'>'); //Cor do titulo  #C0DCC0
   For i := 0 to Query.Fields.Count - 1 do
   if query.Fields[i].Visible then
   if query.Fields[i].Tag = 0 then
   HTML.Add('        <th nowrap><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+query.Fields[i].DisplayLabel+'</font></th>');


    //Listanto dados
   last_Color := true;
   Query.First;
   while not Query.Eof do
   begin
    Progres_Lista.Max := query.RecordCount;
    Progres_Lista.Position := Query.RecNo;



    if last_Color then
      HTML.Add('<tr bgcolor='+Color_FUndo[1]+'>') //#FFFFFF
    else
      HTML.Add('<tr bgcolor='+Color_FUndo[2]+'>');


     For i := 0 to Query.Fields.Count - 1 do
     if query.Fields[i].Visible then
     if query.Fields[i].Tag = 0 then
     begin
     HTML.Add('        <th nowrap><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+FormataValue(query.Fields[i])+'</font></th>');
          if Query.Fields[i].Index = descri_view then
          begin
          Label_Lista.Caption := VarToStr(Query.Fields[i].Value);
          Application.ProcessMessages;
          end;
     end;


   last_Color := not(last_Color);
   query.Next;
   end;



   HTML.Add('</table>');
   HTML.Add('<br><font size='+IntToStr(banco.Relatorio_Font_Size-1)+' face="'+banco.Relatorio_Font_Name+'">Relatório gerado em '+FormatDateTime('dd/mm/yyyy HH:MM',now)+', através do sistema '+SisName+'</font>');
   HTML.Add('<br><font size='+IntToStr(banco.Relatorio_Font_Size-1)+' face="'+banco.Relatorio_Font_Name+'">Número de registros: '+IntToStr(Query.RecordCount)+'</font>');
   HTML.Add('<br>');
   HTML.Add('</center>');
   HTML.Add('</html>');



   html.SaveToFile(banco.App_Dir+'Relatorios\123.html');
   FPrincipal.OpenPage(Banco.App_Dir+'Relatorios\123.html','',true);
   //ShellExecute(Application.Handle, nil, pchar(Banco.App_Dir+'Relatorios\123.html') , nil, nil, SW_SHOWNORMAL);

  if Field_Cod <> -1 then
  Query.Locate(query.Fields[field_cod].FieldName,Cod_Select,[]);

  Form_Lista_Progress.OnDeactivate := nil;
  Form_Lista_Progress.Close;

Except
   on e : exception do
   begin
   banco.Create_Erro(e.ClassName,e.Message);
   MessageDlg('Erro ao criar lista'+#13+e.Message,mtError,[mbok],0);
   end;
end;

Finally
FreeAndNil(Label_Lista);
FreeAndNil(Progres_Lista);
FreeAndNil(Form_Lista_Progress);
if DisableCtrls then Query.EnableControls;
end;
end;

procedure TBanco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
key := 0;

end;

procedure TBanco.LoadEmpresa;
var
  DD_ : ShortString;
begin

if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'RazSoc',[]) then Empresa_Nome := TB_EmitenteValor.Value else Empresa_Nome := '';
if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'CNPJ',[])   then empresa_cnpj := TB_EmitenteValor.Value else empresa_cnpj := '';
if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'IncEst',[]) then empresa_IE := TB_EmitenteValor.Value else Empresa_IE := '';
if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'IncMun',[]) then Empresa_Im := TB_EmitenteValor.Value else Empresa_Im := '';
if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'Fant',  []) then empresa_Fantasia := TB_EmitenteValor.Value else empresa_Fantasia := '';
if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'Resp',  []) then empresa_Responsavel := TB_EmitenteValor.Value else empresa_Responsavel := '';
if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'Cep',   []) then empresa_cep := TB_EmitenteValor.Value else empresa_cep := '';
if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'Log',   []) then Empresa_rua := TB_EmitenteValor.Value else Empresa_rua := '';
if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'Bairr', []) then empresa_bairro := TB_EmitenteValor.Value else empresa_bairro := '';
if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'Nume',  []) then Empresa_Numero := TB_EmitenteValor.Value else Empresa_Numero := '';
if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'Compl', []) then empresa_Complemento := TB_EmitenteValor.Value else empresa_Complemento := '';
//if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'Mail',  []) then Edit9 := TB_EmitenteValor.Value else Edit9 := '';

empresa_TelRes:='';
empresa_TelCom:='';
empresa_TelCel:='';

if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'DD_1',  []) then
begin
dd_ := TB_EmitenteValor.Value;
  if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'Fone_1',[]) then
  empresa_TelRes := FormataTel(DD_,TB_EmitenteValor.Value);
end;
if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'DD_2',  []) then
begin
dd_ := TB_EmitenteValor.Value;
  if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'Fone_2',[]) then
  empresa_TelCom := FormataTel(DD_,TB_EmitenteValor.Value);
end;

if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'DD_3',  []) then
begin
dd_ := TB_EmitenteValor.Value;
  if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'Fone_3',[]) then
  empresa_TelCel := FormataTel(DD_,TB_EmitenteValor.Value);
end;


if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'UF',[]) then empresa_UF := TB_EmitenteValor.Value    else empresa_UF := '';

if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'Cid',[]) then Empresa_Cidade:= TB_EmitenteValor.Value else Empresa_Cidade := '';

if TB_Emitente.Locate(TB_EmitenteConfiName.FieldName,'Tipo',[])then Empresa_Tipo_rua := TB_EmitenteValor.Value else Empresa_Tipo_rua := '';




    Empresa_Nome   := 'Empresa Demonstração Ltda - ME';
   // empresa_cnpj   := '11.111.111-11';
   Empresa_CNPJ := '27743542000100';
   


end;

procedure TBanco.SearchReg(DataSet: TDataSet; Value: ShortString);
 { Function VerificaReg(Verificar,value:ShortString):Boolean;
  begin


  end;^}

var
Achou : Boolean;
I : integer;
begin
if value = '' then
exit;

  achou := false;
  DataSet.Next;
  
while not Achou do
begin
if DataSet.Eof then
Achou:=true;

  For i := 0 to DataSet.Fields.Count-1 do
  if DataSet.Fields[i].Visible then
  begin
    if DataSet.Fields[i] is TStringField then
    if Pos(Value,DataSet.Fields[i].AsString) <> 0 then
    Achou := true;

  end;
if not achou then
DataSet.Next;

end;


end;

procedure TBanco.TB_PedidoFaturaValidate(Sender: TField);
begin
  if not banco.TB_PedidoFatura.IsNull then
  begin
  FFinaliza.Label7.Visible := true;
  FFinaliza.DBLookupComboBox3.Visible := true;
  end;

end;

procedure TBanco.CloseTableCliente; //--------------------------------------------------------------------------------------------------
begin
     banco.TB_ClientesInfo.Close;
     banco.TB_ClientesInfo.Open;

     banco.TB_Pedido.Close;
     banco.TB_Contas.Close;
     banco.TB_Agenda.Close;
end;

function TBanco.FormatTelEdit(value: ShortString;Formata:Boolean): ShortString;
var
  i : byte;
  aux : string [12];
begin

aux := '';
for i := 0 to length(value) do
if value[i] in ['0'..'9'] then
aux := aux + value [i];

if formata then
result := copy (aux,1,4)+' '+copy(aux,5,length(aux))
else
result := aux;


end;

function TBanco.IsInt(value: ShortString): Boolean;
var
  i : byte;
begin
result := false;

if value = '' then
exit;

for i := 1 to length(value) do
if not (value[i] in ['0'..'9']) then
begin
Result := false;
exit;
end;

Result := true;

end;

procedure TBanco.TB_ParcelamentoAfterOpen(DataSet: TDataSet);
begin
if FParcelas <> nil then LoadColumns(FParcelas.ThemeDBGrid1);
end;
procedure TBanco.TB_ParcelamentoBeforeClose(DataSet: TDataSet);
begin
if FParcelas <> nil then SaveColumns(FParcelas.ThemeDBGrid1);
end;




//-------------------------------------------------------------------------------------------------
procedure TBanco.HistoricoCliente(IdCliente:cardinal);
  Function FormataValue(Field:TField):ShortString;
  begin
  if Field.IsNull then
  result := ''
  else
  try
  result := Field.AsString;


  if (Field is TFloatField) then //Float
  Result := FormatFloat(',0.00',Field.Value)
  else
    if (Field is TBCDField) then //Float
    Result := FormatFloat(',0.00',Field.Value)
  else
    if (Field is TCurrencyField) then //currency
  Result := FormatFloat(',0.00',Field.Value)
  else
  if Field is TDateTimeField then // Date
  Result := FormatDateTime('DD/MM/YYYY',Field.Value);
  if Field is TBooleanField then// boolen
  begin
    if Field.Value = true then
    Result := 'Sim'
    else
    Result := 'Não';
  end;
  except
  result := '';
  end;
  end;

Var
  Arquivo : TStringList;
  ColunaCount,    MetadeCol,  i,A,B : byte;
  ContasCount, PedidosCount : byte;
  aux : ShortString;
  LastColor : Boolean;
  ultimo_field : byte;
  Form_Lista_Progress : TForm;
  Label_Lista : TLabel;
  Progres_Lista : Tprogressbar;
begin
if not banco.Cli_Vis_Hist then banco.NotPermissao;


try
Form_Lista_Progress := TForm.Create(nil);
Form_Lista_Progress.Width  := 355;
Form_Lista_Progress.Height := 129;
Form_Lista_Progress.BorderStyle := bsDialog;
Form_Lista_Progress.BorderIcons := [];
Form_Lista_Progress.Caption := 'Histórico do cliente...';
Form_Lista_Progress.Position := poDesktopCenter;
Form_Lista_Progress.KeyPreview := true;
Form_Lista_Progress.OnKeyDown := FormKeyDown;
Form_Lista_Progress.Ondeactivate := FormDeactivate;


Label_Lista := TLabel.Create(Form_Lista_Progress);
Label_Lista.Parent := Form_Lista_Progress;
Label_Lista.AutoSize := false;
Label_Lista.Width :=329;
Label_Lista.Height :=19;
Label_Lista.Font.Name :='Times New Roman';
Label_Lista.Font.Size := 12;
Label_Lista.Top := 8;
Label_Lista.Left :=8;
Label_Lista.Caption := 'Visualizando registros';
Label_Lista.Alignment := taCenter;


Progres_Lista := TProgressBar.Create(Form_Lista_Progress);
Progres_Lista.Parent := Form_Lista_Progress;
Progres_Lista.Position := 0;
Progres_Lista.Width :=325;
Progres_Lista.Height :=17;
Progres_Lista.Left :=8;
Progres_Lista.Top:= 64;


Form_Lista_Progress.Show;





// encontrar o cliente
if Banco.TBClientes.State in [dsInactive] then //se estiver desativada
begin
  banco.TBClientes.SQL.Clear;
  banco.TBClientes.SQL.Add('Select * cliente_cadastro');
  banco.TBClientes.Open; 
  if not TBClientes.Locate(banco.TBClientesCodigo.FieldName,IdCliente,[]) then
  exit;
end;

if banco.TBClientesCodigo.Value <> IdCliente then
if not TBClientes.Locate(banco.TBClientesCodigo.FieldName,IdCliente,[]) then
begin
  banco.TBClientes.SQL.Clear;
  banco.TBClientes.SQL.Add('Select * cliente_cadastro');
  banco.TBClientes.Open;
  if not TBClientes.Locate(banco.TBClientesCodigo.FieldName,IdCliente,[]) then
  exit;
end;



Try
banco.TB_Pedido_Histo.Close;
  Arquivo := TStringList.Create;
  ColunaCount :=0;
  MetadeCol := 0;
  A := 0;
  b := 0;

  // Movendo / visible    fields
  // tabela Pedido
  for i := 0 to banco.TB_Pedido_Histo.Fields.Count -1 do
   begin
   banco.TB_Pedido_Histo.Fields[i].Visible := false;
   if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,100+i,[]) then
   if banco.RetornFieldname(Banco.TB_ConfigValor.Value,banco.TB_Pedido_Histo) <> -1 then
    begin
     a := banco.RetornFieldname(Banco.TB_ConfigValor.Value,banco.TB_Pedido_Histo);
     banco.TB_Pedido_Histo.Fields[a].Visible := true;
     banco.TB_Pedido_Histo.Fields[a].Index :=  i;
     Inc(ColunaCount);
    end;
   end;
   PedidosCount := ColunaCount;

   for i := 0 to banco.TB_Contas_Histo.Fields.Count -1 do
   begin
   banco.TB_Contas_Histo.Fields[i].Visible := false;
   if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,200+i,[]) then
   if banco.RetornFieldname(Banco.TB_ConfigValor.Value,banco.TB_Contas_Histo) <> -1 then
    begin
     a := banco.RetornFieldname(Banco.TB_ConfigValor.Value,banco.TB_Contas_Histo);
     banco.TB_Contas_Histo.Fields[a].Visible := true;
     banco.TB_Contas_Histo.Fields[a].Index :=  i;
     Inc(b);
    end;
   end;
   ContasCount := b;


   if PedidosCount = 0 then
   begin
   PedidosCount := 1;
   banco.TB_Pedido_Histo.Fields[0].Visible := true;
   end;
   

   if ContasCount = 0 then
   begin
   ContasCount := 1;
   banco.TB_Contas_Histo.Fields[0].Visible := true;
   end;

  //
  if ContasCount > PedidosCount then
  ColunaCount := ContasCount
  else
  ColunaCount := PedidosCount;

  if ColunaCount < 6 then
  ColunaCount := 6;

  MetadeCol := ColunaCount div 2;


      //Centralizando fields TB_Pedido
      ultimo_field := 0;
      For i := 0 to banco.TB_Pedido_Histo.Fields.Count -1 do
      if banco.TB_Pedido_Histo.Fields[i].Visible then     ultimo_field:=i;

          A := (ColunaCount div PedidosCount);
          B := ColunaCount - (a * PedidosCount);

      for i := 0 to banco.TB_Pedido_Histo.Fields.Count -1 do
      banco.TB_Pedido_Histo.Fields[i].Tag := a;

      For i := banco.TB_Pedido_Histo.Fields.Count -1 downto 0 do
      if b > 0 then
      if banco.TB_Pedido_Histo.Fields[i].Visible then
      begin
      banco.TB_Pedido_Histo.Fields[i].Tag := banco.TB_Pedido_Histo.Fields[i].Tag + 1;
      b :=  b -1;
      end;




      //Centralizando fields TB_Contas
      ultimo_field := 0;
      For i := 0 to banco.TB_Contas_Histo.Fields.Count -1 do
      if banco.TB_Contas_Histo.Fields[i].Visible then     ultimo_field:=i;

          A := (ColunaCount div ContasCount);
          B := ColunaCount - (a * ContasCount);

      for i := 0 to banco.TB_Contas_Histo.Fields.Count -1 do
      banco.TB_Contas_Histo.Fields[i].Tag := a;

      For i := banco.TB_Contas_Histo.Fields.Count -1 downto 0 do
      if b > 0 then
      if banco.TB_Contas_Histo.Fields[i].Visible then
      begin
      banco.TB_Contas_Histo.Fields[i].Tag := banco.TB_Contas_Histo.Fields[i].Tag + 1;
      b :=  b -1;
      end;






  with Arquivo do
  begin
  Add('<html><head><title>Exportação de dados</title></head>');
  Add('<body bgcolor="#FFFFFF" vlink="#FF0000" leftmargin="0"><center>');
  Add('<br>');
  Add('<br>');
  Add('<table border=0 bgcolor=#000000 cellspacing=1 cellpadding=4>');

  // titulo da tabela
  Add('    <tr bgcolor='+banco.ColortoHTML(banco.Relatorio_Color_Title)+'>'); //Cor do titulo  #C0DCC0  ||     insere nova linha
  Add('        <th colspan='+IntToStr(ColunaCount)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">Informações do Cliente</th>');
  Add('    </tr>');

  //Inserindo informações  do cliente
  // Cod
  // Contato
   Add('    <tr bgcolor='+banco.ColortoHTML(clWhite)+'>');
   Add('        <th align="right"><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TBClientesCodigo.DisplayLabel+'</th> ');
    if banco.TBClientesNome.Value = '' then
    begin
    Add('        <th align="left" colspan='+IntToStr(ColunaCount -1)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+IntToStr(banco.TBClientesCodigo.Value)+'</th>');
    end
    else
    begin
    Add('        <th align="left" colspan='+IntToStr(MetadeCol -1)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+IntToStr(banco.TBClientesCodigo.Value)+'</th>');
    Add('        <th align="right"><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TBClientesNome.DisplayLabel+'</th> ');
    Add('        <th align="left" colspan='+IntToStr(MetadeCol)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TBClientesNome.Value+'</th>');
   end;
   Add('    </tr>');

   //Razão social
   Add('    <tr bgcolor='+banco.ColortoHTML(clWhite)+'>');
   Add('        <th align="right"><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TBClientesNome_Razao.DisplayLabel+'</th> ');
   Add('        <th align="left" colspan='+IntToStr(ColunaCount-1)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TBClientesNome_Razao.Value+'</th>');
   Add('    </tr>');

   // CPF
   if banco.TBClientesCPF.Value <> '' then
   begin
    Add('    <tr bgcolor='+banco.ColortoHTML(clWhite)+'>');
     if Banco.VerificaCNPJ(banco.TBClientesCPF.Value,false,true)[2] = 'P' then
     Add('        <th align="right"><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">CPF</th> ')
     else
     Add('        <th align="right"><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">CNPJ</th> ');

     Add('        <th align="left" colspan='+IntToStr(ColunaCount -1)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TBClientesCPF.Value+'</th>');
     Add('    </tr>');
   end;



   // UF - Municipio
    Add('    <tr bgcolor='+banco.ColortoHTML(clWhite)+'>');
    Add('        <th align="right"><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TBClientesUF.DisplayLabel+'</th> ');
    Add('        <th align="left" colspan='+IntToStr(ColunaCount -1)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TBClientesUF.Value+' - '+banco.TBClientesCidade_Virtual.Value+'</th>');
    Add('    </tr>');

  // Rua + logra + number
    //logr
    if banco.TBClientesLogradouro.Value <> '' then
    begin
    if aux <> '' then
    aux := aux + ' ';
    aux := aux + banco.TBClientesLogradouro.Value;
    end;
    //Number
    if banco.TBClientesNumero.Value <> '' then
    begin
    if aux <> '' then
    aux := aux + ', ';
    aux := aux +'Nº '+banco.TBClientesNumero.Value;
    end;
    //insert
    if aux <> '' then
    begin
    Add('    <tr bgcolor='+banco.ColortoHTML(clWhite)+'>');

    if not banco.TBClientesLogTypeVirtual.IsNull then
    Add('        <th align="right"><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TBClientesLogTypeVirtual.Value+'</font></th>')
    else
    Add('        <th align="right" ><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">Rua</th>');

    Add('        <th align="left" colspan='+IntToStr(ColunaCount-1)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+aux+'</font></th>');
    Add('    </tr>');
    end;

   // Bairro
   if banco.TBClientesBairro.Value <> '' then
   begin
    Add('    <tr bgcolor='+banco.ColortoHTML(clWhite)+'>');
    Add('        <th align="right"><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TBClientesBairro.DisplayLabel+'</font></th> ');
    Add('        <th align="left" colspan='+IntToStr(ColunaCount -1)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TBClientesBairro.Value+'</font></th>');
    Add('    </tr>');
   end;

  // Telefone
  aux := '';
  if not banco.TBClientesTel_Res.IsNull then
  if banco.TBClientesTel_Res.Value  <> ' ' then
  aux := 'Tel Res. '+banco.FormataTel(banco.TBClientesDDD_Res.Value,banco.TBClientesTel_Res.Value);
  if not banco.TBClientesTel_Come.IsNull then
  if banco.TBClientesTel_Come.Value  <> ' ' then
  aux :=aux+ '     Tel Comer. '+banco.FormataTel(banco.TBClientesDDD_Come.Value,banco.TBClientesTel_Come.Value);
  if not banco.TBClientesTel_Cel.IsNull then
  if banco.TBClientesTel_Cel.Value  <> ' ' then
  aux :=aux+ '     Celular '+banco.FormataTel(banco.TBClientesDDD_Cel.Value,banco.TBClientesTel_Cel.Value);
  if aux <> '' then
  begin
  Add('    <tr bgcolor='+banco.ColortoHTML(clWhite)+'>');
  Add('        <th align="left" colspan='+IntToStr(ColunaCount)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+aux+'</font></th>');
  Add('    </tr>');
  end;

   banco.TB_Pedido_Histo.SQL.Clear;
   banco.TB_Pedido_Histo.SQL.Add('Select  A.*, B.nome_razao, B.nome, B.UF, B.Municiopio, B.cpf from');
   banco.TB_Pedido_Histo.SQL.Add('Venda_info A inner join Cliente_cadastro B on');
   banco.TB_Pedido_Histo.SQL.Add('A.id_cliente = b.codigo');
   banco.TB_Pedido_Histo.SQL.Add('Where A.id_cliente ='+IntToStr(banco.TBClientesCodigo.Value));




   banco.TB_Pedido_Histo.open;

   //
   Add('    <tr bgcolor='+banco.ColortoHTML(banco.Relatorio_Color_Title)+'>'); //Cor do titulo  #C0DCC0  ||     insere nova linha
   Add('        <th align="center" colspan='+IntToStr(ColunaCount)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">Pedidos do Cliente</font></th>');
   Add('    </tr>');


if banco.TB_Pedido_Histo.RecordCount = 0 then
begin
   Add('    <tr bgcolor='+banco.ColortoHTML(clwhite)+'>'); //Cor do titulo  #C0DCC0  ||     insere nova linha
   Add('        <th align="center" colspan='+IntToStr(ColunaCount)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">Não existe pedidos</font></th>');
   Add('    </tr>');
end
else
begin
   // Title
  Add('    <tr bgcolor='+banco.ColortoHTML(banco.Relatorio_Color_Title)+'>'); //Cor do titulo  #C0DCC0  ||     insere nova linha
      For i := 0 to banco.TB_Pedido_Histo.Fields.Count -1 do
      if banco.TB_Pedido_Histo.Fields[i].Visible then
      Add('        <th colspan='+IntToStr(banco.TB_Pedido_Histo.Fields[i].Tag)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TB_Pedido_Histo.Fields[i].DisplayLabel+'</font></th>');
   Add('    </tr>');


   LastColor := false;
   banco.TB_Pedido_Histo.First;
   Progres_Lista.Position := 0;
   while not banco.TB_Pedido_Histo.Eof do
   begin
   Progres_Lista.Max := Banco.TB_Pedido_Histo.RecordCount;
   Progres_Lista.Position := banco.TB_Pedido.RecNo;

   Application.ProcessMessages;
   Label_Lista.Caption := banco.TB_Pedidonome_razao.Value;


    if LastColor then
    Add('    <tr bgcolor='+banco.ColortoHTML(banco.Relatorio_color_fundo[1])+'>')
    else
    Add('    <tr bgcolor='+banco.ColortoHTML(banco.Relatorio_color_fundo[2])+'>');


    For i := 0 to banco.TB_Pedido_Histo.Fields.Count - 1 do
    if banco.TB_Pedido_Histo.Fields[i].Visible then
    Add('        <th colspan='+IntToStr(banco.TB_Pedido_Histo.Fields[i].Tag)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+FormataValue(banco.TB_Pedido_Histo.Fields[i])+'</font></th>');

    Add('    </tr>');
   banco.TB_Pedido_Histo.Next;

   LastColor := not (LastColor);
   end;

end;





      //------------------\\
     //| Contas a receber   |\\



//////////////////////////////////////////////////////////////////////////////////////////////
if Banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,90,[]) then
begin

  banco.TB_Contas_Histo.SQL.Clear;
  banco.TB_Contas_Histo.SQL.Add('Select * from tb_contas');
  banco.TB_Contas_Histo.SQL.Add('Where ID_Cliente = '+IntToStr(banco.TBClientesCodigo.Value));

  if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,91,[]) then
  banco.TB_Contas_Histo.SQL.Add('and DataVencimento >= #'+FormatDateTime('mm/dd/yyyy',Date)+'#');

  banco.TB_Contas_Histo.SQL.Add('and  pagada = false');
  banco.TB_Contas_Histo.Open;


   Add('    <tr bgcolor='+banco.ColortoHTML(banco.Relatorio_Color_Title)+'>'); //Cor do titulo  #C0DCC0
   Add('        <th colspan='+IntToStr(ColunaCount)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">Contas a Receber</font></th>');
   Add('    </tr>');

   if Banco.TB_Contas_Histo.RecordCount = 0 then
   begin
   Add('    <tr bgcolor='+banco.ColortoHTML(clWhite)+'>'); //Cor do titulo  #C0DCC0
   Add('        <th colspan='+IntToStr(ColunaCount)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">Não existe contas a Receber</font></th>');
   Add('    </tr>');
   end
   else
   begin



   // pegar o ultimo field
   // calcular o tamanho
      Add('    <tr bgcolor='+banco.ColortoHTML(banco.Relatorio_Color_Title)+'>');

      For i := 0 to banco.TB_Contas_Histo.Fields.Count -1 do
      if banco.TB_Contas_Histo.Fields[i].Visible then
      Add('        <th align="center" colspan='+IntToStr(banco.TB_Contas_Histo.Fields[i].Tag)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TB_Contas_Histo.Fields[i].DisplayLabel+'</font></th>');


      Add('    </tr>');




   banco.TB_Contas_Histo.First;
   Progres_Lista.Position := 0;
   while not banco.TB_Contas_Histo.Eof do
   begin
   Application.ProcessMessages;
   Label_Lista.Caption := 'Histórico de contas...';
   Progres_Lista.Max := Banco.TB_Contas_Histo.RecordCount;
   Progres_Lista.Position := banco.TB_Contas_Histo.RecNo;


    if LastColor then
    Add('    <tr bgcolor='+banco.ColortoHTML(banco.Relatorio_color_fundo[1])+'>')
    else
    Add('    <tr bgcolor='+banco.ColortoHTML(banco.Relatorio_color_fundo[2])+'>');

      For i := 0 to banco.TB_Contas_Histo.Fields.Count - 1 do
      if banco.TB_Contas_Histo.Fields[i].Visible then
      Add('        <th align="center" colspan='+IntToStr(banco.TB_Contas_Histo.Fields[i].Tag)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+FormataValue(banco.TB_Contas_Histo.Fields[i])+'</font></th>');;


    Add('    </tr>');
    banco.TB_Contas_Histo.Next;
    LastColor := not (LastColor);
   end;

end;
end; // locate
///////////////////////////////////////////////////////////////////////////////

  if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,91,[]) then
  begin
    banco.TB_Contas_Histo.SQL.Clear;
    banco.TB_Contas_Histo.SQL.Add('Select * from tb_contas');
    banco.TB_Contas_Histo.SQL.Add('Where ID_Cliente = '+IntToStr(banco.TBClientesCodigo.Value));
    banco.TB_Contas_Histo.SQL.Add('and DataVencimento < #'+FormatDateTime('mm/dd/yyyy',Date)+'#');
    banco.TB_Contas_Histo.SQL.Add('and  pagada = false');
    banco.TB_Contas_Histo.Open;


   Add('    <tr bgcolor='+banco.ColortoHTML(banco.Relatorio_Color_Title)+'>'); //Cor do titulo  #C0DCC0
   Add('        <th colspan='+IntToStr(ColunaCount)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">Contas a Receber Atrasadas</font></th>');
   Add('    </tr>');

   if Banco.TB_Contas_Histo.RecordCount = 0 then
   begin
   Add('    <tr bgcolor='+banco.ColortoHTML(clWhite)+'>'); //Cor do titulo  #C0DCC0
   Add('        <th colspan='+IntToStr(ColunaCount)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">Não existe contas a Receber atrasadas</font></th>');
   Add('    </tr>');
   end
   else
   begin
     Add('    <tr bgcolor='+banco.ColortoHTML(banco.Relatorio_Color_Title)+'>');
     For i := 0 to banco.TB_Contas_Histo.Fields.Count -1 do
     if banco.TB_Contas_Histo.Fields[i].Visible then
     Add('        <th align="center" colspan='+IntToStr(banco.TB_Contas_Histo.Fields[i].Tag)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+banco.TB_Contas_Histo.Fields[i].DisplayLabel+'</font></th>');

     Add('    </tr>');
     banco.TB_Contas_Histo.First;
     Progres_Lista.Position := 0;
     while not banco.TB_Contas_Histo.Eof do
     begin
     Progres_Lista.max := banco.TB_Contas_Histo.RecordCount;
     Progres_Lista.Position := banco.TB_Contas_Histo.RecNo;
     Application.ProcessMessages;
     Label_Lista.Caption := 'Contas Vencidas';


     if LastColor then
     Add('    <tr bgcolor='+banco.ColortoHTML(banco.Relatorio_color_fundo[1])+'>')
     else
     Add('    <tr bgcolor='+banco.ColortoHTML(banco.Relatorio_color_fundo[2])+'>');

     For i := 0 to banco.TB_Contas_Histo.Fields.Count - 1 do
     if banco.TB_Contas_Histo.Fields[i].Visible then
     Add('        <th align="center" colspan='+IntToStr(banco.TB_Contas_Histo.Fields[i].Tag)+'><font size='+IntToStr(banco.Relatorio_Font_Size)+' face="'+banco.Relatorio_Font_Name+'">'+FormataValue(banco.TB_Contas_Histo.Fields[i])+'</font></th>');

     Add('    </tr>');
     banco.TB_Contas_Histo.Next;
     LastColor := not (LastColor);
     end;
    end;
end;



 //  <th colspan=2>Informações do Cliente</th>

{  For i := 2 to ColunaCount do
  Add('<td align="right"></td> ');

  Add('</tr>');   // finaliza linha
  Add('<tr> ');
  Add('<td align="right">Razao</td> ');
  Add('<td align="right">Razaovalue</td> ');
  Add('</tr> ');}
  Add('<tr> ');
  Add('</table>');
  Add('');




  end;
 Arquivo.SaveToFile('c:\123.html');
 FPrincipal.OpenPage('c:\123.html','',true);
Finally
  banco.TB_Pedido_Histo.Active := false;

  FreeAndNil(Arquivo);
end;

Finally
  Form_Lista_Progress.OnDeactivate := nil;
  Form_Lista_Progress.Close;
  FreeAndNil(Form_Lista_Progress);
end;

end;


procedure TBanco.GeraDav;
begin
  if banco.TB_Pedido.RecordCount = 0 then
    exit;

banco.PP_Dav_Emit_Razao.Caption := '';
banco.PP_Dav_Emit_CNPJ.Caption := '';
banco.PP_Dav_Emit_Local.Caption := '';
banco.PP_Dav_Emit_Cep.Caption := '';
banco.PP_Dav_Emit_Contato.Caption := '';
banco.PP_Dav_Vendedor.Caption := '';
banco.PP_Dav_Data.Caption := '';
banco.PP_Dav_Time.Caption := '';
banco.PP_DAV_Soli_Nome.Caption := '';
banco.PP_Dav_Soli_Fanta.Caption := '';
banco.PP_Dav_Soli_Endereco.Caption := '';
banco.PP_Dav_Soli_Cep.Caption := '';
banco.PP_Dav_Soli_TelCom.Caption := '';
banco.PP_Dav_Soli_Cel.Caption := '';
banco.PP_Dav_Soli_Bairro.Caption := '';
banco.PP_Dav_Soli_CNPJ.Caption := '';
banco.PP_Dav_Soli_IE.Caption := '';
banco.PP_Dav_Soli_IM.Caption := '';
banco.PP_Dav_Date_Validade.Caption := '';
banco.PP_Dav_Pagamento_Desc.Caption := '';


  Banco.TB_Vendas_All.SQL.Clear;
  Banco.TB_Vendas_All.SQL.Add('Select * from VENDA_ALL');
  Banco.TB_Vendas_All.SQL.Add('Where ID_Pedido='+IntToStr(banco.TB_PedidoID_Pedido.value));
  Banco.TB_Vendas_All.open;

  if banco.TBClientes.SQL.Count > 1 then
  begin
  banco.TBClientes.close;
  Banco.TBClientes.SQL.Clear;
  banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
  end;

  if Banco.TBClientes.State in [dsInactive] then
  banco.TBClientes.Open;

  if not banco.TBClientes.Locate(banco.TBClientesCodigo.FieldName,banco.TB_PedidoID_cliente.Value,[]) then
  begin
    MessageDlg('O pedido '+IntToStr(banco.TB_PedidoID_Pedido.Value)+' está com erro, verifique o campo cliente',mtError,[mbok],0);
    exit;
  end;

  if banco.TB_Vendas_All.RecordCount = 0 then
  begin
    MessageDlg('Não existem dados para exibir',mtInformation,[mbok],0);
    exit;
  end;

  banco.PP_Dav_Emit_Razao.Caption := banco.Empresa_Nome;
  Banco.PP_Dav_Emit_CNPJ.Caption := banco.Empresa_CNPJ;
  Banco.PP_Dav_Emit_Local.Caption :=Banco.Empresa_Tipo_rua + ' '+banco.Empresa_rua;

  if banco.Empresa_Numero <> '' then
  Banco.PP_Dav_Emit_Local.Caption :=   Banco.PP_Dav_Emit_Local.Caption + ', '+Banco.Empresa_Numero;

  if banco.empresa_Complemento <> '' then
  Banco.PP_Dav_Emit_Local.Caption :=   Banco.PP_Dav_Emit_Local.Caption + ', '+banco.empresa_Complemento;

 if banco.Empresa_bairro  <> '' then
 Banco.PP_Dav_Emit_Local.Caption :=   Banco.PP_Dav_Emit_Local.Caption + ' - '+Banco.Empresa_bairro;


 banco.PP_Dav_Emit_Cep.Caption := banco.empresa_cep + '      '+banco.Empresa_Cidade+' - '+banco.empresa_UF;

  if Banco.empresa_TelRes <> ' ' then
  Banco.PP_Dav_Emit_Contato.Caption :='Tel. Res. '+banco.empresa_TelRes;


  if Banco.empresa_TelCom <> ' ' then
  if Banco.PP_Dav_Emit_Contato.Caption = '' then
  Banco.PP_Dav_Emit_Contato.Caption :='Tel. Come. '+banco.empresa_TelCom
  else
  Banco.PP_Dav_Emit_Contato.Caption := Banco.PP_Dav_Emit_Contato.Caption+'           Tel. Come. '+banco.empresa_TelCom;

  if Banco.empresa_TelCel <> ' ' then
  if Banco.PP_Dav_Emit_Contato.Caption = '' then
  Banco.PP_Dav_Emit_Contato.Caption :='Celular '+banco.empresa_TelCel
  else
  Banco.PP_Dav_Emit_Contato.Caption :=Banco.PP_Dav_Emit_Contato.Caption+'           Celular '+banco.empresa_TelCel;


  banco.PP_Dav_Soli_CNPJ.Caption := banco.TBClientesCPF.Value;
  banco.PP_DAV_Soli_Nome.Caption := banco.TBClientesNome_Razao.Value;
  banco.PP_Dav_Soli_Fanta.Caption := '';
  banco.PP_Dav_Soli_Cep.Caption := banco.FormataCEP(banco.TBClientesCep.Value);
  banco.PP_Dav_Soli_TelCom.Caption := Banco.FormataTel(banco.TBClientesDDD_Come.Value,banco.TBClientesTel_Come.Value);
  banco.PP_Dav_Soli_Cel.Caption    := Banco.FormataTel(banco.TBClientesDDD_Cel.Value,banco.TBClientesTel_Cel.Value);
  banco.PP_Dav_Soli_Cid.Caption := banco.TBClientesCidade_Virtual.Value+ ' - '+banco.TBClientesUF.Value;
  banco.PP_Dav_Soli_IE.Caption := banco.TBClientesIE.Value;
  banco.PP_Dav_Soli_IM.Caption := banco.TBClientesIM.Value;
  banco.PP_Dav_Soli_Bairro.Caption := banco.TBClientesBairro.Value;
  banco.PP_Dav_Soli_Fanta.Caption := banco.TB_PedidoComprador_Nome.Value;

  
  banco.PP_Dav_Soli_Endereco.Caption := banco.TBClientesLogTypeVirtual.Value;
  if banco.TBClientesLogradouro.Value <> '' then
  banco.PP_Dav_Soli_Endereco.Caption :=banco.PP_Dav_Soli_Endereco.Caption+' '+banco.TBClientesLogradouro.Value;
  if banco.TBClientesNumero.Value <> '' then
  banco.PP_Dav_Soli_Endereco.Caption :=banco.PP_Dav_Soli_Endereco.Caption+', '+banco.TBClientesNumero.Value;
  if banco.TBClientesLogradouro.Value <> '' then
  banco.PP_Dav_Soli_Endereco.Caption :=banco.PP_Dav_Soli_Endereco.Caption+', '+banco.TBClientesComplemento.Value;

  banco.PP_Dav_Vendedor.Caption := banco.User_Vender;
  banco.PP_Dav_Data.Caption := FormatDateTime('DD/MM/YYYY',banco.TB_PedidoData_Hora.Value);
  banco.PP_Dav_Time.Caption := FormatDateTime('HH:MM',banco.TB_PedidoData_Hora.Value);

  banco.PP_Dav_NDav.Caption := FormatFloat('#0000000000',Banco.TB_PedidoID_Pedido.Value);
  banco.PP_Dav_NDav_2.Caption :='DAV:  '+ FormatFloat('#0000000000',Banco.TB_PedidoID_Pedido.Value);

   banco.Rela_Dav_NValidade := 30;
   
  if banco.Rela_Dav_NValidade = 0 then
  begin
  banco.PP_Dav_Date_Validade.Visible := false;
  banco.PP_Dav_Date_Validade.Caption := '';
  banco.PP_Dav_Vali_title.Visible := false;
  end
  else
  begin
  banco.PP_Dav_Date_Validade.Visible := true;
  banco.PP_Dav_Vali_title.Visible := true;
  banco.PP_Dav_Date_Validade.Caption := FormatDateTime('DD/MM/YYYY',IncDay(banco.TB_PedidoData_Hora.Value,banco.Rela_Dav_NValidade));
  end;


  banco.PP_Dav_SubTotal.Caption :='R$ '+FormatFloat(',0.00',  banco.TB_PedidoDesconto.value + banco.TB_PedidoPreco.Value);
  banco.PP_Dav_Deconto.Caption  :='R$ '+FormatFloat(',0.00',  banco.TB_PedidoDesconto.value);
  banco.PP_Dav_Total.Caption    :='R$ '+FormatFloat(',0.00',  banco.TB_PedidoPreco.Value);

  if banco.TB_Parcelamento.Locate(banco.TB_ParcelamentoCodigo.FieldName,banco.TB_PedidoParcelamento.Value,[]) then
  banco.PP_Dav_Pagamento_Desc.Caption := banco.TB_ParcelamentoDescricao.Value;
  

  if not DirectoryExists(Banco.App_Dir +'Dav\') then
  CreateDir(Banco.App_Dir +'DAV\');




  banco.Rp_Dav.PDFSettings.Author := Banco.SisName;
  banco.Rp_Dav.PDFSettings.Title := 'Dav '+IntToStr(banco.TB_PedidoID_Pedido.value);

  banco.Rp_Dav.DeviceType := 'PDF';
  banco.Rp_Dav.AllowPrintToFile := true;
  banco.Rp_Dav.ShowPrintDialog := false;
  banco.Rp_Dav.TextFileName := banco.App_Dir+'DAV\DAV'+IntToStr(banco.TB_PedidoID_Pedido.Value)+'.pdf';
  banco.Rp_Dav.AllowPrintToArchive := true;
  banco.Rp_Dav.PrinterSetup.Active := false;



  if FileExists('DAV\DAV'+IntToStr(banco.TB_PedidoID_Pedido.Value)+'.pdf') then
  if not DeleteFile(pchar('DAV\DAV'+IntToStr(banco.TB_PedidoID_Pedido.Value)+'.pdf')) then
  Begin
  MessageDlg('Não foi possível gerar o pedido'+#13+'Algum aplicativo está usando o arquivo:'+#13+banco.App_Dir+'Dav\dav'+IntToStr(banco.TB_PedidoID_Pedido.Value)+'.pdf',mtError,[mbOK],0);
  exit;
  end;


  While FileExists(banco.App_Dir +'DAV\DAV'+IntToStr(banco.TB_PedidoID_Pedido.Value)+'.pdf') do
  sleep(100);

  banco.Rp_Dav.Print;

  if banco.Rela_Dav_Open then
  begin
      While not FileExists(banco.App_Dir +'DAV\DAV'+IntToStr(banco.TB_PedidoID_Pedido.Value)+'.pdf') do
      Sleep(100);
      ShellExecute(0, nil, pchar(banco.App_Dir +'DAV\DAV'+IntToStr(banco.TB_PedidoID_Pedido.Value)+'.pdf'), nil, nil, SW_SHOWNORMAL);
  end;

  if banco.Rela_Dav_Printer then
  begin
  //FPrincipal.PrintDocument(banco.Impressora_Sis,banco.App_Dir +'DAV\DAV'+IntToStr(banco.TB_PedidoID_Pedido.Value)+'.pdf');

  if  Printer.Printers.IndexOf(banco.Rela_Dav_PrinterName) = -1 then
  begin
  if banco.Rela_Dav_PrinterName <> '' then
  MessageDlg('Impressora '+banco.Rela_Dav_PrinterName+' não foi encontrada',mtError,[mbok],0);
  
  exit;
  end;

  banco.Rp_Dav.PrinterSetup.Active := true;
  banco.Rp_Dav.PrinterSetup.PrinterName :=banco.Rela_Dav_PrinterName;
  banco.rp_Dav.Printer.SetDevMode(printer.Printers.IndexOf(banco.Rela_Dav_PrinterName));
  banco.Rp_Dav.PrinterSetup.DocumentName := 'Dav '+IntToStr(banco.TB_PedidoID_Pedido.Value);
  banco.Rp_Dav.DeviceType := 'printer';
  Banco.Rp_Dav.PrintReport;

  end;

end;



procedure TBanco.SaveIndexOf(Table:Tdataset);
var
  i : Shortint;
begin
for i := 0 to Table.Fields.Count - 1 do
begin
  Banco.Config.WriteInteger(Table.Name+'_Position',Table.Fields[i].FieldName,  Table.Fields[i].Index);
  Banco.Config.WriteBool   (Table.Name+'_Visible' ,Table.Fields[i].FieldName,  Table.Fields[i].Visible);
end;
end;

procedure TBanco.LoadIndexOf(Table:Tdataset);
var
  i : Shortint;
begin
for i := 0 to Table.Fields.Count - 1 do
begin
  Table.Fields[i].Index   := Config.ReadInteger(Table.Name+'_Position',Table.Fields[i].FieldName, Table.Fields[i].Index);

  if Table.Fields[i].Tag = 0 then
  Table.Fields[i].Visible := Config.ReadBool   (Table.Name+'_Visible' ,Table.Fields[i].FieldName, true)
  else
  Table.Fields[i].Visible := false;


end;

end;

function TBanco.GetContasAtrasas(Cliente: integer): Currency;
var
 Query : TADOQuery;
 Value : Currency;
Begin
Result := 0;
value := 0;
try
 Try
 Query := TADOQuery.Create(self);
 Query.Connection := ADOConnection1;
 Query.DisableControls;
 Query.LockType := ltReadOnly;
 Query.SQL.Clear;
 Query.SQL.Add('select valor from tb_contas');
 Query.SQL.Add('where pagada = false');
 Query.SQL.Add('and datavencimento > '+FormatDateTime('YYYY/MM/DD',date));
 Query.SQL.Add('and id_cliente = '+IntToStr(Cliente));
 Query.Open;

 Query.First;
 while not Query.Eof do
 begin
 Value := Value + Query.FieldByName('Valor').AsCurrency;
 Application.ProcessMessages;
 Query.Next;
 end;
 Except
 on e :exception do
 Create_Erro(e.ClassName,e.Message);
 end;

Finally
Result := Value;
FreeAndNil(Query);
end;


end;

procedure TBanco.TB_AgendaAfterOpen(DataSet: TDataSet);
begin
if FAgenda <> nil then LoadColumns(FAgenda.ThemeDBGrid1);
end;

procedure TBanco.TB_AgendaBeforeClose(DataSet: TDataSet);
begin
if FAgenda <> nil then SaveColumns(FAgenda.ThemeDBGrid1);

end;

procedure TBanco.GravaAuditoria(Table: TADOQuery; Cod:integer; Modulo,Tipo : Shortint);
var
  i : Shortint;
begin

For i := 0 to Table.Fields.Count - 1 do
        if not Table.Fields[i].Lookup then
        if Table.Fields[i].OldValue <> Table.Fields[i].NewValue then
        begin
        banco.ExecSQLTB.SQL.Clear;
        banco.ExecSQLTB.SQL.Add('Insert Into TB_auditoria ([User],[Data],[Tipo],[modulo],[Campo],[OldValue],[NewValue],[reg])');
        banco.ExecSQLTB.SQL.Add('Values ("'+IntToStr(banco.User_cod)+'","'
                                  +FormatDateTime('YYYY/MM/DD',Date)+' '+FormatDateTime('hh:mm:ss',time)+'",'+
                                  '"'+IntToStr(tipo)+'","'+IntToStr(Modulo)+'","'+
                                  Table.Fields[i].FieldName+'","'+VarToStr(Table.Fields[i].OldValue)+'","'+VarToStr(Table.Fields[i].NewValue)+'","'+
                                  IntToStr(cod)+'")');
        try
        banco.ExecSQLTB.ExecSQL;
        except
        end;
        end;

end;

Function TBanco.OnerrorRelatorio:TStringList;
Const
  Espaco = '          ';

  Function SetPrpriedadesField(Field:TField):TStringList;
  begin
  Result := TStringList.Create;
  Try
    if Field.DataSet <> nil then
    begin
    Result.Add(Espaco+'  DataSet: '+Field.DataSet.Name);
    Result.Add(Espaco+'    Index: '+IntToStr(Field.Index)+' to '+IntToStr(Field.DataSet.Fields.Count));
    end;
  Result.Add(Espaco+'FieldName: '+Field.FieldName);
  Result.Add(Espaco+' IsLokup: '+BoolToStr(Field.IsNull));
  Result.Add(Espaco+'     Size: '+IntToStr(Field.Size));
  Except
  Result.Add(Espaco+'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ERROR <<<<<<<<<<<<<<<<<<<<<');
  end;
  end;

  Function SetPrpriedadesAdoConection(ConexaoADo:TADOConnection):TStringList;
  Var
    ContError : integer;
  begin
  try
  Result := TStringList.Create;
  Result.Add(Espaco+'   InTransaction: '+BoolToStr(ConexaoADo.InTransaction));
  Result.Add(Espaco+'    CommandCount: '+IntToStr(ConexaoADo.CommandCount));
  Result.Add(Espaco+'        Provider: '+ConexaoADo.Provider);
  Result.Add(Espaco+'ConnectionString: '+ConexaoADo.ConnectionString);

  Result.Add(Espaco+'           Erros: '+IntToStr(ConexaoADo.Errors.Count));
  for ContError := 0 to ConexaoADo.Errors.Count - 1 do
  begin
  Result.Add(Espaco+'                 ['+FormatFloat('00',ContError)+'].Number: '+IntToStr(ConexaoADo.Errors[conterror].Number));
  Result.Add(Espaco+'                 ['+FormatFloat('00',ContError)+'].Description: '+ConexaoADo.Errors[conterror].Description);
  Result.Add(Espaco+'                 ['+FormatFloat('00',ContError)+'].HelpFile: '+ConexaoADo.Errors[conterror].HelpFile);
  Result.Add(Espaco+'                 ['+FormatFloat('00',ContError)+'].SQLState: '+ConexaoADo.Errors[conterror].SQLState);
  end;


  Except
  Result.Add(Espaco+'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ERROR <<<<<<<<<<<<<<<<<<<<<');
  end;
  end;

  Function SetPrpriedadesAdoQuery(Query:TADOQuery):TStringList;
  begin
  Result := TStringList.Create;
  Try
    Result.Add(Espaco + 'Active : '+BoolToStr(Query.Active));
    If (Query.State in [dsinactive])    then Result.Add(Espaco + 'dsinactive');
    If (Query.State in [dsBrowse])      then Result.Add(Espaco + 'dsBrowse');
    If (Query.State in [dsEdit])        then Result.Add(Espaco + 'dsEdit');
    If (Query.State in [dsInsert])      then Result.Add(Espaco + 'dsInsert');
    If (Query.State in [dsSetKey])      then Result.Add(Espaco + 'dsSetKey');
    If (Query.State in [dsCalcFields])  then Result.Add(Espaco + 'dsCalcFields');
    If (Query.State in [dsNewValue])    then Result.Add(Espaco + 'dsNewValue');
    If (Query.State in [dsOldValue])    then Result.Add(Espaco + 'dsOldValue');
    If (Query.State in [dsCurValue])    then Result.Add(Espaco + 'dsCurValue');
    If (Query.State in [dsBlockRead])   then Result.Add(Espaco + 'dsBlockRead');
    If (Query.State in [dsInternalCalc])then Result.Add(Espaco + 'dsInternalCalc');
    If (Query.State in [dsOpening])     then Result.Add(Espaco + 'dsOpening');
    Result.Add(Espaco +     'Sql: "'+Query.SQL.Text+'"$#*');
    Except
  Result.Add(Espaco+'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ERROR <<<<<<<<<<<<<<<<<<<<<');
  end;
 end;
var
   i,  IForm :Cardinal;
begin
Result := TStringList.Create;
with result do
begin
  Add('...................................................................');
  Add('........................Created by Fazzioni........................');
  Add('...:--> Relatório Automatico');
  Add('....--> Usuário conectado: '+banco.User_Vender);
  Add('                      cod: '+IntToStr(banco.User_cod));
  Add('....-->           Horario: '+FormatDateTime('DD/MM/YYYY',date)+' '+FormatDateTime('hh:mm:ss',Time));
  Add('...................................................................');
  Add(' Application Components Count: ' + IntToStr(  Application.ComponentCount));
  Add('');
  Add('');


For IForm := 0 to Application.ComponentCount -1 do
begin
  Add('');
  Add('');
  Add( IntToStr(IForm)+' - "'+Application.Components[IForm].Name+'" : '+Application.Components[IForm].ClassName);
  Add('Components count: '+IntToStr(Application.Components[IForm].ComponentCount) );
  Add('');


  if (Application.Components[IForm] is TForm) or (Application.Components[IForm] is TDataModule) then

  For i := 0 to Application.Components[IForm].ComponentCount - 1 do
  begin
    Add( IntToStr(i)+' - "'+Application.Components[IForm].Components[i].Name+'" : '+Application.Components[IForm].Components[i].ClassName);

    if (Application.Components[IForm].Components[i] is TField) then
    AddStrings(SetPrpriedadesField(Application.Components[IForm].Components[i] as TField))
    else
    if (Application.Components[IForm].Components[i] is TADOQuery) then
    AddStrings(SetPrpriedadesAdoQuery(Application.Components[IForm].Components[i] as TADOQuery))
    else
    if (Application.Components[IForm].Components[i] is TADOConnection) then
    AddStrings(SetPrpriedadesAdoConection(Application.Components[IForm].Components[i] as TADOConnection));
  end;
end;

end;
end;

procedure TBanco.TB_ContasAfterOpen(DataSet: TDataSet);
begin
if FContas <> nil then
LoadColumns(FContas.ThemeDBGrid1);
end;

procedure TBanco.TB_ContasBeforeClose(DataSet: TDataSet);
begin
if FContas <> nil then
SaveColumns(FContas.ThemeDBGrid1);
end;

end.



