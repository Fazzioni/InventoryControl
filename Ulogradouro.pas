unit Ulogradouro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, ThemeDBGrid,db;

type
  TFlogradouro = class(TForm)
    ThemeDBGrid1: TThemeDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flogradouro: TFlogradouro;

implementation

uses UDados;

{$R *.dfm}

procedure TFlogradouro.Button1Click(Sender: TObject);
var
  S : String;
begin
s := '';
if InputQuery('Logradouro...','Informe novo texto',s) then
begin

if banco.TBLogra.Locate(Banco.TBLograTipo.FieldName,s,[]) then
begin
MessageDlg('Já existe um logradouro com esse nome',mtInformation,[mbok],0);
exit;
end;



banco.TBLogra.Insert;
banco.TBLograTipo.Value := S;
try
banco.TBLogra.Post;
except
  on e: exception do
  begin
  Banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Erro ao criar novo logradouro'+#13+e.Message,mtError,[mbok],0);
  end;
end;
end;

end;

procedure TFlogradouro.Button2Click(Sender: TObject);
var
  S : String;
  cod : Integer;
begin
if banco.TBLogra.RecordCount = 0 then
exit;

cod := banco.TBLograCodigo.Value;

s := banco.TBLograTipo.Value;

if InputQuery('Logradouro...','Informe novo texto',s) then
begin
if (LowerCase(banco.TBLograTipo.Value) = LowerCase(s)) or (s = '') then
exit;



if banco.TBLogra.Locate(Banco.TBLograTipo.FieldName,s,[]) then
begin
MessageDlg('Já existe um logradouro com esse nome',mtInformation,[mbok],0);
exit;
end;

if not banco.TBLogra.Locate(Banco.TBLograCodigo.FieldName,cod,[]) then
banco.TBLogra.Insert
else
banco.TBLogra.Edit;


banco.TBLograTipo.Value := S;
try
banco.TBLogra.Post;
except
  on e: exception do
  begin
  Banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Erro ao criar novo logradouro'+#13+e.Message,mtError,[mbok],0);
  end;

end;

end;

end;

procedure TFlogradouro.Button3Click(Sender: TObject);
begin
if banco.TBLogra.RecordCount = 0 then
exit;

if MessageDlg('Deseja excluir o logradouro '+Banco.TBLograTipo.Value+'?',mtWarning,[mbYes,mbno],0) = mrno then
exit;


try
banco.TBLogra.Delete;
MessageDlg('Logradouro excluido com sucesso',mtInformation,[mbok],0);
except
on e : exception do
begin
  if  Pos('Cliente_Cadastro',e.Message) <> 0 then
  begin
  MessageDlg('Não é possível excluir o registro'+#13+'Existe cliente relacionado',mtError,[mbok],0);
  exit;
  end;
  
  Banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Não foi possível excluir o logradouro'+#13+e.Message,mtError,[mbok],0);
  end;
end;

end;

procedure TFlogradouro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
close;

end;

procedure TFlogradouro.FormResize(Sender: TObject);
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
