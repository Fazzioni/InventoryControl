unit Uprinciapl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, StdCtrls, DB, ADODB, Inifiles, ExtCtrls,DateUtils,
  ThemeDBGrid, Menus, ImgList,Clipbrd,ShellApi,Registry,printers;
type
  TFPrincipal = class(TForm)
    Image1: TImage;
    Img3: TImage;
    Img2: TImage;
    Img1: TImage;
    Img4: TImage;
    Img5: TImage;
    Img6: TImage;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Funcionrios1: TMenuItem;               
    Clientes1: TMenuItem;
    Estoque1: TMenuItem;
    ImageList1: TImageList;
    Timer1: TTimer;
    Config1: TMenuItem;
    Emitente1: TMenuItem;
    Timer2: TTimer;
    Sobre1: TMenuItem;
    Button1: TButton;
    ContasaReceber1: TMenuItem;
    N4: TMenuItem;
    Parcelamento1: TMenuItem;
    Global1: TMenuItem;
    N2: TMenuItem;
    Usuarios1: TMenuItem;
    Agenda1: TMenuItem;
    Img7: TImage;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure Fecha;
    Procedure Propriedades(Form:TForm);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    Procedure Img1_Visible;
    Procedure Img2_Visible;
    Procedure Img3_Visible;
    Procedure Img4_Visible;
    Procedure Img5_Visible;
    Procedure Img6_Visible;
    Procedure Img7_Visible;
    procedure Img1Click(Sender: TObject);
    procedure Img5Click(Sender: TObject);
    procedure Img4Click(Sender: TObject);
    procedure Img6Click(Sender: TObject);
    procedure ClearImg;
    procedure Funcionrios1Click(Sender: TObject);
    procedure Img2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Img7Click(Sender: TObject);
    procedure Img3Click(Sender: TObject);
    procedure Img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure Emitente1Click(Sender: TObject);
    Procedure OpenPage(value:string;TxtCopy:ShortString;space:Boolean);
    Function RemoveCaracter(Value:string):string;
    procedure PrintDocument(Impressora : Shortstring;const documentToPrint : string) ;
    procedure SobreClick(Sender: TObject);
    Procedure ShowParcelas;
    procedure Button1Click(Sender: TObject);
    procedure Parcelamento1Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    Procedure OpenAuditoria;
    procedure Cadastros1Click(Sender: TObject);
    procedure Config1Click(Sender: TObject);
  private
    { Private declarations }
  public


    Option_Pedido : 0..2;
    Option_Reeopen : Boolean;
    Tamanho_bara : integer;

    Form_INfoTbl  :TForm;
    Form_Memo : TMemo;
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses UClientes, UDados, UFestoque, UFvendas, UPedido, UFaniversario,
  UAgenda, ComObj, Uemissor, Usituacao, Ufuncionario, UEmitente, Usobre,
  Ucontas, UParcelas, Uconfig, UformaPag, Upermissoes, UAuditoria, Contnrs;

{$R *.dfm}

procedure TFPrincipal.PrintDocument(Impressora : Shortstring; const documentToPrint : string) ;
var
 printCommand : string;
 printerInfo : string;
 Device, Driver, Port: array[0..255] of Char;
 hDeviceMode: THandle;
Device_Print : integer;
begin
Printer.Printers;

Device_Print := printer.Printers.IndexOf(Impressora);

if Device_Print = -1 then
exit;

if Printer.PrinterIndex = Device_Print then
begin
printCommand := 'print';
printerInfo := '';
end
else
begin
printCommand := 'printto';
Printer.PrinterIndex := Device_Print;
Printer.GetPrinter(Device, Driver, Port, hDeviceMode) ;
printerInfo := Format('"%s" "%s" "%s"', [Device, Driver, Port]) ;
end;
ShellExecute(Application.Handle, PChar(printCommand), PChar(documentToPrint), PChar(printerInfo), nil, SW_INVALIDATE) ;
//WinExec(pchar('C:\Program Files (x86)\Adobe\Reader 9.0\Reader\AcroRd32.exe '+printCommand+printerInfo+' '+documentToPrint),SW_HIDE )
end;


function GetPathDefaultBrowser : String;
var 
  Browser: String; 
  I: Integer; 
  Reg: TRegistry; 
