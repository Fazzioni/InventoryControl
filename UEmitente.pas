unit UEmitente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ExtCtrls,db , Clipbrd;

type
  TFEmitente = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DBLookTipolog: TDBLookupComboBox;
    ComboBox1: TComboBox;
    DBLookCid: TDBLookupComboBox;
    Label1: TLabel;
    Edit4: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Label12: TLabel;
    Edit18: TEdit;
    Label13: TLabel;
    Edit19: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Edit20: TEdit;
    Label20: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Procedure CreateEdit(campo,Value:ShortString);
    procedure Edit20Exit(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit20KeyPress(Sender: TObject; var Key: Char);
    function Focused: Integer;
    procedure Edit11Exit(Sender: TObject);
    procedure Edit11Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmitente: TFEmitente;

implementation

uses UDados, UImgFuncionario;

{$R *.dfm}
function TFEmitente.Focused: Integer;
begin
result := -1;
Result:= ActiveControl.ComponentIndex;

end;


procedure TFEmitente.FormShow(Sender: TObject);
var
  Stream : TMemoryStream;
begin
if (banco.TB_Emitente.State in [dsInactive] ) then
banco.TB_Emitente.Open;

if (banco.TB_Fotos.State in [dsInactive] ) then
banco.TB_Fotos.Open;

if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'RazSoc',[]) then Edit1.Text := banco.TB_EmitenteValor.Value else Edit1.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'CNPJ',[]) then Edit20.Text := banco.TB_EmitenteValor.Value else Edit20.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'IncEst',[]) then Edit18.Text := banco.TB_EmitenteValor.Value else Edit18.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'IncMun',[]) then Edit19.Text := banco.TB_EmitenteValor.Value else Edit19.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Fant',  []) then Edit4.Text := banco.TB_EmitenteValor.Value else Edit4.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Resp',  []) then Edit2.Text := banco.TB_EmitenteValor.Value else Edit2.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Cep',   []) then Edit3.Text := banco.TB_EmitenteValor.Value else Edit3.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Log',   []) then Edit5.Text := banco.TB_EmitenteValor.Value else Edit5.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Bairr', []) then Edit6.Text := banco.TB_EmitenteValor.Value else Edit6.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Nume',  []) then Edit7.Text := banco.TB_EmitenteValor.Value else Edit7.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Compl', []) then Edit8.Text := banco.TB_EmitenteValor.Value else Edit8.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Mail',  []) then Edit9.Text := banco.TB_EmitenteValor.Value else Edit9.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'DD_1',  []) then Edit10.Text := banco.TB_EmitenteValor.Value else Edit10.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'DD_2',  []) then Edit12.Text := banco.TB_EmitenteValor.Value else Edit12.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'DD_3',  []) then Edit14.Text := banco.TB_EmitenteValor.Value else Edit14.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'DD_4',  []) then Edit16.Text := banco.TB_EmitenteValor.Value else Edit16.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Fone_1',[]) then Edit11.Text := banco.TB_EmitenteValor.Value else Edit11.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Fone_2',[]) then Edit13.Text := banco.TB_EmitenteValor.Value else Edit13.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Fone_3',[]) then Edit15.Text := banco.TB_EmitenteValor.Value else Edit15.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Fone_4',[]) then Edit17.Text := banco.TB_EmitenteValor.Value else Edit17.Text := '';

if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Cid',[]) then DBLookCid.KeyValue := banco.TB_EmitenteValor.Value else DBLookCid.KeyValue := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'UF',[])  then ComboBox1.Text := banco.TB_EmitenteValor.Value    else ComboBox1.Text := '';
if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,'Tipo',[])then DBLookTipolog.KeyValue := banco.TB_EmitenteValor.Value else DBLookTipolog.KeyValue := '';


ComboBox1.ItemIndex :=banco.UFtoInt(ComboBox1.Text);

