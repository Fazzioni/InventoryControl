unit Uvisible;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ExtCtrls;

type
  TFVisible = class(TForm)
    CheckListBox1: TCheckListBox;
    Panel1: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVisible: TFVisible;

implementation

{$R *.dfm}

procedure TFVisible.Button1Click(Sender: TObject);
begin
ModalResult := 1;

end;

procedure TFVisible.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
close;


end;

end.
