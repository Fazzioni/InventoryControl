unit UCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ThemeDBGrid;

type
  TFCargo = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ThemeDBGrid1: TThemeDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ThemeDBGrid1DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCargo: TFCargo;

implementation

uses UDados;

{$R *.dfm}

procedure TFCargo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
close;

end;

procedure TFCargo.Button1Click(Sender: TObject);
var
  s : ShortString;
begin
   s :=InputBox('Criando cargos','Informe o cargo','');

if s = '' then
exit;
if banco.TB_Setor.Locate(Banco.TB_SetorDescricao.Value,s,[]) then
begin
MessageDlg('Já existe um setor com esse nome',mtInformation,[mbok],0);
exit;
end;


Try
 Banco.TB_Setor.Insert;
 Banco.TB_SetorDescricao.Value := s;
 Banco.TB_Setor.Post;
 MessageDlg('Setor criado com sucesso',mtInformation,[mbok],0);
except
on e : exception do
begin
  banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Erro ao criar registro, mensagem original'+#13+e.Message,mtError,[mbOK],0);
end;
end;


end;

procedure TFCargo.Button2Click(Sender: TObject);
var
  s : ShortString;
cod : Integer;
begin
if Banco.TB_Setor.RecordCount = 0 then
exit;
cod := banco.TB_SetorCodigo.Value;

   s :=InputBox('Editando cargo','Informe o cargo',Banco.TB_SetorDescricao.Value);



if (s = '') or (LowerCase(s) = LowerCase(Banco.TB_SetorDescricao.Value)) then
exit;

if banco.TB_Setor.Locate(banco.TB_SetorDescricao.FieldName,s,[]) then
begin
MessageDlg('Já existe um setor com esse nome',mtInformation,[mbok],0);
banco.TB_Setor.Locate(banco.TB_SetorCodigo.FieldName,cod,[]);
exit;

end;
if not banco.TB_Setor.Locate(banco.TB_SetorCodigo.FieldName,cod,[]) then
begin
MessageDlg('Erro ao editar registro, não foi possível localizar',mtError,[mbok],0);
exit;
end;


Banco.TB_Setor.Edit;
Banco.TB_SetorDescricao.Value := s;
Try
 Banco.TB_Setor.Post;
  MessageDlg('Setor modificado com sucesso',mtInformation,[mbok],0);
except
  MessageDlg('Erro ao editar registro',mtError,[mbOK],0);
end;
end;

procedure TFCargo.ThemeDBGrid1DblClick(Sender: TObject);
begin
Button2.Click;
end;

procedure TFCargo.Button3Click(Sender: TObject);
begin
if Banco.TB_Setor.RecordCount = 0 then
exit;

 if MessageDlg('Deseja remover o cargo '+Banco.TB_SetorDescricao.value+'?',mtWarning,[mbYes,mbNo],0) = mrno then
 exit;
 
 if Banco.TB_Funcionarios.Locate(Banco.TB_FuncionariosSetor.FieldName,Banco.TB_SetorCodigo.Value,[]) then
 Begin
  MessageDlg('Existem funcionários relacionados com esse cargo'+#13+'Não foi possível excluir o registro',mtError,[mbOK],0);
  exit;
 end;


 

 try
  Banco.TB_Setor.Delete;
  MessageDlg('Registro excluido com sucesso',mtInformation,[mbOK],0);
 except
   on e: exception do
   begin
   MessageDlg('Não foi possível excluir o cargo, mensagem original'+#13+e.Message,mtError,[mbok],0);
   Banco.Create_Erro(e.ClassName,e.Message+#13+#13+#13+'EXCLUINDO Cargo TABELA TBCARGOS');
   end;
 end;
 


end;

procedure TFCargo.FormResize(Sender: TObject);
Const
 Largura = 10;
begin
Button1.Top := Largura;
Button2.Top := Largura;
Button3.Top := Largura;
Panel1.Height := Button1.Height + Button1.Top+1;

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
