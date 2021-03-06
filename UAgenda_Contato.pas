unit UAgenda_Contato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, ThemeDBGrid, db;

type
  TFAgenda_Contato = class(TForm)
    ThemeDBGrid1: TThemeDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAgenda_Contato: TFAgenda_Contato;

implementation

uses UDados;

{$R *.dfm}

procedure TFAgenda_Contato.FormResize(Sender: TObject);
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

ThemeDBGrid1.Columns[1].Width := ThemeDBGrid1.Width - 23 - ThemeDBGrid1.Columns[0].Width;


Button2.Left := (Panel1.Width div 2 ) - (Button2.Width div 2);
Button1.Left := Button2.Left - Button1.Width - 10;
Button3.Left := Button2.Left + Button2.Width +  10;
end;

procedure TFAgenda_Contato.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
close;

end;

procedure TFAgenda_Contato.Button1Click(Sender: TObject);
var
  Aux : String;
begin
aux := '';

if InputQuery('Inserindo formas de contatos','Informe o novo contato',aux) then
begin
    Try
    Banco.TB_Agenda_Contato.Insert;
    banco.TB_Agenda_ContatoDescricao.Value := aux;
    banco.TB_Agenda_Contato.Post;
    MessageDlg('Dados gravados com sucesso',mtInformation,[mbok],0);
    Except
    on e : exception do
    begin
     if banco.IsDuplicate(E.Message) then
     MessageDlg('Forma de Contato j? cadastrado',mtError,[mbok],0)
     else
     begin
     Banco.Create_Erro(e.ClassName,e.Message);
     MessageDlg(e.Message,mtError,[mbok],0);
     end;

    if banco.TB_Agenda_Contato.State in [dsedit, dsinsert] then
    Banco.TB_Agenda_Contato.Cancel;
    end;


    end;

end;

end;

procedure TFAgenda_Contato.Button2Click(Sender: TObject);
var
  Aux : String;
begin
if banco.TB_Agenda_Contato.RecordCount = 0 then
exit;

aux := '';
aux := Banco.TB_Agenda_ContatoDescricao.Value;

if InputQuery('Editando Contato da Agenda','Informe o novo contato',aux) then
begin
    Try
    Banco.TB_Agenda_Contato.edit;
    banco.TB_Agenda_ContatoDescricao.Value := aux;
    banco.TB_Agenda_Contato.Post;
    MessageDlg('Dados gravados com sucesso',mtInformation,[mbok],0);
    Except
    on e : exception do
    begin
     if banco.IsDuplicate(E.Message) then
     MessageDlg('Contato j? cadastrado',mtError,[mbok],0)
     else
     begin
     Banco.Create_Erro(e.ClassName,e.Message);
     MessageDlg(e.Message,mtError,[mbok],0);
     end;

    if banco.TB_Agenda_Contato.State in [dsedit, dsinsert] then
    Banco.TB_Agenda_Contato.Cancel;
    end;


    end;

end;

end;

procedure TFAgenda_Contato.Button3Click(Sender: TObject);
begin

if Banco.TB_Agenda_Contato.RecordCount = 0 then
exit;

if MessageDlg('Tem certeza que deseja excluir o contato '+Banco.TB_Agenda_ContatoDescricao.Value+'?',mtWarning,[mbyes,mbno],0) = mrno then
exit;


try
 Banco.TB_Agenda_Contato.Delete;
 MessageDlg('Contato excluida com sucesso',mtInformation,[mbok],0);
 except
 on e : exception do
 begin
    if Pos('TB_Agenda',e.Message) <> 0 then
    begin
    MessageDlg('N?o ? poss?vel excluir o registro'+#13+'Existe uma registro na tabela Agenda relacionado',mtError,[mbok],0);
    end
    else
    MessageDlg('N?o foi poss?vel excluir o registro, mensagem original'+#13+e.Message,mtError,[mbOK],0);
 end;
 end;
end;

procedure TFAgenda_Contato.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
  end;
(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

end.
