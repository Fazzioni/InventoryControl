unit Urecebe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ToolEdit, CurrEdit, StdCtrls, DBCtrls, ExtCtrls, ComCtrls,
  DB, ADODB, Gauges, Grids, DBGrids, ThemeDBGrid, Menus, Buttons, jpeg,DateUtils;

type
  TFRecebe = class(TForm)
    TBContas: TADOQuery;
    Conta_Source: TDataSource;
    TBContasCodigo: TAutoIncField;
    TBContasNPedido: TIntegerField;
    TBContasDataCreate: TDateTimeField;
    TBContasDataVencimento: TDateTimeField;
    TBContasValor: TBCDField;
    TBContasPortador: TIntegerField;
    TBContasPagada: TBooleanField;
    TBContasDataPagada: TDateTimeField;
    TBContasFuncRecebe: TIntegerField;
    TBContasDuplicata: TIntegerField;
    TBContasDescricao: TWideStringField;
    TBContasID_Cliente: TIntegerField;
    TBClientesRecebe: TADOQuery;
    Clientes_Source: TDataSource;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    MododePesquisa1: TMenuItem;
    N1: TMenuItem;
    Clientes1: TMenuItem;
    Contas1: TMenuItem;
    Pedidos1: TMenuItem;
    Img1: TImage;
    Img2: TImage;
    Img3: TImage;
    ThemeDBGrid1: TThemeDBGrid;
    PPThemeGrid1: TPopupMenu;
    Fonte1: TMenuItem;
    Colunas1: TMenuItem;
    abela1: TMenuItem;
    N2: TMenuItem;
    Panel2: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    Label1: TLabel;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    Memo1: TMemo;
    Panel3: TPanel;
    Image2: TImage;
    Bevel2: TBevel;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Edit1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    DBComboBox1: TDBLookupComboBox;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    N3: TMenuItem;
    Listar1: TMenuItem;
    Label11: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label12: TLabel;
    CheckBox2: TCheckBox;
    Receber1: TMenuItem;
    Estorno1: TMenuItem;
    N5: TMenuItem;
    Bevel3: TBevel;
    BTNVOLTA: TBitBtn;
    BitBtn1: TBitBtn;
    Image4: TImage;
    Bevel4: TBevel;
    Image5: TImage;
    Image3: TImage;
    Label13: TLabel;
    TBContasRazoSocial: TStringField;
    TBContasCNPJCPF: TStringField;
    TBContasPortadorVirtual: TStringField;
    PopupMenu2: TPopupMenu;
    OpesdaTabela1: TMenuItem;
    Largura1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Cor1: TMenuItem;
    MenuItem4: TMenuItem;
    IxibirTtulo1: TMenuItem;
    ThemeDBGrid2: TThemeDBGrid;
    TBClientesRecebeCodigo: TAutoIncField;
    TBClientesRecebeNome_Razao: TWideStringField;
    TBClientesRecebeNome: TWideStringField;
    TBClientesRecebeNumero: TWideStringField;
    TBClientesRecebeComplemento: TWideStringField;
    TBClientesRecebeBairro: TWideStringField;
    TBClientesRecebeUF: TWideStringField;
    TBClientesRecebeCep: TWideStringField;
    TBClientesRecebeEmail: TWideStringField;
    TBClientesRecebeDDD_Res: TWideStringField;
    TBClientesRecebeTel_Res: TWideStringField;
    TBClientesRecebeDDD_Come: TWideStringField;
    TBClientesRecebeTel_Come: TWideStringField;
    TBClientesRecebeDDD_Cel: TWideStringField;
    TBClientesRecebeTel_Cel: TWideStringField;
    TBClientesRecebeDDD_Fax: TWideStringField;
    TBClientesRecebeTel_Fax: TWideStringField;
    TBClientesRecebeIE: TWideStringField;
    TBClientesRecebeIM: TWideStringField;
    TBClientesRecebeLogradouro: TWideStringField;
    TBClientesRecebeLogr_Tipo: TIntegerField;
    TBClientesRecebeOBS: TWideStringField;
    TBClientesRecebeCidade_Virtual: TStringField;
    TBClientesRecebeMuniciopio: TIntegerField;
    TBClientesRecebeLogTypeVirtual: TStringField;
    TBClientesRecebeAtivo: TBooleanField;
    TBClientesRecebeCPF: TWideStringField;
    Timer1: TTimer;
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure TBContasFetchProgress(DataSet: TCustomADODataSet; Progress,
      MaxProgress: Integer; var EventStatus: TEventStatus);
    procedure FormCreate(Sender: TObject);
    Function ClienterEnterPress(GridVisible:Boolean):Integer;
    Procedure ShowContas(IdCliente:integer);
    procedure ThemeDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ThemeDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Clientes1Click(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Img0MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img00MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
      Procedure ShowListBox(IdCliente:Integer);
    procedure Memo1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure ThemeDBGrid1CellClick(Column: TColumn);
    procedure ThemeDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormHide(Sender: TObject);
    procedure TBContasAfterOpen(DataSet: TDataSet);
    procedure TBContasBeforeClose(DataSet: TDataSet);
    procedure Fonte1Click(Sender: TObject);
    procedure Colunas1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure ThemeDBGrid2Exit(Sender: TObject);
    procedure ThemeDBGrid1DblClick(Sender: TObject);
    procedure BTNVOLTAClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3Enter(Sender: TObject);
    procedure ThemeDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ThemeDBGrid2DblClick(Sender: TObject);
    procedure Listar1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CurrencyEdit1Change(Sender: TObject);
    procedure Label11MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PPThemeGrid1Popup(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure TBClientesRecebeAfterOpen(DataSet: TDataSet);
    procedure TBClientesRecebeBeforeClose(DataSet: TDataSet);
    procedure Cor1Click(Sender: TObject);
    procedure ThemeDBGrid2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure OpesdaTabela1Click(Sender: TObject);
    procedure IxibirTtulo1Click(Sender: TObject);
    procedure Largura1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure GravaHistAlter;
  private

    { Private declarations }
  public
    PesqIndex : Byte;
    TitleEnabled : Boolean;
    ContaRecebe : Integer;
    RefreshTbl : Boolean;
    CodSave : TBookmarkStr;
    JaExec : Boolean;
    { Public declarations }
  end;

var
  FRecebe: TFRecebe;

implementation

uses UDados, ADOInt, Uvisible, UPrinterConta, IniFiles, Urecibo, Ucontas;

{$R *.dfm}

procedure TFRecebe.Edit2KeyPress(Sender: TObject; var Key: Char);
begin


if key = #13 then
begin
  if (PesqIndex >= 1) then
  if Edit2.Text ='' then
  exit
  else
  if not Banco.IsInt(Edit2.Text) then
  begin
    MessageDlg('Valor inv?lido',mtError,[mbok],0);
    Edit2.SetFocus;
    exit;
  end;

 if PesqIndex = 1 then
 begin
    TBContas.Close;
    TBContas.SQL.Clear;
    TBContas.SQL.Add('Select * from tb_contas');
    TBContas.SQL.Add('Where codigo = '+Edit2.Text);
    if not CheckBox1.Checked then
    TBContas.SQL.Add('and pagada = false');
    try
    TBContas.Open;
    Panel1.Visible := true;
    ThemeDBGrid1.SetFocus;
    except
    end;
 end
 else
 if PesqIndex > 1 then
 begin
    TBContas.Close;
    TBContas.SQL.Clear;
    TBContas.SQL.Add('Select * from tb_contas');
    TBContas.SQL.Add('Where npedido = '+Edit2.Text);
    if not CheckBox1.Checked then
    TBContas.SQL.Add('and pagada = false');
    try
    TBContas.Open;
    Panel1.Visible := true;
    ThemeDBGrid1.SetFocus;
    except
    end;
 end
 else
 if PesqIndex = 0 then
 begin
 ShowContas(ClienterEnterPress(true));

 ShowListBox(TBClientesRecebeCodigo.Value);
 end;


 key := #0;
 


end;




end;

procedure TFRecebe.TBContasFetchProgress(DataSet: TCustomADODataSet;
  Progress, MaxProgress: Integer; var EventStatus: TEventStatus);
begin
try
{ProgressBar.MaxValue := MaxProgress;
ProgressBar.Progress := Progress;}
Application.ProcessMessages;

except
end;

end;

procedure TFRecebe.FormCreate(Sender: TObject);
var
   i : Shortint;
begin
JaExec := false;

PesqIndex := 0;
PesqIndex := banco.Config.ReadInteger('Form_Recebe','SearchType',PesqIndex);
if PesqIndex > 2 then PesqIndex := 0;

ContaRecebe := -1;

//TBContas.ExecuteOptions := [eoAsyncFetch];
//TBContas.ExecuteOptions :=[eoAsyncExecute, eoAsyncFetch, eoAsyncFetchNonBlocking]


Memo1.Color := Color;
Memo1.Clear;

TBContas.Active := false;

try
  for i := 0 to TBContas.FieldCount -1 do
  begin
  TBContas.Fields[i].Index   := banco.Config.ReadInteger(TBContas.Name+'_Position',TBContas.Fields[i].FieldName, TBContas.Fields[i].Index);
  TBContas.Fields[i].Visible := banco.Config.ReadBool   (TBContas.Name+'_Visible' ,TBContas.Fields[i].FieldName, true);
  if TBContas.Fields[i].Tag = 1 then TBContas.Fields[i].Visible := false;
  end;
except
end;



end;

Function TFRecebe.ClienterEnterPress(GridVisible:Boolean):Integer;
begin
Result:=-1;
ThemeDBGrid2.Visible := false;
ThemeDBGrid2.Width := Edit2.Width;


if not (TBClientesRecebe.State in [dsInactive]) then // se estiver aberta
begin
    if LowerCase(TBClientesRecebeNome_Razao.Value) = LowerCase(Edit2.Text) then
    begin
    Result := TBClientesRecebeCodigo.Value;
    exit;
    end;

    if banco.IsInt(Edit2.Text) then
    if TBClientesRecebeCodigo.Value = StrToInt(Edit2.Text) then
    begin
    Result := TBClientesRecebeCodigo.Value;
    Edit2.Text := TBClientesRecebeNome_Razao.Value;
    exit;
    end;
end;



 if Edit2.Text = '' then
 begin
   TBClientesRecebe.Close;
   TBClientesRecebe.SQL.Clear;
   TBClientesRecebe.SQL.Add('Select * from Cliente_Cadastro');
   TBClientesRecebe.open;
   ThemeDBGrid2.Visible := GridVisible;
   if ThemeDBGrid2.Visible then
   ThemeDBGrid2.SetFocus;
   exit;
  end;


if not (TBClientesRecebe.State in [dsInactive]) then // se estiver aberta
if TBClientesRecebe.Locate(TBClientesRecebeNome_Razao.FieldName,Edit2.Text,[]) then
begin
Result := TBClientesRecebeCodigo.Value;
Edit2.Text := TBClientesRecebeNome_Razao.Value;
exit;
end;

  if Banco.IsInt(Edit2.Text) then
   Try
    StrToInt(Edit2.Text);
    TBClientesRecebe.Close;
    TBClientesRecebe.SQL.Clear;
    TBClientesRecebe.SQL.Add('Select * from Cliente_Cadastro');
    TBClientesRecebe.SQL.Add('where codigo = '+Edit2.Text);
    TBClientesRecebe.Open;

    if TBClientesRecebe.RecordCount > 0 then
    begin
     Edit2.Text := TBClientesRecebeNome_Razao.Value;
     Result := TBClientesRecebeCodigo.Value;
    exit;
    end;

   Except
   end;

  ThemeDBGrid2.Visible := GridVisible;
  if ThemeDBGrid2.Visible then
  ThemeDBGrid2.SetFocus;

  TBClientesRecebe.Close;
  TBClientesRecebe.SQL.Clear;
  TBClientesRecebe.SQL.Add('Select * from Cliente_Cadastro');
  TBClientesRecebe.SQL.Add('where nome_razao like '+chr(39)+Edit2.Text+'%'+chr(39));
  TBClientesRecebe.Open;

  if TBClientesRecebe.RecordCount = 0 then
  begin
  TBClientesRecebe.Close;
  TBClientesRecebe.SQL.Clear;
  TBClientesRecebe.SQL.Add('Select * from Cliente_Cadastro');
  TBClientesRecebe.Open;
  end;




end;



procedure TFRecebe.ThemeDBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF Key = vk_up then
if TBClientesRecebe.RecNo = 1 then
begin
Edit2.SetFocus;

key:=0;

end;




end;

procedure TFRecebe.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_down then
if ThemeDBGrid2.Visible then
ThemeDBGrid2.SetFocus;

end;

procedure TFRecebe.ThemeDBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
ThemeDBGrid2.Visible := false;
  if TBClientesRecebe.RecordCount > 0 then
  begin
    Edit2.Text := TBClientesRecebeNome_Razao.Value;
    ShowContas(TBClientesRecebeCodigo.Value);
    ShowListBox(TBClientesRecebeCodigo.Value);
  end
  else
    Edit2.SetFocus;
end;
end;

procedure TFRecebe.ShowContas(IdCliente: integer);
begin
if IdCliente = -1 then
exit;

  TBContas.Close;
  TBContas.SQL.Clear;
  TBContas.SQL.Add('Select * from tb_contas');
  TBContas.SQL.Add('Where id_cliente = '+IntToStr(IdCliente));
  if not CheckBox1.Checked then
  TBContas.SQL.Add('and pagada = false');


  try
  TBContas.Open;
  Panel1.Visible := true;
  ThemeDBGrid1.SetFocus;
 
  except
  end;


end;

procedure TFRecebe.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ThemeDBGrid2.Visible := false;

PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFRecebe.Clientes1Click(Sender: TObject);
begin
PesqIndex := 0;
Image1.Picture := Img1.Picture;


end;

procedure TFRecebe.Contas1Click(Sender: TObject);
begin
PesqIndex := 1;
Image1.Picture := Img2.Picture;
end;

procedure TFRecebe.Pedidos1Click(Sender: TObject);
begin
PesqIndex := 2;
Image1.Picture := Img3.Picture;
end;

procedure TFRecebe.PopupMenu1Popup(Sender: TObject);
begin
 Clientes1.Checked := false;
  Contas1.Checked := false;
 Pedidos1.Checked := false;

 if PesqIndex = 0 then
 Clientes1.Checked := true
 else
 if PesqIndex = 1 then
 Contas1.Checked := true
 else
 Pedidos1.Checked := true;





end;

procedure TFRecebe.FormShow(Sender: TObject);
begin
Banco.LoadIndexOf(TBClientesRecebe);
RefreshTbl := false;

TitleEnabled := false;

if Banco.TBMunicipio.State in [dsInactive] then
Banco.TBMunicipio.Open;

ThemeDBGrid1.Font := banco.font_grid[7];

if PesqIndex = 0 then
Image1.Picture := Img1.Picture
else
if PesqIndex = 1 then
Image1.Picture := Img2.Picture
else
Image1.Picture := Img3.Picture;

try
Width  := banco.Config.ReadInteger('Size_Receber','Width',Width);
Height := banco.Config.ReadInteger('Size_Receber','Height',Height);
ThemeDBGrid2.Height := banco.Config.ReadInteger('Size_Receber_CliHeight','Height',ThemeDBGrid2.Height);

except end;


Image3.Align := alClient;
Image3.Center := True;
Image3.Parent := self;
Image3.Top := Height;
Image3.Left := Width;


banco.LoadIndexOf(TBContas);


TitleEnabled := banco.Config.ReadBool('Frecebe','TitleClientes',TitleEnabled);

if TitleEnabled then
ThemeDBGrid2.Options := ThemeDBGrid2.Options + [dgTitles]
else
ThemeDBGrid2.Options := ThemeDBGrid2.Options - [dgTitles];


CheckBox2.Checked := banco.Config.ReadBool('Form_Recebe','PrintRecibo',CheckBox2.Checked);
CheckBox1.Checked := banco.Config.ReadBool('Form_Recebe','ViewPaga',CheckBox1.Checked);







end;

procedure TFRecebe.Img0MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
{
if (x > Image3.Left) and (x < Image3.Left+Image3.Width) and (y > Image3.Top) and (y< Image3.Top+Image3.Height) then
begin
 if Image3.Visible = false then Image3.Visible := true;
 if Image4.Visible = true  then Image4.Visible := false;
 end
else
if (x > Image4.Left) and (x < Image4.Left+Image4.Width) and (y > Image4.Top) and (y< Image4.Top+Image4.Height) then
begin
 if Image4.Visible = false then Image4.Visible := true;
 if Image3.Visible = true  then Image3.Visible := false;
 end
else
begin
    if Image3.Visible = true then Image3.Visible := false;
    if Image4.Visible = true  then Image4.Visible := false;
end;}


//    if Image3.Visible = false then Image3.Visible := true;
//    if Image4.Visible = true  then Image4.Visible := false




end;

procedure TFRecebe.Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

//if Image4.Visible then Image4.Visible := false;

end;

procedure TFRecebe.Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
//if Image3.Visible then Image3.Visible := false;

end;

procedure TFRecebe.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
//    if Image3.Visible = true then Image3.Visible := False;
//    if Image4.Visible = true  then Image4.Visible := false

end;

procedure TFRecebe.Img00MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
//    if Image3.Visible = true then Image3.Visible := false;
//    if Image4.Visible = false  then Image4.Visible := true;
end;

procedure TFRecebe.ShowListBox(IdCliente:Integer);
begin
try
Memo1.Clear;


if TBClientesRecebe.State in [dsInactive] then
begin
TBClientesRecebe.Close;
TBClientesRecebe.SQL.Clear;
TBClientesRecebe.SQL.Add('Select * from Cliente_cadastro');
TBClientesRecebe.Open;
end;



if not (TBClientesRecebeCodigo.Value = IdCliente) then
if not (TBClientesRecebe.Locate(TBClientesRecebeCodigo.FieldName,IdCliente,[])) then
begin

TBClientesRecebe.Close;
TBClientesRecebe.SQL.Clear;
TBClientesRecebe.SQL.Add('Select * from Cliente_cadastro');
TBClientesRecebe.Open;

if not TBClientesRecebe.Locate(TBClientesRecebeCodigo.FieldName,IdCliente,[]) then
begin
Memo1.Clear;
exit;
end;

end;

Memo1.Clear;

Memo1.Lines.Add('       C?digo: '+IntToStr(TBClientesRecebeCodigo.Value));
Memo1.Lines.Add(' Raz?o Social: '+TBClientesRecebeNome_Razao.Value);
Memo1.Lines.Add('     CNPJ/CPF: '+TBClientesRecebeCPF.Value);
Memo1.Lines.Add('           UF: '+TBClientesRecebeUF.Value + ' - '+TBClientesRecebeCidade_Virtual.Value);
if not TBClientesRecebeTel_Come.IsNull then  if TBClientesRecebeTel_Come.Value  <> ' ' then
Memo1.Lines.Add('    Comercial: '+banco.FormataTel(TBClientesRecebeDDD_Come.Value,TBClientesRecebeTel_Come.Value));
if not TBClientesRecebeTel_Res.IsNull then  if TBClientesRecebeTel_Res.Value  <> ' ' then
Memo1.Lines.Add('  Residencial: '+banco.FormataTel(TBClientesRecebeDDD_Res.Value,TBClientesRecebeTel_Res.Value));
if not TBClientesRecebeTel_Cel.IsNull then  if TBClientesRecebeTel_Cel.Value  <> ' ' then
Memo1.Lines.Add('      Celular: '+banco.FormataTel(TBClientesRecebeDDD_Cel.Value,TBClientesRecebeTel_Cel.Value));
except
Memo1.Clear;
end;


end;

procedure TFRecebe.Memo1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
Handled := true;

end;

procedure TFRecebe.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
key := 0;

end;

procedure TFRecebe.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
key := #0;

end;

procedure TFRecebe.FormResize(Sender: TObject);
begin
 Bevel1.Width := Self.Width - (Bevel1.Left * 3);
 Edit2.Width := Self.Width - ( Edit2.Left * 2); Edit2.Width := Edit2.Width - Image2.Width -1;

 Image2.Left := Edit2.Left + Edit2.Width;
 Image2.top := Edit2.top -1;

 Memo1.Width := Edit2.Width;

 Bevel2.Width := Panel3.Width - (Bevel2.Left *2);
 Bevel4.Left :=  Bevel2.Width -Bevel2.Left - Bevel4.Width;
 
 DBEdit5.Width :=  ((Panel3.Width - DBEdit5.left) *20) div 100;
 DBEdit3.Width := DBEdit5.Width;
 DBEdit2.Width := DBEdit5.Width;
 DBEdit4.Width := DBEdit5.Width;
 DBEdit6.Width := DBEdit5.Width;
 Image5.Left :=  DBEdit3.Left + DBEdit3.Width +3;
 label13.left := DBEdit2.Width + DBEdit2.Left + 3;

 Edit1.Width :=  Bevel4.Left - Edit1.Left -  32;
 Image4.Left := Edit1.Left +Edit1.Width +2;


 Label2.left := Bevel4.Left;
 CurrencyEdit1.Left := Bevel4.Left + 16;
 Label11.left := CurrencyEdit1.Left;
 CurrencyEdit2.Left := CurrencyEdit1.Left+CurrencyEdit1.Width + 20;
 Label12.Left := CurrencyEdit2.Left;

 DBEdit1.Width := Edit1.Width+ (Edit1.Width+Edit1.Left-Image4.Left) +Image4.Width;


 DBComboBox1.Width :=  ((Panel3.Width - DBEdit5.left) *35) div 100;

 Bevel3.Width := Bevel2.Width;

 BitBtn1.Left := Bevel3.Width - BitBtn1.Width - 10;
 BTNVOLTA.Left := BitBtn1.Left - 10 - BTNVOLTA.Width;
 
Image3.Left := Bevel4.Left + (Bevel4.Width div 4);



end;

procedure TFRecebe.ThemeDBGrid1CellClick(Column: TColumn);
begin
if TBContas.RecordCount > 0 then ShowListBox(TBContasID_Cliente.Value);
end;

procedure TFRecebe.ThemeDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if TBContas.RecordCount > 0 then
ShowListBox(TBContasID_Cliente.Value);
end;

procedure TFRecebe.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin
HoldColor := ThemeDBGrid1.Brush.Color;
 if TBContas.RecordCount = 0 then
 begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
 end
 else
 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;


    if (TBContasDataVencimento.Value < Date) and (TBContasPagada.Value = false) then
    (Sender as TThemeDBGrid).Canvas.Font.Color := Banco.Contas_Color_Atrasada
    else
    if TBContasPagada.Value then
    (Sender as TThemeDBGrid).Canvas.Font.Color := Banco.Contas_Color_Pagada
    else
    (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;


  end
 else
  begin
    if (TBContasDataVencimento.Value < Date) and (TBContasPagada.Value = false) then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Contas_Color_Atrasada
    else
    if TBContasPagada.Value then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Contas_Color_Pagada;


 end;

(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TFRecebe.FormHide(Sender: TObject);
var
  i : Shortint;
begin

{
try
  for i := 0 to TBContas.FieldCount -1 do
  begin
  banco.Config.WriteInteger(TBContas.Name+'_Position',TBContas.Fields[i].FieldName, TBContas.Fields[i].Index);
  banco.Config.WriteBool   (TBContas.Name+'_Visible' ,TBContas.Fields[i].FieldName, TBContas.Fields[i].Visible);
  end;
except

end;
      }

banco.SaveIndexOf(TBContas);

banco.Config.WriteInteger('Size_Receber','Width',Width);
banco.Config.WriteInteger('Size_Receber','Height',Height);
banco.Config.WriteInteger('Size_Receber_CliHeight','Height',ThemeDBGrid2.Height);

banco.Config.WriteBool('Form_Recebe','PrintRecibo',CheckBox2.Checked);
banco.Config.WriteBool('Form_Recebe','ViewPaga',CheckBox1.Checked);
banco.Config.WriteInteger('Form_Recebe','SearchType',PesqIndex);


TBContas.Close;

if RefreshTbl then
begin
banco.TB_Contas.DisableControls;
CodSave := Banco.TB_Contas.Bookmark;
Banco.SaveColumns(FContas.ThemeDBGrid1);
Banco.TB_Contas.close;
banco.TB_Contas.Open;
Banco.LoadColumns(FContas.ThemeDBGrid1);
Banco.TB_Contas.Bookmark := CodSave;
banco.TB_Contas.EnableControls;
end;

end;


procedure TFRecebe.TBContasAfterOpen(DataSet: TDataSet);
var
  i : Shortint;
begin
Banco.LoadColumns(ThemeDBGrid1);

end;

procedure TFRecebe.TBContasBeforeClose(DataSet: TDataSet);
begin
Banco.SaveColumns(ThemeDBGrid1);
end;

procedure TFRecebe.Fonte1Click(Sender: TObject);
begin
Banco.FontDialog.Font := banco.font_grid[8];

if Banco.FontDialog.Execute then
begin
banco.Font_Grid[8] := banco.FontDialog.Font;
Banco.Font_Grid[8].Style := [];
ThemeDBGrid2.Font := banco.FontDialog.Font;
end;



end;

procedure TFRecebe.Colunas1Click(Sender: TObject);
var
  i : integer;
begin
  Try
    Application.CreateForm(TFVisible,FVisible);

    for i := 0 to TBContas.FieldCount -1 do
    if TBContas.Fields[i].Tag = 0 then
    FVisible.CheckListBox1.Checked[FVisible.CheckListBox1.Items.Add(TBContas.Fields[i].DisplayLabel,)] := TBContas.Fields[i].Visible;

    FVisible.ShowModal;
  Finally
    if FVisible.ModalResult = 1 then
    begin
     for i := 0 to FVisible.CheckListBox1.Items.Count -1 do
     TBContas.Fields[Banco.SearchField(TBContas,FVisible.CheckListBox1.Items[i],false)].Visible := FVisible.CheckListBox1.Checked[i];

    try
    for i := 0 to TBContas.FieldCount -1 do
    begin
    banco.Config.WriteInteger(TBContas.Name+'_Position',TBContas.Fields[i].FieldName, TBContas.Fields[i].Index);
    banco.Config.WriteBool   (TBContas.Name+'_Visible' ,TBContas.Fields[i].FieldName, TBContas.Fields[i].Visible);
    end;
    except
    end;

     end;

   FreeAndNil(FVisible);
end;
end;

procedure TFRecebe.CheckBox1Click(Sender: TObject);
begin
  if (PesqIndex >= 1) then
  if Edit2.Text ='' then
  begin
  ThemeDBGrid2.Visible := false;
  Memo1.Clear;
  exit;
  end
  else
  if not Banco.IsInt(Edit2.Text) then
  begin
    Edit2.SetFocus;
    Memo1.Clear;
    exit;
  end;

 if PesqIndex = 1 then
 begin
    TBContas.Close;
    TBContas.SQL.Clear;
    TBContas.SQL.Add('Select * from tb_contas');
    TBContas.SQL.Add('Where codigo = '+Edit2.Text);
    if not CheckBox1.Checked then
    TBContas.SQL.Add('and pagada = false');
    try
    TBContas.Open;
    Panel1.Visible := true;
    ThemeDBGrid1.SetFocus;
    except
    end;
 end
 else
 if PesqIndex > 1 then
 begin
    TBContas.Close;
    TBContas.SQL.Clear;
    TBContas.SQL.Add('Select * from tb_contas');
    TBContas.SQL.Add('Where npedido = '+Edit2.Text);
    if not CheckBox1.Checked then
    TBContas.SQL.Add('and pagada = false');
    try
    TBContas.Open;
    Panel1.Visible := true;
    ThemeDBGrid1.SetFocus;
    except
    end;
 end
 else
 if PesqIndex = 0 then
 begin

  if TBClientesRecebe.State in [dsInactive] then
  begin
  Edit2.SetFocus;
  exit;
  end;

 ShowContas(ClienterEnterPress(false));
end;
end;

procedure TFRecebe.Edit2Enter(Sender: TObject);
begin
Panel1.Visible := false;
Panel3.Visible := false;

end;

procedure TFRecebe.ThemeDBGrid2Exit(Sender: TObject);
begin
(Sender as TThemeDBGrid).visible := false;
end;

procedure TFRecebe.ThemeDBGrid1DblClick(Sender: TObject);   //recebe conta   -------------------------------
begin
if TBContas.RecordCount = 0 then
exit;

Label13.Caption := '';

if TBContasPagada.Value = false then
begin
Panel1.Visible := false;
Panel3.Visible := true;



Edit1.Text := '';
if not TBContasID_Cliente.IsNull then
ShowListBox(TBContasID_Cliente.Value);
Edit1.Text := TBClientesRecebeNome_Razao.Value;


TBContas.edit;
TBContasDataPagada.Value := Date;
DBEdit2.Color := clWindow;

if TBContasDataVencimento.Value < Date then
begin
DBEdit2.Color := banco.Contas_Color_Atrasada;
Label13.Caption := IntToStr(DaysBetween(TBContasDataVencimento.Value, date)+1)+' Dia(s)';
end;



Panel2.Visible := false;

CurrencyEdit1.Value := TBContasValor.Value;

Label11.Caption := '';
  try
  Label11.Caption := 'R$ '+FormatFloat(',0.00',TBContasValor.Value);
  except
  Label11.Caption := '0.00';
  end;


CurrencyEdit1Change(CurrencyEdit1);


Image3.Align := alNone;
Image3.Center := false;
Image3.Parent := Panel3;
Image3.Top := 17;


//Image3.Left := Bevel4.Left + (Bevel4.Width div 4);
FormResize(Self);



try
BitBtn1.SetFocus;
except end;

end;

end;

procedure TFRecebe.BTNVOLTAClick(Sender: TObject);
begin
Panel3.Visible := false;
Panel1.Visible := true;
TBContas.Cancel;
Panel2.Visible := true;
ThemeDBGrid1.SetFocus;
//BorderIcons := [biSystemMenu];

Image3.Align := alClient;
Image3.Center := True;
Image3.Parent := self;
Image3.Top := Height;
Image3.Left := Width;

end;

procedure TFRecebe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
begin
  if Panel3.Visible then
  BTNVOLTAClick(BTNVOLTA)
  else
  if Panel1.Visible then
  begin
  Panel1.Visible := false;
  Memo1.Clear;
  Edit2.SetFocus;
  end
  else


  close;
  

end;

end;

procedure TFRecebe.DBEdit3ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
Handled := true;
end;

procedure TFRecebe.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
key := #0;
end;

procedure TFRecebe.DBEdit3Enter(Sender: TObject);
begin
Self.Perform(WM_NEXTDLGCTL,0,0);

end;

procedure TFRecebe.ThemeDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
ThemeDBGrid1DblClick(Sender);
end;

procedure TFRecebe.ThemeDBGrid2DblClick(Sender: TObject);
var
key : char;
begin
key := #13;
ThemeDBGrid2KeyPress(sender,key);
end;

procedure TFRecebe.Listar1Click(Sender: TObject);
begin
banco.ListaQuery(TBContas,'Contas a receber',TBContasDescricao.Index);

end;

procedure TFRecebe.Button1Click(Sender: TObject);
var
  AuxDate : Tdate;
  QueryAux : TADOQuery;
  AuxBol : Boolean;
begin

AuxBol := false;

if TBContasValor.Value <> CurrencyEdit1.Value then
if  MessageDlg('O valor vai ser ajustado, deseja continuar?',mtConfirmation,[mbyes,mbno],0) = mrno then
exit;



try
  TBContasPagada.Value := true;
  TBContasDataPagada.Value := now;
  TBContasFuncRecebe.Value := banco.User_cod;
  GravaHistAlter;
  
  TBContas.Post;
  RefreshTbl := true;
except
  on e : exception do
  begin
  MessageDlg('N?o foi poss?vel receber esta conta, mensagem original'+#13+e.Message,mtError, [mbok],0);
  BTNVOLTAClick(BTNVOLTA);
  exit;
  end;
end;

 { try
  Application.CreateForm(TFPrinterContas,FPrinterContas);
  FPrinterContas.ShowModal;
  finally
  FreeAndNil(FPrinterContas);
  end;
       }

  //Verificando se todas as parcelas de um pedido foi pago, para mudar a situa??o.
  if not TBContasNPedido.IsNull then
  if banco.Alter_Situacao > 0 then
  begin
    // pesquisa a nova situa??o
    if Banco.TB_Situacao.State in [dsInactive] then banco.TB_Situacao.Open;


   //verificar se todas as contas foi pagada;
    try
      QueryAux := TADOQuery.Create(self);
      QueryAux.Connection := Banco.ADOConnection1;
      QueryAux.SQL.clear;
      QueryAux.SQL.Add('Select Pagada,NPedido from TB_Contas');
      QueryAux.SQL.Add('Where Pagada = false and NPedido ='+IntToStr(TBContasNPedido.Value));
      QueryAux.Open;


      if QueryAux.RecordCount = 0 then
      if not banco.TB_Situacao.Locate(banco.TB_SituacaoCodigo.FieldName,Banco.Alter_Situacao,[]) then
      MessageDlg('A configura??o informada ? inv?lida: '+#13+'Altere no modulo Configura??es: op??o habilitada para editar a situa??o de um pedido apos receber todas as parcelas'+#13+'O pedido n?o ser? alterado',mtError,[mbok],0)
      else
      begin
        QueryAux.close;
        QueryAux.Active := false;
        QueryAux.SQL.Clear;
        QueryAux.SQL.Add('Select ID_Pedido,situacao from Venda_Info');
        QueryAux.SQL.Add('Where ID_Pedido = '+IntToStr(TBContasNPedido.Value));
        QueryAux.Open;

        if QueryAux.RecordCount = 0 then
        MessageDlg('Existe um erro n?o identificado no pedido '+IntToStr(TBContasNPedido.Value),mtError,[mbok],0)
        else
        begin
          QueryAux.Edit;
          QueryAux.FieldByName('situacao').Value := banco.Alter_Situacao;
          try
          QueryAux.Post;
          MessageDlg('A situa??o do pedido '+IntToStr(TBContasNPedido.Value)+' foi alterada para '+Banco.TB_SituacaoDescri.Value,mtInformation,[mbok],0);
          except
            on exp : exception do
            begin
            MessageDlg('Erro ao alterar a situa??o do pedido '+IntToStr(TBContasNPedido.Value)+' mensagem original, '+#13+exp.Message,mtError,[mbok],0);
            banco.Create_Erro(exp.ClassName,exp.message);
            end;
          end;
        end;

    end;
   finally
   QueryAux.Close;
   QueryAux.Connection := nil;
   FreeAndNil(QueryAux);
   end;


  end;


  BTNVOLTAClick(BTNVOLTA);



// alterando registro na tabela clientes atrasados
//  banco.TB_Cliente_ContaVencimento = primeira parcela vencia
{try
if banco.TB_Cliente_Conta.Locate(banco.TB_Cliente_ContaID_Cliente.FieldName,TBContasID_Cliente.Value,[]) then
if (banco.TB_Cliente_ContaVencimento.Value = TBContasDataVencimento.Value) and(banco.TB_Cliente_ContaValorTotal.Value = TBContasValor.Value) then
banco.TB_Cliente_Conta.Delete
else
begin
banco.TB_Cliente_Conta.Edit;
banco.TB_Cliente_ContaValorTotal.Value :=  banco.TB_Cliente_ContaValorTotal.Value - TBContasValor.Value;
banco.TB_Cliente_Conta.Post;
end;
except
  on e :exception do
  begin
  MessageDlg('Ocorreu um erro ao verificar as contas atrasadas do cliente, mensagem original'+#13+e.Message,mtError,[mbok],0);
  Banco.Create_Erro(e.ClassName,e.Message);
  end;
end;   }



if CheckBox2.Checked then
begin
  try
    Application.CreateForm(Tfrecibo,FRecibo);
    AuxDate := date;
    if not(TBContasDataPagada.IsNull) then AuxDate:= TBContasDataPagada.Value;
    FRecibo.PrinterRecibo(Edit1.Text,TBContasDescricao.Value,TBContasValor.Value,TBContasCodigo.Value,AuxDate);
  finally
    FreeAndNil(FRecibo);
  end;


end;


end;


procedure TFRecebe.CurrencyEdit1Change(Sender: TObject);
begin
try
CurrencyEdit2.Value := CurrencyEdit1.Value  - TBContasValor.Value;

if CurrencyEdit2.Value < 0 then
CurrencyEdit2.Color := BANCO.Contas_Color_Atrasada
else
if CurrencyEdit2.Value > 0 then
CurrencyEdit2.Color := banco.Contas_Color_Pagada
else
CurrencyEdit2.Color := clActiveCaption;



except
CurrencyEdit2.Value := 0;
CurrencyEdit2.Color := clWindow;
end;


end;

procedure TFRecebe.Label11MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
CurrencyEdit1.Value := TBContasValor.Value;
CurrencyEdit1Change(CurrencyEdit1);

end;

procedure TFRecebe.Image4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

if Edit1.Text <> '' then
if Button = mbLeft then
if MessageDlg('Deseja visualizar o hist?rico do cliente?',mtConfirmation,[mbyes,mbno],0) = mryes then
banco.HistoricoCliente(TBContasID_Cliente.Value);

end;

procedure TFRecebe.Image5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

if MessageDlg('Deseja visualizar o pedido em PDF?',mtConfirmation,[mbyes,mbno],0) = mrno then
exit;

if not (banco.TB_Pedido.State in [dsInactive]) then banco.TB_Pedido.Close;

banco.TB_Pedido.SQL.Clear;
{banco.TB_Pedido.SQL.Add('Select  A.*, B.nome_razao, B.nome, B.UF, B.Municiopio, B.cpf from');
banco.TB_Pedido.SQL.Add('Venda_info A inner join Cliente_cadastro B on');
banco.TB_Pedido.SQL.Add('A.id_cliente = b.codigo'); }
banco.TB_Pedido.SQL.Add(Banco.Sql_Tb_Pedido_Default);
banco.TB_Pedido.SQL.Add('where A.id_pedido = '+IntToStr(TBContasNPedido.value));
banco.TB_Pedido.Open;

if banco.TB_Pedido.RecordCount = 0 then
MessageDlg('Erro ao procurar pedido',mtError,[mbok],0)
else
banco.GeraDav;

end;



procedure TFRecebe.PPThemeGrid1Popup(Sender: TObject);
begin
Receber1.Enabled := false;
Estorno1.Enabled := false;

if TBContas.RecordCount > 0 then
begin
Receber1.Enabled := not(TBContasPagada.Value);
Estorno1.Enabled := TBContasPagada.Value;
end;
end;

procedure TFRecebe.Edit2Change(Sender: TObject);
begin
Memo1.Clear;

end;

procedure TFRecebe.MenuItem3Click(Sender: TObject);
var
  i : Smallint;
begin
  Try
    Application.CreateForm(TFVisible,FVisible);

    for i := 0 to TBClientesRecebe.FieldCount -1 do
    if TBClientesRecebe.Fields[i].Tag = 0 then
    FVisible.CheckListBox1.Checked[FVisible.CheckListBox1.Items.Add(TBClientesRecebe.Fields[i].DisplayLabel)] := TBClientesRecebe.Fields[i].Visible;

    FVisible.ShowModal;
  Finally

    if FVisible.ModalResult = 1 then
    begin
     for i := 0 to FVisible.CheckListBox1.Items.Count -1 do
     TBClientesRecebe.Fields[Banco.SearchField(TBClientesRecebe,FVisible.CheckListBox1.Items[i],false)].Visible := FVisible.CheckListBox1.Checked[i];
     banco.SaveIndexOf(TBClientesRecebe);
     end;

   FreeAndNil(FVisible);
end;
end;


procedure TFRecebe.TBClientesRecebeAfterOpen(DataSet: TDataSet);
var
  i : Smallint;
begin
Banco.LoadColumns(ThemeDBGrid2);
For i := 0 to TBClientesRecebe.Fields.Count -1 do
if TBClientesRecebe.Fields[i].Tag > 0 then
TBClientesRecebe.Fields[i].Visible := false;

end;

procedure TFRecebe.TBClientesRecebeBeforeClose(DataSet: TDataSet);
begin
Banco.SaveColumns(ThemeDBGrid2);
end;

procedure TFRecebe.Cor1Click(Sender: TObject);
begin
banco.ColorDialog.Color := Banco.Cor_Grid [8];

if banco.ColorDialog.Execute then
begin
Banco.Cor_Grid[8] := Banco.ColorDialog.Color;
ThemeDBGrid2.Refresh;
end;

end;

procedure TFRecebe.ThemeDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  holdcolor : TColor;
begin
HoldColor := ThemeDBGrid2.Brush.Color;


if not JaExec then
begin
JaExec := true;
showScrollBar(ThemeDBGrid2.Handle,SB_HORZ,false);
end;


 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
  end
 else
  begin
   if Banco.Cor_Grid[8] <> clwhite then
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Cor_Grid[8]
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;
 end;

 (Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFRecebe.OpesdaTabela1Click(Sender: TObject);
begin
IxibirTtulo1.Checked :=TitleEnabled;


end;

procedure TFRecebe.IxibirTtulo1Click(Sender: TObject);
begin
TitleEnabled := not (TitleEnabled);
banco.Config.WriteBool('Frecebe','TitleClientes',TitleEnabled);

if TitleEnabled then
ThemeDBGrid2.Options := ThemeDBGrid2.Options + [dgTitles]
else
ThemeDBGrid2.Options := ThemeDBGrid2.Options - [dgTitles];


end;

procedure TFRecebe.Largura1Click(Sender: TObject);
var
  aux : string;
begin
aux := '0';
aux := IntToStr(ThemeDBGrid2.Height);
if InputQuery('Editando Tabela','Informe a nova altura',aux) then
begin
  if not Banco.IsInt(aux) then
  MessageDlg('Altura incorreta',mtError,[mbok],0)
  else
    try
    if StrToInt(aux) < 20 then
    raise Exception.Create('O valor deve ser maior que "20"');

    ThemeDBGrid2.Height := StrToInt(aux);
    Except
    MessageDlg('Altura incorreta',mtError,[mbok],0)
   end;
end;
end;


procedure TFRecebe.Timer1Timer(Sender: TObject);
var
  key : Char;
begin
key := #13;
if ContaRecebe > 0 then
begin
Timer1.Enabled := false;
Contas1Click(self);
Edit2.Text := IntToStr(ContaRecebe);
Edit2KeyPress(Edit2,key);

end
else
Timer1.Enabled := false;




end;

procedure TFRecebe.GravaHistAlter;
  procedure InserHist(Alteracao: ShortString);
  begin
  Try
  banco.ExecSQLTB.SQL.Clear;
  banco.ExecSQLTB.SQL.Add('Insert into tb_Cont_hist (ID_Func,Alteracao,Data,ID_Conta)');
  banco.ExecSQLTB.SQL.Add('Values ('+IntToStr(banco.User_cod)+',"'+Alteracao+'","'+
  FormatDateTime('YYYY/MM/DD',Date)+' '+FormatDateTime('hh:mm:ss',time)+'",'+IntToStr(TBContasCodigo.value)+')');
  banco.ExecSQLTB.ExecSQL;
  except
  end;
  end;

var
  I : Shortint;
begin

if TBContasPagada.OldValue <> TBContasPagada.Value then
if TBContasPagada.Value then
InserHist('#$:=R3C3B!D4');



end;

end.



