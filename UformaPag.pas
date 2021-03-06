unit UformaPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ThemeDBGrid, StdCtrls, DBCtrls, dbcgrids,db,
  ADODB, ExtCtrls;

type
  TFFormaPag = class(TForm)
    ThemeDBGrid1: TThemeDBGrid;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    Button1: TButton;
    Button3: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFormaPag: TFFormaPag;

implementation

uses UDados;

{$R *.dfm}

procedure TFFormaPag.Button1Click(Sender: TObject);
var
  Aux : ShortString;

begin
aux := '';

Aux := InputBox('Inserindo forma de pagamento','Informe a nova forma','');

if aux = '' then
exit;

if Banco.TB_FormaPagamento.Locate(Banco.TB_FormaPagamentoForma.FieldName,Aux,[lopartialkey,loCaseInsensitive]) then
MessageDlg('J? existe uma forma de pagamento com o mesmo nome',mterror,[mbok],0)
else
begin
Banco.TB_FormaPagamento.Insert;
Banco.TB_FormaPagamentoForma.Value := aux;
Banco.TB_FormaPagamento.Post;
end;


end;

procedure TFFormaPag.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
close;

end;

procedure TFFormaPag.Button3Click(Sender: TObject);
var
  Aux : ShortString;
  cod : integer;
begin
if Banco.TB_FormaPagamento.RecordCount = 0 then
exit;
aux := '';

cod := banco.TB_FormaPagamentocodigo.Value;

Aux := InputBox('Editando forma de pagamento','Informe a nova forma',banco.TB_FormaPagamentoForma.value);

if (aux = '') or (aux = Banco.TB_FormaPagamentoForma.Value) then
exit;

if Banco.TB_FormaPagamento.Locate(Banco.TB_FormaPagamentoForma.FieldName,Aux,[]) then
MessageDlg('J? existe uma forma de pagamento com o mesmo nome',mterror,[mbok],0)
else
if Banco.TB_FormaPagamento.Locate(Banco.TB_FormaPagamentocodigo.FieldName,cod,[]) then
begin
  try
  Banco.TB_FormaPagamento.Edit;
  Banco.TB_FormaPagamentoForma.value := aux;
  Banco.TB_FormaPagamento.Post;
  MessageDlg('Forma de pagamento editada com sucesso',mtInformation,[mbok],0);
  except
    on e: exception do
    begin
    Banco.Create_Erro(e.ClassName,e.Message);
    MessageDlg('Falha ao editar forma de pagamento, mensagem original:'+#13+e.Message,mtError,[mbok],0);
    end;
  end;
end
else
MessageDlg('Forma de pagamento n?o foi editada',mtError,[mbok],0);

end;



procedure TFFormaPag.Button2Click(Sender: TObject);
begin
if banco.TB_FormaPagamento.RecordCount = 0 then exit;

if MessageDlg('Deseja excluir a forma de pagamento '+Banco.TB_FormaPagamentoForma.Value+'?',mtWarning,[mbyes,mbno],0) = mrno then
exit;



   try
      banco.TB_FormaPagamento.Delete;
      MessageDlg('Registro excluido',mtInformation,[mbok],0);
    except
      on e: exception do
      begin
        if pos ('Venda_Info',e.message) <> 0 then
        begin
        MessageDlg('N?o foi poss?vel excluir o registro'+#13+'A Fatura est? relacionado com pedido',mtError,[mbok],0);
        exit;
        end;

        if pos ('TB_Parcelamento',e.message) <> 0 then
        begin
        MessageDlg('N?o foi poss?vel excluir o registro'+#13+'Existem Parcelamentos relacionados',mtError,[mbok],0);
        exit;
        end;



        Banco.Create_Erro(e.ClassName,e.Message);
        MessageDlg('Erro ao excluir o registro, mensagem original'+#13+e.Message,mtError,[mbok],0);
      end;
    end;


end;



























procedure TFFormaPag.FormResize(Sender: TObject);
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

//ThemeDBGrid1.Columns[1].Width := 50;

ThemeDBGrid1.Columns[0].Width := ThemeDBGrid1.Width - 21;



Button2.Left := (Panel1.Width div 2 ) - (Button2.Width div 2);
Button1.Left := Button2.Left - Button1.Width - 10;
Button3.Left := Button2.Left + Button2.Width +  10;

end;

end.
