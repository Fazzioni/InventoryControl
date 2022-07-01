unit UPrinterConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFPrinterContas = class(TForm)
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrinterContas: TFPrinterContas;

implementation

{$R *.dfm}

procedure TFPrinterContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
begin
Button2Click(Button2);
key := 0;
end;

end;

procedure TFPrinterContas.Button2Click(Sender: TObject);
begin
close;
end;

end.
