unit Ucarta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ThemeDBGrid,ComObj,DB,printers,
  ExtCtrls, Menus;

type
  TFcarta = class(TForm)
    ThemeDBGrid1: TThemeDBGrid;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    PopupMenu1: TPopupMenu;
    AdicionarFavoritos1: TMenuItem;
    N1: TMenuItem;
    AdicionarAtalho1: TMenuItem;
    SalvarDocumento1: TMenuItem;
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    FavoritoTrue: TImage;
    FavoritoFalse: TImage;
    FavoritoSelectTrue: TImage;
    FavoritoSelectFalse: TImage;
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ThemeDBGrid1DblClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure AdicionarAtalho1Click(Sender: TObject);
    procedure AdicionarFavoritos1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    DataSet_LIsta : TDataSet;

    { Public declarations }
  end;

var
  Fcarta: TFcarta;

implementation

uses Ufuncionario, UProgressCarta, uclientes, UDados, Uprinciapl, UAtalho;

{$R *.dfm}

procedure TFcarta.Button5Click(Sender: TObject);
Var
  WinWord, Docs, Doc: Variant;
	arquivo : string;
  i : integer;
  Steam : TMemoryStream;
  valor : Shortstring;
  Imprime_msg : Boolean;
begin

if banco.TB_Carta.RecordCount = 0 then
exit;

Imprime_msg := false;




if banco.TB_CartaCarta.Value = '' then
begin
MessageDlg('Carta registrada inválida',mtError,[mbok],0);
exit;
end;

arquivo := '';
i := 0;
Try
Application.CreateForm(TFprogressCarta,FprogressCarta);
FprogressCarta.Show;

Application.ProcessMessages;
FprogressCarta.Label1.Caption := 'Localizando pasta Temp';

arquivo := Banco.PegaTempDir;

if not (DirectoryExists(arquivo)) then
arquivo := 'c:\';

while FileExists(arquivo+'Carta_'+IntToStr(i)+'.doc') do
inc(i);

arquivo := arquivo+'Carta_'+IntToStr(i)+'.doc';

Application.ProcessMessages;
FprogressCarta.Label1.Caption := 'Verificando anexo';

try
Steam := TMemoryStream.Create;
Banco.TB_CartaCarta.SaveToStream(Steam);
Steam.SaveToFile(arquivo);
Except
MessageDlg('Não foi possível salvar a carta, arquivo inválido',mtError,[mbok],0);

FprogressCarta.OnDeactivate := nil;
FprogressCarta.Close;
FreeAndNil(FprogressCarta);
FreeAndNil(Steam);
exit;
end;


i := 0;
while not FileExists(arquivo) do
if i = 10 then
begin
MessageDlg('Falha ao salvar aquivo. (Time Out)',mtError,[mbok],0);
FprogressCarta.OnDeactivate := nil;
FprogressCarta.Close;
FreeAndNil(FprogressCarta);
FreeAndNil(Steam);
exit;
end
else
begin
Application.ProcessMessages;
Sleep(1000);
inc(i);
end;


FprogressCarta.Label1.Caption := 'Criando documento do Word';
Application.ProcessMessages;

if Banco.Carta_Impre_MSG then
if MessageDlg('Deseja imprimir a carta?'+#13+
              'Nome: '+banco.TB_CartaDescricao.Value+#13+
              'Impressora: '+Banco.Impressora_Sis,mtConfirmation, [mbyes,mbno],0) = mryes then
Imprime_msg := true;

try
WinWord := CreateOleObject('Word.Application');
Except
MessageDlg('Não foi abrir o Microsoft Word',mtError,[mbok],0);
FprogressCarta.OnDeactivate := nil;
FprogressCarta.Close;
FreeAndNil(FprogressCarta);
FreeAndNil(Steam);
exit;
end;




//------------------------------------------------------------------------------------------
WinWord.Visible :=  Banco.Carta_Visible;

FprogressCarta.Label1.Caption := 'Abrindo interface...';
Application.ProcessMessages;

Docs := WinWord.Documents;

FprogressCarta.Label1.Caption := 'Abrindo arquivo';
Application.ProcessMessages;
Doc := Docs.Open(arquivo);

