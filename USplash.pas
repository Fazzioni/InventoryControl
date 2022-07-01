unit USplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,Inifiles;

type
  TFSplash = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSplash: TFSplash;

implementation

uses UDados;

{$R *.dfm}

procedure TFSplash.Timer1Timer(Sender: TObject);
var
  I : Shortint;
begin
Timer1.Enabled := false;

banco.User_Dir := ExtractFilePath(Application.ExeName)+'User\';

if not DirectoryExists(banco.User_Dir) then
if not CreateDir(banco.User_Dir) then
begin
MessageDlg('Não foi possível criar a pasta de usuários. Crie manualmente:'+#13+banco.User_Dir,mtError,[mbOK],0);
ModalResult := mrCancel;
exit;
end;

banco.IniDir := banco.User_Dir + IntToStr(banco.User_cod)+'Config.ini';
banco.User_Cor:=banco.User_Dir + IntToStr(banco.User_cod)+'Color.CFG';

try
banco.Config := TIniFile.Create(banco.IniDir);
except
MessageDlg('Não foi possível criar o arquivo de configuração',mtError,[mbOK],0);
ModalResult := mrCancel;
exit;
end;


Try
For i := Low(Banco.Last_Grid_Select) to High(Banco.Last_Grid_Select) do
begin
banco.Last_Grid_Select[i] :=  banco.config.ReadInteger('Select_Grid','Pos'+IntToStr(i),banco.Last_Grid_Select[i]);
Label1.Caption := 'Lendo configuração '+IntToStr(i)+' de tabela';
Application.ProcessMessages;
end;


For i := Low(Banco.Config_GRID_Foco)  to High(Banco.Config_GRID_Foco) do
begin
banco.Config_GRID_Foco[i] := banco.config.ReadBool('Foco_Grid','Pos'+IntToStr(i),banco.Config_GRID_Foco[i]);
Label1.Caption := 'Lendo configuração de foco '+IntToStr(i)+' de tabela';
Application.ProcessMessages;
end;

if banco.Locate(29) then
try
banco.Color_Contas_active := StrToBool(Banco.TB_ConfigValor.Value);
except
end;

For i := Low(Banco.Color_Contas_Perso)  to High(Banco.Color_Contas_Perso) do
begin
  if banco.Locate(29+i) then
  try
  if banco.IsInt(Banco.TB_ConfigValor.Value) then
  banco.Color_Contas_Perso[i] := StrToInt(Banco.TB_ConfigValor.Value);
  except
  end;

Label1.Caption := 'Lendo configuração de cor '+IntToStr(i)+' da tabela Contas';
Application.ProcessMessages;
end;



Label1.Caption := 'Carregando Impressora';
Application.ProcessMessages;
banco.Impressora_Sis := banco.Config.ReadString('System','PrinterName','');


Label1.Caption := 'Carregando posições da tabela Pedido';
Application.ProcessMessages;
banco.LoadIndexOf(banco.TB_Pedido);

Label1.Caption := 'Carregando posições da tabela Vendas';
Application.ProcessMessages;
banco.LoadIndexOf(banco.TB_Vendas_All);

Label1.Caption := 'Carregando posições da tabela Clientes';
Application.ProcessMessages;
banco.LoadIndexOf(banco.TBClientes);

Label1.Caption := 'Carregando posições da tabela Pedido';
Application.ProcessMessages;
banco.LoadIndexOf(banco.TBEstoque);

Label1.Caption := 'Carregando posições da tabela Funcionários';
Application.ProcessMessages;
banco.LoadIndexOf(banco.TB_Funcionarios);

Label1.Caption := 'Carregando posições da tabela Contas';
Application.ProcessMessages;
banco.LoadIndexOf(banco.TB_Contas);

Label1.Caption := 'Carregando posições da tabela Agenda';
Application.ProcessMessages;
banco.LoadIndexOf(banco.TB_Agenda);


Label1.Caption := 'Carregando posições de tabelas Clientes';
Application.ProcessMessages;
For i := low(banco.Grid_Colluns) to high(banco.Grid_Colluns) do
begin
  banco.Grid_Colluns[i] :=  banco.Config.ReadString('Grid_Finally','Colluns'+IntToStr(i),'');
  banco.Grid_Widht[i] := banco.Config.ReadInteger('Grid_Finally','Colluns'+IntToStr(i)+'Width',0);
  Application.ProcessMessages;
end;

Label1.Caption := 'Verificando informações';
Application.ProcessMessages;
if banco.Grid_Colluns[low(banco.grid_colluns)] = '' then
begin
banco.Grid_Colluns[0] := 'codigo';
banco.Grid_Widht[0] := 50;
end;


banco.Grid_Finaliza_Height := banco.Config.ReadInteger('Grid_Finally','Heidht',banco.Grid_Finaliza_Height);
//banco.Grid_Finaliza_Width := banco.Config.ReadInteger('Grid_Finally','Width',banco.Grid_Finaliza_Width);
banco.Grid_Finaliza_Title := banco.Config.ReadBool('Grid_Finally','Title',false);
except
end;




Try
Label1.Caption := 'Abrindo tabela Clientes'; Application.ProcessMessages;
banco.TBClientes.Active       := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela de Cidades'; Application.ProcessMessages;
banco.TBMunicipio.Active      := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Logradouro'; Application.ProcessMessages;
banco.TBLogra.Active          := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Estoque'; Application.ProcessMessages;
banco.TBEstoque.Active        := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Unidade do Estoque'; Application.ProcessMessages;
banco.TBEstUn.Active          := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela de Vendas'; Application.ProcessMessages;
banco.TB_Vendas_All.Active    := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Pedidos'; Application.ProcessMessages;
banco.TB_Pedido.Active        := true;
Application.ProcessMessages;

//Label1.Caption := 'Abrindo tabela Portador'; Application.ProcessMessages;
//banco.TB_PortadorLista.Active := true;

Label1.Caption := 'Abrindo tabela Situação'; Application.ProcessMessages;
banco.TB_Situacao.Active      := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Functionários'; Application.ProcessMessages;
banco.TB_Funcionarios.Active  := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Forma de Pagamento'; Application.ProcessMessages;
banco.TB_FormaPagamento.Active:= true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Emitente'; Application.ProcessMessages;
banco.TB_Emitente.Active      := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Fotos'; Application.ProcessMessages;
banco.TB_Fotos.Active         := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Cartas'; Application.ProcessMessages;
banco.TB_Carta.Active         := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela de Cidades Virtuais'; Application.ProcessMessages;
banco.TB_Municipio_new.Active := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Estoque Auxiliar'; Application.ProcessMessages;
banco.TBEstoque_Quant.Active  := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Clientes Auxiliar'; Application.ProcessMessages;
banco.TB_ClientesInfo.Active  := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Fatura'; Application.ProcessMessages;
banco.TB_FormaPagamento.Active:= true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Parcelamento'; Application.ProcessMessages;
banco.TB_Parcelamento.Active  := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Contas'; Application.ProcessMessages;
banco.TB_Contas.Active        := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Portador'; Application.ProcessMessages;
banco.TB_Portador.Active      := true;
Application.ProcessMessages;


Label1.Caption := 'Abrindo tabela Parcelamentos Virtuais'; Application.ProcessMessages;
banco.TBParcelamentoVirtual.Active := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Cartas Auxiliar'; Application.ProcessMessages;
banco.TB_Carta_Favorito.Active := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Agenda'; Application.ProcessMessages;
banco.TB_Agenda.Active := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Contatos'; Application.ProcessMessages;
banco.TB_Agenda_Contato.Active := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Agenda Auxiliar'; Application.ProcessMessages;
banco.TB_Agenda_Tipo.Active := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Parcelas Auxiliar'; Application.ProcessMessages;
banco.TB_Parcelamento_Lista.Active := true;
Application.ProcessMessages;

Label1.Caption := 'Abrindo tabela Funcionário auxiliar'; Application.ProcessMessages;
banco.TB_ContasFuncAux.Active := true;
banco.TB_ContasFuncAux.DisableControls;
Application.ProcessMessages;

except
on e :Exception do
begin
  MessageDlg('Erro encontrado na tabela'+#13+e.Message,mtError,[mbok],0);
  Application.Terminate;
  exit;
end;
end;


Label1.Caption := 'Tabelas abertas'; Application.ProcessMessages;


if FileExists(banco.User_Cor) then
banco.ColorDialog.CustomColors.LoadFromFile(banco.User_Cor);

For i := 1 to High(banco.cor_grid) do
banco.Cor_Grid[i] := StringToColor(banco.config.ReadString('Color_Grid','Cor_'+IntToStr(i),'$00DBDBDB'));

for i := 1 to high(banco.Font_Grid) do
begin
 banco.Font_Grid[i] := TFont.Create;
 banco.Font_Grid[i].Name  := banco.Config.ReadString ('Font_Grid', 'Name_'+IntToStr(i),'MS Sans Serif');
 banco.Font_Grid[i].Color := banco.Config.ReadInteger('Font_Grid','Color_'+IntToStr(i),clBlack);
 banco.Font_Grid[i].size  := banco.Config.ReadInteger('Font_Grid', 'Size_'+IntToStr(i),8);
end;
banco.Pedido_InfoCLiente       := banco.config.ReadBool   ('Ffinaliza', 'ShowInfo',true);
banco.Pedido_InfoCliente_Width := banco.config.ReadInteger('Ffinaliza','widthInfo',165);


banco.pedido_ScreenWidth := banco.config.ReadInteger('Ffinaliza','Screenwidth',banco.pedido_ScreenWidth);
banco.pedido_ScreenHeigth := banco.config.ReadInteger('Ffinaliza','Screenheigth',banco.pedido_ScreenHeigth);



if banco.TB_Fotos.Locate(Banco.TB_FotosValor.FieldName,'Foto',[]) then
banco.LoadBitmap(banco.TB_FotosFoto,banco.Empresa_Imagem.Bitmap);

banco.LoadEmpresa;





Label1.Caption := 'Abrindo configurações da base'; Application.ProcessMessages;
//Abrindo configurações da base de dados
// codigo 1
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,1,[]) then
if banco.TB_ConfigValor.Value = '1' then
banco.TBClientesCodigo.ReadOnly := false;
//Codigo 1 = ClienteCodigoReadonly >>   1 = false     Obs vai ativar o campo
//                                 >>   <> 1 = true
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,4,[]) then
if banco.TB_ConfigValor.Value = '1' then
banco.TBEstoqueCodigo.ReadOnly := false;


