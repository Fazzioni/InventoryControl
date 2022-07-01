unit Ucalendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TFcalendario = class(TForm)
    MonthCalendar1: TMonthCalendar;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MonthCalendar1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcalendario: TFcalendario;

implementation

uses DateUtils;

{$R *.dfm}

procedure TFcalendario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
begin
ModalResult := mrCancel;
close;
end;


if (key = vk_left)  or (key = 65) then MonthCalendar1.Date := MonthCalendar1.Date -1;
if (key = vk_Right) or (key = 68) then MonthCalendar1.Date := MonthCalendar1.Date +1;
if (key = vk_up)    or (key = 87) then MonthCalendar1.Date := MonthCalendar1.Date -7;
if (key = vk_down)  or (key = 83) then MonthCalendar1.Date := MonthCalendar1.Date +7;

if key = 72 then
MonthCalendar1.Date := date;


if key = vk_return then
MonthCalendar1DblClick(MonthCalendar1);



end;

procedure TFcalendario.MonthCalendar1DblClick(Sender: TObject);
begin
ModalResult := mrOk;

end;

end.
