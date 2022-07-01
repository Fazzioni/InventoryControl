unit UException;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls;

type
  TFException = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Timer1: TTimer;
    SpeedButton1: TSpeedButton;
    Memo1: TMemo;
    Label6: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    Red : Byte;
    Aumenta : Boolean;
    
    { Public declarations }
  end;

var
  FException: TFException;

implementation

{$R *.dfm}

procedure TFException.Timer1Timer(Sender: TObject);
begin
if Aumenta then
red := red + 4
else
Red := red - 4;

if Red >= 252 then
Aumenta := false
else
if red <= 4 then
Aumenta := true;



Label1.Font.Color := RGB(Red,0,0);
end;

procedure TFException.FormCreate(Sender: TObject);
begin
Aumenta := false;
Red := 248;

end;

procedure TFException.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
key :=#0;

end;

procedure TFException.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
key := 0;

end;

procedure TFException.Memo1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
Handled := true;

end;

procedure TFException.SpeedButton1Click(Sender: TObject);
begin
ModalResult := mrok;

end;

procedure TFException.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
ModalResult := mrok;

end;

end.
