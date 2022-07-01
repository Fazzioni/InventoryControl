unit UDevolucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFDevolucao = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDevolucao: TFDevolucao;

implementation

uses UDados;

{$R *.dfm}

procedure TFDevolucao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
close;

end;

procedure TFDevolucao.FormShow(Sender: TObject);
begin
 Caption := 'Devolução de item de compra';

 Label7.Caption := IntToStr(banco.TB_Vendas_AllID_mercadoria.Value);
 Label8.Caption := Banco.TB_Vendas_AllDescri.Value;

 if banco.TBEstoque_Quant.Locate(banco.TBEstoque_QuantID_Merca.FieldName,banco.TB_Vendas_AllID_mercadoria.Value,[]) then
 Label9.Caption := FloatToStr(banco.TBEstoque_QuantQuant.Value)
 else
 Label9.Caption := '';

 Edit1.Text := FloatToStr(banco.TB_Vendas_AllQtd.Value);
 Edit1.Enabled := false;
 
 Edit2.Text := '';

end;

procedure TFDevolucao.BitBtn1Click(Sender: TObject);
var
  SobraItens : Integer;
  Valor : Real;
begin
// devolucao = TOtal - baixa


Try
  if not Banco.IsInt(Edit2.Text) then
  raise Exception.Create('Valor incorreto');

  Valor := StrToFloat(Edit2.Text);
Except
  MessageDlg('Valor inccoreto',mtError,[mbok],0);
  Edit2.SetFocus;
  exit;
end;

if Valor > banco.TB_Vendas_AllQtd.Value then
begin
MessageDlg('O valor não pode ser maior do que a quantidade',mtError,[mbok],0);
Edit2.SetFocus;
exit;
end;


//banco.TB_Vendas_All

end;

end.