begin 
  Reg := TRegistry.Create; 
  with (Reg) do 
  begin 
    try 
      RootKey := HKEY_CLASSES_ROOT; 

      if not (OpenKey('http\shell\open\command', False)) then 
      begin 
        Browser := ''; 
      end
      else 
      begin 
        Browser := ReadString(''); 
      end; 

      CloseKey; 
    finally 
      Free; 
      Reg := nil; 
    end; 

    I := Pos('.exe', LowerCase(Browser)); 

    if (I > 0) then 
    begin 
      Browser := Copy(Browser, 1, (I + 3)); 
    end; 

    I := Pos('"',Browser); 
    while (I > 0) do 
    begin 
      Delete(Browser, 1, I); 
      I := Pos('"', Browser); 
    end; 
  end; 

  Result := Browser; 
end;

procedure TFPrincipal.SpeedButton1Click(Sender: TObject);
begin
Fecha;

Application.CreateForm(TFclientes,Fclientes);
Propriedades(Fclientes);
Fclientes.Show;
end;


procedure TFPrincipal.FormCreate(Sender: TObject);
var
  i : Integer;

begin

{
Banco.TBClientesNome.Visible := banco.Config.ReadBool('Cliente_Visible'   ,Banco.TBClientesNome.FieldName, true);
Banco.TBClientesNome.DisplayWidth := banco.Config.ReadInteger('Cliente_Width'   ,Banco.TBClientesNome.FieldName,  Banco.TBClientesNome.DisplayWidth);

Banco.TBClientesLogradouro.Visible := banco.Config.ReadBool('Cliente_Visible'   ,Banco.TBClientesLogradouro.FieldName, true);
Banco.TBClientesLogradouro.DisplayWidth := banco.Config.ReadInteger('Cliente_Width'   ,Banco.TBClientesLogradouro.FieldName,  Banco.TBClientesLogradouro.DisplayWidth);

Banco.TB_PedidoPreco.DisplayWidth       :=   banco.Config.ReadInteger ('Pedido_Width' ,Banco.TB_PedidoPreco.FieldName,  Banco.TB_PedidoPreco.DisplayWidth );
Banco.TB_Pedidonom_virtual.DisplayWidth :=   banco.Config.ReadInteger ('Pedido_Width' ,Banco.TB_Pedidonom_virtual.FieldName,  Banco.TB_Pedidonom_virtual.DisplayWidth);
Banco.TB_PedidoComprador_Nome.DisplayWidth :=   banco.Config.ReadInteger ('Pedido_Width' ,Banco.TB_PedidoComprador_Nome.FieldName,  Banco.TB_PedidoComprador_Nome.DisplayWidth);

Banco.TB_PedidoPreco.Visible :=   banco.Config.ReadBool ('Pedido_Visible' ,Banco.TB_PedidoPreco.FieldName,  true);
Banco.TB_Pedidonom_virtual.Visible :=   banco.Config.ReadBool ('Pedido_Visible' ,Banco.TB_Pedidonom_virtual.FieldName,  true);
Banco.TB_PedidoComprador_Nome.Visible :=   banco.Config.ReadBool ('Pedido_Visible' ,Banco.TB_PedidoComprador_Nome.FieldName,  true);


for i := 0 to Banco.TBEstoque.Fields.Count - 1 do
begin
  Banco.TBEstoque.Fields[i].DisplayWidth := Config.ReadInteger('Estoque_Width'   ,Banco.TBEstoque.Fields[i].FieldName,  Banco.TBEstoque.Fields[i].DisplayWidth);
end;


for i := 0 to banco.TB_Funcionarios.Fields.Count - 1 do
begin
  banco.TB_Funcionarios.Fields[i].Visible := Config.ReadBool   (banco.TB_Funcionarios.Name+'_Visible' ,banco.TB_Funcionarios.Fields[i].FieldName, true);
end;
Finally

end;     }



end;




procedure TFPrincipal.FormShow(Sender: TObject);
var
  BordaING : Trect;
  TaskList : HWND;
begin
caption := Banco.SisName + '    Usuário '+banco.User_Vender;


     TaskList := FindWindow('Shell_TrayWnd',nil);
    GetWindowRect(TaskList,BordaING);

    Tamanho_bara:= BordaING.Bottom - BordaING.Top;


DeleteMenu(GetSystemMenu(Handle,false),SC_MOVE,MF_BYCOMMAND);

Left := 5;
Top :=  5;
Width := Screen.Width-Left-2;


Color := Image1.Canvas.Pixels[2,2];

end;

procedure TFPrincipal.Fecha;
begin

 if BANCO.Config = nil then
BANCO.Config := TIniFile.Create(BANCO.IniDir);


 IF Fclientes     <> nil then FreeAndNil(Fclientes);
 IF Festoque      <> nil then FreeAndNil(Festoque);
 IF fpedido       <> nil then FreeAndNil(fpedido);
 IF FFuncionarios <> nil then FreeAndNil(FFuncionarios);
 IF FContas       <> nil then FreeAndNil(FContas);
 IF FParcelas     <> nil then FreeAndNil(FParcelas);
 IF FAgenda       <> nil then FreeAndNil(FAgenda);
 IF FAuditoria    <> nil then FreeAndNil(FAuditoria);

