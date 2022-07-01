unit Upermissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, ADODB, CheckLst, ExtCtrls, Buttons;

type
  TFPermissoes = class(TForm)
    EditFunc: TDBLookupComboBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    TBFuncionario: TADOQuery;
    TBFuncionarioNome: TWideStringField;
    TBFuncionariocodigo: TAutoIncField;
    TBFuncionariopassword: TWideStringField;
    TBFuncionarioativo: TBooleanField;
    DataSource1: TDataSource;
    RadioGroup1: TRadioGroup;
    ListOut: TCheckListBox;
    ListCont: TCheckListBox;
    ListFunc: TCheckListBox;
    ListEst: TCheckListBox;
    ListClie: TCheckListBox;
    BitBtn1: TBitBtn;
    Bevel2: TBevel;
    ListPed: TCheckListBox;
    TB_Permis: TADOQuery;
    TB_PermisID_User: TIntegerField;
    TB_PermisValor: TWideStringField;
    Button3: TButton;
    procedure EditFuncClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditFuncKeyPress(Sender: TObject; var Key: Char);
    procedure EditFuncMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure GroupBox1Exit(Sender: TObject);
    Procedure Visible(Component : TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure LoadPermissoes;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListClieKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPermissoes: TFPermissoes;

implementation

uses UDados, UPassword, UPermissoesNew;

 Function Encript(Value:ShortString):ShortString;stdcall; external 'sysconf.dll';
 Function Descript(Value:ShortString):ShortString;stdcall; external 'sysconf.dll';


{$R *.dfm}

procedure TFPermissoes.EditFuncClick(Sender: TObject);
begin


if EditFunc.KeyValue = null then
begin
Button1.Enabled := false;
Button2.Enabled := false;

exit;
end;

Button1.Enabled := true;

if TBFuncionario.RecordCount = 0 then
exit;

if TBFuncionariocodigo.Value > 0 then
Button2.Enabled := not (TBFuncionariopassword.IsNull)
else
Button2.Enabled := false;


if TBFuncionariopassword.IsNull then
Button1.Caption := 'Adicionar Senha'
else
Button1.Caption := 'Alterar Senha';

if EditFunc.KeyValue = 0 then
Visible(Sender);



LoadPermissoes;

end;

procedure TFPermissoes.FormShow(Sender: TObject);
begin
TBFuncionario.SQL.Clear;
TBFuncionario.SQL.Add('Select Nome, codigo, password, ativo  from funcionarios');
TBFuncionario.SQL.Add('where ativo = true');

if banco.User_cod <> 0 then
TBFuncionario.SQL.Add('and codigo > 0')
else
TBFuncionario.SQL.Add('or codigo = 0');



TBFuncionario.Open;
EditFuncClick(EditFunc);

Visible(ListClie);

end;

procedure TFPermissoes.EditFuncKeyPress(Sender: TObject; var Key: Char);
begin
EditFuncClick(sender);
if key = #13 then
begin
 if RadioGroup1.ItemIndex = -1 then
 RadioGroup1.ItemIndex := 0;

 RadioGroup1Click(RadioGroup1);

end;

end;

procedure TFPermissoes.EditFuncMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
EditFuncClick(sender);
end;

procedure TFPermissoes.Button1Click(Sender: TObject);
begin
try
  Application.createform(Tfpassword,Fpassword);

  FPassword.Editando := not (TBFuncionariopassword.IsNull);
  FPassword.Label4.Caption := TBFuncionarioNome.Value;
  
  fpassword.showmodal;
Finally
  FreeAndNil(Fpassword);
  EditFuncClick(EditFunc);
end;

end;

procedure TFPermissoes.Button2Click(Sender: TObject);
begin
if MessageDlg('Deseja remover o acesso do funcionário '+TBFuncionarioNome.Value +#13,mtConfirmation,[mbyes, mbno],0) = mrno then
exit;

try
TBFuncionario.Edit;
TBFuncionariopassword.Clear;
TBFuncionario.Post;
MessageDlg('Operação concluída com sucesso',mtInformation,[mbok],0);
Except
  MessageDlg('Erro ao editar funcionário',mtError,[mbok],0);
end;

EditFuncClick(EditFunc);



end;

procedure TFPermissoes.GroupBox1Exit(Sender: TObject);
begin
Caption := 'Exit';

end;

procedure TFPermissoes.Visible(Component: TObject);
Const
 Largura = 7;
begin
ListOut.Visible := false;
ListCont.Visible := false;
ListFunc.Visible := false;
ListEst.Visible := false;
ListClie.Visible := false;
ListPed.Visible := false;


if EditFunc.KeyValue = Null then
RadioGroup1.ItemIndex := -1
else
if EditFunc.KeyValue = 0 then
begin
RadioGroup1.ItemIndex := -1;
exit;
end
else
if (Component is TCheckListBox) then
begin
(Component as TCheckListBox).Top  := Bevel2.Top + largura;
(Component as TCheckListBox).Left := Bevel2.Left + largura;
(Component as TCheckListBox).Height := Bevel2.Height - (largura * 2);
(Component as TCheckListBox).Width := Bevel2.Width - (largura * 2);
(Component as TCheckListBox).Visible := true;
(Component as TCheckListBox).Font.Size := 12;
(Component as TCheckListBox).OnKeyDown := ListClieKeyDown;
(Component as TCheckListBox).SetFocus;
end
else
RadioGroup1.ItemIndex := -1;

if RadioGroup1.ItemIndex = -1 then
BitBtn1.Visible := false
else
BitBtn1.Visible := true;


end;

procedure TFPermissoes.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex =-1 then Visible(sender);
if RadioGroup1.ItemIndex = 0 then Visible(ListClie) else
if RadioGroup1.ItemIndex = 1 then Visible(ListEst) else
if RadioGroup1.ItemIndex = 2 then Visible(ListFunc) else
if RadioGroup1.ItemIndex = 3 then Visible(ListCont) else
if RadioGroup1.ItemIndex = 4 then Visible(ListPed) else
if RadioGroup1.ItemIndex = 5 then Visible(ListOut);


end;

procedure TFPermissoes.BitBtn1Click(Sender: TObject);
 function BooltoDec(value: Boolean): char;
 begin
 result := '0';
 if value then
 Result := '1';
 end;
var
  Value : ShortString;
  i : Shortint;
begin
value := '';

TB_Permis.Close;
TB_Permis.SQL.Clear;
TB_Permis.SQL.Add('select ID_User, Valor from logperm');
TB_Permis.SQL.Add('Where ID_User = '+IntToStr(EditFunc.KeyValue));

 try
 TB_Permis.Open;
 except
  on e : exception do
  begin
  banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Erro ao salvar permissões'+#13+e.Message,mtError,[mbok],0);
  end;
 end;

if TB_Permis.RecordCount = 0 then
begin
TB_Permis.Insert;
TB_PermisID_User.Value := EditFunc.KeyValue;
end
else
TB_Permis.Edit;


// Clientes
// Estoque
// Funcionários
// Contas
// Pedidos
// Outros

for i := 0 to ListClie.Items.Count -1 do Value := Value + BooltoDec(ListClie.Checked[i]);
for i := 0 to ListEst .Items.Count -1 do Value := Value + BooltoDec(ListEst.Checked[i]);
for i := 0 to ListFunc.Items.Count -1 do Value := Value + BooltoDec(ListFunc.Checked[i]);
for i := 0 to ListCont.Items.Count -1 do Value := Value + BooltoDec(ListCont.Checked[i]);
for i := 0 to ListPed .Items.Count -1 do Value := Value + BooltoDec(ListPed.Checked[i]);
for i := 0 to ListOut .Items.Count -1 do Value := Value + BooltoDec(ListOut.Checked[i]);


TB_PermisValor.Value := Encript(Value);

try
  TB_Permis.Post;
  MessageDlg('Dados gravados com sucesso',mtInformation,[mbok],0);
  RadioGroup1.ItemIndex := -1;
  RadioGroup1Click(RadioGroup1);
  EditFunc.SetFocus;
Except
  on e :Exception do
  begin
  banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Erro ao salvar permissões'+#13+e.Message,mtError,[mbok],0);
  end;
end;

end;


procedure TFPermissoes.LoadPermissoes;
 function DecToBool(value: char): Boolean;
 begin
  Result := false;
  if value = '1' then
  Result := true;
 end;

var
  Value : ShortString;
  i, aux : Shortint;
begin
for i := 0 to ListClie.Items.Count -1 do ListClie.Checked[i] := false;
for i := 0 to ListEst .Items.Count -1 do ListEst .Checked[i] := false;
for i := 0 to ListFunc.Items.Count -1 do ListFunc.Checked[i] := false;
for i := 0 to ListCont.Items.Count -1 do ListCont.Checked[i] := false;
for i := 0 to ListPed .Items.Count -1 do ListPed .Checked[i] := false;
for i := 0 to ListOut .Items.Count -1 do ListOut .Checked[i] := false;



value := '';
TB_Permis.Close;
TB_Permis.SQL.Clear;
TB_Permis.SQL.Add('select ID_User, Valor from logperm');
TB_Permis.SQL.Add('Where ID_User = '+IntToStr(EditFunc.KeyValue));

 try
 TB_Permis.Open;
 except
 on e : exception do  banco.Create_Erro(e.ClassName,e.Message);
 end;

if TB_Permis.RecordCount = 0 then
exit;







Value := Descript(TB_PermisValor.Value);
if Value = '' then  exit;
aux := 0;

// Clientes
For i := 0 to ListClie.Items.Count - 1 do
begin
inc(aux);
ListClie.Checked[i] := DecToBool(value[aux]);
end;

// Estoque
For i := 0 to ListEst.Items.Count - 1 do
begin
inc(aux);
ListEst.Checked[i] := DecToBool(value[aux]);
end;

// Funcionários
For i := 0 to ListFunc.Items.Count - 1 do
begin
inc(aux);
ListFunc.Checked[i] := DecToBool(value[aux]);
end;

// Contas
For i := 0 to ListCont.Items.Count - 1 do
begin
inc(aux);
ListCont.Checked[i] := DecToBool(value[aux]);
end;

// Pedidos
For i := 0 to ListPed.Items.Count - 1 do
begin
inc(aux);
ListPed.Checked[i] := DecToBool(value[aux]);
end;

// Outros
For i := 0 to ListOut.Items.Count - 1 do
begin
inc(aux);
ListOut.Checked[i] := DecToBool(value[aux]);
end;






end;


procedure TFPermissoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
begin
 if RadioGroup1.ItemIndex = -1 then
 close
 else
 Visible(sender);

end;

end;

procedure TFPermissoes.ListClieKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

If (key = vk_left) or (key = vk_right) then
begin

 if RadioGroup1.ItemIndex = 0 then
 begin
 if key = vk_left then RadioGroup1.ItemIndex := 5;
 if key = vk_right then RadioGroup1.ItemIndex := 2;
 RadioGroup1Click(RadioGroup1);
 key := 0;
 exit;
 end;

 if RadioGroup1.ItemIndex = 1 then
 begin
 if key = vk_left then RadioGroup1.ItemIndex := 4;
 if key = vk_right then RadioGroup1.ItemIndex := 3;
 RadioGroup1Click(RadioGroup1);
 key := 0;
 exit;
 end;

 if RadioGroup1.ItemIndex = 2 then
 begin
 if key = vk_left then RadioGroup1.ItemIndex := 0;
 if key = vk_right then RadioGroup1.ItemIndex := 4;
 RadioGroup1Click(RadioGroup1);
 key := 0;
 exit;
 end;

 if RadioGroup1.ItemIndex = 3 then
 begin
 if key = vk_left then   RadioGroup1.ItemIndex := 1;
 if key = vk_right then  RadioGroup1.ItemIndex := 5;
 RadioGroup1Click(RadioGroup1);
 key := 0;
 exit;
 end;

 if RadioGroup1.ItemIndex = 4 then
 begin
 if key = vk_left then   RadioGroup1.ItemIndex := 2;
 if key = vk_right then  RadioGroup1.ItemIndex := 1;
 RadioGroup1Click(RadioGroup1);
 key := 0;
 exit;
 end;

 if RadioGroup1.ItemIndex = 5 then
 begin
 if key = vk_left then  RadioGroup1.ItemIndex := 3;
 if key = vk_right then RadioGroup1.ItemIndex := 0;
 RadioGroup1Click(RadioGroup1);
 key := 0;
 exit;
 end;
end;


end;

procedure TFPermissoes.Button3Click(Sender: TObject);
begin
try
  Application.CreateForm(TFPermissoesNew,FPermissoesNew);
  if EditFunc.KeyValue = null then
  begin
  if not ( RadioGroup1.ItemIndex > -1) then
  FPermissoesNew.Button1.Enabled := false;

  FPermissoesNew.Button2.Enabled := false;
  end;

  if EditFunc.KeyValue = 0 then
  begin
  FPermissoesNew.Button1.Enabled := false;
  FPermissoesNew.Button2.Enabled := false;
  end;


  FPermissoesNew.ShowModal;
finally
FreeAndNil(FPermissoesNew);
end;

end;

end.
