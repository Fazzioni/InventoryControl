unit UAgenda_Mes_SelectMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin;

type
  TFAgenda_Mes_SelectMes = class(TForm)
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpinEdit1Exit(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAgenda_Mes_SelectMes: TFAgenda_Mes_SelectMes;

implementation

uses UDados, IniFiles;

{$R *.dfm}

procedure TFAgenda_Mes_SelectMes.FormResize(Sender: TObject);
Const
  Espac = 10;
begin

  SpinEdit1.Width := (Panel1.Width * 25) div 100;
  Button1.Width   := (Panel1.Width * 25) div 100;
  SpinEdit1.Left  := (Panel1.Width div 2) - ((SpinEdit1.Width+Espac+Button1.Width) div 2);

  Label1.Left  := SpinEdit1.Left;

  Button1.Left := SpinEdit1.Left + SpinEdit1.Width + espac;

{Button1.Left := ((Panel1.Width div 2) - 5) - Button1.Width;
Button2.Left := ((Panel1.Width div 2) + 5);
{SpinEdit1.Left := (Panel1.Width * 25) div 100;
Label1.Left := SpinEdit1.Left;}


{SpinEdit1.Width := (Panel1.Width * 20) div 100;
SpinEdit1.Left := Button1.Left - SpinEdit1.Width - 10;
Label1.Left := SpinEdit1.Left;
                                 }

RadioGroup1.Font.Size := (RadioGroup1.Width * 5) div 200;
RadioGroup1.Font.name := 'courier new';


end;


procedure TFAgenda_Mes_SelectMes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_Escape then
close;

end;

procedure TFAgenda_Mes_SelectMes.FormShow(Sender: TObject);
begin
self.Constraints.MinWidth := 400;
self.Constraints.MinHeight := 200;

Width := Banco.Config.ReadInteger('Agenda_Mes','Mes_Width',Width);
Height := Banco.Config.ReadInteger('Agenda_Mes','Mes_Height',Height);

end;

procedure TFAgenda_Mes_SelectMes.Button1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex = -1 then
begin
  MessageDlg('Selecione um m?s',mtError,[mbok],0);
  exit;
end;


if SpinEdit1.Value  <= 0 then
begin
  MessageDlg('Informe o ano desejado',mtError,[mbok],0);
  SpinEdit1.SetFocus;
  exit;
end;

 close;
 ModalResult := mrok;

end;

procedure TFAgenda_Mes_SelectMes.SpinEdit1Exit(Sender: TObject);
begin
try
  if SpinEdit1.Text = '' then
  begin
  SpinEdit1.Value := 0;
  exit;
  end;

  
except
  SpinEdit1.Value := 0;
end;

end;

procedure TFAgenda_Mes_SelectMes.FormHide(Sender: TObject);
begin

Banco.Config.WriteInteger('Agenda_Mes','Mes_Width',Width);
Banco.Config.WriteInteger('Agenda_Mes','Mes_Height',Height);


end;

end.