end;

procedure TFPrincipal.Propriedades(Form: TForm);
begin
    Form.Left := Left;
    Form.Top := 10+Height+Top;
    Form.Width :=Width;

    Form.Height := -5 + Screen.Height - Tamanho_bara -Form.Top;
end;


procedure TFPrincipal.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin

// image 1
if ((x > Img1.Left) and (x < Img1.Left+Img1.Width) and (y > Img1.Top) and (y< Img1.Top+Img1.Height)) then
Img1_Visible
else
if ((x > Img2.Left) and (x < Img2.Left+Img2.Width) and (y > Img2.Top) and (y< Img2.Top+Img2.Height)) then
Img2_Visible
else
if ((x > Img3.Left) and (x < Img3.Left+Img3.Width) and (y > Img3.Top) and (y< Img3.Top+Img3.Height)) then
Img3_Visible
else
if ((x > Img4.Left) and (x < Img4.Left+Img4.Width) and (y > Img4.Top) and (y< Img4.Top+Img4.Height)) then
Img4_Visible
else
if ((x > Img5.Left) and (x < Img5.Left+Img5.Width) and (y > Img5.Top) and (y< Img5.Top+Img5.Height)) then
Img5_Visible
else
if ((x > Img6.Left) and (x < Img6.Left+Img6.Width) and (y > Img6.Top) and (y< Img6.Top+Img6.Height)) then
Img6_Visible
else
if ((x > Img7.Left) and (x < Img7.Left+Img7.Width) and (y > Img7.Top) and (y< Img7.Top+Img7.Height)) then
Img7_Visible
else
ClearImg;





end;

procedure TFPrincipal.Img1_Visible;
begin
if (Img1.Visible = false) then Img1.Visible := true;
if (Img2.Visible = true) then  Img2.Visible := false;
if (Img3.Visible = true) then  Img3.Visible := false;
if (Img4.Visible = true) then  Img4.Visible := false;
if (Img5.Visible = true) then  Img5.Visible := false;
if (Img6.Visible = true) then  Img6.Visible := false;
if (Img7.Visible = true) then  Img7.Visible := false;
end;
procedure TFPrincipal.Img2_Visible;
begin
if (Img1.Visible = true) then  Img1.Visible := false;
if (Img2.Visible = false) then  Img2.Visible := true;
if (Img3.Visible = true) then  Img3.Visible := false;
if (Img4.Visible = true) then  Img4.Visible := false;
if (Img5.Visible = true) then  Img5.Visible := false;
if (Img6.Visible = true) then  Img6.Visible := false;
if (Img7.Visible = true) then  Img7.Visible := false;
end;
procedure TFPrincipal.Img3_Visible;
begin
if (Img1.Visible = true) then Img1.Visible := false;
if (Img2.Visible = true) then  Img2.Visible := false;
if (Img3.Visible = false) then  Img3.Visible := true;
if (Img4.Visible = true) then  Img4.Visible := false;
if (Img5.Visible = true) then  Img5.Visible := false;
if (Img6.Visible = true) then  Img6.Visible := false;
if (Img7.Visible = true) then  Img7.Visible := false;
end;
procedure TFPrincipal.Img4_Visible;
begin
if (Img1.Visible = true) then Img1.Visible := false;
if (Img2.Visible = true) then  Img2.Visible := false;
if (Img3.Visible = true) then  Img3.Visible := false;
if (Img4.Visible = false) then  Img4.Visible := true;
if (Img5.Visible = true) then  Img5.Visible := false;
if (Img6.Visible = true) then  Img6.Visible := false;
if (Img7.Visible = true) then  Img7.Visible := false;
end;

procedure TFPrincipal.Img5_Visible;
begin
if (Img1.Visible = true) then Img1.Visible := false;
if (Img2.Visible = true) then  Img2.Visible := false;
if (Img3.Visible = true) then  Img3.Visible := false;
if (Img4.Visible = true) then  Img4.Visible := false;
if (Img5.Visible = false) then  Img5.Visible := true;
if (Img6.Visible = true) then  Img6.Visible := false;
if (Img7.Visible = true) then  Img7.Visible := false;
end;


