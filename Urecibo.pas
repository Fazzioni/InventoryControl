unit Urecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppPrnabl, ppClass, ppCtrls, ppCache, ppBands, ppDesignLayer,
  ppParameter, ppComm, ppRelatv, ppProd, ppReport, StdCtrls;

type
  TFRecibo = class(TForm)
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel1: TppLabel;
    LClie: TppLabel;
    LImpor: TppLabel;
    Lprov: TppLabel;
    LCid: TppLabel;
    ppLine10: TppLine;
    LRaz: TppLabel;
    Emit_Contato: TppLabel;
    Emit_Cep: TppLabel;
    Emit_Local: TppLabel;
    Emit_CNPJ: TppLabel;
    Emit_Razao: TppLabel;
    ppImage1: TppImage;
    Lvalor: TppLabel;
    ppLine7: TppLine;
    ppLabel2: TppLabel;
    LClie1: TppLabel;
    LImpor1: TppLabel;
    Lprov1: TppLabel;
    LCid1: TppLabel;
    ppLine12: TppLine;
    LRaz1: TppLabel;
    Emit_Contato1: TppLabel;
    Emit_Cep1: TppLabel;
    Emit_Local1: TppLabel;
    Emit_CNPJ1: TppLabel;
    Emit_Razao1: TppLabel;
    ppImage2: TppImage;
    Lvalor1: TppLabel;
    Procedure PrinterRecibo(ClientName,Historico:ShortString;Valor:Currency; ContNumber:Integer; Pago:TDate);
      private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRecibo: TFRecibo;

implementation

uses UDados;

{$R *.dfm}
const
 Centenas: array[1..9] of string[12]=('CEM','DUZENTOS','TREZENTOS','QUATROCENTOS',
                                      'QUINHENTOS','SEISCENTOS','SETECENTOS',
                                      'OITOCENTOS','NOVECENTOS');
                                      
 Dezenas : array[2..9] of string[10]=('VINTE','TRINTA','QUARENTA','CINQUENTA',
                                      'SESSENTA','SETENTA','OITENTA','NOVENTA');

 Dez     : array[0..9] of string[10]=('DEZ','ONZE','DOZE','TREZE','QUATORZE',
                                      'QUINZE','DEZESSEIS','DEZESSETE',
                                      'DEZOITO','DEZENOVE');

 Unidades: array[1..9] of string[10]=('UM','DOIS','TRÊS','QUATRO','CINCO',
                                      'SEIS','SETE','OITO','NOVE');
 MoedaSingular = 'REAL';
 MoedaPlural   = 'REAIS';
 CentSingular  = 'CENTAVO';
 CentPlural    = 'CENTAVOS';
 Zero          = 'ZERO';

Function Ext3(Parte:string):string;
var
 Base: string;
 digito: integer;
begin
Base:='';
digito:=StrToInt(Parte[1]);
if digito=0 then
 Base:=''
else
 Base:=Centenas[digito];
if (digito = 1) and (Parte > '100') then
 Base:='CENTO';
Digito:=StrToInt(Parte[2]);
if digito = 1 then
 begin
  Digito:=StrToInt(Parte[3]);
  if Base <> '' then
   Base:=Base + ' E ';
  Base:=Base + Dez[Digito];
 end
else
 begin
  if (Base <> '') and (Digito > 0) then
   Base:=Base+' E ';
  if Digito > 1 then
   Base:=Base + Dezenas[digito];
  Digito:=StrToInt(Parte[3]);
  if Digito > 0 then
   begin
    if Base <> '' then Base:=Base+' E ';
    Base:=Base+Unidades[Digito];
   end;
 end;
Result:=Base;
end;

function extenso (valor: real): string;
var
 ComoTexto: string;
 Parte: string;
begin
Result:='';
ComoTexto:=FloatToStrF(Abs(Valor),ffFixed,18,2);
// Acrescenta zeros a esquerda ate 12 digitos
while length(ComoTexto) < 15 do
 Insert('0',ComoTexto,1);
// Retira caracteres a esquerda para o máximo de 12 digitos
while length(ComoTexto) > 15 do
 delete(ComoTexto,1,1);

// Calcula os bilhões
Parte:=Ext3(copy(ComoTexto,1,3));
if StrToInt(copy(ComoTexto,1,3)) = 1 then
 Parte:=Parte + ' BILHAO'
else
 if Parte <> '' then
  Parte:=Parte + ' BILHOES';
Result:=Parte;

// Calcula os nilhões
Parte:=Ext3(copy(ComoTexto,4,3));
if Parte <> '' then
 begin
  if Result <> '' then
   Result:=Result+', ';
  if StrToInt(copy(ComoTexto,4,3)) = 1 then
   Parte:=Parte + ' MILHÃO'
  else
   Parte:=Parte + ' MILHÕES';
  Result:=Result + Parte;
 end;

