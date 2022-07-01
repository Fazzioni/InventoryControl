unit Uagenda_HoraEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TFAgenda_HoraEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAgenda_HoraEdit: TFAgenda_HoraEdit;

implementation

uses UAgenda_MesHora, UDados;

{$R *.dfm}

procedure TFAgenda_HoraEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
close;

end;

procedure TFAgenda_HoraEdit.SpeedButton2Click(Sender: TObject);
begin
close;

end;

procedure TFAgenda_HoraEdit.SpeedButton1Click(Sender: TObject);
var
  Fail :Boolean;
begin
Fail := false;


if DateTimePicker2.Time < DateTimePicker1.Time then
begin
  MessageDlg('A hora de tarde é maior do que a de manhã',mtError,[mbok],0);
  DateTimePicker2.SetFocus;
  exit;
end;

if DateTimePicker2.Time = DateTimePicker1.Time then
begin
  MessageDlg('A hora de tarde é igual a hora de manhã',mtError,[mbok],0);
  DateTimePicker2.SetFocus;
  exit;
end;



  FAgenda_MesHora.ManhaTime := DateTimePicker1.Time;
  FAgenda_MesHora.TardeTIme := DateTimePicker2.Time;


  try
    if not banco.Locate(18) then
    begin
    banco.TB_Config.Insert;
    banco.TB_ConfigCodigo.Value := 18;
    end
    else
    banco.TB_Config.edit;
    banco.TB_ConfigValor.Value := TimeToStr(DateTimePicker1.Time);
    banco.TB_Config.Post;
  except
    on e: exception do
    begin
      banco.Create_Erro(e.ClassName,e.Message);
      MessageDlg('Não foi possível salvar a data de manhã'+#13+e.Message,mtError,[mbok],0);
      Fail := true;
    end;
  end;

  try
    if not banco.Locate(19) then
    begin
    banco.TB_Config.Insert;
    banco.TB_ConfigCodigo.Value := 19;
    end
    else
    banco.TB_Config.edit;
    banco.TB_ConfigValor.Value := TimeToStr(DateTimePicker2.Time);
    banco.TB_Config.Post;
  except
    on e: exception do
    begin
      banco.Create_Erro(e.ClassName,e.Message);
      MessageDlg('Não foi possível salvar a data de tarde'+#13+e.Message,mtError,[mbok],0);
     Fail := true;
    end;
  end;

  if not Fail then
  MessageDlg('Dados gravados com sucesso',mtInformation,[mbok],0);

  Close;


end;

end.
