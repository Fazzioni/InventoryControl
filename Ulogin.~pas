unit Ulogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, ADODB, ExtCtrls, Buttons;

type
  TFlogin = class(TForm)
    DBUser: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Image1: TImage;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Timer1: TTimer;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    Procedure VerificConectionString(Lista:TStringList);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    PRocedure LoadPermissao(User:integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBUserKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Label4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label4Click(Sender: TObject);
    Function GetIpFromTbl:Integer;
    Function GetMacFromTbl: Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flogin: TFlogin;

implementation

uses UDados, DateUtils, UPassword;
Function GetMac:ShortString; stdcall; external 'sysconf.dll';
Function GetIp:ShortString; Stdcall; External 'Sysconf.dll';
Function Encript(Value:ShortString):ShortString;stdcall; external 'sysconf.dll';
Function Descript(Value:ShortString):ShortString;stdcall; external 'sysconf.dll';


{$R *.dfm}

procedure TFlogin.FormShow(Sender: TObject);
var
  arquivo : TStringList;
begin
Color := Image1.Canvas.Pixels[1,1];


try
arquivo := TStringList.Create;



if FileExists(ExtractFilePath(Application.ExeName)+'\inicialization\'+GetMac+'.ini') then
Arquivo.LoadFromFile(ExtractFilePath(Application.ExeName)+'\inicialization\'+GetMac+'.ini')
else
if FileExists(ExtractFilePath(Application.ExeName)+'inicialization.ini') then
Arquivo.LoadFromFile(ExtractFilePath(Application.ExeName)+'inicialization.ini');

VerificConectionString(arquivo);

banco.ADOConnection1.Connected := false;
banco.ADOConnection1.ConnectionString := arquivo.Text;

if banco.ADOConnection1.ConnectionString = '' then
begin
  MessageDlg('O banco de dados não foi configurado nesse computador',mtError,[mbok],0);
  Application.Terminate;

  exit;
end;

{if not FileExists(banco.Dir_Banco) then
begin
ShowMessage('BANCO DE DADOS Não encontrado');
Application.Terminate;
exit;
end;}

//ADOConnection1.ConnectionString := InputBox('','','Provider=Microsoft.ACE.OLEDB.12.0;'+'Data Source='+Dir_Banco+';Persist Security Info=False;');
//banco.ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source='+banco.Dir_Banco+';';
//ADOConnection1.ConnectionString := 'Provider=Microsoft.ACE.OLEDB.12.0;User ID=Admin;Data Source='+Dir_Banco+';';


try
banco.ADOConnection1.Connected := true;
except
    on e : exception do
    begin
      ShowMessage('erro '+#13+e.Message);
      Application.Terminate;
      exit;
    end;
end;

finally
FreeAndNil(arquivo);
end;

banco.App_Dir:=ExtractFilePath(Application.ExeName);


Try
  banco.TB_Config.Active := true;
  Banco.TB_Config.Open;
Except
  MessageDlg('Banco de dados inválido',mtError,[mbok],0);
  Application.Terminate;
  exit;
end;


{if not banco.Locate(7) then
begin
  MessageDlg('É necessário atualizar dados',mtInformation,[mbok],0);
  winexec(pchar(banco.App_Dir+'Check.exe'),sw_normal);
  ModalResult := mrCancel;
  exit;
end
else
if banco.TB_ConfigValor.Value <> DateToStr(Date) then
begin
  MessageDlg('É necessário atualizar dados',mtInformation,[mbok],0);
  winexec(pchar(banco.App_Dir+'Check.exe'),sw_normal);
  ModalResult := mrCancel;
  exit;
end;




if banco.Locate(8) then
if banco.TB_ConfigValor.Value = 'Validando_'+DateToStr(date) then
begin
MessageDlg('Aguarde enquanto os dados são atualizados',mtInformation,[mbok],0);
  ModalResult := mrCancel;
exit;
end;
 }


Try
  banco.TB_Funcionarios.SQL.Clear;
  banco.TB_Funcionarios.SQL.add('Select * from Funcionarios');
  banco.TB_Funcionarios.SQL.add('where not Password is null');
  banco.TB_Funcionarios.SQL.add('and ativo = true');

  banco.TB_Funcionarios.SQL.add('or Codigo = 0');
  banco.TB_Funcionarios.Active := true;
  Banco.TB_Funcionarios.Open;
Except
  MessageDlg('Banco de dados inválido',mtError,[mbok],0);
  ModalResult := mrCancel;
  exit;
end;


DBUser.KeyValue := 0;

end;

procedure TFlogin.Button2Click(Sender: TObject);
var
  Pass_Temp : ShortString;
begin

if DBUser.KeyValue = null then
exit;

//Password
if DBUser.KeyValue = 0 then
begin
  banco.SetAllPermiss(true);
  //'00'+s+'00')
  Pass_Temp := '';

  if banco.Locate(26)  then
  begin
  Pass_Temp := banco.TB_ConfigValor.Value;
  Pass_Temp := Descript(Pass_Temp); //descriptografar
  end;

  if (Pass_Temp = '') or (Pass_Temp <> '00'+Edit1.Text+'00')  then
  begin
  MessageDlg('Senha incorreta',mtError,[mbok],0); //----------------------------------------------
  exit;
  end;

  banco.User_cod := 0;
  banco.User_Vender := 'SUPERVISOR';

end
else
begin
  Pass_Temp := '';
  Pass_Temp := banco.TB_FuncionariosPassword.Value;
  Pass_Temp := Descript(Pass_Temp); //descriptografar
  if (Pass_Temp = '') or (Pass_Temp <> Edit1.Text)  then
  begin
  MessageDlg('Senha incorreta',mtError,[mbok],0); //----------------------------------------------
  exit;
  end;

  banco.User_cod := banco.TB_FuncionariosCdigo.Value;
  banco.User_Vender := banco.TB_FuncionariosNome.Value;


  LoadPermissao(DBUser.KeyValue);
end;


ModalResult := mrok;


banco.TB_Funcionarios.Close;
banco.TB_Funcionarios.SQL.Clear;
banco.TB_Funcionarios.SQL.Add(Banco.Sql_Tb_Funcio_Default);




banco.ExecSQLTB.SQL.Clear;
banco.ExecSQLTB.SQL.Add('Insert Into tb_login ([User],[Data],[MAC],[IP])');
banco.ExecSQLTB.SQL.Add('Values ('+IntToStr(banco.User_cod)+',"'
                                  +FormatDateTime('YYYY/MM/DD',Date)+' '+FormatDateTime('hh:mm:ss',time)+'",'
                                  +IntToStr(GetMacFromTbl)+','
                                  +IntToStr(GetIpFromTbl)+')');
try
banco.ExecSQLTB.ExecSQL;
except
end;



end;


procedure TFlogin.VerificConectionString(Lista: TStringList);
var
  Parametros : TStringList;
  LasTI, i : integer;
  Pass : ShortString;
  Alter : Boolean;
begin
Alter := false;

if Lista.Count = 0 then
begin
MessageDlg('Banco de dados não foi configurado',mtError,[mbok],0);
abort;
Application.Terminate;
exit;
end;



Try
 Parametros := TStringList.Create;

LasTI := 1;
for i := 1 to length(Lista.Text) do
if lista.Text[i] = ';' then
begin
 Parametros.Add(copy(lista.Text,LasTI,i-LasTI));
 LasTI := i+1;
end;


For i := 0 to Parametros.Count -1 do
begin

if copy(Parametros[i],1,12) = 'Data Source=' then
if not FileExists(copy(Parametros[i],13,length(Parametros[i]))) then
begin
MessageDlg('O arquivo '+copy(Parametros[i],13,length(Parametros[i]))+' não foi encontrado',mtError,[mbok],0);
abort;
Application.Terminate;
exit;
end
else
Banco.Dir_Banco :=copy(Parametros[i],13,length(Parametros[i]));



if copy(Parametros[i],1,9) = 'Password=' then
begin
Pass := copy(Parametros[i],10,length(Parametros[i]));
Pass := Encript(Pass);

if Pass = '' then
begin
MessageDlg('Senha inválida ao acessar o banco de dados, configure a mesma pela aplicação',mtError,[mbok],0);
abort;
Application.Terminate;
exit;
end;


Parametros[i] := 'Password="'+Pass+'"';
Alter := true;

end;

end;

if Alter then
begin
Lista.Clear;
 for i := 0 to Parametros.Count - 1 do
 Lista.Text := Lista.Text + Parametros[i]+';';
end;


FInally
FreeAndNil(Parametros);
end;
end;

procedure TFlogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Button2Click(SpeedButton1);
key :=#0;
exit;
end;

if not (key in ['a'..'z','A'..'Z','1'..'9',chr(8)]) then
begin
key := #0;
beep;
end;



end;




procedure TFlogin.FormCreate(Sender: TObject);
begin
banco.SetAllPermiss(False);

end;

procedure TFlogin.LoadPermissao(User: integer);
var
  Query : TADOQuery;
  Chave : ShortString;
begin
banco.SetAllPermiss(False);
Chave := '';

Try
  Query := TADOQuery.Create(self);
  Query.Connection := Banco.ADOConnection1;
  Query.SQL.Add('select id_user,valor from logperm');
  query.SQL.Add('where id_user = '+IntToStr(User));
  query.Open;
Except
  FreeAndNil(Query);
  exit;
end;


if Query.RecordCount = 0 then exit;


Chave := Descript(VarToStr(Query.FieldValues['valor']));

if (Chave = '')  then
exit;

if Chave[01] = '1' then  Banco.Cli_Acesso      := true;
if Chave[02] = '1' then  Banco.Cli_Alter_Logr  := true;
if Chave[03] = '1' then  Banco.Cli_Editar      := true;
if Chave[04] = '1' then  Banco.Cli_Excluir     := true;
if Chave[05] = '1' then  Banco.Cli_Mala_Direta := true;
if Chave[06] = '1' then  Banco.Cli_Novo        := true;
if Chave[07] = '1' then  Banco.Cli_Relatorio   := true;
if Chave[08] = '1' then  Banco.Cli_Vis_Hist    := true;
if Chave[09] = '1' then  Banco.Cont_Acesso     := true;
if Chave[10] = '1' then  Banco.Cont_Novo       := true;
if Chave[11] = '1' then  Banco.Cont_Editar     := true;
if Chave[12] = '1' then  Banco.Cont_Excluir    := true;
if Chave[13] = '1' then  Banco.Cont_Hist_Cont  := true;
if Chave[14] = '1' then  Banco.Cont_Alter_Portador  := true;
if Chave[15] = '1' then  Banco.Cont_Alter_Faturas   := true;
if Chave[16] = '1' then  Banco.Cont_Alter_Parcelamentos := true;
if Chave[17] = '1' then  Banco.Cont_Receber_conta   := true;
if Chave[18] = '1' then  Banco.Est_Acesso      := true;
if Chave[19] = '1' then  Banco.Est_Novo        := true;
if Chave[20] = '1' then  Banco.Est_Editar      := true;
if Chave[21] = '1' then  Banco.Est_Excluir     := true;
if Chave[22] = '1' then  Banco.Est_Alter_Un    := true;
if Chave[23] = '1' then  Banco.User_Acesso     := true;
if Chave[24] = '1' then  Banco.User_Novo       := true;
if Chave[25] = '1' then  Banco.User_Editar     := true;
if Chave[26] = '1' then  Banco.User_Excluir    := true;
if Chave[27] = '1' then  Banco.User_Alter_Perm := true;
if Chave[28] = '1' then  Banco.User_Visu_Auditoria   := true;
if Chave[29] = '1' then  Banco.User_Alter_Setor:= true;
if Chave[30] = '1' then  Banco.User_Alter_Emitente   := true;
if Chave[31] = '1' then  Banco.User_Config_Global    := true;
if Chave[32] = '1' then  Banco.User_Config_Backup    := true;
if Chave[33] = '1' then  Banco.Agen_Acesso           := true;
if Chave[34] = '1' then  Banco.Agen_Alter_Tipo       := true;
if Chave[35] = '1' then  Banco.Agen_Alter_Contato    := true;
if Chave[36] = '1' then  Banco.Agen_Editar     := true;
if Chave[37] = '1' then  Banco.Agen_Excluir    := true;
if Chave[38] = '1' then  Banco.Agen_Novo       := true;
if Chave[39] = '1' then  Banco.Agen_Relatorio  := true;

//User_MalaDireta

end;


procedure TFlogin.SpeedButton2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFlogin.DBUserKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
self.Perform(WM_NEXTDLGCTL,0,0);
key :=#0;
end;

end;

procedure TFlogin.Timer1Timer(Sender: TObject);
begin
DBUser.KeyValue := 0;
Button2Click(SpeedButton1);
end;

procedure TFlogin.Label4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
(Sender as TLabel).Font.Style := [fsBold,fsItalic,fsUnderline];
end;

procedure TFlogin.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if Label4.Visible then
Label4.Font.Style := [fsItalic];
end;

procedure TFlogin.Label4Click(Sender: TObject);
  Function ReturnOfCont(value:ShortString):Smallint;
  var
    i : Shortint;
  begin
    Result := 0;
    for i := 0 to Length(value) do
    if value[i] in ['0'..'9'] then
    Result := Result +  StrToInt(value[i]);
  end;
 Function ContraSenha:Integer;
 Begin
 Result := 0;                                                                                       {CONTA}
 Result := DayOf(Date) +  MonthOf(Date) + StrToInt(copy( IntToStr(YearOf(Date)),3,2));        // Dia + mes + (string(Ano[3]+ano[4]))
 Result :=  trunc(sqrt(Result * 9));                                                          // int(raiz(result 8 9))
 Result := StrToInt(IntToStr(Result) + FormatFloat('0000',ReturnOfCont(banco.Empresa_CNPJ)) );// string (result + formatflooat('0000',SomaAllCPF))
 Result := (Result * 3);                                                                      // result * 3
end;
var
   s: String;
   DataAux : TDate;
begin

DataAux := date- 1;
FormMouseMove(self,[ssctrl],0,0);

if MessageDlg(
'Esse processo altera a senha atual do supervisor'+#13+
'É necessário entrar em contato com o desenvolvedor, Daniel Fazzioni para solicitar a contra senha'+#13+
'Ao entrar em contato, informe o serial de seu programa'+#13+
'Você ja possui a contra senha?'
,mtInformation,[mbyes,mbno],0) = mrno then
exit;

s := '';
s := IntToStr(ContraSenha);

if InputQuery('Alterando a senha do supervisor','Informe a contra senha',s) = false then
exit;

if banco.Locate(25) then
try
DataAux := StrToDate( Descript(Banco.TB_ConfigValor.Value));
except
end;


if s <> IntToStr(ContraSenha) then
begin
MessageDlg('Contra senha inválida',mtError,[mbok],0);
exit;
end;

if DataAux >= Date then
begin
  MessageDlg('Contra senha expirada',mtError,[mbok],0);
  exit;
end;


try
   Application.CreateForm(TFPassword,FPassword);
   FPassword.Especial := true;
   FPassword.Label4.Caption := 'Supervisor';
   FPassword.ShowModal;
Finally
  s := '';
  if FPassword.ModalResult = mrok then
  s := FPassword.Edit2.Text;

  FreeAndNil(FPassword);
end;

if s = '' then exit;

try
  if not banco.Locate(26) then
  begin
  banco.TB_Config.Insert;
  banco.TB_ConfigCodigo.Value := 26;
  end
  else
  banco.TB_Config.Edit;
  banco.TB_ConfigValor.Value := Encript('00'+s+'00');

  banco.TB_Config.Post;
  MessageDlg('Senha do supervisor alterada com sucesso',mtInformation,[mbok],0);
Except
  on e : Exception do
  begin
    banco.Create_Erro(e.ClassName,e.Message);
    MessageDlg(e.Message,mtError,[mbok],0);
    exit;
  end;
end;

try
  if not banco.Locate(25) then
  begin
  banco.TB_Config.Insert;
  banco.TB_ConfigCodigo.Value := 25;
  end
  else
  banco.TB_Config.Edit;
  banco.TB_ConfigValor.Value := Encript(DateToStr(Date));
  banco.TB_Config.Post;
except
end;


end;

function TFlogin.GetIpFromTbl: Integer;
var
  Query : TADOQuery;
begin
  Result := 0;
try
 Query := TADOQuery.Create(self);
  try

    Query.Connection := banco.ADOConnection1;
    Query.DisableControls;
    Query.SQL.Clear;
    Query.SQL.Add('select * from tb_loginip');
    Query.SQL.Add('where descricao = '+Char(39)+GetIp+Char(39));
    Query.Open;

  if query.RecordCount <> 0 then
  Result := Query.FieldValues['codigo']
  else
  begin
  Query.Insert;
  Query.FieldByName('descricao').AsString := GetIp;
  Query.Post;
  Result := Query.FieldValues['codigo'];
  end;


  Except
  on e:exception do
  banco.Create_Erro(e.ClassName,e.message);

  end;
Finally
  if not (query.State in [dsinactive]) then
  Query.Close;

FreeAndNil(Query);
end;
end;

function TFlogin.GetMacFromTbl: Integer;
var
  Query : TADOQuery;
begin
  Result := 0;
try
 Query := TADOQuery.Create(self);
  try

    Query.Connection := banco.ADOConnection1;
    Query.DisableControls;
    Query.SQL.Clear;
    Query.SQL.Add('select * from tb_loginMAC');
    Query.SQL.Add('where descricao = '+Char(39)+GetMac+Char(39));
    Query.Open;

  if query.RecordCount <> 0 then
  Result := Query.FieldValues['codigo']
  else
  begin
  Query.Insert;
  Query.FieldByName('descricao').AsString := GetMac;
  Query.Post;
  Result := Query.FieldValues['codigo'];
  end;


  Except
  on e:exception do
  banco.Create_Erro(e.ClassName,e.message);

  end;
Finally
  if not (query.State in [dsinactive]) then
  Query.Close;

FreeAndNil(Query);
end;
end;
end.
