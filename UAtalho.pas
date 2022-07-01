unit UAtalho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls,Menus, StdCtrls;

type
  TFAtalho = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    HotKey1: THotKey;
    procedure Image2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HotKey1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtalho: TFAtalho;

implementation

{$R *.dfm}

procedure TFAtalho.Image2Click(Sender: TObject);
begin
ModalResult := mrOk;

end;

procedure TFAtalho.Image1Click(Sender: TObject);
begin
ModalResult := mrCancel;

end;

procedure TFAtalho.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
ModalResult := mrCancel;

end;

procedure TFAtalho.HotKey1Change(Sender: TObject);
begin
//HideCaret(HotKey1.Handle);
Label1.Caption := ShortCutToText(HotKey1.HotKey); //unit menus
if Label1.Caption = '' then
Label1.Caption := 'Nenhum';


end;

procedure TFAtalho.FormShow(Sender: TObject);
begin
HotKey1Change(HotKey1);
end;

procedure TFAtalho.FormCreate(Sender: TObject);
begin
HotKey1.HotKey := 0;

end;

end.
