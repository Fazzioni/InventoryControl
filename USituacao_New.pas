unit USituacao_New;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask,db;

type
  TFsituacao_New = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBCheckBox1: TDBCheckBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Edit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
   Editing : Boolean;
    { Public declarations }
  end;

var
  Fsituacao_New: TFsituacao_New;

implementation

uses UDados;

{$R *.dfm}

procedure TFsituacao_New.Edit1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if not banco.TB_SituacaoColor.IsNull then
banco.ColorDialog.Color := banco.TB_SituacaoColor.Value;

if banco.ColorDialog.Execute then
begin
banco.TB_SituacaoColor.Value := Banco.ColorDialog.Color;
Edit1.Color := banco.ColorDialog.Color;
end;


end;

procedure TFsituacao_New.Edit2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if not banco.TB_SituacaoBrashColor.IsNull then
banco.ColorDialog.Color := banco.TB_SituacaoBrashColor.Value;

if banco.ColorDialog.Execute then
begin
banco.TB_SituacaoBrashColor.Value := Banco.ColorDialog.Color;
Edit2.Color := banco.TB_SituacaoBrashColor.value;
end;
end;

procedure TFsituacao_New.Edit2ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
Handled := true;

end;

procedure TFsituacao_New.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
key := #0;
end;

procedure TFsituacao_New.FormCreate(Sender: TObject);
begin
Editing := false;

end;

procedure TFsituacao_New.FormShow(Sender: TObject);
begin
Edit1.Text := '';
Edit2.Text := '';


if Editing then
begin
Caption := 'Editando situa??o';
BitBtn1.Caption := 'Editar';
banco.TB_Situacao.Edit;

end
else
begin
Caption := 'Inserindo situa??o';
BitBtn1.Caption := 'Inserir';
banco.TB_Situacao.Insert;
banco.TB_SituacaoBaixaEstoque.Value := false;


banco.TB_SituacaoColor.Value := clBlack;
banco.TB_SituacaoBrashColor.Value := clWhite;
end;



Edit1.Color := banco.TB_SituacaoColor.Value;
Edit2.Color := banco.TB_SituacaoBrashColor.Value;

end;

procedure TFsituacao_New.FormHide(Sender: TObject);
begin
if Banco.TB_Situacao.State in [dsedit, dsinsert] then
Banco.TB_Situacao.Cancel;
end;

procedure TFsituacao_New.BitBtn2Click(Sender: TObject);
begin
close;

end;

procedure TFsituacao_New.BitBtn1Click(Sender: TObject);
begin
banco.TB_SituacaoDescri.Value := Banco.lastcaracter(banco.TB_SituacaoDescri.Value);
if banco.TB_SituacaoDescri.Value = '' then
begin
MessageDlg('Informe a descri??o da situa??o',mtError,[mbok],0);
DBEdit1.SetFocus;
exit;
end;


if Banco.TB_SituacaoColor.IsNull then
begin
MessageDlg('Informe a cor da fonte',mtError,[mbok],0);
exit;
end;

if Banco.TB_SituacaoBrashColor.IsNull then
begin
MessageDlg('Informe a cor do fundo',mtError,[mbok],0);
exit;
end;

if Banco.TB_SituacaoColor.Value = banco.TB_SituacaoBrashColor.Value then
begin
MessageDlg('As cores n?o podem ser iguais',mtError,[mbok],0);
exit;
end;

try
banco.TB_Situacao.Post;

if Editing then
MessageDlg('Situa??o editada com sucesso',mtInformation,[mbok],0)
else
MessageDlg('Situa??o criada com sucesso',mtInformation,[mbok],0);

close;
Except
on e :Exception do
begin
MessageDlg('N?o foi poss?vel criar/editar a situa??o'+#13+e.message,mtWarning,[mbok],0);
banco.Create_Erro(e.ClassName,e.Message);
end;


end;

end;

procedure TFsituacao_New.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
close;

end;

end.
