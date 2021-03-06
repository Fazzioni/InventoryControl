unit Usituacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ThemeDBGrid, ExtCtrls, StdCtrls;

type
  TFSituacao = class(TForm)
    ThemeDBGrid1: TThemeDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ColorDialog1: TColorDialog;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSituacao: TFSituacao;

implementation

uses UDados, USituacao_New;

{$R *.dfm}

procedure TFSituacao.Button1Click(Sender: TObject);
begin
Try
Application.CreateForm(TFsituacao_New,Fsituacao_New);
Fsituacao_New.ShowModal;
FInally
FreeAndNil(Fsituacao_New);
end;

end;

procedure TFSituacao.Button2Click(Sender: TObject);
begin
Try
Application.CreateForm(TFsituacao_New,Fsituacao_New);
Fsituacao_New.Editing := true;

Fsituacao_New.ShowModal;
FInally
FreeAndNil(Fsituacao_New);
end;


end;

procedure TFSituacao.Button3Click(Sender: TObject);
begin
if Banco.TB_Situacao.RecordCount = 0 then
exit;

if MessageDlg('Tem certeza que deseja excluir a situa??o '+Banco.TB_SituacaoDescri.Value+'?',mtWarning,[mbyes,mbno],0) = mrno then
exit;


try
 Banco.TB_Situacao.Delete;
 MessageDlg('Situa??o excluida com sucesso',mtInformation,[mbok],0);
 except
 on e : exception do
 begin
    if Pos('Venda_Info',e.Message) <> 0 then
    begin
    MessageDlg('N?o ? poss?vel excluir o registro'+#13+'Existe pedido relacionado',mtError,[mbok],0);
    end
    else
    MessageDlg('N?o foi poss?vel excluir o registro, mensagem original'+#13+e.Message,mtError,[mbOK],0);
    Banco.Create_Erro(e.ClassName,e.Message+#13+#13+#13+#13+'Excluindo registro situacao');
 end;
 end;
end;


procedure TFSituacao.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if not banco.TB_SituacaoColor.IsNull then
   (Sender as TThemeDBGrid).Canvas.Font.Color := Banco.TB_SituacaoColor.Value;

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
  if ColorToRGB((sender as TThemeDBGrid).Canvas.Font.Color) < 10 then
   (sender as TThemeDBGrid).Canvas.Font.Color := clwhite;
   
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
  end
  else
  begin
    if not banco.TB_SituacaoBrashColor.IsNull then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.TB_SituacaoBrashColor.Value;
  end;

   (Sender as TThemeDBGrid).DefaultDrawColumnCell(rect,DataCol,Column,State);

end;


procedure TFSituacao.FormResize(Sender: TObject);
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
