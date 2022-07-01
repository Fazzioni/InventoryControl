unit UAddCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ThemeDBGrid, Buttons, Mask, ToolEdit,
  RXDBCtrl;

type
  TFAddCliente = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    ThemeDBGrid1: TThemeDBGrid;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure ThemeDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DateEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
        Editing : Boolean;
    { Public declarations }
  end;

var
  FAddCliente: TFAddCliente;

implementation

uses UDados, UFvendas, Ufinaliza;

{$R *.dfm}

procedure TFAddCliente.Edit2KeyPress(Sender: TObject; var Key: Char);
var
  i : integer;
begin


if (key = #13 ) then
begin
    Banco.TB_Funcionarios.Close;
    Banco.TB_Funcionarios.SQL.Clear;
    Banco.TB_Funcionarios.SQL.Add('Select * from Funcionarios');
    Banco.TB_Funcionarios.SQL.Add('where ativo = true');

if Banco.IsInt(Edit2.Text) then
Try
  Banco.TB_Funcionarios.Open;
  StrToInt(Edit2.Text);
  if Banco.TB_Funcionarios.Locate(Banco.TB_FuncionariosCdigo.FieldName,i,[]) then
  begin
  Edit2.Text := Banco.TB_FuncionariosNome.Value;
        DateEdit1.SetFocus;
  exit;
  end;
Except
end;

ThemeDBGrid1.Visible := true;
ThemeDBGrid1.SetFocus;

if Edit2.Text <> '' then
Banco.TB_Funcionarios.SQL.Add('and nome like '+chr(39)+Edit2.Text+'%'+chr(39));



Banco.TB_Funcionarios.Open

end;
end;


procedure TFAddCliente.ThemeDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
begin
ThemeDBGrid1.Visible := false;
    if Banco.TB_Funcionarios.RecordCount > 0 then
    begin
      Edit2.Text := Banco.TB_FuncionariosNome.Value;
      DateEdit1.SetFocus;
  end
  else
    Edit2.SetFocus;
end
else
    if Banco.TB_Funcionarios.RecordCount = 0 then
    Edit2.SetFocus;
end;

procedure TFAddCliente.FormShow(Sender: TObject);
begin
if Editing then
begin
BitBtn1.Caption := 'Editar';
DateEdit1.SetFocus;
end
else
Edit2.SetFocus;

end;

procedure TFAddCliente.DateEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
Abort;
end;
end;

procedure TFAddCliente.FormCreate(Sender: TObject);
begin
Editing := false;
end;

procedure TFAddCliente.FormHide(Sender: TObject);
begin
if banco.TB_Funcionarios.SQL.Count > 1 then
begin
    Banco.TB_Funcionarios.Close;
    Banco.TB_Funcionarios.SQL.Clear;
    Banco.TB_Funcionarios.SQL.Add('Select * from Funcionarios');
    Banco.TB_Funcionarios.Open;
end;


end;

end.