FprogressCarta.Label1.Caption := 'Substituindo valores...';
Application.ProcessMessages;

valor := '';

  For i := 0 to dataset_lista.Fields.Count -1 do
  begin
    FprogressCarta.Label1.Caption := 'Verificando '+dataset_lista.fields[i].DisplayLabel;
    Application.ProcessMessages;
    valor := '';

    if (dataset_lista.Fields[i] is TBooleanField) then
    if dataset_lista.Fields[i].AsBoolean then
     valor := 'Sim' else valor := 'Não';
     

    if (dataset_lista.Fields[i] is TIntegerField) then
      valor := IntToStr(dataset_lista.Fields[i].AsInteger);

    if (dataset_lista.Fields[i] is TStringField) then
    if not (dataset_lista.Fields[i].AsString = null) then
    if dataset_lista.Fields[i].FieldName = 'CPF' then
       valor := Banco.VerificaCNPJ(dataset_lista.Fields[i].AsString,true,false)
    else
       valor := dataset_lista.Fields[i].AsString;

    if valor = '' then valor := ' ';


  if (dataset_lista.Fields[i] is TDateTimeField) then
  begin
  if not (dataset_lista.Fields[i].AsDateTime = null) then
  begin
  valor := FormatDateTime('DD/MM/YYY',dataset_lista.Fields[i].AsDateTime);
  Doc.Content.Find.execute(FindText := '{DD/MM/YYYY_'+dataset_lista.Fields[i].FieldName+'}', ReplaceWith:=valor);

  valor := FormatDateTime('DDDD',dataset_lista.Fields[i].AsDateTime)+', '+FormatDateTime('DD',dataset_lista.Fields[i].AsDateTime)+' de '+FormatDateTime('MMMM',dataset_lista.Fields[i].AsDateTime)+' de '+FormatDateTime('YYYY',dataset_lista.Fields[i].AsDateTime);


  Doc.Content.Find.execute(FindText := '{DDDD/MMMM/YYYY_'+dataset_lista.Fields[i].FieldName+'}', ReplaceWith:=valor);

  valor := DateToStr(dataset_lista.Fields[i].AsDateTime);
  Doc.Content.Find.execute(FindText := '{'+dataset_lista.Fields[i].FieldName+'}', ReplaceWith:=valor);

  end;
  end
  else
Doc.Content.Find.execute(FindText := '{'+dataset_lista.Fields[i].FieldName+'}', ReplaceWith:=valor)

end;

// DD DDD YYYY YYYY
FprogressCarta.Label1.Caption := 'Verificando datas';
Application.ProcessMessages;
Doc.Content.Find.execute(FindText := '{DD_Date}', ReplaceWith:=FormatDateTime  ('DD',Date));
Doc.Content.Find.execute(FindText := '{DDDD_Date}', ReplaceWith:=FormatDateTime('DDDD',Date));
Doc.Content.Find.execute(FindText := '{MM_Date}', ReplaceWith:=FormatDateTime  ('MM',Date));
Doc.Content.Find.execute(FindText := '{MMMM_Date}', ReplaceWith:=FormatDateTime('MMMM',Date));
Doc.Content.Find.execute(FindText := '{YYYY_Date}', ReplaceWith:=FormatDateTime('YYYY',Date));



FprogressCarta.Label1.Caption := 'Salvando';
Application.ProcessMessages;

if banco.Carta_Salva  then
begin

if not DirectoryExists(Banco.carta_dir) then
begin
  if not CreateDir(Banco.carta_dir) then
  MessageDlg('Não foi possível salvar, a pasta não existe',mtError,[mbok],0);
end
else
try
i := 0;
while FileExists(Banco.carta_dir+IntToStr(i)+'-'+FormatDateTime('DD-MM-YYY',Date)+'.doc') do
inc(i);

Doc.SaveAs(Banco.carta_dir+IntToStr(i)+'-'+FormatDateTime('DD-MM-YYY',Date)+'.doc')

