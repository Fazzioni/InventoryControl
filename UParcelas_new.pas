unit UParcelas_new;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask,db;

type
  TFparcelas_New = class(TForm)
    Label1: TLabel;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    editing : Boolean;
    { Public declarations }
  end;

var
  Fparcelas_New: TFparcelas_New;

implementation

uses UDados;

{$R *.dfm}

procedure TFparcelas_New.FormCreate(Sender: TObject);
begin
editing := false;

end;

procedure TFparcelas_New.FormShow(Sender: TObject);
begin

if editing then
begin
caption := 'Editando Parcelas..: '+IntToStr(banco.TB_ParcelamentoCodigo.Value);
BitBtn1.Caption := 'Editar';
banco.TB_Parcelamento.Edit;
end
else
begin
BitBtn1.Caption := 'Criar';
caption := 'Criando Parcela';
banco.TB_Parcelamento.Insert;
banco.TB_Parcelamentoativo.Value := true;
Banco.TB_Parcelamentoentrada.Value := true;

end;



end;

procedure TFparcelas_New.FormHide(Sender: TObject);
begin
if Banco.TB_Parcelamento.State in [dsedit, dsinsert] then
Banco.TB_Parcelamento.Cancel;
end;

procedure TFparcelas_New.BitBtn2Click(Sender: TObject);
begin
banco.TB_Parcelamento.Cancel;
close;

end;

procedure TFparcelas_New.BitBtn1Click(Sender: TObject);
begin

Banco.TB_ParcelamentoDescricao.Value:= Banco.lastcaracter(Banco.TB_ParcelamentoDescricao.Value);

if banco.TB_ParcelamentoDescricao.Value = '' then
begin
MessageDlg('O campo Descrição não pode ficar em branco',mtError,[mbok],0);
DBEdit4.SetFocus;
exit;
end;

if banco.TB_ParcelamentoIntervaloDias.IsNull then
begin
MessageDlg('O campo Intervalo de Dias não pode ficar em branco',mtError,[mbok],0);
DBEdit1.SetFocus;
exit;
end;

if banco.TB_ParcelamentoParcelas.IsNull then
begin
MessageDlg('O campo Parcelas não pode ficar em branco',mtError,[mbok],0);
DBEdit2.SetFocus;
exit;
end;

if banco.TB_ParcelamentoFormaPagamento.IsNull then
begin
MessageDlg('O campo Forma de Pagamento não pode ficar em branco',mtError,[mbok],0);
DBLookupComboBox1.SetFocus;
exit;
end;


try
banco.TB_Parcelamento.Post;
if editing then
MessageDlg('Parcela editada com sucesso',mtInformation,[mbok],0)
else
MessageDlg('Parcela criada com sucesso',mtInformation,[mbok],0);

close;
except
  on e :Exception do
  begin
  banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Não foi possível criar/editar parcela, mensagem original '+#13+e.Message,mtWarning,[mbok],0);
  end;
end;


end;

procedure TFparcelas_New.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
abort;

exit;
end;


end;

end.
