unit Upagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ToolEdit, CurrEdit, jpeg,
  ExtCtrls;

type
  TFpagamento = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label6: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label7: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    Image1: TImage;
    Timer1: TTimer;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CurrencyEdit2Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CurrencyEdit4Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpagamento: TFpagamento;

implementation

uses UformaPag, UDados, Ufinaliza;

{$R *.dfm}

procedure TFpagamento.SpeedButton1Click(Sender: TObject);
begin
Try
Application.CreateForm(TFFormaPag,FFormaPag);
FFormaPag.ShowModal;
finally
  FreeAndNil(FFormaPag);
end;
end;

procedure TFpagamento.Button1Click(Sender: TObject);
begin
if DBLookupComboBox1.KeyValue = Null then
begin
DBLookupComboBox1.Color := clFuchsia;
Timer1.Enabled := false;
Timer1.Enabled := true;
exit;
end;

if CurrencyEdit4.Value = 0 then
begin
CurrencyEdit4.Color := clFuchsia;
Timer1.Enabled := false;
Timer1.Enabled := true;
CurrencyEdit4.SetFocus;
exit;
end;


{Banco.TB_Pagamento.Insert;
Banco.TB_Pagamentopedido.Value := FFinaliza.Pedido;
Banco.TB_PagamentoData.Value := now;
Banco.TB_Pagamentoquant.Value := CurrencyEdit4.Value;
banco.TB_PagamentoForma.Value := Banco.TB_FormaPagamentocodigo.Value;
Banco.TB_Pagamento.Post;

FFinaliza.Lista_Cod_Pag.Add(IntToStr(Banco.TB_PagamentoCodigo.Value));
FFinaliza.Pag_Tipo.     Add(IntToStr(Banco.TB_FormaPagamentocodigo.Value));
 }

FFinaliza.CalculaResto;
close;

banco.Config.WriteString('Config','FormaPag',DBLookupComboBox1.KeyValue);
end;


procedure TFpagamento.CurrencyEdit2Change(Sender: TObject);
begin
if CurrencyEdit2.Value = 0 then
CurrencyEdit2.Color := clGradientActiveCaption
else
if CurrencyEdit2.Value < 0 then
CurrencyEdit2.Color := clFuchsia
else
CurrencyEdit2.Color := clRed;
end;

procedure TFpagamento.Button2Click(Sender: TObject);
begin
close;

end;

procedure TFpagamento.CurrencyEdit4Change(Sender: TObject);
begin
CurrencyEdit2.Value := FFinaliza.CurrencyEdit2.Value - CurrencyEdit4.Value;


end;

procedure TFpagamento.FormShow(Sender: TObject);
begin
CurrencyEdit4.Value := CurrencyEdit2.Value;
CurrencyEdit2Change(CurrencyEdit2);

DBLookupComboBox1.KeyValue := banco.Config.ReadString('Config','FormaPag','');

end;

procedure TFpagamento.Image1Click(Sender: TObject);
begin
CurrencyEdit4.Value := FFinaliza.CurrencyEdit2.Value;
end;

procedure TFpagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
close;

end;

procedure TFpagamento.Timer1Timer(Sender: TObject);
begin
DBLookupComboBox1.Color := CurrencyEdit3.Color;
CurrencyEdit4.Color := CurrencyEdit3.Color;
Timer1.enabled:=false;
end;

procedure TFpagamento.DBLookupComboBox1Enter(Sender: TObject);
begin
DBLookupComboBox1.Color := CurrencyEdit3.Color;
end;

procedure TFpagamento.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
Abort;
end;
end;

end.
