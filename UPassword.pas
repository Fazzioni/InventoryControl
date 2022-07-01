unit UPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TFPassword = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1ClickSupervisor(Sender: TObject);
  private
    { Private declarations }
  public
    Editando : Boolean;
    Especial : Boolean;
    { Public declarations }
  end;

var
  FPassword: TFPassword;

implementation

uses Upermissoes, UDados;
Function Encript(Value:ShortString):ShortString;stdcall; external 'sysconf.dll';
Function Descript(Value:ShortString):ShortString;stdcall; external 'sysconf.dll';

{$R *.dfm}

procedure TFPassword.FormCreate(Sender: TObject);
begin
Editando := false;
Especial := false;

end;

procedure TFPassword.FormShow(Sender: TObject);
begin
   if Editando then
   begin
      caption := 'Editando senha...';
      if (banco.User_cod = 0) and (FPermissoes.EditFunc.KeyValue <> 0) then
        Edit1.Enabled := false;

   end
   else
   begin
      Caption := 'Adicionando senha...';
      Edit1.Text := '';
      Edit1.Enabled := false;


   end;

   Edit1.Visible := Edit1.Enabled;
   Label1.Visible := Edit1.Enabled;

   if not (FPermissoes = nil) then
    BitBtn1.OnClick := BitBtn1ClickSupervisor;

end;

procedure TFPassword.BitBtn2Click(Sender: TObject);
begin
close;

end;

procedure TFPassword.BitBtn1Click(Sender: TObject);
begin

if Editando and Edit1.Enabled and edit1.Visible then
begin
  if Edit1.Text = '' then
  begin
    MessageDlg('Digite a senha atual',mtError,[mbok],0);
    Edit1.SetFocus;
    exit;
  end;

    if Edit1.Text <> Descript(FPermissoes.TBFuncionariopassword.Value) then
    begin
    MessageDlg('A senha atual não confere',mtError,[mbok],0);
    Edit1.SetFocus;
    exit;
    end;
end;

  if Edit2.Text = '' then
  begin
  MessageDlg('Digite a nova senha',mtError,[mbok],0);
  Edit2.SetFocus;
  exit;
  end;

  if Edit2.Text <> Edit3.Text then
  begin
  MessageDlg('Nova Senha não confere',mtError,[mbok],0);
  Edit2.SetFocus;
  exit;
  end;

if length(Edit2.Text) < 3 then
begin
MessageDlg('A senha deve conter no mínimo 3 caracteres',mtError,[mbok],0);
Edit2.SetFocus;
exit;
end;

if Especial then
begin
ModalResult := mrok;
exit;
end;

try
FPermissoes.TBFuncionario.Edit;
FPermissoes.TBFuncionariopassword.Value := Encript(Edit2.Text);
FPermissoes.TBFuncionario.Post;
if Editando then MessageDlg('Senha redefinida com sucesso',mtInformation,[mbok],0)
else             MessageDlg('Senha definida com sucesso',mtInformation,[mbok],0);
Except
MessageDlg('Erro ao definir senha',mtError,[mbok],0);
end;

close;

end;

procedure TFPassword.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key =#13 then
begin
self.Perform(WM_NEXTDLGCTL,0,0);
key := #0;
exit;
end;

if key = #27 then
key :=#0;

if not (key in ['a'..'z','A'..'Z','0'..'9',chr(8)]) then
begin
  MessageDlg('caráter inválido',mtError,[mbok],0);
  key := #0;
end;


end;

procedure TFPassword.Edit1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
Handled := true;

end;

procedure TFPassword.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
  BitBtn2Click(BitBtn2);

end;


procedure TFPassword.BitBtn1ClickSupervisor(Sender: TObject);
begin
  if Edit1.Visible then
  begin
    if (Edit1.Text = '')  then
    begin
    MessageDlg('Digite a senha atual',mtError,[mbok],0);
    Edit1.SetFocus;
    exit;
    end;

    if not banco.Locate(26) then
    begin
    MessageDlg('A senha atual não confere',mtError,[mbok],0);
    Edit1.SetFocus;
    exit;
    end;


    if '00'+Edit1.Text+'00' <> Descript(banco.TB_ConfigValor.Value) then
    begin
    MessageDlg('A senha atual não confere',mtError,[mbok],0);
    Edit1.SetFocus;
    exit;
    end;
  end;

  if Edit2.Text = '' then
  begin
    MessageDlg('Digite a nova senha',mtError,[mbok],0);
    Edit2.SetFocus;
    exit;
  end;

  if Edit2.Text <> Edit3.Text then
  begin
    MessageDlg('Nova Senha não confere',mtError,[mbok],0);
    Edit2.SetFocus;
    exit;
  end;

if length(Edit2.Text) < 3 then
begin
  MessageDlg('A senha deve conter no mínimo 3 caracteres',mtError,[mbok],0);
  Edit2.SetFocus;
  exit;
end;


{if Especial then
begin
  ModalResult := mrok;
  exit;
end;

}

if (banco.User_cod = 0) and (FPermissoes.TBFuncionariocodigo.Value <> 0) then // supervisor editando a resposta de um usuario
begin
   // ShowMessage('teste');
   BitBtn1Click(sender);
end
else
  try
    if banco.Locate(26) then
    begin
      banco.TB_Config.Edit;
      banco.TB_ConfigValor.Value := Encript('00'+Edit2.Text+'00');
      banco.TB_Config.Post;
      MessageDlg('Senha definida com sucesso',mtInformation,[mbok],0);
    end;
  Except
    MessageDlg('Erro ao definir senha',mtError,[mbok],0);
  end;


  
close;
end;


end.
