unit UNewFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons,db,ShellApi,
  ToolEdit, RXDBCtrl, ComCtrls;

type
  TNew_Funcionario = class(TForm)
    DBMemo1: TDBMemo;
    DBLookupComboBox1: TDBLookupComboBox;
    Label12: TLabel;
    DBEdit17: TDBEdit;
    DBEdit15: TDBEdit;
    Label10: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label1: TLabel;
    DBEdit4: TDBEdit;
    Label14: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label16: TLabel;
    DBEdit1: TDBEdit;
    DBEdit16: TDBEdit;
    Label4: TLabel;
    DBEdit14: TDBEdit;
    Label9: TLabel;
    Image2: TImage;
    Bevel1: TBevel;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBLookTipolog: TDBLookupComboBox;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label17: TLabel;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    Label21: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label18: TLabel;
    DBLookCid: TDBLookupComboBox;
    Image1: TImage;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure LoadCid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit11Enter(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    function UFtoInt(UF: ShortString): Byte;
    procedure ComboBox1Exit(Sender: TObject);
    procedure DBLookCidExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit15Exit(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure DBEdit14Enter(Sender: TObject);
    procedure DBEdit15Enter(Sender: TObject);
    procedure DBEdit14KeyPress(Sender: TObject; var Key: Char);
    function Focused: Integer;
    procedure DBEdit2Exit(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
  private
    { Private declarations }
  public
   Editing:Boolean;
    { Public declarations }
  end;

var
  New_Funcionario: TNew_Funcionario;

implementation

uses UDados, UImgFuncionario;

{$R *.dfm}
function TNew_Funcionario.Focused: Integer;
begin
result := -1;
Result:= ActiveControl.ComponentIndex;

end;

function TNew_Funcionario.UFtoInt(UF: ShortString): Byte;
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


procedure TNew_Funcionario.LoadCid;
begin
Banco.TB_Municipio_new.Close;
Banco.TB_Municipio_new.SQL.Clear;
Banco.TB_Municipio_new.SQL.Add('Select * from Cliente_local');
Banco.TB_Municipio_new.sql.Add('Where UF like '+chr(39)+ComboBox1.Text+chr(39));
banco.TB_Municipio_new.SQL.Add('Order by Cidade asc');

Banco.TB_Municipio_new.Open;

end;

procedure TNew_Funcionario.FormShow(Sender: TObject);
var
  Stream: TMemoryStream;
begin
if banco.TBLogra.State in [dsinactive] then
  Banco.TBLogra.Open;



IF Editing then
begin
    Caption := 'Editando registro de Funcion?rio...';
    BitBtn1.Caption := 'Editar';
    ComboBox1.Text := Banco.TB_FuncionariosUF.Value;

try
if length(Banco.TB_FuncionariosCep.Value) = 8 then
banco.TB_FuncionariosCep.EditMask := '00000\ 000;0;';
DBEdit14Exit(DBEdit14);
DBEdit15Exit(DBEdit15);
except
end;



if not Banco.TB_FuncionariosFotos.IsNull then
begin
    Try
      Stream := TMemoryStream.Create;
      Banco.TB_FuncionariosFotos.SaveToStream(Stream);
      Stream.Position := 0;
      Image2.Picture.Bitmap.LoadFromStream(Stream);
      Stream.Free;
     Except
      on e: Exception do
      begin
         Banco.Create_Erro(e.ClassName,e.Message+#13+#13+#13+'Abrindo IMG Funcionarios EDITAR');
         MessageDlg('N?o foi poss?vel abrir a imagem, Mensagem original'+#13+e.Message,mtError,[mbOK],0);
         Stream.Free;
      end;
    end;
end;

 Banco.TB_Funcionarios.Edit;

end
else
begin
    Caption := 'Inserindo registro...';
    BitBtn1.Caption := 'Inserir';
    ComboBox1.Text := 'SC';
    Banco.TB_Funcionarios.Insert;
    Banco.TB_FuncionariosMuniciopio.Value:= -1;
    banco.TB_FuncionariosAtivo.Value := true;
    
end;




LoadCid;



end;


procedure TNew_Funcionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if Banco.TB_Funcionarios.State in [dsedit, dsinsert] then
Banco.TB_Funcionarios.Cancel;

{Banco.TB_Municipio_new.Close;
Banco.TB_Municipio_new.SQL.Clear;
Banco.TB_Municipio_new.SQL.Add('Select * from Cliente_local');
Banco.TB_Municipio_new.Open;}

end;

procedure TNew_Funcionario.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
Abort;
//exit;
end;


if not (Key in['0'..'9',Chr(8)]) then
begin
Key:= #0;
Abort;
end;
end;


procedure TNew_Funcionario.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
Abort;
end;


end;

procedure TNew_Funcionario.DBEdit11Enter(Sender: TObject);
begin
Banco.TB_FuncionariosCep.EditMask := '';
end;

procedure TNew_Funcionario.DBEdit11Exit(Sender: TObject);
begin
banco.TB_FuncionariosCep.EditMask := '00000\ 000;0;';


if Length(Banco.TB_FuncionariosCep.Value) < 8 then
exit;


if DBLookCid.Text <> '' then
exit;

Banco.TB_Municipio_new.Close;
Banco.TB_Municipio_new.SQL.Clear;
Banco.TB_Municipio_new.SQL.Add('Select * from Cliente_local');
Banco.TB_Municipio_new.sql.Add('Where cep ='+chr(39)+DBEdit11.Text+chr(39));
Banco.TB_Municipio_new.Open;

If Banco.TB_Municipio_new.RecordCount > 0 then
begin
ComboBox1.ItemIndex := UFtoInt(Banco.TB_Municipio_newUF.Value);
Banco.TB_FuncionariosMuniciopio.Value := Banco.TB_Municipio_newCodigo.Value;
DBLookCid.KeyValue := Banco.TB_Municipio_newCodigo.Value;

end;
LoadCid;
end;

procedure TNew_Funcionario.ComboBox1Exit(Sender: TObject);
var
  i : byte;
begin

For i := 0 to ComboBox1.Items.Count -1 do
if ComboBox1.Items[i] = ComboBox1.Text then
exit;




ComboBox1.Text := '';
ComboBox1.SetFocus;

end;


procedure TNew_Funcionario.DBLookCidExit(Sender: TObject);
Begin

if Length(Banco.TB_FuncionariosCep.Value) = 8 then
exit;


if DBLookCid.Text = '' then
exit;

Banco.TB_Municipio_new.Close;
Banco.TB_Municipio_new.SQL.Clear;
Banco.TB_Municipio_new.SQL.Add('Select * from Cliente_local');
Banco.TB_Municipio_new.sql.Add('Where codigo ='+IntToStr(DBLookCid.KeyValue));
Banco.TB_Municipio_new.Open;

If Banco.TB_Municipio_new.RecordCount > 0 then
begin
Banco.TB_FuncionariosCep.Value :=Banco.TB_Municipio_newCEP.Value;
banco.TB_FuncionariosCep.EditMask := '00000\ 000;0;';

end;

LoadCid;
end;

procedure TNew_Funcionario.BitBtn2Click(Sender: TObject);

begin
close;
end;

procedure TNew_Funcionario.BitBtn1Click(Sender: TObject);
var
    Stream: TMemoryStream;
begin
Banco.TB_FuncionariosNome.Value := Banco.lastcaracter(Banco.TB_FuncionariosNome.Value);
DBEdit2Exit(DBEdit2);


If DBEdit3.Text = '' then
begin
 MessageDlg('O campo Nome n?o pode ficar vazio',mtError,[mbOK],0);
 DBEdit3.SetFocus;
 Abort;
end;

If  (DBLookCid.Text = '') then
begin
 MessageDlg('Informe o munic?pio do Funcion?rio',mtError,[mbOK],0);
 DBLookCid.SetFocus;
 Abort;
end;

If  (DBLookupComboBox1.Text = '') then
begin
 MessageDlg('Informe o cargo do Funcion?rio',mtError,[mbOK],0);
 DBLookupComboBox1.SetFocus;
 Abort;
end;




    //Banco.TBClientesLogr_Tipo.Value  := ComboBox3.Text;

    Banco.TB_FuncionariosUF.Value         := ComboBox1.Text;
    //Banco.TBClientesMuniciopio.Value := ComboBox2.Text;

  //  Banco.TBClientesNascimento.Value := DateEdit1.Date;
//    Banco.TBClientesTipo_Venda.Value := ComboBox5.ItemIndex;
//    Banco.TBClientesdescri_venda.Value := ComboBox4.Text;

   if not Image2.Picture.Bitmap.Empty then
   begin
    try
      Stream := TMemoryStream.Create;
      Image2.Picture.Bitmap.SaveToStream(Stream);
      Banco.TB_FuncionariosFotos.LoadFromStream(Stream);
      Stream.Free;
    Except
      on e: Exception do
      begin
      Stream.Free;
      Banco.Create_Erro(e.ClassName,e.Message+#13+#13+#13+'SALVANDO IMG FUNCIONARIOS TABLEA TB_Funcionario');
      MessageDlg('Ocorreu um erro ao tentar salvar a imagem, Mensagem original'+#13+e.Message,mtError,[mbOK],0);
      end;
  end;
 end
 else
  Banco.TB_FuncionariosFotos.Clear;
  

    Try
        if Editing then
        begin
        Banco.ADOConnection1.BeginTrans;
        banco.GravaAuditoria(Banco.TB_Funcionarios,banco.TB_FuncionariosCdigo.Value,1, 2);
        end;

     Banco.TB_Funcionarios.Post;
     if Editing then
     Banco.ADOConnection1.CommitTrans;
     
     if Editing then
     MessageDlg('Funcion?rio editado com sucesso',mtInformation,[mbOK],0)
     else
     MessageDlg('Funcion?rio registrado com sucesso',mtInformation,[mbOK],0);

     close;

    Except
      on e: Exception do
      begin
      if Editing then
      Banco.ADOConnection1.RollbackTrans;

      Banco.Create_Erro(e.ClassName,e.Message+#13+#13+#13+'REGISTRANDO FUNCIONARIOS TABLEA TB_Funcionario');
      MessageDlg('N?o foi poss?vel registrar o Funcion?rio, Mensagem original'+#13+e.Message,mtError,[mbOK],0)


      end;

     end;
end;

procedure TNew_Funcionario.ComboBox1Select(Sender: TObject);
begin
LoadCid;
end;

procedure TNew_Funcionario.Image2Click(Sender: TObject);
begin
   try
   Application.CreateForm(TFImgFunc,FImgFunc);
   FImgFunc.Image1.Picture := Image2.Picture;
  
   FImgFunc.ShowModal;
  finally
    FreeAndNil(FImgFunc);
  end;
end;

procedure TNew_Funcionario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
BitBtn2.Click;

end;

procedure TNew_Funcionario.DBEdit15Exit(Sender: TObject);
begin
Case length((Sender as TDBEdit).Text) of
5: Banco.TB_FuncionariosTel_Cel.EditMask := '!0000 0;0;';
6: Banco.TB_FuncionariosTel_Cel.EditMask := '!0000 00;0;';
7: Banco.TB_FuncionariosTel_Cel.EditMask := '!0000 000;0;';
8: Banco.TB_FuncionariosTel_Cel.EditMask := '!0000 0000;0;';
9: Banco.TB_FuncionariosTel_Cel.EditMask := '!00000 0000;0;';
end;

end;

procedure TNew_Funcionario.DBEdit14Exit(Sender: TObject);
begin
Case length((Sender as TDBEdit).Text) of
5: Banco.TB_FuncionariosTel_Res.EditMask := '!0000 0;0;';
6: Banco.TB_FuncionariosTel_Res.EditMask := '!0000 00;0;';
7: Banco.TB_FuncionariosTel_Res.EditMask := '!0000 000;0;';
8: Banco.TB_FuncionariosTel_Res.EditMask := '!0000 0000;0;';
9: Banco.TB_FuncionariosTel_Res.EditMask := '!00000 0000;0;';
end;
end;

procedure TNew_Funcionario.DBEdit14Enter(Sender: TObject);
begin
Banco.TB_FuncionariosTel_Res.EditMask := '';
end;

procedure TNew_Funcionario.DBEdit15Enter(Sender: TObject);
begin
Banco.TB_FuncionariosTel_Cel.EditMask := '';
end;

procedure TNew_Funcionario.DBEdit14KeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
Abort;
end;

if (Sender is TDBEdit) then
if Length((Sender as TDBEdit).Text) = 8 then
if not (Key in[Chr(8)]) then
key:=#0;


if not (Key in['0'..'9',Chr(8)]) then
begin
Key:= #0;
Abort;
end;

if (length((Sender as TDBEdit).Text) = 9) and (key <> Chr(8) ) then
begin
Key := #0;
Abort;
exit;
end;
end;

procedure TNew_Funcionario.DBEdit2Exit(Sender: TObject);
begin

banco.TB_FuncionariosCPF.Value := Banco.VerificaCNPJ(banco.TB_FuncionariosCPF.Value,true,false);


end;

procedure TNew_Funcionario.Image1Click(Sender: TObject);
begin
banco.OpenCNPJCPF(DBEdit2.Text);

end;

procedure TNew_Funcionario.DBEdit2Enter(Sender: TObject);
begin
banco.TB_FuncionariosCPF.Value :=Banco.VerificaCNPJ(Banco.TB_FuncionariosCPF.Value,false,false);

end;

end.
