unit UFaniversario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, dateutils;

type
  TFAniversario = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Panel1: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAniversario: TFAniversario;

implementation

uses UDados, DB, UCliente_Info;

{$R *.dfm}

procedure TFAniversario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
Close;

end;

procedure TFAniversario.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
  Try
  Application.CreateForm(TFInfo_Cliente,FInfo_Cliente);
  FInfo_Cliente.Print;
  Finally
  FreeAndNil(FInfo_Cliente);
  end;
end;
end;

end.