// Calcula os nilhares
Parte:=Ext3(copy(ComoTexto,7,3));
if Parte <> '' then
 begin
  if Result <> '' then
   Result:=Result + ', ';
  Parte:=Parte + ' MIL';
  Result:=Result + Parte;
 end;

// Calcula as unidades
Parte:=Ext3(copy(ComoTexto,10,3));
if Parte <> '' then
 begin
  if Result <> '' then
   if Frac(Valor) = 0 then
    Result:=Result + ' E '
   else
    Result:=Result + ', ';
  Result:=Result + Parte;
 end;

// Acrescenta o texto da moeda
if Int(Valor) = 1 then
 Parte:=' ' + MoedaSingular
else
 Parte:=' ' + MoedaPlural;
if copy(ComoTexto,7,6) = '000000' then
 Parte:=' DE ' + MoedaPlural;
Result:=Result + Parte;

// Se o valor for zero, limpa o resultado
if int(Valor) = 0 then Result:='';

//Calcula os centavos
Parte:=Ext3('0'+copy(ComoTexto,14,2));
if Parte <> '' then
 begin
  if Result <> '' then
   Result:=Result + ' E ';
  if Parte = Unidades[1] then
   Parte:=Parte + ' '+CentSingular
  else
   Parte:=Parte + ' '+CentPlural;
  Result:=Result + Parte;
 end;

// Se o valor for zero, assume a constante ZERO
if Valor = 0 then  Result:=Zero;
end;



procedure TFRecibo.PrinterRecibo(ClientName, Historico: ShortString;
  Valor: Currency; ContNumber: Integer; Pago:TDate);
begin
//
ppImage1.Picture := nil;
ppImage2.Picture := nil;

  Emit_Razao.Caption := '';
Emit_Contato.Caption := '';
    Emit_Cep.Caption := '';
   Emit_CNPJ.Caption := '';
  Emit_Local.Caption := '';
LClie.Caption := '';
LImpor.Caption := '';
Lprov.Caption := '';
LCid.Caption := '';
Lvalor.Caption := 'R$ 0,00';
LRaz.Caption := '';

ppImage1.Picture := banco.Empresa_Imagem;
Emit_Razao.Caption := banco.Empresa_Nome;
Emit_Local.Caption :=Banco.Empresa_Tipo_rua + ' '+banco.Empresa_rua;

if banco.Empresa_Numero      <> '' then Emit_Local.Caption := Emit_Local.Caption+', ' +Banco.Empresa_Numero;
if banco.empresa_Complemento <> '' then Emit_Local.Caption := Emit_Local.Caption+', ' +banco.empresa_Complemento;
if banco.Empresa_bairro      <> '' then Emit_Local.Caption := Emit_Local.Caption+' - '+Banco.Empresa_bairro;

Emit_CNPJ.Caption := Banco.VerificaCNPJ(banco.Empresa_CNPJ,true,true);

if banco.empresa_cep <> '' then Emit_Cep.Caption := 'CEP '+banco.empresa_cep;
if banco.empresa_UF <>  '' then Emit_Cep.Caption := Emit_Cep.Caption + '    '+banco.empresa_UF;
if banco.Empresa_Cidade <>  '' then Emit_Cep.Caption := Emit_Cep.Caption + ' - '+banco.Empresa_Cidade;


LClie.Caption := 'Recebemos de '+ClientName;
LImpor.Caption := 'A importância de '+extenso(Valor);
Lprov.Caption := 'Proveniente: '+IntToStr(ContNumber)+', Referente '+Historico;
LCid.Caption := Banco.Empresa_Cidade+' - '+Banco.empresa_UF+', '+FormatDateTime('DD',Pago)+' de '+FormatDateTime('MMMMM',Pago)+' de '+FormatDateTime('YYYY',date);


Lvalor.Caption :='R$ '+FormatFloat(',0.00',valor);

LRaz.Caption := banco.Empresa_Nome;


ppReport1.Icon := Application.Icon;
ppReport1.OutlineSettings.Enabled := false; // remove croqui

LClie1.Caption  := LClie.Caption;
LImpor1.Caption := LImpor.Caption;
Lprov1.Caption  := Lprov.Caption;
LCid1.Caption   := LCid.Caption;
Lvalor1.Caption := Lvalor.Caption;
LRaz1.Caption   := LRaz.Caption;
Emit_Contato1.Caption:= Emit_Contato.Caption;
Emit_Cep1.Caption    := Emit_Cep.Caption;
Emit_Local1.Caption  := Emit_Local.Caption;
Emit_CNPJ1.Caption   := Emit_CNPJ.Caption;
Emit_Razao1.Caption  := Emit_Razao.Caption;
if ppImage1.Picture <> nil then ppImage2.Picture := ppImage1.Picture;


ppReport1.PrinterSetup.PrinterName := Banco.Impressora_Sis;

ppReport1.Print;



end;

end.