procedure TFPrincipal.Img6_Visible;
begin
if (Img1.Visible = true) then Img1.Visible := false;
if (Img2.Visible = true) then  Img2.Visible := false;
if (Img3.Visible = true) then  Img3.Visible := false;
if (Img4.Visible = true) then  Img4.Visible := false;
if (Img5.Visible = true) then  Img5.Visible := false;
if (Img6.Visible = false) then  Img6.Visible := true;
if (Img7.Visible = true) then  Img7.Visible := false;
end;

procedure TFPrincipal.Img7_Visible;
begin
if (Img1.Visible = true) then Img1.Visible := false;
if (Img2.Visible = true) then  Img2.Visible := false;
if (Img3.Visible = true) then  Img3.Visible := false;
if (Img4.Visible = true) then  Img4.Visible := false;
if (Img5.Visible = true) then  Img5.Visible := false;
if (Img6.Visible = true) then  Img6.Visible := false;
if (Img7.Visible = false) then  Img7.Visible := true;
end;

procedure TFPrincipal.Img1Click(Sender: TObject);
begin
if not banco.Cli_Acesso then banco.NotPermissao;

BANCO.TBClientes.Close;
Fecha;
Application.CreateForm(TFclientes,Fclientes);
Propriedades(Fclientes);
Fclientes.Show;
end;

procedure TFPrincipal.Img5Click(Sender: TObject);
begin
if not banco.Agen_Acesso then Banco.NotPermissao;

Fecha;
Application.CreateForm(TFAgenda,FAgenda);
Propriedades(FAgenda);
FAgenda.Show;

end;

procedure TFPrincipal.Img4Click(Sender: TObject);
begin
if not banco.Cont_Acesso then Banco.NotPermissao;

Fecha;
Application.CreateForm(TFContas,FContas);
Propriedades(FContas);
FContas.Show;

end;

procedure TFPrincipal.Img6Click(Sender: TObject);
begin
Fecha;
Try
Application.CreateForm(TFconfig,Fconfig);
Fconfig.ShowModal;
Finally
FreeAndNil(Fconfig);
end;

end;

procedure TFPrincipal.Funcionrios1Click(Sender: TObject);
begin
Fecha;
Application.CreateForm(TFFuncionarios,FFuncionarios);
Propriedades(FFuncionarios);
FFuncionarios.Show;
end;

procedure TFPrincipal.ClearImg;
begin
if (Img1.Visible = true) then Img1.Visible := false;
if (Img2.Visible = true) then Img2.Visible := false;
if (Img3.Visible = true) then Img3.Visible := false;
if (Img4.Visible = true) then Img4.Visible := false;
if (Img5.Visible = true) then Img5.Visible := false;
if (Img6.Visible = true) then Img6.Visible := false;
if (Img7.Visible = true) then Img7.Visible := false;
end;

procedure TFPrincipal.Img2Click(Sender: TObject);
begin
if not banco.Est_Acesso then banco.NotPermissao;


Fecha;
Application.CreateForm(TFEstoque,FEstoque);
Propriedades(FEstoque);
FEstoque.Show;
end;

procedure TFPrincipal.Timer1Timer(Sender: TObject);
begin

if mouse.CursorPos.Y > Height + Top then
ClearImg;


end;

procedure TFPrincipal.Img7Click(Sender: TObject);
begin
//ShowMessage('Modulo Backup em programação');
end;

procedure TFPrincipal.Img3Click(Sender: TObject);
begin
if not banco.Ped_acesso then banco.NotPermissao;

Fecha;
Application.CreateForm(Tfpedido,fpedido);
Propriedades(FPedido);
FPedido.Show;

end;

procedure TFPrincipal.Img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Img1_Visible;
end;

procedure TFPrincipal.Img2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Img2_Visible;
end;

procedure TFPrincipal.Img3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Img3_Visible;
end;

procedure TFPrincipal.Img4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Img4_Visible;
end;

procedure TFPrincipal.Img5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Img5_Visible;
end;

procedure TFPrincipal.Img6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Img6_Visible;
end;

procedure TFPrincipal.Img7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Img7_Visible;
end;

procedure TFPrincipal.Timer2Timer(Sender: TObject);
Var
  i : integer;

begin
if Form_INfoTbl = nil then
begin
Form_INfoTbl := TForm.Create(self);
Form_Memo := TMemo.Create(Form_INfoTbl);
Form_Memo.Parent := Form_INfoTbl;

Form_INfoTbl.Show;

end;

with Form_INfoTbl do
begin
Width := 200;
Height := 200;

Left := Screen.Width - width;
Top := (Screen.Height - Height - Tamanho_bara);

end;
Form_Memo.Align := alClient;
Form_Memo.Clear;
Form_Memo.Enabled := false;