Banco.TB_Municipio_new.Close;
Banco.TB_Municipio_new.SQL.Clear;
Banco.TB_Municipio_new.SQL.Add('Select * from Cliente_local');
Banco.TB_Municipio_new.sql.Add('Where UF like '+chr(39)+ComboBox1.Text+chr(39));
banco.TB_Municipio_new.SQL.Add('Order by Cidade asc');

Banco.TB_Municipio_new.Open;

 if banco.TB_Fotos.Locate(Banco.TB_FotosValor.FieldName,'Foto',[]) then
 if Banco.TB_FotosFoto.Value <> '' then
   begin
    Try
      Stream := TMemoryStream.Create;
      Banco.TB_FotosFoto.SaveToStream(Stream);
      Stream.Position := 0;
      Image1.Picture.Bitmap.LoadFromStream(Stream);
      Stream.Free;
     Except
      on e: Exception do
      begin
      Banco.Create_Erro(e.ClassName,e.Message+#13+#13+#13+'Abrindo IMG EMITENTE');
      MessageDlg('N?o foi poss?vel abrir a imagem, Mensagem original'+#13+e.Message,mtError,[mbOK],0)
      end;

    end;
end;
end;

procedure TFEmitente.BitBtn1Click(Sender: TObject);
var
  Stream : TMemoryStream;
begin
Edit20Exit(Edit20);
Edit3Exit(Edit3);
Edit11Enter(Edit11);
Edit11Enter(Edit13);
Edit11Enter(Edit15);
Edit11Enter(Edit17);


if DBLookCid.Text = '' then
begin
MessageDlg('Selecione um munic?pio',mtInformation,[mbok],0);
DBLookCid.SetFocus;
abort;
end;


if ComboBox1.ItemIndex = - 1 then
begin
MessageDlg('Informe uma UF',mtInformation,[mbok],0);
ComboBox1.SetFocus;
abort;
end;

Try
CreateEdit('RazSoc',Edit1.Text);
CreateEdit('CNPJ'  ,Edit20.Text);
CreateEdit('IncEst',Edit18.Text);
CreateEdit('IncMun',Edit19.Text);
CreateEdit('Fant'  ,Edit4.Text);
CreateEdit('Resp'  ,Edit2.Text);
CreateEdit('Cep'   ,Edit3.Text);
CreateEdit('Log'   ,Edit5.Text);
CreateEdit('Bairr' ,Edit6.Text);
CreateEdit('Nume'  ,Edit7.Text);
CreateEdit('Compl' ,Edit8.Text);
CreateEdit('Mail'  ,Edit9.Text);
CreateEdit('DD_1'  ,Edit10.Text);
CreateEdit('DD_2'  ,Edit12.Text);
CreateEdit('DD_3'  ,Edit14.Text);
CreateEdit('DD_4'  ,Edit16.Text);
CreateEdit('Fone_1',Edit11.Text);
CreateEdit('Fone_2',Edit13.Text);
CreateEdit('Fone_3',Edit15.Text);
CreateEdit('Fone_4',Edit17.Text);
CreateEdit('Cid',DBLookCid.KeyValue);
CreateEdit('UF',ComboBox1.Text);
CreateEdit('Tipo',DBLookTipolog.KeyValue);

try
 if banco.TB_Fotos.Locate(Banco.TB_FotosValor.FieldName,'Foto',[]) then
  banco.TB_Fotos.Edit
  else
  begin
   banco.TB_Fotos.Insert;
   banco.TB_FotosValor.Value := 'Foto';
  end;

  if (Image1.Picture.Graphic = nil) then
  banco.TB_FotosFoto.Clear
  else
  begin
      Stream := TMemoryStream.Create;
      Image1.Picture.Bitmap.SaveToStream(Stream);
      Banco.TB_FotosFoto.LoadFromStream(Stream);
      Stream.Free;
   end;
Except
   on e: Exception do
   begin
      Stream.Free;
      Banco.Create_Erro(e.ClassName,e.Message+#13+#13+#13+'SALVANDO IMG EMITENTE');
      MessageDlg('Ocorreu um erro ao tentar salvar a imagem, Mensagem original'+#13+e.Message,mtError,[mbOK],0);
   end;
end;


if banco.TB_Fotos.Locate(Banco.TB_FotosValor.FieldName,'Foto',[]) then
banco.LoadBitmap(Banco.TB_FotosFoto,Banco.Empresa_Imagem.Bitmap)
else
banco.Clearimg;

banco.LoadEmpresa;

MessageDlg('Dados gravados com sucesso',mtInformation,[mbOK],0);
close;



Except
MessageDlg('Falha ao gravar dados',mtError,[mbok],0);

end;
end;

procedure TFEmitente.CreateEdit(campo,Value: ShortString);
begin

if Banco.TB_Emitente.Locate(Banco.TB_EmitenteConfiName.FieldName,campo,[]) then
banco.TB_Emitente.Edit
else
begin
banco.TB_Emitente.Insert;
banco.TB_EmitenteConfiName.Value := campo;
end;

banco.TB_EmitenteValor.Value := Banco.lastcaracter(Value);
Banco.TB_Emitente.Post;



end;

procedure TFEmitente.Edit20Exit(Sender: TObject);
var
  i : integer;
aux : ShortString;
begin

aux := '';

For i :=1 to length(Edit20.text) do
if (Edit20.Text[i] in ['0'..'9']) then
aux := aux + Edit20.Text[i];

Edit20.Text := aux;

 if banco.iscnpj(aux) then
 edit20.text := banco.Format_CNPJANDCPF(aux,false)
 else
 begin
 messagedlg('CNPJ inv?lido',mtinformation,[mbok],0);
 Edit20.Text := '';
 abort;
 
 end;




end;

procedure TFEmitente.ComboBox1Select(Sender: TObject);
begin
Banco.TB_Municipio_new.Close;
Banco.TB_Municipio_new.SQL.Clear;
Banco.TB_Municipio_new.SQL.Add('Select * from Cliente_local');
Banco.TB_Municipio_new.sql.Add('Where UF like '+chr(39)+ComboBox1.Text+chr(39));
banco.TB_Municipio_new.SQL.Add('Order by Cidade asc');

Banco.TB_Municipio_new.Open;

end;

procedure TFEmitente.Edit3Exit(Sender: TObject);
var
  i : integer;
aux : ShortString;
begin

aux := '';

For i :=1 to length(Edit3.text) do
if (Edit3.Text[i] in ['0'..'9']) then
aux := aux + Edit3.Text[i];

if length(aux) = 8 then
Edit3.Text := Banco.FormataCEP(aux)
else
begin
MessageDlg('CEP inv?lido',mtInformation,[mbok],0);
abort;
end;


end;

procedure TFEmitente.Edit1KeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
Abort;
exit;
end;


end;

procedure TFEmitente.Edit20KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
key:=#0;
exit;
end;


// Key  3 = copy
// Key 22 = Paste
// Key 26 = Crtl + Z
// key 1  = Crtl + A
// key 24 = Crtl + X


if not (key in ['0'..'9',chr(8),chr(3),chr(22),chr(26),chr(24),chr(1)]) then
key := #0;

end;


procedure TFEmitente.Edit11Exit(Sender: TObject);
var
  aux : ShortString;
  i : Byte;
begin
aux := '';
For i := 1 to length((Sender as TEdit).text) do
if (Sender as TEdit).Text[i] in ['0'..'9'] then
aux := aux + (sender as TEdit).Text[i];


if length(aux) = 8 then
(sender as TEdit).Text := copy(aux,1,4)+' '+copy(aux,5,4);

if length(aux) = 9 then
(sender as TEdit).Text := copy(aux,1,5)+' '+copy(aux,6,4);

end;

procedure TFEmitente.Edit11Enter(Sender: TObject);
var
  aux : ShortString;
  i : Byte;
begin
aux := '';
For i := 1 to length((Sender as TEdit).text) do
if (Sender as TEdit).Text[i] in ['0'..'9'] then
aux := aux + (sender as TEdit).Text[i];

(sender as TEdit).Text := aux;

end;

procedure TFEmitente.BitBtn2Click(Sender: TObject);
begin
close;

end;

procedure TFEmitente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
BitBtn2.Click;


end;

procedure TFEmitente.Image1Click(Sender: TObject);
begin
   try
   Application.CreateForm(TFImgFunc,FImgFunc);
   FImgFunc.Caption := 'Imagem da Empresa ';
   FImgFunc.Image1.Picture := Image1.Picture;
   FImgFunc.Bevel1.Width := Image1.Width;
   FImgFunc.Bevel1.Height:= Image1.Height;
   FImgFunc.Label1.Width := Image1.Width;
   FImgFunc.Label1.Height := Image1.Height;


   FImgFunc.ShowModal;
     FreeAndNil(FImgFunc);
  except
    FreeAndNil(FImgFunc);
  end;
end;


procedure TFEmitente.Edit3KeyPress(Sender: TObject; var Key: Char);
var
  aux : string[20];
  i : Byte;
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
key := #0;
exit;
end;



//Iniciando Procedimento Ctrl + V
if key = #22 then
if Clipboard.HasFormat(CF_TEXT) then
begin
  aux := '';

  For i := 1 to Length(clipboard.AsText) do
  if Length(aux) <> 8 then
  if (Clipboard.AsText[i] in ['0'..'9']) then
  aux := aux + clipboard.AsText[i];


  {for i := 1 to (Sender as Tedit).SelStart do}

  //aux := copy()

  (Sender as Tedit).Tag := (Sender as Tedit).SelStart;

  if (Sender as Tedit).SelText <> '' then
  begin

  (sender as Tedit).Text := copy( (sender as Tedit).Text, 0, (sender as Tedit).SelStart)+
                              copy( (sender as Tedit).Text, (sender as Tedit).SelStart +1+(sender as Tedit).SelLength,length((sender as Tedit).Text));
  (Sender as Tedit).SelStart := (Sender as Tedit).Tag;
  end;

    (Sender as Tedit).Tag := (sender as Tedit).SelStart + length(aux);

  (sender as Tedit).Text := copy( (sender as Tedit).Text, 1, (sender as Tedit).SelStart) +
                              aux +
                              copy( (sender as Tedit).Text,  (sender as Tedit).SelStart+1,length(  (sender as Tedit).Text));


  (Sender as Tedit).SelStart := (Sender as Tedit).Tag;


  if length((Sender as Tedit).Text) > 8 then
  begin
   (Sender as Tedit).Text := copy((sender as Tedit).Text,1,8);
   (Sender as Tedit).SelStart := (Sender as Tedit).Tag;
  end;


   (Sender as Tedit).Tag := 0;
key :=#0;
exit;
end;
// Finalizando procedimento Ctrl + V ||



if not (key in ['0'..'9',chr(8),chr(3),chr(26),chr(24),chr(1)]) then
begin
Key:= #0;
exit;
end;


if Length((Sender as Tedit).Text) = 8 then    // Precionou tecla, edit > 8 caracter
if (Sender as Tedit).SelText = '' then       //  se nao selecionou
if not (Key in[Chr(8)]) then                   //  se nao apagar
key:=#0;


end;


procedure TFEmitente.Edit3Enter(Sender: TObject);
var
  i : Shortint;
  aux : ShortString;
begin

For i :=1 to length(Edit3.text) do
if (Edit3.Text[i] in ['0'..'9']) then
aux := aux + Edit3.Text[i];

Edit3.Text := aux;


end;

end.
