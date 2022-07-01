unit UAgendaTipo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ThemeDBGrid, StdCtrls, ExtCtrls, db;

type
  TFAgenda_TIpo = class(TForm)
    ThemeDBGrid1: TThemeDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    FavoritoTrue: TImage;
    FavoritoFalse: TImage;
    FavoritoSelectTrue: TImage;
    FavoritoSelectFalse: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ThemeDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAgenda_TIpo: TFAgenda_TIpo;

implementation

uses UDados;

{$R *.dfm}

procedure TFAgenda_TIpo.Button1Click(Sender: TObject);
var
  Aux : String;
begin
aux := '';

if InputQuery('Inserindo Tipo de Agenda','Informe o novo tipo',aux) then
begin
    Try
    Banco.TB_Agenda_Tipo.Insert;
    banco.TB_Agenda_TipoDescricao.Value := aux;
    banco.TB_Agenda_TipoGregaAgenda.Value := true;
    banco.TB_Agenda_Tipo.Post;
    MessageDlg('Dados gravados com sucesso',mtInformation,[mbok],0);
    Except
    on e : exception do
    begin
     if banco.IsDuplicate(E.Message) then
     MessageDlg('Tipo de Agenda já cadastrado',mtError,[mbok],0)
     else
     begin
     Banco.Create_Erro(e.ClassName,e.Message);
     MessageDlg(e.Message,mtError,[mbok],0);
     end;

    if banco.TB_Agenda_Tipo.State in [dsedit, dsinsert] then
    Banco.TB_Agenda_Tipo.Cancel;
    end;


    end;

end;

end;

procedure TFAgenda_TIpo.FormResize(Sender: TObject);
Const
 Largura = 10;
begin
Button1.Top := Largura;
Button2.Top := Largura;
Button3.Top := Largura;
Panel1.Height := Button1.Height + Button1.Top+1;

ThemeDBGrid1.Top := Panel1.Top +Panel1.Height +2+ Largura;
ThemeDBGrid1.Left := Largura;

ThemeDBGrid1.Height := Height - ThemeDBGrid1.Top - (largura * 5);
ThemeDBGrid1.Width := Width - (Largura * 4);

ThemeDBGrid1.Columns[1].Width := ThemeDBGrid1.Width - 24 - ThemeDBGrid1.Columns[0].Width - ThemeDBGrid1.Columns[2].Width;


Button2.Left := (Panel1.Width div 2 ) - (Button2.Width div 2);
Button1.Left := Button2.Left - Button1.Width - 10;
Button3.Left := Button2.Left + Button2.Width +  10;


end;

procedure TFAgenda_TIpo.Button3Click(Sender: TObject);
begin
if Banco.TB_Agenda_Tipo.RecordCount = 0 then
exit;

if MessageDlg('Tem certeza que deseja excluir o tipo '+Banco.TB_Agenda_TipoDescricao.Value+'?',mtWarning,[mbyes,mbno],0) = mrno then
exit;


try
 Banco.TB_Agenda_Tipo.Delete;
 MessageDlg('Tipo de excluida com sucesso',mtInformation,[mbok],0);
 except
 on e : exception do
 begin
    if Pos('TB_Agenda',e.Message) <> 0 then
    begin
    MessageDlg('Não é possível excluir o registro'+#13+'Existe uma registro na tabela Agenda relacionado',mtError,[mbok],0);
    end
    else
    MessageDlg('Não foi possível excluir o registro, mensagem original'+#13+e.Message,mtError,[mbOK],0);
 end;
 end;
end;


procedure TFAgenda_TIpo.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
  end;

(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);


 if (Column.Field = Banco.TB_Agenda_TipoGregaAgenda) then
  begin
      try
        if banco.TB_Agenda_Tipo.RecordCount > 0 then
        if Banco.TB_Agenda_TipoGregaAgenda.Value then
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

procedure TFAgenda_TIpo.Button2Click(Sender: TObject);
var
  Aux : String;
begin
if banco.TB_Agenda_Tipo.RecordCount = 0 then
exit;

aux := '';
aux := Banco.TB_Agenda_TipoDescricao.Value;

if InputQuery('Editando Tipo de Agenda','Informe o novo tipo',aux) then
begin
    Try
    Banco.TB_Agenda_Tipo.edit;
    banco.TB_Agenda_TipoDescricao.Value := aux;
    banco.TB_Agenda_Tipo.Post;
    MessageDlg('Dados gravados com sucesso',mtInformation,[mbok],0);
    Except
    on e : exception do
    begin
     if banco.IsDuplicate(E.Message) then
     MessageDlg('Tipo de Agenda já cadastrado',mtError,[mbok],0)
     else
     begin
     Banco.Create_Erro(e.ClassName,e.Message);
     MessageDlg(e.Message,mtError,[mbok],0);
     end;

    if banco.TB_Agenda_Tipo.State in [dsedit, dsinsert] then
    Banco.TB_Agenda_Tipo.Cancel;
    end;


    end;

end;

end;

procedure TFAgenda_TIpo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
close;


end;

procedure TFAgenda_TIpo.ThemeDBGrid1DblClick(Sender: TObject);
begin
if banco.TB_Agenda_Tipo.RecordCount = 0 then
exit;

banco.TB_Agenda_Tipo.Edit;
if banco.TB_Agenda_TipoGregaAgenda.IsNull then banco.TB_Agenda_TipoGregaAgenda.Value := false;
banco.TB_Agenda_TipoGregaAgenda.Value := not(banco.TB_Agenda_TipoGregaAgenda.Value);

try
banco.TB_Agenda_Tipo.Post;
if banco.TB_Agenda_TipoGregaAgenda.Value then
MessageDlg('Registros "'+Banco.TB_Agenda_TipoDescricao.Value+'" vão ser visualizados no calendário da aplicação',mtInformation,[mbok],0)
else
MessageDlg('Registros "'+Banco.TB_Agenda_TipoDescricao.Value+'" vão ser ocultos',mtInformation,[mbok],0);


except
on e :Exception do
begin
banco.Create_Erro(e.ClassName,e.Message);
MessageDlg('Erro ao alterar registro'+#13+e.Message,mtError,[mbok],0);

if banco.TB_Agenda_Tipo.State in [dsedit, dsinsert] then
Banco.TB_Agenda_Tipo.Cancel;

end;

end;


end;

end.
