program Project1;



uses
  Forms,
  SysUtils,
  Controls,
  UClientes in 'UClientes.pas' {Fclientes},
  UFcliente_New in 'UFcliente_New.pas' {FClientes_New},
  UDados in 'UDados.pas' {Banco: TDataModule},
  Uprinciapl in 'Uprinciapl.pas' {FPrincipal},
  UFestoque in 'UFestoque.pas' {FEstoque},
  UEstoque_New in 'UEstoque_New.pas' {FEstoque_New},
  UFvendas in 'UFvendas.pas' {Fvendas},
  UAddCliente in 'UAddCliente.pas' {FAddCliente},
  UAddProduto in 'UAddProduto.pas' {FAddProduto},
  UCliente_Info in 'UCliente_Info.pas' {FInfo_Cliente},
  UPedido in 'UPedido.pas' {FPedido},
  UFinfoPedido in 'UFinfoPedido.pas' {FinfoPedido},
  UAgenda in 'UAgenda.pas' {FAgenda},
  Ufinaliza in 'Ufinaliza.pas' {FFinaliza},
  Usituacao in 'Usituacao.pas' {FSituacao},
  Uvisible in 'Uvisible.pas' {FVisible},
  Ufuncionario in 'Ufuncionario.pas' {FFuncionarios},
  UNewFuncionario in 'UNewFuncionario.pas' {New_Funcionario},
  UImgFuncionario in 'UImgFuncionario.pas' {FImgFunc},
  UCargo in 'UCargo.pas' {FCargo},
  UPesquisa in 'UPesquisa.pas' {FPesquisa},
  Upagamento in 'Upagamento.pas' {Fpagamento},
  UformaPag in 'UformaPag.pas' {FFormaPag},
  UCancel in 'UCancel.pas' {Fcancel},
  UEmitente in 'UEmitente.pas' {FEmitente},
  Ucarta in 'Ucarta.pas' {Fcarta},
  UProgressCarta in 'UProgressCarta.pas' {FprogressCarta},
  Ulogradouro in 'Ulogradouro.pas' {Flogradouro},
  Umedida in 'Umedida.pas' {FMedida},
  Umedida_new in 'Umedida_new.pas' {Fmedida_New},
  Usobre in 'Usobre.pas' {Fsobre},
  UParcelas in 'UParcelas.pas' {FParcelas},
  Ucontas in 'Ucontas.pas' {FContas},
  UParcelas_new in 'UParcelas_new.pas' {Fparcelas_New},
  Ucalendario in 'Ucalendario.pas' {Fcalendario},
  UPortador in 'UPortador.pas' {FPortador},
  USituacao_New in 'USituacao_New.pas' {Fsituacao_New},
  Uconfig in 'Uconfig.pas' {Fconfig},
  UAtalho in 'UAtalho.pas' {FAtalho},
  UAbcCliente in 'UAbcCliente.pas' {FABCCliente},
  Ucontas_New in 'Ucontas_New.pas' {Fconta_New},
  Urecebe in 'Urecebe.pas' {FRecebe},
  UPrinterConta in 'UPrinterConta.pas' {FPrinterContas},
  Urecibo in 'Urecibo.pas' {FRecibo},
  USplash in 'USplash.pas' {FSplash},
  Ulogin in 'Ulogin.pas' {Flogin},
  UinfoConta in 'UinfoConta.pas' {FinfoConta},
  Upermissoes in 'Upermissoes.pas' {FPermissoes},
  UPassword in 'UPassword.pas' {FPassword},
  UAgendaNew in 'UAgendaNew.pas' {FAgenda_New},
  UAgendaTipo in 'UAgendaTipo.pas' {FAgenda_TIpo},
  UAgenda_Contato in 'UAgenda_Contato.pas' {FAgenda_Contato},
  UAgendaMes in 'UAgendaMes.pas' {FAgenda_Mes},
  UAgenda_Mes_SelectMes in 'UAgenda_Mes_SelectMes.pas' {FAgenda_Mes_SelectMes},
  UAgenda_MesHora in 'UAgenda_MesHora.pas' {FAgenda_MesHora},
  Uagenda_HoraEdit in 'Uagenda_HoraEdit.pas' {FAgenda_HoraEdit},
  UAuditoria in 'UAuditoria.pas' {FAuditoria},
  UPermissoesNew in 'UPermissoesNew.pas' {FPermissoesNew},
  UException in 'UException.pas' {FException},
  UReceita in 'UReceita.pas' {Freceita};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TBanco, Banco);
  Flogin := TFlogin.Create(nil);
  Flogin.ShowModal;

  if Flogin.ModalResult = mrcancel then
  begin
    FreeAndNil(Flogin);
    Application.Terminate;
    exit;
  end;


  FSplash := TFSplash.Create(nil);
  FSplash.Showmodal;
  FreeAndNil(Flogin);

{  if FSplash.ModalResult = mrcancel then
  begin
  FreeAndNil(FSplash);
  Application.Terminate;
  exit;
  end;}


  Application.CreateForm(TFPrincipal, FPrincipal);
  FreeAndNil(FSplash);
  Application.Run;
end.
