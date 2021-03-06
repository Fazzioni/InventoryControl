{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q+,R+,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit UFcliente_New;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids,Clipbrd,db,
  Buttons, ImgList,  ExtCtrls ;

type
  TFClientes_New = class(TForm)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    DBMemo1: TDBMemo;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label20: TLabel;
    DBEdit14: TDBEdit;
    DBEdit21: TDBEdit;
    Label23: TLabel;
    DBLookCid: TDBLookupComboBox;
    DBLookTipolog: TDBLookupComboBox;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    DBEdit5: TDBEdit;
    Image1: TImage;
    DBCheckBox1: TDBCheckBox;
    Bevel1: TBevel;
    Label5: TLabel;
    Edit1: TEdit;
    Label11: TLabel;
    Edit2: TEdit;
    Label14: TLabel;
    Edit3: TEdit;
    procedure ComboBox1Exit(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    Procedure LoadCid;
    procedure ComboBox1Select(Sender: TObject);
    procedure DBEdit16Enter(Sender: TObject);
    procedure DBEdit16KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit19Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit12Enter(Sender: TObject);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Gotoreg(Cod:Integer);
    procedure DBLookCidExit(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    Function Focused:Integer;
    procedure DBEdit3Enter(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit14KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit18KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
       Editing  : Boolean;
    CodCliente  : Integer;
  //EditoCliente  : Boolean;

   //  Edit_Contato : ShortString;
    { Public declarations }
  end;

var
  FClientes_New: TFClientes_New;

implementation

uses UDados, Ufinaliza;

{$R *.dfm}

procedure TFClientes_New.ComboBox1Exit(Sender: TObject);
var
  i : byte;
begin

For i := 0 to ComboBox1.Items.Count -1 do
if ComboBox1.Items[i] = ComboBox1.Text then
exit;




ComboBox1.Text := '';
ComboBox1.SetFocus;

end;


procedure TFClientes_New.DBEdit12Exit(Sender: TObject);
begin
if (Sender is TDBEdit) then (sender as TDBEdit).Color := clWindow;

banco.TBClientesCep.EditMask := '00000\ 000;0;';


if Length(Banco.TBClientesCep.Value) < 8 then
exit;


if DBLookCid.Text <> '' then
exit;

Banco.TB_Municipio_new.Close;
Banco.TB_Municipio_new.SQL.Clear;
Banco.TB_Municipio_new.SQL.Add('Select * from Cliente_local');
Banco.TB_Municipio_new.sql.Add('Where cep ='+chr(39)+DBEdit12.Text+chr(39));
Banco.TB_Municipio_new.Open;

If Banco.TB_Municipio_new.RecordCount > 0 then
begin
ComboBox1.ItemIndex := banco.UFtoInt(Banco.TB_Municipio_newUF.Value);
Banco.TBClientesMuniciopio.Value := Banco.TB_Municipio_newCodigo.Value;
DBLookCid.KeyValue := Banco.TB_Municipio_newCodigo.Value;

end;
LoadCid;
end;

procedure TFClientes_New.LoadCid;
begin

if banco.TB_Municipio_new.SQL.Count > 2 then
if banco.TB_Municipio_new.SQL[1] = 'Where UF like '+chr(39)+ComboBox1.Text+chr(39) then
exit;


Banco.TB_Municipio_new.Close;
Banco.TB_Municipio_new.SQL.Clear;
Banco.TB_Municipio_new.SQL.Add('Select * from Cliente_local');
Banco.TB_Municipio_new.sql.Add('Where UF like '+chr(39)+ComboBox1.Text+chr(39));
banco.TB_Municipio_new.SQL.Add('Order by Cidade asc');

Banco.TB_Municipio_new.Open;

end;



procedure TFClientes_New.ComboBox1Select(Sender: TObject);
begin
LoadCid;
end;

procedure TFClientes_New.DBEdit16Enter(Sender: TObject);
begin
if (Sender is TDBEdit) then (sender as TDBEdit).Color := clGradientInactiveCaption;

(Sender as TDBEdit).Field.AsString := Banco.FormatTelEdit((Sender as TDBEdit).Field.AsString,false);

end;

procedure TFClientes_New.DBEdit16KeyPress(Sender: TObject; var Key: Char);
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


  {for i := 1 to (Sender as TDBEdit).SelStart do}

  //aux := copy()

  (Sender as TDBEdit).Tag := (Sender as TDBEdit).SelStart;

  if (Sender as TDBEdit).SelText <> '' then
  begin

  (sender as TDBEdit).Text := copy( (sender as TDBEdit).Text, 0, (sender as TDBEdit).SelStart)+
                              copy( (sender as TDBEdit).Text, (sender as TDBEdit).SelStart +1+(sender as TDBEdit).SelLength,length((sender as TDBEdit).Text));
  (Sender as TDBEdit).SelStart := (Sender as TDBEdit).Tag;
  end;

    (Sender as TDBEdit).Tag := (sender as TDBEdit).SelStart + length(aux);

  (sender as TDBEdit).Text := copy( (sender as TDBEdit).Text, 1, (sender as TDBEdit).SelStart) +
                              aux +
                              copy( (sender as TDBEdit).Text,  (sender as TDBEdit).SelStart+1,length(  (sender as TDBEdit).Text));


  (Sender as TDBEdit).SelStart := (Sender as TDBEdit).Tag;


  if length((Sender as TDBEdit).Text) > 8 then
  begin
   (Sender as TDBEdit).Text := copy((sender as TDBEdit).Text,1,8);
   (Sender as TDBEdit).SelStart := (Sender as TDBEdit).Tag;
  end;


   (Sender as TDBEdit).Tag := 0;
key :=#0;
exit;
end;
// Finalizando procedimento Ctrl + V ||



if not (key in ['0'..'9',chr(8),chr(3),chr(26),chr(24),chr(1)]) then
begin
Key:= #0;
exit;
end;


if Length((Sender as TDBEdit).Text) = 8 then    // Precionou tecla, edit > 8 caracter
if (Sender as TDBEdit).SelText = '' then       //  se nao selecionou
if not (Key in[Chr(8)]) then                   //  se nao apagar
key:=#0;


end;

procedure TFClientes_New.DBEdit19Exit(Sender: TObject);
begin
if (Sender is TDBEdit) then (sender as TDBEdit).Color := clWindow;
(Sender as TDBEdit).Field.AsString := Banco.FormatTelEdit((Sender as TDBEdit).Field.AsString,true);

end;

procedure TFClientes_New.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
key := #0;
exit;
end;

if not (Key in['0'..'9',Chr(8)]) then
begin
Key:= #0;
exit;
end;

end;

procedure TFClientes_New.DBEdit12Enter(Sender: TObject);
begin
banco.TBClientesCep.EditMask := '';

if (Sender is TDBEdit) then (sender as TDBEdit).Color := clGradientInactiveCaption;

end;

procedure TFClientes_New.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin


if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
key := #0;
exit;
end;
end;

procedure TFClientes_New.DBEdit2Exit(Sender: TObject);
begin
if (Sender is TDBEdit) then (sender as TDBEdit).Color := clWindow;

banco.TBClientesCPF.Value := Banco.VerificaCNPJ(banco.TBClientesCPF.Value,true,false);

end;


procedure TFClientes_New.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{if (ssCtrl in Shift) and (Key = Ord('V'))  then
   begin
      if Clipboard.HasFormat(CF_TEXT) then
      begin
        if Banco.VerificaCNPJ(clipboard.AsText,false,false) <> '' then
        (Sender as TDBEdit).Field.AsString := Banco.VerificaCNPJ(clipboard.AsText,false,false);
      end;
   Key := 0;
   end;

if (ssCtrl in Shift) and ((Key = Ord('C')))  then
   begin
       Clipboard.Clear;
        Clipboard.AsText := (sender as TDBEdit).SelText;
   Key := 0;
   end;   }
 end;


procedure TFClientes_New.DBEdit2KeyPress(Sender: TObject; var Key: Char);
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

procedure TFClientes_New.ComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
key := #0;
exit;
end;
end;

procedure TFClientes_New.FormShow(Sender: TObject);
begin


CodCliente := -1;

Edit1.Text := '';

IF Editing then
begin
            Caption := 'Editando registro de clientes...';
    BitBtn1.Caption := 'Editar';

    ComboBox1.Text := Banco.TBClientesUF.Value;
    CodCliente := banco.TBClientesCodigo.Value;


     Banco.TBClientes.Edit;

   if banco.TB_ClientesInfo.Locate(banco.TB_ClientesInfoID_Cliente.FieldName,banco.TBClientesCodigo.Value,[]) then
   begin
   Edit1.Text := FormatDateTime('DD/MM/YYYY',banco.TB_ClientesInfoUltimaCompra.Value);
   Edit2.Text := 'R$ ' + FormatFloat(',0.00',banco.TB_ClientesInfoApagar.Value - banco.TB_ClientesInfoPago.Value);
   if banco.TB_ClientesInfoApagar.Value - banco.TB_ClientesInfoPago.Value  > 0 then
   Edit2.Color := clRed
   else
   if banco.TB_ClientesInfoApagar.Value - banco.TB_ClientesInfoPago.Value  = 0 then
   Edit2.Color := clInactiveCaption
   else
   Edit2.Color := clMoneyGreen;


   Edit3.Text := 'R$ ' + FormatFloat(',0.00',banco.TB_ClientesInfoApagar.Value);
   end;

  if not banco.TBClientesCep.IsNull then
  banco.TBClientesCep.EditMask := '00000\ 000;0;'
  else
  banco.TBClientesCep.EditMask := '';



end
else
begin
    Caption := 'Inserindo registro...';
    BitBtn1.Caption := 'Inserir';
    ComboBox1.Text := 'SC';
    Banco.TBClientes.Insert;
    banco.TBClientesAtivo.Value := true;

    {verificar o campo codigo}
    //sugerir cod
    if banco.TBClientesCodigo.ReadOnly  = false then
    begin
      banco.ExecSQLTB.Close;
      banco.ExecSQLTB.Fields.Clear;
      banco.ExecSQLTB.SQL.Clear;
      Banco.ExecSQLTB.SQL.Add('select codigo from cliente_Cadastro');
      Banco.ExecSQLTB.SQL.Add('order by codigo desc');
       try
       banco.ExecSQLTB.Open;
       except
       end;
     if not (banco.ExecSQLTB.State in [dsinactive]) then
     begin
      if Banco.ExecSQLTB.RecordCount = 0 then Banco.TBClientesCodigo.Value := 1
      else
      try
      banco.TBClientesCodigo.Value := banco.ExecSQLTB.FieldValues['codigo'] + 1;
      except end;
      
      banco.ExecSQLTB.Close;
      end;
    end;
end;




LoadCid;

DBEdit1.Enabled :=not(Banco.TBClientesCodigo.ReadOnly);
if Banco.TBClientesCodigo.ReadOnly then
DBEdit1.Color := clBtnFace
else
DBEdit1.Color := DBEdit4.Color;


if Banco.TBClientesAtivo.IsNull then
Banco.TBClientesAtivo.Value := false;


//EditoCliente := false;

end;

procedure TFClientes_New.BitBtn2Click(Sender: TObject);
begin
close;
Banco.TBClientes.Cancel;
end;

procedure TFClientes_New.BitBtn1Click(Sender: TObject);
var
  i : Byte;
begin
banco.TBClientesNome_Razao.Value := Banco.lastcaracter(Banco.TBClientesNome_Razao.Value);

DBEdit2Exit(DBEdit2);


If DBEdit4.Text = '' then
begin
 MessageDlg('O campo Raz?o Social n?o pode ficar vazio',mtError,[mbOK],0);
 DBEdit4.SetFocus;
 exit;
end;

If (Banco.TBClientesMuniciopio.Value = -1) or (DBLookCid.Text = '') then
begin
 MessageDlg('Informe o munic?pio do cliente',mtError,[mbOK],0);
 DBLookCid.SetFocus;
 exit;
end;


if not banco.TBClientesCodigo.ReadOnly then
If Banco.TBClientesCodigo.IsNull then
begin
 MessageDlg('? necess?rio informar o c?digo do cliente',mtError,[mbOK],0);
 DBEdit1.SetFocus;

 exit;
end;


Banco.TBClientesUF.Value         := ComboBox1.Text;


    Try



     if Editing then
     begin
        Banco.ADOConnection1.BeginTrans;

        banco.GravaAuditoria(Banco.TBClientes,banco.TBClientesCodigo.Value,4, 2);


     if banco.TBClientesCodigo.Value <> CodCliente then  // FECHA TABELA, POIS MUDO O CODIGO DO CLIENTE
     banco.CloseTableCliente;
     end;

     Banco.TBClientes.Post;
     if Editing then
     Banco.ADOConnection1.CommitTrans;

     if Editing then
     MessageDlg('Cliente editado com sucesso',mtInformation,[mbOK],0)
     else
     MessageDlg('Cliente registrado com sucesso',mtInformation,[mbOK],0);

     ModalResult := mrOk;

    Except
    on E: Exception do
    begin
      if banco.IsDuplicate(E.Message) then
      begin


      MessageDlg('Cliente j? registrado',mtError,[mbok],0);
      end
        else
         begin
          Banco.Create_Erro(e.ClassName,e.Message+#13+#13+#13+'REGISTRANDO CLIENTE TABLEA TBClientes');
          MessageDlg('N?o foi poss?vel registrar o cliente, Mensagem original'+#13+e.Message,mtError,[mbOK],0)
        end;

     if Editing then
      Banco.ADOConnection1.RollbackTrans;

      end;
      end;

 end;


procedure TFClientes_New.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
BitBtn2Click(sender);

end;

procedure TFClientes_New.Gotoreg(Cod: Integer);
begin
Banco.TBClientes.First;
While not Banco.TBClientes.Eof do
If Banco.TBClientesCodigo.Value = cod then
exit
else
Banco.TBClientes.Next;
end;

procedure TFClientes_New.DBLookCidExit(Sender: TObject);
begin

if Length(Banco.TBClientesCep.Value) = 8 then
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
Banco.TBClientesCep.Value :=Banco.TB_Municipio_newCEP.Value;
end;

LoadCid;
end;


procedure TFClientes_New.Image1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
Banco.OpenCNPJCPF(DBEdit2.Text);

end;



function TFClientes_New.Focused: Integer;
begin
result := -1;
Result:= ActiveControl.ComponentIndex;

end;

procedure TFClientes_New.DBEdit3Enter(Sender: TObject);
begin
if (Sender is TDBEdit) then (sender as TDBEdit).Color := clGradientInactiveCaption;
end;
procedure TFClientes_New.DBEdit3Exit(Sender: TObject);
begin
if (Sender is TDBEdit) then (sender as TDBEdit).Color := clWindow;
end;

procedure TFClientes_New.DBEdit2Enter(Sender: TObject);
begin
if (Sender is TDBEdit) then (sender as TDBEdit).Color := clGradientInactiveCaption;
banco.TBClientesCPF.Value := Banco.VerificaCNPJ(banco.TBClientesCPF.Value,false,false);
end;

procedure TFClientes_New.FormHide(Sender: TObject);
begin
  banco.TBClientesCep.EditMask := '00000\ 000;0;';


if Banco.TBClientes.State in [dsedit, dsinsert] then
Banco.TBClientes.Cancel;
end;

procedure TFClientes_New.DBEdit1KeyPress(Sender: TObject; var Key: Char);
{var
  Cod : integer;
CodAnt: integer;
}begin
{cod := -1;
codant := -1;
 }
if key = #13 then
begin



{  if EditoCliente = false then
begin

    Try
    cod := StrToInt((sender as TDBEdit).Text);
    except
    exit;
    end;

    try
      CodAnt := banco.TBClientesCodigo.Value;
    except
    codant := -1;
    end;

    try
    banco.TBClientes.cancel;
    except
    close;
    exit;
    end;

    if banco.TBClientes.Locate(banco.TBClientesCodigo.FieldName,Cod,[]) then
    begin
     Editing := true;
     FormShow(self);
     EditoCliente := false;
    end
    else
    begin

      EditoCliente := false;
      if (CodAnt <> -1) and (banco.TBClientes.Locate(banco.TBClientesCodigo.FullName,CodAnt,[])) then
      begin
      Editing := true; // Procurar cliente aberto anteriormente
      FormShow(self);
      end
      else
      begin
      Editing := false;  // se n achar cria
      FormShow(self);
      banco.TBClientesCodigo.Value := Cod;
      end;
    MessageDlg('Cliente n?o encontrado',mtError,[mbok],0);
    end;



  end;
  end;
          }
self.Perform(WM_NEXTDLGCTL,0,0);
key := #0;
end;



end;

procedure TFClientes_New.DBEdit14KeyPress(Sender: TObject; var Key: Char);
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


if not (key in ['0'..'9','A'..'Z','a'..'z','-','/',' ',chr(8),chr(3),chr(22),chr(26),chr(24),chr(1)]) then
key := #0;
end;



procedure TFClientes_New.DBEdit18KeyPress(Sender: TObject; var Key: Char);
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
  if Length(aux) <> 9 then
  if (Clipboard.AsText[i] in ['0'..'9']) then
  aux := aux + clipboard.AsText[i];


  {for i := 1 to (Sender as TDBEdit).SelStart do}

  //aux := copy()

  (Sender as TDBEdit).Tag := (Sender as TDBEdit).SelStart;

  if (Sender as TDBEdit).SelText <> '' then
  begin

  (sender as TDBEdit).Text := copy( (sender as TDBEdit).Text, 0, (sender as TDBEdit).SelStart)+
                              copy( (sender as TDBEdit).Text, (sender as TDBEdit).SelStart +1+(sender as TDBEdit).SelLength,length((sender as TDBEdit).Text));
  (Sender as TDBEdit).SelStart := (Sender as TDBEdit).Tag;
  end;

    (Sender as TDBEdit).Tag := (sender as TDBEdit).SelStart + length(aux);

  (sender as TDBEdit).Text := copy( (sender as TDBEdit).Text, 1, (sender as TDBEdit).SelStart) +
                              aux +
                              copy( (sender as TDBEdit).Text,  (sender as TDBEdit).SelStart+1,length(  (sender as TDBEdit).Text));


  (Sender as TDBEdit).SelStart := (Sender as TDBEdit).Tag;


  if length((Sender as TDBEdit).Text) > 9 then
  begin
   (Sender as TDBEdit).Text := copy((sender as TDBEdit).Text,1,9);
   (Sender as TDBEdit).SelStart := (Sender as TDBEdit).Tag;
  end;


   (Sender as TDBEdit).Tag := 0;
key :=#0;
exit;
end;
// Finalizando procedimento Ctrl + V ||



if not (key in ['0'..'9',chr(8),chr(3),chr(26),chr(24),chr(1)]) then
begin
Key:= #0;
exit;
end;


if Length((Sender as TDBEdit).Text) = 9 then    // Precionou tecla, edit > 9 caracter
if (Sender as TDBEdit).SelText = '' then       //  se nao selecionou
if not (Key in[Chr(8)]) then                   //  se nao apagar
key:=#0;



end;

end.