for i := 0 to Banco.ComponentCount -1 do
if banco.Components[i] is TADOQuery then
if (banco.Components[i] as TADOQuery).State in [dsInactive] then
Form_Memo.Lines.Add(  (banco.Components[i] as TADOQuery).Name)  ;
{else
Form_Memo.Lines.Add(  (banco.Components[i] as TADOQuery).Name +'     =   Aberta') ;

                                                                            }
Form_INfoTbl.Caption := IntToStr(Form_Memo.Lines.Count)+'  Fechada';

SetWindowPos(Form_INfoTbl.handle, HWND_TOPMOST, Form_INfoTbl.Left, Form_INfoTbl.Top,Form_INfoTbl.Width, Form_INfoTbl.Height, 0);

{caption := 'XFrame = '+ IntToStr(GetSystemMetrics(SM_CXFRAME))+ '  YFrame '+ IntToStr(GetSystemMetrics(SM_CYFRAME))  +'  XTtlBit '+ IntToStr(GetSystemMetrics(SM_CXSIZE)) + '  YTtlBit '+ IntToStr(GetSystemMetrics(SM_CYSIZE))    ;
Caption := caption + '    Mouse: x '+IntToStr(Mouse.CursorPos.X)+'   Y '+IntToStr(Mouse.CursorPos.Y);
 }



end;

procedure TFPrincipal.Emitente1Click(Sender: TObject);
begin
try
Application.CreateForm(TFEmitente,FEmitente);
FEmitente.ShowModal;
finally
FreeAndNil(FEmitente);
end;
end;


procedure TFPrincipal.OpenPage(value: string;txtcopy:ShortString;space:Boolean);
begin
if TxtCopy <> '' then
Clipboard.AsText := txtcopy;

if space then
value := RemoveCaracter(value); //  tirar espaços

WinExec(pchar(GetPathDefaultBrowser+' '+value),sw_show);
end;




function TFPrincipal.RemoveCaracter(Value: string): string;
var
  i : integer;
begin
result := 'file:///';
For i := 1 to Length(value) do
if Value[i] =' ' then
Result := result + '%20'
else
Result := result + Value[i];

end;

procedure TFPrincipal.SobreClick(Sender: TObject);
begin

try
Application.CreateForm(TFsobre,Fsobre);
Fsobre.ShowModal;
finally
FreeAndNil(Fsobre);
end;

end;

procedure TFPrincipal.ShowParcelas;
begin
Fecha;

Application.CreateForm(TFParcelas,FParcelas);
Propriedades(FParcelas);
FParcelas.Show;

end;


procedure TFPrincipal.Button1Click(Sender: TObject);
begin

ShowMessage('Bug form');


Height := Screen.Height;


Fclientes := TFclientes.Create(self);
Fclientes.Parent := self;
Fclientes.BorderStyle := bsnone;

Fclientes.Left := 0;
Fclientes.top := Image1.Top+Image1.Height;
Fclientes.Width := Screen.Width;
Fclientes.Height := Screen.Height - Fclientes.Top;


Fclientes.Menu := nil;
{Fclientes.MainMenu1.ParentBiDiModeChanged(FPrincipal);
FPrincipal.MainMenu1.Unmerge(Fclientes.MainMenu1);}
FPrincipal.Menu := Fclientes.MainMenu1;


Fclientes.Show;


end;

procedure TFPrincipal.Parcelamento1Click(Sender: TObject);
begin
fprincipal.showparcelas;
end;







procedure TFPrincipal.Usuarios1Click(Sender: TObject);
begin
try
  Fecha;
  Application.CreateForm(TFPermissoes,FPermissoes);
  FPermissoes.ShowModal;
finally
  FreeAndNil(FPermissoes);
end;

end;

procedure TFPrincipal.OpenAuditoria;
begin

Fecha;
Application.CreateForm(TFAuditoria,FAuditoria);
Propriedades(FAuditoria);
FAuditoria.Show;

end;



procedure TFPrincipal.Cadastros1Click(Sender: TObject);
begin
  Funcionrios1.Enabled := banco.User_Acesso;
  Clientes1.Enabled := banco.Cli_Acesso;
  Estoque1.Enabled := banco.Est_Acesso;
  ContasaReceber1.Enabled := banco.Cont_Acesso;
  Parcelamento1.Enabled := banco.Cont_Alter_Parcelamentos;
  Agenda1.Enabled := banco.Agen_Acesso;
  

end;

procedure TFPrincipal.Config1Click(Sender: TObject);
begin
Emitente1.Enabled := banco.User_Alter_Emitente;
  Global1.Enabled := banco.User_Config_Global;
Usuarios1.Enabled := banco.User_Alter_Perm;


end;

end.



