unit UProgressCarta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFprogressCarta = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FprogressCarta: TFprogressCarta;

implementation

{$R *.dfm}

procedure TFprogressCarta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
key := 0;

end;

procedure TFprogressCarta.FormDeactivate(Sender: TObject);
begin
(sender as Tform).setfocus;
end;

end.