Label1.Caption := 'Atalhos de Formatação'; Application.ProcessMessages;
if banco.Locate(9) then
begin
  try
  Banco.FormatarString1.ShortCut := StrToInt(Banco.TB_ConfigValor.Value);
  except
  Banco.FormatarString1.ShortCut := 0;
  end;
end
else
Banco.FormatarString1.ShortCut := 0;

Label1.Caption := 'Página CNPJ'; Application.ProcessMessages;
if Banco.Locate(10) then banco.Const_CNPJ_Page := banco.TB_ConfigValor.Value;
Label1.Caption := 'Página CPF'; Application.ProcessMessages;
if Banco.Locate(11) then banco.Const_CPF_Page  := banco.TB_ConfigValor.Value;
Label1.Caption := 'Campo CNPJ'; Application.ProcessMessages;
if Banco.Locate(12) then banco.campo_cnpj      := banco.TB_ConfigValor.Value;
Label1.Caption := 'Campo CPF'; Application.ProcessMessages;
if Banco.Locate(13) then banco.Campo_CPF       := banco.TB_ConfigValor.Value;

Label1.Caption := 'Automatizador de situação'; Application.ProcessMessages;
if banco.locate(15) then
begin
  try
  banco.Alter_Situacao := StrToInt(banco.TB_ConfigValor.value);
  Except
  MessageDlg('Foi encontrado um erro nas configurações'+#13'"Alterar situação de pedido ao receber as parcelas"'+#13+'A opção foi desativada',mtError,[mbok],0);
  banco.Alter_Situacao := -1;
    banco.TB_Config.Edit;
    banco.TB_ConfigValor.Value := '-1';
    banco.TB_Config.Post;
  end;

  if banco.Alter_Situacao <> -1 then
  if not  banco.TB_Situacao.Locate(banco.TB_SituacaoCodigo.FieldName,banco.Alter_Situacao,[]) then
  begin
    MessageDlg('Foi encontrado um erro nas configurações'+#13'"Alterar situação de pedido ao receber as parcelas"'+#13+'A opção foi desativada',mtError,[mbok],0);
    banco.Alter_Situacao := -1;

    banco.TB_Config.Edit;
    banco.TB_ConfigValor.Value := '-1';
    banco.TB_Config.Post;
  end;
end;


Label1.Caption := 'Configuração de Cartas'; Application.ProcessMessages;
if banco.Locate(20) then
if banco.TB_ConfigValor.Value = '1' then
banco.Carta_Salva := true else banco.Carta_Salva := false;

Label1.Caption := 'Diretório...'; Application.ProcessMessages;
if banco.Locate(21) then
if banco.TB_ConfigValor.Value <> '' then
banco.carta_dir := banco.TB_ConfigValor.Value;

Label1.Caption := 'Visualização'; Application.ProcessMessages;
if banco.Locate(22) then
if banco.TB_ConfigValor.Value = '1' then
banco.Carta_Visible := true else banco.Carta_Visible := false;

Label1.Caption := 'Impressão'; Application.ProcessMessages;
if banco.Locate(23) then
if banco.TB_ConfigValor.Value = '1' then
banco.carta_Impr_aut := true else banco.carta_Impr_aut := false;

if banco.Locate(24) then
if banco.TB_ConfigValor.Value = '1' then
banco.Carta_Impre_MSG := true else banco.Carta_Impre_MSG := false;


Label1.Caption := 'Configuração HTML'; Application.ProcessMessages;
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,80,[]) then
  try
  banco.Relatorio_Font_Name := banco.TB_ConfigValor.Value;
  except
  banco.Relatorio_Font_Name := 'Verdana';
  end;

Label1.Caption := 'Tamanho da Fonte'; Application.ProcessMessages;
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,81,[]) then
  try
  banco.Relatorio_Font_Size := StrToInt(banco.TB_ConfigValor.Value);
  except
  banco.Relatorio_Font_Size := 2;
  end;

Label1.Caption := 'Cor do Título'; Application.ProcessMessages;
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,82,[]) then
  try
  BANCO.Relatorio_Color_Title := StrToInt(banco.TB_ConfigValor.Value);
  except
  end;

Label1.Caption := 'Cor Primária'; Application.ProcessMessages;
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,83,[]) then
  try
  BANCO.Relatorio_Color_fundo[1]:= StrToInt(banco.TB_ConfigValor.Value);
  except
  end;


Label1.Caption := 'Cor Secundaria'; Application.ProcessMessages;
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,84,[]) then
try
BANCO.Relatorio_Color_fundo[2]:= StrToInt(banco.TB_ConfigValor.Value);
except
end;



close;
end;

end.
