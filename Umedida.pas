unit Umedida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ThemeDBGrid, StdCtrls, ExtCtrls,db;

type
  TFMedida = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ThemeDBGrid1: TThemeDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMedida: TFMedida;

implementation

uses UDados, Umedida_new;

{$R *.dfm}

procedure TFMedida.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
close;

end;

procedure TFMedida.Button3Click(Sender: TObject);
begin
if banco.TBEstUn.RecordCount = 0 then
exit;

if MessageDlg('Deseja excluir a unidade de medida '+banco.TBEstUnSinb.Value +'?',mtWarning,[mbYes,mbno],0) = mrno then
exit;


try
  banco.TBEstUn.Delete;
  MessageDlg('Unidade de medida excluida com sucesso',mtInformation,[mbok],0);
  except
   on e : exception do
   begin
      if pos ('Estoque',e.Message) <> 0 then
      begin
       MessageDlg('Não é possível excluir o registro'+#13+'Existe produtos no estoque relacionado',mtError,[mbok],0);
       exit;
      end;

      banco.Create_Erro(e.ClassName,e.Message);
      MessageDlg('Erro ao excluir o cadastro, mensagem original:'+#13+e.Message,mtError, [mbOK],0);
   end;
  end;
end;


procedure TFMedida.Button1Click(Sender: TObject);
begin
try
Application.CreateForm(TFmedida_New,Fmedida_New);
Fmedida_New.Editing := false;
Fmedida_New.ShowModal;
FInally
FreeAndNil(Fmedida_New);
end;

end;

procedure TFMedida.Button2Click(Sender: TObject);
begin
if banco.TBEstUn.RecordCount = 0 then
exit;

try
Application.CreateForm(TFmedida_New,Fmedida_New);
Fmedida_New.Editing := true;
Fmedida_New.ShowModal;
FInally
FreeAndNil(Fmedida_New);
end;

end;

procedure TFMedida.FormResize(Sender: TObject);
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

ThemeDBGrid1.Columns[1].Width := 50;

ThemeDBGrid1.Columns[2].Width := ThemeDBGrid1.Width - 24 - ThemeDBGrid1.Columns[0].Width - ThemeDBGrid1.Columns[1].Width;


Button2.Left := (Panel1.Width div 2 ) - (Button2.Width div 2);
Button1.Left := Button2.Left - Button1.Width - 10;
Button3.Left := Button2.Left + Button2.Width +  10;
end;


end.
