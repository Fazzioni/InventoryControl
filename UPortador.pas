unit UPortador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, ThemeDBGrid;

type
  TFPortador = class(TForm)
    ThemeDBGrid1: TThemeDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPortador: TFPortador;

implementation

uses UDados;

{$R *.dfm}

procedure TFPortador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
close;

end;

procedure TFPortador.Button1Click(Sender: TObject);
var
  New : string;
begin

new := '';
if not InputQuery('Inseriondo portador','Informe novo portador',new) then
exit;

if banco.TB_Portador.Locate(banco.TB_PortadorDescricao.FieldName,new,[]) then
begin
MessageDlg('Ja existe um portador com esse nome',mtInformation,[mbok],0);
exit;
end;

try
banco.TB_Portador.Insert;
banco.TB_PortadorDescricao.Value := New;
banco.TB_Portador.post ;

MessageDlg('Portador registrado com sucesso',mtInformation,[mbok],0);
Except
  on e : exception do
  begin
  MessageDlg('Erro ao criar portador, mensagem original'+#13+e.Message,mtError,[mbOK],0);
  Banco.Create_Erro(e.ClassName,e.Message);
  end;
end;


end;

procedure TFPortador.FormResize(Sender: TObject);
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


procedure TFPortador.Button3Click(Sender: TObject);
begin
if Banco.TB_Portador.RecordCount = 0 then
exit;

if MessageDlg('Tem certeza que deseja excluir o registro '+Banco.TB_PortadorDescricao.Value+'?',mtWarning,[mbyes,mbno],0) = mrno then
exit;


try
 Banco.TB_Portador.Delete;
 MessageDlg('Dados excluido com sucesso',mtInformation,[mbok],0);
 except
 on e : exception do
 begin
    if Pos('TB_Contas',e.Message) <> 0 then
    begin
    MessageDlg('Não é possível excluir o registro'+#13+'Existe conta relacionada',mtError,[mbok],0);
    end
    else
    MessageDlg('Não foi possível excluir o registro, mensagem original'+#13+e.Message,mtError,[mbOK],0);
    Banco.Create_Erro(e.ClassName,e.Message+#13+#13+#13+#13+'Excluindo registro TB_Portador');
 end;
 end;
end;

end.
