unit UCancel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TFcancel = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    Estagio : Byte;

    { Public declarations }
  end;

var
  Fcancel: TFcancel;

implementation

uses Ufinaliza, UDados;

{$R *.dfm}

procedure TFcancel.FormCreate(Sender: TObject);
begin
Estagio := 0;

end;

procedure TFcancel.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if Estagio < 7 then
CanClose := false
else
CanClose := true;


end;

end.
