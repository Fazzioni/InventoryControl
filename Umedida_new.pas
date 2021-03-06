unit Umedida_new;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFmedida_New = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    Editing : Boolean;
    Codigo : integer;
    Default_Un,Default_Des : ShortString;

    { Public declarations }
  end;

var
  Fmedida_New: TFmedida_New;

implementation

uses UDados;

{$R *.dfm}

procedure TFmedida_New.FormCreate(Sender: TObject);
begin
Editing := false;
codigo := -1;

end;

procedure TFmedida_New.FormShow(Sender: TObject);
begin
if Editing then
begin
 caption := 'Editando unidade de medida '+banco.TBEstUnSinb.Value;
 Label2.Caption := caption;

 Edit1.Text := banco.TBEstUnSinb.Value;
 Edit2.Text := Banco.TBEstUnDescri.Value;
 codigo     := banco.TBEstUnCodigo.Value;
 Default_Un := banco.TBEstUnSinb.Value;
 Default_Des:= Banco.TBEstUnDescri.Value;
 BitBtn1.Caption := 'Editar';

end
else
begin
 caption := 'Inserindo unidade de medida';
 Label2.Caption := caption;
 BitBtn1.Caption := 'Inserir';
 
 Edit1.Text := '';
 Edit2.Text := '';
end;

end;

procedure TFmedida_New.BitBtn1Click(Sender: TObject);
begin
Edit1.Text := banco.lastcaracter(Edit1.Text);
Edit2.Text := banco.lastcaracter(Edit2.Text);


if Edit1.Text = '' then
begin
MessageDlg('Informe a unidade de medida',mtError,[mbok],0);
Edit1.SetFocus;
exit;
end;

if Edit2.Text = '' then
begin
MessageDlg('Informe a descri??o da medida',mtError,[mbok],0);
Edit2.SetFocus;
exit;
end;


if Editing then
begin
if Codigo = -1 then close;

if LowerCase(Default_Un) <> LowerCase(Edit1.Text) then
if banco.TBEstUn.Locate(banco.TBEstUnSinb.FieldName,Edit1.Text,[]) then
begin
    MessageDlg('J? existe um registro com essa unidade de medida',mtError,[mbok],0);
    Edit1.SetFocus;
    exit;
end;

if not banco.TBEstUn.Locate(banco.TBEstUnCodigo.FieldName,Codigo,[]) then
begin
  MessageDlg('Registro n?o encontrado, imposs?vel localizar registro '+IntToStr(Codigo),mtError,[mbok],0);
  close;
  exit;
end
else
    try
    banco.TBEstUn.Edit;
    Banco.TBEstUnSinb.Value := Edit1.Text;
    Banco.TBEstUnDescri.Value := Edit2.Text;
    banco.TBEstUn.Post;
    MessageDlg('Unidade de medida editada com sucesso',mtInformation,[mbok],0);
    close;
    except
      on e : exception do
      begin
      banco.Create_Erro(e.ClassName,e.Message);
      MessageDlg('Erro ao editar unidade de medida, mensagem original'+#13+e.Message,mtError,[mbok],0);
      end;
    end;




end
else
begin
  if banco.TBEstUn.Locate(banco.TBEstUnSinb.FieldName,Edit1.Text,[]) then
  begin
    MessageDlg('J? existe um registro com essa unidade de medida',mtError,[mbok],0);
    Edit1.SetFocus;
    exit;
  end
  else
  begin
    try
    banco.TBEstUn.Insert;
    Banco.TBEstUnSinb.Value := Edit1.Text;
    Banco.TBEstUnDescri.Value := Edit2.Text;
    banco.TBEstUn.Post;
    MessageDlg('Unidade de medida criada com sucesso',mtInformation,[mbok],0);
    close;
    except
      on e : exception do
      begin
      banco.Create_Erro(e.ClassName,e.Message);
      MessageDlg('Erro ao criar unidade de medida, mensagem original'+#13+e.Message,mtError,[mbok],0);
      end;
    end;
  end;
end;

end;

procedure TFmedida_New.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
close;

end;

procedure TFmedida_New.BitBtn2Click(Sender: TObject);
begin
close;

end;

procedure TFmedida_New.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
Abort;
exit;
end;
end;


end.
