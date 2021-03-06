unit UImgFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg,ShellApi ;

type
  TFImgFunc = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Label1: TLabel;
    Bevel1: TBevel;
    Timer1: TTimer;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    Arrasta : Boolean;
    x1,y1 : Integer;
    Executando : Boolean;
    { Public declarations }
  end;

var
  FImgFunc: TFImgFunc;

implementation

uses UNewFuncionario, Math, UEmitente, UDados;

{$R *.dfm}

procedure TFImgFunc.Label1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Button = mbLeft then
begin
Arrasta := true;
x1 := x;
y1 := y;
end;
end;

procedure TFImgFunc.Label1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Arrasta := false;
end;

procedure TFImgFunc.Timer1Timer(Sender: TObject);
begin
if Arrasta then
begin
Label1.Left := Mouse.CursorPos.X  - x1 -Left-10;
Bevel1.Left := Label1.Left;

Label1.Top := Mouse.CursorPos.y  - y1 - top-32;
Bevel1.Top := Label1.Top;
end;
end;

procedure TFImgFunc.Button1Click(Sender: TObject);
Var
  x, y :Integer;
begin
if Image1.Picture.Bitmap.Empty then
begin
  if (not (New_Funcionario = nil)) then
  New_Funcionario.Image2.Picture := nil;

  if (not (FEmitente = nil)) then
  FEmitente.Image1.Picture := nil;

close;
exit;
end;

if  not (New_Funcionario = nil) then
begin
  New_Funcionario.Image2.Canvas.Brush.color := clwhite;
  New_Funcionario.Image2.Canvas.Pen.Color := clWhite;
  New_Funcionario.Image2.Canvas.Rectangle(0,0,New_Funcionario.Image2.Width,New_Funcionario.Image2.Height);
  for x := 0 to Label1.Width do
  for y := 0 to Label1.Height do
  new_Funcionario.Image2.Canvas.Pixels[x,y]  := Image1.Canvas.Pixels[Label1.Left+x,Label1.Top+y];
end;


if  not (FEmitente = nil) then
begin
  FEmitente.Image1.Canvas.Brush.color := clwhite;

  for x := 0 to Label1.Width do
  for y := 0 to Label1.Height do
  FEmitente.Image1.Canvas.Pixels[x,y]  := Image1.Canvas.Pixels[Label1.Left+x,Label1.Top+y];
end;


Close;
end;

procedure TFImgFunc.Button2Click(Sender: TObject);
begin




if OpenDialog1.Execute then
if FileExists(OpenDialog1.FileName)  then
begin
Image1.Canvas.Brush.Color := clWhite;



Image1.Picture.LoadFromFile(OpenDialog1.FileName);

Label1.Left := 0;
Bevel1.Left := 0;

Label1.Top := 0;
Bevel1.Top := 0;



If not (Image1.Picture.Graphic is TBitmap) then
begin
MessageDlg('Selecione apenas imagens do tipo Bitmap',mtInformation,[mbOK],0);
Image1.Picture := nil;

end;
end
else
MessageDlg('Imagem n?o encontrada',mtError,[mbOK],0);
end;

procedure TFImgFunc.Button3Click(Sender: TObject);
begin
if Image1.Picture.Graphic = nil then
exit;


if SaveDialog1.Execute then
begin
if ExtractFileExt(SaveDialog1.FileName) = '' then
SaveDialog1.FileName := SaveDialog1.FileName +'.bmp';
Image1.Picture.SaveToFile(SaveDialog1.FileName);
end;


end;

procedure TFImgFunc.Button4Click(Sender: TObject);
begin
Image1.Picture := nil;
end;

procedure TFImgFunc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
close;

end;

function Executa (Arquivo : String; Estado : Integer) : Integer; 
var 
Programa : array [0..512] of char; 
CurDir : array [0..255] of char; 
WorkDir : String; 
StartupInfo : TStartupInfo; 
ProcessInfo : TProcessInformation; 
begin 
StrPCopy (Programa, Arquivo); 
GetDir (0, WorkDir); 
StrPCopy (CurDir, WorkDir); 
FillChar (StartupInfo, Sizeof (StartupInfo), #0); 
StartupInfo.cb := sizeof (StartupInfo); 
StartupInfo.dwFlags := STARTF_USESHOWWINDOW; 
StartupInfo.wShowWindow := Estado; 
if not CreateProcess (nil, Programa, nil, nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo) then 
Result := -1 
else 
begin 
WaitForSingleObject (ProcessInfo.hProcess, Infinite);
GetExitCodeProcess (ProcessInfo.hProcess,HPrevInst);
end; 
end;



procedure TFImgFunc.Button5Click(Sender: TObject);
var
  i : integer;
  SaveImg : TFileName;
  aux : Boolean;
begin
Try
Visible := false;

SaveImg := '';
SaveImg := Banco.PegaTempDir;
if not (SaveImg[Length(SaveImg)] in ['\','/']) then
SaveImg := SaveImg + '\';


aux := false;

for i := 1 to length(SaveImg) do
if SaveImg[i] in [' '] then
aux := true;

if (aux = true) or (SaveImg = '') then
SaveImg := 'C:\';


i := 0;
while fileExists(SaveImg +'Image'+IntToStr(i)+'.BMP' ) do
inc(i);

SaveImg := SaveImg+'Image'+IntToStr(i)+'.bmp';

if (Image1.Picture.Graphic = nil) then
begin
Image1.Canvas.Brush.Color := clWhite;
Image1.Canvas.Pen.Color := clWhite;
Image1.Canvas.Rectangle(0,0,Bevel1.Width,Bevel1.Height);
Image1.Picture.Bitmap.Width := Bevel1.Width;
Image1.Picture.Bitmap.Height := Bevel1.Height;
end;

Image1.Picture.SaveToFile(SaveImg);


Sleep(500);
Executa('mspaint '+SaveImg,SW_SHOWNORMAL);


if FileExists(SaveImg) then
begin
Image1.Picture.LoadFromFile(SaveImg);
DeleteFile(SaveImg);
end;


visible := true;
except
on e: exception do
begin
  Banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Erro ao realizar procedimentos com imagem, mensagem original'+#13+e.Message,mtError,[mbok],0);
visible := true;
end;


end;

end;

procedure TFImgFunc.Button6Click(Sender: TObject);
begin
close;

end;

procedure TFImgFunc.FormResize(Sender: TObject);
begin
Button6.Top := Panel1.Height - Button6.Height - 10;

end;

end.