except
on e : exception do
MessageDlg('Não foi possível salvar o arquivo, mensagem original'+#13+e.Message,mtError,[mbok],0);
end;

end;
Doc.SaveAs(arquivo);
FprogressCarta.Label1.Caption := 'Finalizando';
Application.ProcessMessages;
FprogressCarta.OnDeactivate := nil;
FprogressCarta.Close;


if (banco.carta_Impr_aut) or (Imprime_msg) then
begin
if printer.Printers.IndexOf(Banco.Impressora_Sis) = -1 then // não encontrou impressora
MessageDlg('Não foi possível encontrar a impressora configurada',mtError,[mbOK],0)
else
begin
// Procedimento para imprimir

WinWord.ActivePrinter := banco.Impressora_Sis;
WinWord.PrintOut;
While WinWord.BackgroundPrintingStatus > 0 do
Application.ProcessMessages;
end;



end;


if not Banco.Carta_Visible then
begin

WinWord.Quit; //   WordApplication1.Disconnect;
end;


DeleteFile(arquivo);

close;

except
on e: exception do
begin
Banco.Create_Erro(e.ClassName,e.Message);
MessageDlg(e.Message,mtError,[mbok],0);
end;
end;
end;


procedure TFcarta.Button1Click(Sender: TObject);
var
    aux : string;
Dir_DOc :TFileName;
Stream : TMemoryStream;
i : integer;
begin
Dir_DOc := '';

if not OpenDialog1.Execute then
exit;



Dir_DOc := OpenDialog1.FileName;

if not FileExists(Dir_DOc) then
begin
MessageDlg('Documento não existe',mtInformation,[mbok],0);
exit;
end;

aux := ExtractFileName(Dir_DOc) ;
for i := length(aux) downto 1 do
if aux[i] = '.' then
break;

aux := copy(aux,1,i-1);



if InputQuery('Registrando carta','Informe o nome da carta',aux) = false then
exit;

if aux = '' then exit;

if Banco.TB_Carta.Locate(Banco.TB_CartaDescricao.FieldName,aux,[]) then
begin
MessageDlg('Já existe uma carta registrada com esse nome',mtInformation,[mbok],0);
exit;
end;

banco.TB_Carta.Insert;
banco.TB_CartaFavorito.Value := false;


if not (FFuncionarios = nil) then
Banco.TB_CartaModulo.Value := 1;

if not (Fclientes = nil) then
Banco.TB_CartaModulo.Value := 2;



banco.TB_CartaDescricao.Value := aux;


Try
Stream := TMemoryStream.Create;
Stream.LoadFromFile(Dir_DOc);
banco.TB_CartaCarta.LoadFromStream(Stream);
FreeAndNil(Stream);
except
on e : exception do
begin
Banco.TB_Carta.Cancel;
MessageDlg('Erro ao abrir o arquivo, mensagem original'+#13+e.Message,mtError,[mbok],0);
FreeAndNil(Stream);
exit;
end;
end;

try
Banco.TB_Carta.Post;
MessageDlg('Carta '+aux +' registrada com sucesso',mtInformation,[mbok],0);
except
on e : exception do
begin
banco.Create_Erro(e.ClassName,e.Message);
MessageDlg('Erro ao registrar a carta, mensagem original'+#13+e.Message,mtError,[mbok],0);
end;
end;
end;

procedure TFcarta.Button3Click(Sender: TObject);
var
  Steam : TMemoryStream;
begin


if banco.TB_Carta.RecordCount = 0 then exit;

if banco.TB_CartaCarta.Value = null then
begin
MessageDlg('O registro não possui nem um anexo',mtInformation,[mbok],0);
exit;
end;

SaveDialog1.FileName := banco.TB_CartaDescricao.Value;

if not SaveDialog1.Execute then
exit;

if ExtractFileExt(SaveDialog1.FileName) = '' then
SaveDialog1.FileName := SaveDialog1.FileName + '.doc';


Try
Steam := TMemoryStream.Create;
Banco.TB_CartaCarta.SaveToStream(Steam);
Steam.SaveToFile(SaveDialog1.FileName);
MessageDlg('Arquivo salvo',mtInformation,[mbok],0);

FreeAndNil(Steam);
Except
on e : exception do
begin
banco.Create_Erro(e.ClassName,e.Message);
MessageDlg('Erro ao salvar o arquivo, mensagem original'+#13+e.Message,mtInformation,[mbok],0);
FreeAndNil(Steam);
end;

end;

end;

procedure TFcarta.Button2Click(Sender: TObject);
begin
if banco.TB_Carta.RecordCount = 0 then
exit;

if MessageDlg('Deseja excluir o anexo '+Banco.TB_CartaDescricao.Value + '?',mtInformation,[mbyes, mbno],0) = mrno then
exit;


try
if banco.TB_Carta_Favorito.Locate(banco.TB_Carta_FavoritoCodigo.FieldName, banco.TB_CartaCodigo.Value,[]) then
banco.TB_Carta_Favorito.Delete;

banco.TB_Carta.Delete;
MessageDlg('Registro excluido',mtInformation,[mbok],0);
except
  on e : exception do
  begin
  Banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Erro ao excluir registro',mtError,[mbok],0);
  end;
end;

end;

procedure TFcarta.Edit1Change(Sender: TObject);
begin
banco.TB_Carta.Locate(banco.TB_CartaDescricao.FieldName,Edit1.Text,[loCaseInsensitive,loPartialKey]);

end;

procedure TFcarta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
close;

end;

procedure TFcarta.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//  inherited;
 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
  end;

(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);


  if (Column.Field = Banco.TB_CartaFavorito) then
  begin
      try
        if banco.TB_Carta.RecordCount > 0 then
        if Banco.TB_CartaFavorito.Value then
        begin
           if (gdselected in State) or (gdfocused in State) then
          (sender as TThemeDBGrid).CANVAS.StretchDraw(Rect,FavoritoSelectTrue.Picture.Bitmap)
           else
          (sender as TThemeDBGrid).CANVAS.StretchDraw(Rect,FavoritoTrue.Picture.Bitmap);

        end
        else
        begin
           if (gdselected in State) or (gdfocused in State) then
           (sender as TThemeDBGrid).CANVAS.StretchDraw(Rect,FavoritoSelectFalse.Picture.Bitmap)
           else
           (sender as TThemeDBGrid).CANVAS.StretchDraw(Rect,FavoritoFalse.Picture.Bitmap );
        end;
        
     except
     end;
  end;


end;


procedure TFcarta.ThemeDBGrid1DblClick(Sender: TObject);
begin
if banco.TB_Carta.RecordCount = 0 then
exit;

try
banco.TB_Carta.Edit;
if banco.TB_CartaFavorito.IsNull then
banco.TB_CartaFavorito.Value := false;
banco.TB_CartaFavorito.Value := not (banco.TB_CartaFavorito.Value);
banco.TB_Carta.Post;


if not banco.TB_Carta_Favorito.Locate(banco.TB_Carta_FavoritoCodigo.FieldName,banco.TB_CartaCodigo.Value,[]) then
begin
banco.TB_Carta_Favorito.Insert;
banco.TB_Carta_FavoritoCodigo.Value := banco.TB_CartaCodigo.Value;
banco.TB_Carta_Favorito.Post;
end;



{if banco.TB_CartaFavorito.Value then
MessageDlg('Favorito adicionado com sucesso',mtInformation,[mbok],0)
else
MessageDlg('Favorito removido com sucesso',mtInformation,[mbok],0);  }

except
on e :exception do
begin
banco.Create_Erro(e.ClassName,e.Message);
MessageDlg('Erro ao modificar o campo favorito, mensagem original'+#13+e.Message,mtError,[mbok],0);

if Banco.TB_Carta.State in [dsedit, dsinsert] then
Banco.TB_Carta.Cancel;


end;


end;


end;

procedure TFcarta.PopupMenu1Popup(Sender: TObject);
begin
SalvarDocumento1.Enabled := true;
AdicionarFavoritos1.Enabled := true;
   AdicionarAtalho1.Enabled := true;
AdicionarFavoritos1.Caption := 'Adicionar nos Favoritos';
AdicionarAtalho1.Caption := 'Adicionar Atalho';

if Banco.TB_CartaFavorito.IsNull then
AdicionarFavoritos1.Enabled := false
else
if banco.TB_CartaFavorito.Value then
AdicionarFavoritos1.Caption := 'Remover dos Favoritos';



if banco.TB_Carta_Favorito.Locate(banco.TB_Carta_FavoritoCodigo.FieldName,banco.TB_CartaCodigo.Value,[]) then
if not banco.TB_Carta_FavoritoHotKey.IsNull then
if banco.TB_Carta_FavoritoHotKey.Value <> 0 then
AdicionarAtalho1.Caption := 'Alterar Atalho';


if banco.TB_Carta.RecordCount = 0 then
begin
SalvarDocumento1.Enabled := false;
AdicionarFavoritos1.Enabled := false;
AdicionarAtalho1.Enabled := false;
end;

end;

procedure TFcarta.AdicionarAtalho1Click(Sender: TObject);
begin
if banco.TB_Carta.RecordCount = 0 then
exit;

try
 Application.CreateForm(TFAtalho,FAtalho);
 if banco.TB_Carta_Favorito.Locate(banco.TB_Carta_FavoritoCodigo.FieldName,banco.TB_CartaCodigo.Value,[]) then
 FAtalho.HotKey1.HotKey := banco.TB_Carta_FavoritoHotKey.Value
 else
 FAtalho.HotKey1.HotKey := 0;

 FAtalho.ShowModal;
Finally
  if FAtalho.ModalResult = mrok then
  begin
    if not banco.TB_Carta_Favorito.Locate(banco.TB_Carta_FavoritoCodigo.FieldName,banco.TB_CartaCodigo.Value,[]) then
    begin
    Banco.TB_Carta_Favorito.Insert;
    banco.TB_Carta_FavoritoCodigo.Value := banco.TB_CartaCodigo.Value;
    end
    else
    banco.TB_Carta_Favorito.Edit;

    banco.TB_Carta_FavoritoHotKey.Value := FAtalho.HotKey1.HotKey;
      Try
      banco.TB_Carta_Favorito.Post;
      Except
        on E: Exception do
        begin
          if (Banco.TB_Carta_Favorito.State in [dsinsert]) or
             (Banco.TB_Carta_Favorito.State in [dsedit] ) then
          Banco.TB_Carta_Favorito.cancel;

          if banco.IsDuplicate(E.Message) then
          MessageDlg('Atalho já registrado',mtError,[mbok],0)
          else
          begin
            Banco.Create_Erro(e.ClassName,e.Message+#13+#13+#13+'REGISTRANDO Atalho');
            MessageDlg('Não foi possível registrar o atalho, Mensagem original'+#13+e.Message,mtError,[mbOK],0)
          end;
        end;
      end;
  end;
  FreeAndNil(FAtalho);
  end;
end;

procedure TFcarta.AdicionarFavoritos1Click(Sender: TObject);
begin
ThemeDBGrid1DblClick(ThemeDBGrid1);
end;

procedure TFcarta.FormResize(Sender: TObject);
Const
 Largura = 10;
begin
Button1.Top := Largura;
Button2.Top := Largura;
Button3.Top := Largura;
Panel1.Height := Button1.Height + Button1.Top+ (Largura div 2) + Edit1.Height + 1;
Edit1.Top := Button1.Top +  Button1.Height + (Largura div 2);

Edit1.Width := Panel1.Width - (Edit1.Left * 2);

ThemeDBGrid1.Top := Panel1.Top +Panel1.Height +2+ Largura;
ThemeDBGrid1.Left := Largura;

ThemeDBGrid1.Height := ClientHeight - ThemeDBGrid1.Top - (largura);
ThemeDBGrid1.Width := ClientWidth - (Largura * 2);

ThemeDBGrid1.Columns[1].Width := ThemeDBGrid1.Width - 24 - ThemeDBGrid1.Columns[0].Width;


Button2.Left := (Panel1.Width div 2 ) - (Button2.Width div 2);
Button1.Left := Button2.Left - Button1.Width - 10;
Button3.Left := Button2.Left + Button2.Width +  10;

end;

end.








/////////////////////////////////////////////////////////////////\\\\\\\\\\\\\

var
  lista :TStringList;
begin
Try
  lista := TStringList.Create;
  lista.Add('------------------------------------------------------------------------');
  lista.Add('|           Configuração para gerar cartas automáticas                 |');
  lista.Add('|                                                                      |');
  lista.Add('| 1 - Informe o carácter { para iniciar a procura                      |');
  lista.Add('| 2 - digite o nome do campo, verificar a lista abaixo                 |');
  lista.Add('| 3 - Informe o carácter } para finalizar                              |');
  lista.Add('| 4 - O texto no word será alterado apenas 1 vez por campo             |');
  lista.Add('| Exemplo:                                                             |');
  lista.Add('|    CFP  do Funcionário  {CPF}                                        |');
  lista.Add('|    Nome do Funcionário  {NOME}                                       |');
  lista.Add('|                                                                      |');
  lista.Add('|                                                                      |');
  lista.Add('|                                                                      |');
  lista.Add('|----------------------------------------------------------------------|');
  lista.Add('|     Para Consulta do campo do tipo Data, poderá especificar:         |');
  lista.Add('| {DD/MM/YYYY_NOMEDOCAMPO}      será exibido: 01/01/2001               |');
  lista.Add('|                                                                      |');
  lista.Add('| {DDDD/MMMM/YYYY_NOMEDOCAMPO}  Segunda-Feira, 01 de Janeiro de 2001   |');
  lista.Add('|                                                                      |');
  lista.Add('| {NOMEDOCAMPO}    Ficará igual apresentado no sistema 01/01/2001      |');
  lista.Add('|                                                                      |');
  lista.Add('|                                                                      |');
  lista.Add('|                                                                      |');
  lista.Add('|----------------------------------------------------------------------|');
  lista.Add('|                  Para Informar a data atual:                         |');
  lista.Add('|                                                                      |');
  lista.Add('|  {DD_Date}    Será exibido o dia de hoje   01                        |');
  lista.Add('|  {DDDD_Date}  será exibido o dia da semana Segunda-Feira             |');
  lista.Add('|  {MM_Date}    Será exibido o número do mês 01                        |');
  lista.Add('|  {MMMM_Date}  será exibido o nome do mês   Janeiro                   |');
  lista.Add('|  {YYYY_Date}  será exibido o ano           2001                      |');
  lista.Add('|                                                                      |');
  lista.Add('|                                                                      |');
  lista.Add('|                                                                      |');
  lista.Add('|----------------------------------------------------------------------|');
  lista.Add('|                Lista com o código dos campos                         |');
  lista.Add('|                                                                      |');
  lista.Add('|  {codigo}                                                            |');
  lista.Add('|  {cpf}                                                               |');
  lista.Add('|  {nome}                                                              |');
  lista.Add('|  {logradouro}                                                        |');
  lista.Add('|  {numero}                                                            |');
  lista.Add('|  {Complemento}                                                       |');
  lista.Add('|  {Bairro}                                                            |');
  lista.Add('|  {UF}                                                                |');
  lista.Add('|  {CEP}                                                               |');
  lista.Add('|  {OBS}                                                               |');
  lista.Add('|  {Email}                                                             |');
  lista.Add('|  {Tel_Res}                                                           |');
  lista.Add('|  {Tel_Cel}                                                           |');
  lista.Add('|  {DDD_Res}                                                           |');
  lista.Add('|  {DDD_Cel}                                                           |');
  lista.Add('|  {Nascimento}     ---> Tipo Data                                     |');
  lista.Add('|  {RG}                                                                |');
  lista.Add('|  {Municiopio}     ---> Número da cidade                              |');
  lista.Add('|  {CidadeVirtual}  ---> Nome da cidade                                |');
  lista.Add('|  {Logr_TIpo}      ---> Número do tipo do logradouro                  |');
  lista.Add('|  {Cargo}          ---> Número do Cargo                               |');
  lista.Add('|  {CargoVirtual}   ---> Nome do Cargo                                 |');
  lista.Add('|  {Tb_Logra}       ---> É o nome do logradouro                        |');
  lista.Add('|  {Ativo}          ---> Resultado: Sim ou Não                         |');
  lista.Add('|                                                                      |');
  lista.Add('------------------------------------------------------------------------');



  lista.SaveToFile(Banco.PegaTempDir+'Leia-me.txt');
  winExec(pchar('Notepad.exe '+Banco.PegaTempDir+'Info.txt'), sw_shownormal);
  DeleteFile(banco.PegaTempDir+'Leia-me.txt')
Finally
FreeAndNil(lista);
end;

