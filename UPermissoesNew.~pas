unit UPermissoesNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, ThemeDBGrid, ExtCtrls;

type
  TFPermissoesNew = class(TForm)
    TB_PermiSave: TADOQuery;
    TB_PermiSaveCodigo: TAutoIncField;
    TB_PermiSaveDescricao: TWideStringField;
    TB_PermiSavePermissao: TWideStringField;
    Permi_source: TDataSource;
    ThemeDBGrid1: TThemeDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPermissoesNew: TFPermissoesNew;

implementation

uses UDados, Upermissoes;

{$R *.dfm}

procedure TFPermissoesNew.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
close;

end;

procedure TFPermissoesNew.Button1Click(Sender: TObject);
  Function BooltoHex(usebol : Boolean):Char;
  begin
  Result := '0';
  if usebol then
  Result := '1';
  end;

var
  Value : String;
  I : Shortint;
begin

value := '';

if InputQuery('Criando novo Perfil','Informe o nome',Value) = false then
exit;

if Value = '' then
exit;

try
  TB_PermiSave.Insert;
  TB_PermiSaveDescricao.Value := Value;

  Value := '';
for i := 0 to FPermissoes.ListClie.Count - 1 do Value := value + BooltoHex(FPermissoes.ListClie.Checked[i]);
for i := 0 to FPermissoes.ListCont.Count - 1 do Value := value + BooltoHex(FPermissoes.ListCont.Checked[i]);
for i := 0 to FPermissoes.ListEst.Count - 1 do Value := value + BooltoHex(FPermissoes.ListEst.Checked[i]);
for i := 0 to FPermissoes.ListFunc.Count - 1 do Value := value + BooltoHex(FPermissoes.ListFunc.Checked[i]);
for i := 0 to FPermissoes.ListOut.Count - 1 do Value := value + BooltoHex(FPermissoes.ListOut.Checked[i]);
for i := 0 to FPermissoes.ListPed.Count - 1 do Value := value + BooltoHex(FPermissoes.ListPed.Checked[i]);

  TB_PermiSavePermissao.Value := Value;

  TB_PermiSave.Post;
  MessageDlg('Perfil criado com sucesso',mtInformation,[mbok],0);
Except
on e :Exception do
begin
  banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg(e.Message,mtError,[mbok],0);

  if TB_PermiSave.State in [dsedit, dsinsert] then
  TB_PermiSave.Cancel;
end;
 end;
end;

procedure TFPermissoesNew.FormShow(Sender: TObject);
begin
TB_PermiSave.Open;

Width := banco.Config.ReadInteger('Permissoes_New','Width',Width);
Height := banco.Config.ReadInteger('Permissoes_New','Height',Height);

end;

procedure TFPermissoesNew.FormHide(Sender: TObject);
begin
TB_PermiSave.Close;
banco.Config.WriteInteger('Permissoes_New','Width',Width);
banco.Config.WriteInteger('Permissoes_New','Height',Height);



end;

procedure TFPermissoesNew.Button2Click(Sender: TObject);
 function DecToBool(value: char): Boolean;
 begin
  Result := false;
  if value = '1' then
  Result := true;
 end;

var
  i : Shortint;
  a : Smallint;
begin
if TB_PermiSave.RecordCount = 0 then exit;

if TB_PermiSavePermissao.IsNull then exit;

if MessageDlg('Deseja carregar o perfil '+TB_PermiSaveDescricao.Value+'?',mtConfirmation,[mbYes,mbno],0) = mrno then
exit;


a := 1;
for i := 0 to FPermissoes.ListClie.Count - 1 do
begin
 FPermissoes.ListClie.Checked[i] := DecToBool( TB_PermiSavePermissao.asstring[a] );
 inc(a);
end;

for i := 0 to FPermissoes.ListCont.Count - 1 do
begin
 FPermissoes.ListCont.Checked[i] := DecToBool(TB_PermiSavePermissao.asstring[a]);
 inc(a);
end;

for i := 0 to FPermissoes.ListEst.Count - 1 do
begin
 FPermissoes.ListEst.Checked[i] := DecToBool(TB_PermiSavePermissao.asstring[a]);
 inc(a);
end;

for i := 0 to FPermissoes.ListFunc.Count - 1 do
begin
 FPermissoes.ListFunc.Checked[i] := DecToBool(TB_PermiSavePermissao.asstring[a]);
 inc(a);
end;

for i := 0 to FPermissoes.ListOut.Count - 1 do
begin
 FPermissoes.ListOut.Checked[i] := DecToBool(TB_PermiSavePermissao.asstring[a]);
 inc(a);
end;

for i := 0 to FPermissoes.ListPed.Count - 1 do
begin
 FPermissoes.ListPed.Checked[i] := DecToBool(TB_PermiSavePermissao.asstring[a]);
 inc(a);
end;

MessageDlg('Perfil carregado com sucesso',mtInformation,[mbok],0);
close;

end;

procedure TFPermissoesNew.Button3Click(Sender: TObject);
begin
if TB_PermiSave.RecordCount = 0 then exit;

if MessageDlg('Deseja excluri o perfil '+TB_PermiSaveDescricao.Value+'?',mtWarning,[mbyes,mbno],0) = mrno then
exit;

try
  TB_PermiSave.Delete;
  MessageDlg('Perfil excluído com sucesso',mtInformation,[mbok],0);
Except
  on e :exception do
  begin
  banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg(e.Message,mtError,[mbok],0);
  end;
end;
end;

procedure TFPermissoesNew.FormResize(Sender: TObject);
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



procedure TFPermissoesNew.ThemeDBGrid1DrawColumnCell(Sender: TObject;
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
