unit Ufinaliza;

interface                                                                                      
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, Grids, DBGrids,
  DBCtrls, ThemeDBGrid, ComCtrls, ExtCtrls, Menus, RXDBCtrl, math, db, adodb;

type
  TFFinaliza = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit1: TCurrencyEdit;
    DBEdit1: TDBEdit;
    DBLookCid: TDBLookupComboBox;
    Label6: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    TabSheet3: TTabSheet;
    Panel4: TPanel;
    Edit1: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    Label13: TLabel;
    ThemeDBGrid3: TThemeDBGrid;
    TabSheet4: TTabSheet;
    DBMemo1: TDBMemo;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    CopiarTUdo1: TMenuItem;
    Arquivo1: TMenuItem;
    Abrir1: TMenuItem;
    Salvar1: TMenuItem;
    N1: TMenuItem;
    Limpar1: TMenuItem;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label7: TLabel;
    ListView1: TListView;
    CheckBox1: TCheckBox;
    DBComboBox1: TDBLookupComboBox;
    Label25: TLabel;
    Panel5: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Splitter1: TSplitter;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    SpeedButton2: TSpeedButton;
    Panel6: TPanel;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit3: TDBEdit;
    Label11: TLabel;
    Label20: TLabel;
    DBEdit14: TDBEdit;
    Label23: TLabel;
    DBEdit21: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    ComboBox1: TComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label15: TLabel;
    DBLookTipolog: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    Label16: TLabel;
    DBEdit9: TDBEdit;
    Label17: TLabel;
    DBEdit5: TDBEdit;
    DBEdit16: TDBEdit;
    Label19: TLabel;
    DBEdit13: TDBEdit;
    DBEdit19: TDBEdit;
    Label18: TLabel;
    DBEdit15: TDBEdit;
    Label21: TLabel;
    DBEdit11: TDBEdit;
    DBEdit18: TDBEdit;
    Label22: TLabel;
    DBEdit10: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit8: TDBEdit;
    Label24: TLabel;
    Label36: TLabel;
    DBEdit7: TDBEdit;
    Label37: TLabel;
    DBMemo2: TDBMemo;
    Label38: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Edit3: TEdit;
    Image2: TImage;
    PopupMenu2: TPopupMenu;
    OpesdaTabela1: TMenuItem;
    N2: TMenuItem;
    Fonte1: TMenuItem;
    Largura1: TMenuItem;
    Colunas1: TMenuItem;
    IxibirTtulo1: TMenuItem;
    N3: TMenuItem;
    Cor1: TMenuItem;
    ThemeDBGrid2: TThemeDBGrid;
    Image1: TImage;
    BttNew: TSpeedButton;
    BttEdit: TSpeedButton;
    BttHist: TSpeedButton;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CalculaResto;
    procedure DBEdit1Change(Sender: TObject);
    procedure CurrencyEdit3Exit(Sender: TObject);
    procedure CurrencyEdit2Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ThemeDBGrid2KeyPress(Sender: TObject; var Key: Char);
    Procedure VisbileCliente(CliEnabled : Boolean);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    Function  RefreshStatus:Extended;
    procedure Button4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure WMSysCommand(var Message:TWMSysCommand);
    message wm_syscommand;
    Procedure DeletePedido;
    procedure DBEdit1Exit(Sender: TObject);
    procedure ThemeDBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    Function VerficaCod(lista:TStrings;cod:integer):Boolean;
    procedure CopiarTUdo1Click(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    function Focused: Integer;
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure ListView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure ListView1DblClick(Sender: TObject);
    procedure ListView1Editing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    Procedure VerificaPagamento;
    procedure DBComboBox1Exit(Sender: TObject);
    Procedure ShowInfoClient;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBDateEdit1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookCidKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure DBLookupComboBox2DropDown(Sender: TObject);
    procedure DBLookupComboBox2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox3DropDown(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure DBLookupComboBox3Enter(Sender: TObject);
    procedure Largura1Click(Sender: TObject);
    procedure OpesdaTabela1Click(Sender: TObject);
    procedure IxibirTtulo1Click(Sender: TObject);
    procedure Fonte1Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure ThemeDBGrid2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Colunas1Click(Sender: TObject);
    Procedure LoadColClientes;
    Procedure SaveColClientes;
    procedure Panel4Resize(Sender: TObject);
    procedure BttNewClick(Sender: TObject);
    procedure BttEditClick(Sender: TObject);
    procedure BttHistClick(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure Panel5Resize(Sender: TObject);
    procedure ThemeDBGrid2DblClick(Sender: TObject);
    procedure WriteAuditoria(ID_Mercadoria,ID_Mercadoria_Estoque: Integer; Campo, NewValue, OldValue,EditandoReg: ShortString);
    function GravaAuditoria: Integer;

    Procedure SaveColIndex(Grid : TThemeDBGrid);
    Procedure LoadColIndex(Grid : TThemeDBGrid);
    procedure ThemeDBGrid3DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    Procedure BaixaEstoque;
  private
    { Private declarations }
  public
    Pedido : Cardinal;
    Finalizado : Boolean;

    Editing : Boolean;
    itemCell : Shortint;

    TempCOd : TBookmarkStr;

    Cod_Auditoria : Integer;
    { Public declarations }
  end;

var
  FFinaliza: TFFinaliza;
Const
  Espaco = 8;
implementation

uses UDados,  UCliente_Info, UAddProduto, Usituacao, Upagamento,
  UCancel, UAddCliente, DateUtils, Ucalendario, Uvisible, UFcliente_New,
  IniFiles;

{$R *.dfm}
function Tffinaliza.GravaAuditoria: Integer;
var
  Query : TADOQuery;
begin
  Result := -1;
  try
    Query := TADOQuery.Create(self);
    Query.Connection := Banco.ADOConnection1;
    Query.SQL.Clear;
    Query.SQL.Add('select * from tb_auditoria');
    query.DisableControls;

    try
    Query.Open;
    Query.Insert;
     Query.FieldValues['tipo'] := 2 ;
     Query.FieldValues['Data'] := now;
     Query.FieldValues['User'] := banco.User_cod;
     Query.FieldValues['modulo'] := 2;
     Query.FieldValues['reg'] := banco.TB_PedidoID_Pedido.Value;
     Query.FieldValues['Campo']:= 'Mercadorias';
     Query.FieldValues['OldValue'] := '';
     Query.FieldValues['NewValue'] := '';
    Query.Post;
    Result := Query.FieldValues['codigo'];
    except
    Result := -1;
    end;

  finally
  if  not(Query.State in [dsinactive]) then
  Query.Close;
  Query.Active := false;
  FreeAndNil(Query);
  end;

end;


procedure Tffinaliza.WriteAuditoria(ID_Mercadoria,
  ID_Mercadoria_Estoque: Integer; Campo, NewValue, OldValue,EditandoReg: ShortString);
begin

if Cod_Auditoria = -1 then
Cod_Auditoria := GravaAuditoria;

if cod_auditoria = -1 then
exit;


try
banco.ExecSQLTB.Close;
banco.ExecSQLTB.SQL.Clear;
Banco.ExecSQLTB.SQL.Add('INSERT into tb_auditoria_mercadoria ([ID_Pedido],[ID_Mercadoria],[ID_Mercadoria_Estoque],[Campo],[NewValue],[OldValue],[tipo],[ID_Auditoria])');
banco.ExecSQLTB.SQL.Add('Values ('+IntToStr(Banco.TB_PedidoID_Pedido.Value)+','
                                  +IntToStr(ID_Mercadoria)+','
                                  +IntToStr(ID_Mercadoria_Estoque)+','
                                  +'"'+campo+'",'
                                  +'"'+newValue+'",'
                                  +'"'+oldvalue+'",'
                                  +EditandoReg+','+
                                  IntToStr(Cod_Auditoria)+')');
banco.ExecSQLTB.ExecSQL;
except
end;

end;

function TFFinaliza.Focused: Integer;
begin
result := -1;
Result:= ActiveControl.ComponentIndex;
end;

Function TFFinaliza.RefreshStatus:Extended;
begin
result:=0;

Banco.TB_Vendas_All.First;
while not Banco.TB_Vendas_All.Eof do
begin
Result := result + Banco.TB_Vendas_AllValor_Total.Value;
Banco.TB_Vendas_All.Next;
end;

StatusBar1.Panels[0].Text := 'Preço R$ ' + formatfloat('##,###,##0.00',Result); //FloatToStr(Preco);
StatusBar1.Panels[1].Text := 'Registros '+IntToStr(Banco.TB_Vendas_All.RecordCount);

CurrencyEdit4.Value := Result;

CalculaResto;
end;

procedure TFFinaliza.FormShow(Sender: TObject);
var
Item  : TListItem;
i : Shortint;

begin

 ThemeDBGrid2.Width  :=  Edit1.Width;
 ThemeDBGrid2.Height := Banco.Grid_Finaliza_Height;
 ThemeDBGrid2.Font   := Banco.Font_grid[6];
 ThemeDBGrid2.Left := Edit1.Left;
 ThemeDBGrid2.Top := Edit1.Top + Edit1.Height;




 if Banco.Grid_Finaliza_Title then  ThemeDBGrid2.Options := ThemeDBGrid2.Options + [dgTitles]
 else                               ThemeDBGrid2.Options := ThemeDBGrid2.Options - [dgTitles];





Finalizado := false;


Height := banco.pedido_ScreenHeigth;
Width :=banco.pedido_ScreenWidth ;

try
CheckBox1.Checked := Banco.Config.ReadBool('Ffinaliza','SomaDecimal',true);
except
end;


if banco.TB_Contas.State in [dsinactive] then
banco.TB_Contas.Open;

VisbileCliente(false);

if Banco.TBEstUn.State in [dsInactive] then
Banco.TBEstUn.Open;

if Banco.TB_ClientesInfo.State in [dsInactive] then
Banco.TB_ClientesInfo.Open;

if Banco.TB_FormaPagamento.State in [dsInactive] then
Banco.TB_FormaPagamento.Open;

if Banco.TBClientes.SQL.Count > 1 then
begin
Banco.TBClientes.Close;
Banco.TBClientes.SQL.Clear;
Banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
end;

if Banco.TBClientes.State in [dsInactive] then
Banco.TBClientes.Open;

Edit3.Text := '';


// =============================================================================
banco.ADOConnection1.BeginTrans; // ----------------------------------------- INICIA TRANCISÃO NO ADOCONECTION


if Editing = false then // Não está editando
begin

   Banco.TB_Pedido.Insert;
   Banco.TB_PedidoData_Hora.Value := Now;
   banco.TBClientes.Locate(banco.TBClientesCodigo.FieldName,0,[]);
   Banco.TB_PedidoID_cliente.Value := Banco.TBClientesCodigo.Value;
   Banco.TB_PedidoDesconto.Value := 0;
   Banco.TB_Pedidosituacao.Value := 1;
   Banco.TB_Pedidosituacao.Value := Banco.TB_SituacaoCodigo.Value;

   Banco.TB_Pedido.Post;
   Pedido := Banco.TB_PedidoID_Pedido.Value;

   Banco.TB_Pedido.Edit;
   banco.TB_PedidoID_cliente.Clear;
   Image2.Visible := false;
// =============================================================================
end
else
begin
  Pedido := Banco.TB_PedidoID_Pedido.Value;
  Banco.TB_Pedido.Edit;
  if CurrencyEdit2.Value = 0 then
  CurrencyEdit2.Color := clGradientActiveCaption
  else
  CurrencyEdit2.Color := clRed;


 if Banco.TBClientes.Locate(banco.TBClientesCodigo.FieldName,banco.TB_PedidoID_cliente.Value,[]) then
 begin
 Edit1.Enabled := false;
 Edit1.Text := Banco.TBClientesNome_Razao.Value;
 VisbileCliente(True);
 end;


{Parcelamento}
banco.TB_Contas.Close;
Banco.TB_Contas.SQL.Clear;
Banco.TB_Contas.SQL.Add(banco.Sql_Tb_contas_Default);
banco.TB_Contas.SQL.Add('Where npedido = '+IntToStr(Pedido));
banco.TB_Contas.SQL.Add('Order by datavencimento asc');
banco.TB_Contas.Open;

  banco.TB_Contas.First;
  while not  banco.TB_Contas.Eof do
  begin
  Item := ListView1.Items.Add;
  Item.Caption :=FormatDateTime('DD/MM/YYYY',banco.TB_ContasDataVencimento.value);
  item.SubItems.Add(FloatToStr(banco.TB_ContasValor.Value));

  IF not BANCO.TB_ContasPortador.IsNull then
  begin
    if banco.TB_Portador.Locate(banco.TB_PortadorCodigo.FieldName,Banco.TB_ContasPortador.Value,[]) then
    item.SubItems.Add(banco.TB_PortadorDescricao.Value)
    else    Item.SubItems.Add('');
  end
  else   item.SubItems.Add('');
  if banco.TB_ContasPagada.Value then item.SubItems.Add('s')   else                                Item.SubItems.Add('n');

  banco.TB_Contas.Next;
  end;

  CurrencyEdit4.Value := Banco.TB_PedidoPreco.Value;
  RefreshStatus;
  CalculaResto;
  DBEdit1Change(sender);

  if banco.TB_PedidoFatura.Value > 1 then
  if banco.TB_PedidoParcelamento.Value > 1 then
  begin
  DBLookupComboBox2.Enabled := false;
  DBLookupComboBox3.Enabled := false;
  DBEdit1.Enabled := false;

  Finalizado := true;
  end;

VerificaPagamento;

if banco.TB_Contas.RecordCount = 0 then
Image2.Visible := True
else
Image2.Visible := False;


// =============================================================================



end;

Banco.TB_Vendas_All.SQL.Clear;
Banco.TB_Vendas_All.SQL.Add('Select * from VENDA_ALL');
Banco.TB_Vendas_All.SQL.Add('Where ID_Pedido='+IntToStr(Pedido));
Banco.TB_Vendas_All.open;

// Achar informações do cliente
ShowInfoClient;


if banco.TB_PedidoFatura.IsNull then
begin
banco.TB_PedidoParcelamento.Clear;
Label7.Visible := false;
DBLookupComboBox3.Visible := false;
banco.TB_Parcelamento.Close;
banco.TB_Parcelamento.sql.clear;
banco.TB_Parcelamento.SQL.Add('Select * from tb_parcelamento');
banco.TB_Parcelamento.SQL.Add('Where ativo = true');
banco.TB_Parcelamento.Open;
end
else
begin
banco.TB_Parcelamento.Close;
banco.TB_Parcelamento.SQL.Clear;
banco.TB_Parcelamento.SQL.Add('Select * from tb_parcelamento');
banco.TB_Parcelamento.SQL.Add('Where formaPagamento = '+IntToStr(banco.TB_PedidoFatura.Value));
banco.TB_Parcelamento.SQL.Add('and ativo = true');
banco.TB_Parcelamento.sql.Add('Order by '+banco.TB_ParcelamentoDescricao.FieldName);
banco.TB_Parcelamento.open;
DBLookupComboBox3.Visible := True;
Label7.Visible := true;
end;

  Edit3.Text := FormatDateTime('DD/MM/YYYY hh:mm:ss',banco.TB_PedidoData_Hora.value);


// Fatura e Parcelamento -------------------------------------------------------



//criar a coluna SITUAção
for i := 0 to Banco.TB_Vendas_All.Fields.Count - 1 do
if banco.TB_Vendas_All.Fields[i].Tag = 0 then
ThemeDBGrid3.Columns[ThemeDBGrid3.Columns.Add.Index].Field:= banco.TB_Vendas_All.Fields[i];


ThemeDBGrid3.Columns[ThemeDBGrid3.Columns.Add.Index].FieldName:= 'Situação';
Banco.LoadColumns(ThemeDBGrid3);
LoadColIndex(ThemeDBGrid3); //seta index da coluna acima

end;

                           {Finaliza on Show}
///////////////////////////////////////////////////////////////////////////////\\
// --------------------------------------------------------------------------- \\
// --------------------------------------------------------------------------- \\
// --------------------------------------------------------------------------- \\
// --------------------------------------------------------------------------- \\
// --------------------------------------------------------------------------- \\
// --------------------------------------------------------------------------- \\
// --------------------------------------------------------------------------- \\
// --------------------------------------------------------------------------- \\
///////////////////////////////////////////////////////////////////////////////\\










procedure TFFinaliza.BitBtn2Click(Sender: TObject);
begin
if Finalizado then
begin
banco.TB_Pedido.Cancel;
banco.ADOConnection1.CommitTrans;
ModalResult := mrcancel;
exit;
end;


  if MessageDlg('Tem certeza que deseja sair sem salvar as alterações?',mtWarning,[mbYes, mbNo],0) = mrno then
  exit;


  Banco.ADOConnection1.RollbackTrans;
  ModalResult := mrcancel;
  banco.Refresh(banco.TB_Pedido);
  
end;

procedure TFFinaliza.FormCreate(Sender: TObject);
begin
TempCOd := '';
Cod_Auditoria := -1;


try
LoadColClientes;
except
end;

itemCell := -2;

Editing := false;

 BttNew.Visible := banco.Config.ReadBool('Ffinaliza', 'BttNew',true);
BttEdit.Visible := banco.Config.ReadBool('Ffinaliza','BttEdit',true);

if banco.Cli_Vis_Hist then
BttHist.Visible := banco.Config.ReadBool('Ffinaliza','BttHist',true)
else
BttHist.Visible := false;

if banco.Cli_Novo then
BttNew.Visible := banco.Config.ReadBool('Ffinaliza','BttNew',true)
else
BttNew.Visible := false;

if banco.Cli_Editar then
BttEdit.Visible := banco.Config.ReadBool('Ffinaliza','BttEdit',true)
else
BttEdit.Visible := false;




end;

procedure TFFinaliza.CalculaResto;
Var
Pago : Currency;
begin
  pago := 0;

{Banco.TB_Pagamento.Refresh;
Banco.TB_Pagamento.First;
while not Banco.TB_Pagamento.Eof do
begin
Pago := pago + Banco.TB_Pagamentoquant.Value;
Banco.TB_Pagamento.Next;
end;
 }

CurrencyEdit1.Value := Pago;
CurrencyEdit2.Value := CurrencyEdit3.Value - Pago;

if DBEdit1.Text = '' then
exit;

Try
  CurrencyEdit3.Value := CurrencyEdit4.Value - (CurrencyEdit4.Value * StrToFloat(DBEdit1.Text) /100 );
  CurrencyEdit2.Value := CurrencyEdit3.Value - CurrencyEdit1.Value;
except
  CurrencyEdit3.Value := CurrencyEdit4.Value;
end;
end;

procedure TFFinaliza.DBEdit1Change(Sender: TObject);
begin
  CalculaResto;
end;

procedure TFFinaliza.CurrencyEdit3Exit(Sender: TObject);
begin
if DBEdit1.Text = '' then
DBEdit1.Text := '0';

end;

procedure TFFinaliza.CurrencyEdit2Change(Sender: TObject);
begin

if CurrencyEdit2.Value = 0 then
CurrencyEdit2.Color := clGradientActiveCaption
else
CurrencyEdit2.Color := clRed;




end;

procedure TFFinaliza.Edit1KeyPress(Sender: TObject; var Key: Char);
begin





if (key = #13 ) then
begin
key := #0;
    if Edit1.Text = '' then
    begin
     Banco.TBClientes.Close;
     Banco.TBClientes.SQL.Clear;
     Banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
     banco.TBClientes.SQL.Add('where ativo = true');
     Banco.TBClientes.open;
     ThemeDBGrid2.Visible := true;
     ThemeDBGrid2.Width := Edit1.Width;
     ThemeDBGrid2.SetFocus;
     exit;
    end;

if banco.TBClientes.Locate(banco.TBClientesNome_Razao.FieldName,Edit1.Text,[]) then
begin
banco.TB_PedidoID_cliente.Value := banco.TBClientesCodigo.Value;
VisbileCliente(true);
DBEdit2.SetFocus;
exit;
end;

   Try
    StrToInt(Edit1.Text);
    Banco.TBClientes.Close;
    Banco.TBClientes.SQL.Clear;
    Banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
    banco.TBClientes.SQL.Add('where ativo = true');
    Banco.TBClientes.SQL.Add('and codigo = '+Edit1.Text);
    Banco.TBClientes.Open;

    if Banco.TBClientes.RecordCount > 0 then
    begin
     Edit1.Text := Banco.TBClientesNome_Razao.Value;

     if Banco.TB_PedidoComprador_Nome.Value = '' then
      Banco.TB_PedidoComprador_Nome.Value := Banco.TBClientesNome.Value;

     DBEdit2.SetFocus;
     VisbileCliente(True);
     abort;
     exit;
    end;

   Except
   end;

  ThemeDBGrid2.Visible := true;
  ThemeDBGrid2.Width := Edit1.Width;
  ThemeDBGrid2.SetFocus;

  Banco.TBClientes.Close;
  Banco.TBClientes.SQL.Clear;
  Banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
  banco.TBClientes.SQL.Add('where ativo = true');
  Banco.TBClientes.SQL.Add('and nome_razao like '+chr(39)+Edit1.Text+'%'+chr(39));
  Banco.TBClientes.Open;

  if banco.TBClientes.RecordCount = 0 then
  begin
  Banco.TBClientes.Close;
  Banco.TBClientes.SQL.Clear;
  Banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
  banco.TBClientes.SQL.Add('where ativo = true');
  Banco.TBClientes.Open;
  end;


end;


end;

procedure TFFinaliza.ThemeDBGrid2KeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
begin
ThemeDBGrid2.Visible := false;
  if Banco.TBClientes.RecordCount > 0 then
  begin
    Edit1.Text := Banco.TBClientesNome_Razao.Value;
    banco.TB_PedidoID_cliente.Value := banco.TBClientesCodigo.Value;
    ShowInfoClient;
    
    if Banco.TB_PedidoComprador_Nome.Value = '' then
    Banco.TB_PedidoComprador_Nome.Value := Banco.TBClientesNome.Value;

    VisbileCliente(true);
    DBEdit2.SetFocus;
  end
  else
    Edit1.SetFocus;
end
else
    if (Banco.TBEstoque.RecordCount = 0) or (key = #8) then
    Edit1.SetFocus;

if key = #10 then // Ctrl + enter
  if Banco.TBClientes.RecordCount > 0 then
    Try
      Edit1.Text := Banco.TBClientesNome_Razao.Value;
      ThemeDBGrid2.Visible := false;
      Application.CreateForm(TFInfo_Cliente,FInfo_Cliente);
      FInfo_Cliente.Print;
    Finally
    FreeAndNil(FInfo_Cliente);
    end;

end;

procedure TFFinaliza.VisbileCliente(CliEnabled: Boolean);
begin

Label11.Visible := CliEnabled;
Label12.Visible := CliEnabled;
Label13.Visible := CliEnabled;
Label14.Visible := CliEnabled;
Label15.Visible := CliEnabled;
Label17.Visible := CliEnabled;
Label16.Visible := CliEnabled;
Label18.Visible := CliEnabled;
Label19.Visible := CliEnabled;
Label20.Visible := CliEnabled;
Label21.Visible := CliEnabled;
Label22.Visible := CliEnabled;
Label23.Visible := CliEnabled;
Label24.Visible := CliEnabled;
Label36.Visible := CliEnabled;
Label37.Visible := CliEnabled;
Image1.Visible := CliEnabled;


ComboBox1.Visible := CliEnabled;
DBLookupComboBox1.Visible := CliEnabled;
DBLookTipolog.Visible := CliEnabled;
DBEdit3.Visible := CliEnabled;
DBEdit5.Visible := CliEnabled;
DBEdit6.Visible := CliEnabled;
DBEdit7.Visible := CliEnabled;
DBEdit8.Visible := CliEnabled;
DBEdit9.Visible := CliEnabled;
DBEdit10.Visible := CliEnabled;
DBEdit11.Visible := CliEnabled;
DBEdit12.Visible := CliEnabled;
DBEdit13.Visible := CliEnabled;
DBEdit14.Visible := CliEnabled;
DBEdit16.Visible := CliEnabled;
DBEdit15.Visible := CliEnabled;
DBEdit17.Visible := CliEnabled;
DBEdit18.Visible := CliEnabled;
DBEdit19.Visible := CliEnabled;

DBEdit21.Visible := CliEnabled;
DBMemo2.Visible := CliEnabled;

//if CliEnabled then
//begin
ComboBox1.Text := Banco.TBClientesUF.Value;


Case length(Banco.TBClientesTel_Come.Text) of
5: Banco.TBClientesTel_Come.EditMask := '!0000 0;0;';
6: Banco.TBClientesTel_Come.EditMask := '!0000 00;0;';
7: Banco.TBClientesTel_Come.EditMask := '!0000 000;0;';
8: Banco.TBClientesTel_Come.EditMask := '!0000 0000;0;';
9: Banco.TBClientesTel_Come.EditMask := '!00000 0000;0;';
end;

Case length(Banco.TBClientesTel_Res.Text) of
5: Banco.TBClientesTel_Res.EditMask := '!0000 0;0;';
6: Banco.TBClientesTel_Res.EditMask := '!0000 00;0;';
7: Banco.TBClientesTel_Res.EditMask := '!0000 000;0;';
8: Banco.TBClientesTel_Res.EditMask := '!0000 0000;0;';
9: Banco.TBClientesTel_Res.EditMask := '!00000 0000;0;';
end;

Case length(Banco.TBClientesTel_Cel.Text) of
5: Banco.TBClientesTel_Cel.EditMask := '!0000 0;0;';
6: Banco.TBClientesTel_Cel.EditMask := '!0000 00;0;';
7: Banco.TBClientesTel_Cel.EditMask := '!0000 000;0;';
8: Banco.TBClientesTel_Cel.EditMask := '!0000 0000;0;';
9: Banco.TBClientesTel_Cel.EditMask := '!00000 0000;0;';
end;

Case length(Banco.TBClientesTel_Fax.Text) of
5: Banco.TBClientesTel_Fax.EditMask := '!0000 0;0;';
6: Banco.TBClientesTel_Fax.EditMask := '!0000 00;0;';
7: Banco.TBClientesTel_Fax.EditMask := '!0000 000;0;';
8: Banco.TBClientesTel_Fax.EditMask := '!0000 0000;0;';
9: Banco.TBClientesTel_Fax.EditMask := '!00000 0000;0;';
end;
//  end;



end;

procedure TFFinaliza.Edit1Enter(Sender: TObject);
begin
if LowerCase(Banco.TBClientesNome_Razao.Value) <> LowerCase(Edit1.Text) then
VisbileCliente(false);
end;

procedure TFFinaliza.Edit1Exit(Sender: TObject);
begin

if ThemeDBGrid2.Visible = false then
if banco.TBClientes.Locate(banco.TBClientesNome_Razao.FieldName,Edit1.Text,[]) then
begin
banco.TB_PedidoID_cliente.Value := banco.TBClientesCodigo.Value;
VisbileCliente(true);

end
else
begin
VisbileCliente(false);
banco.TB_PedidoID_cliente.Clear;
end;



ShowInfoClient;


end;

procedure TFFinaliza.DBEdit2Enter(Sender: TObject);
begin
ThemeDBGrid2.Visible := false;
end;

procedure TFFinaliza.Edit1Change(Sender: TObject);
begin
ThemeDBGrid2.Visible := false;
VisbileCliente(false);
end;

procedure TFFinaliza.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13 ) then
PageControl1.TabIndex := 1;
end;

procedure TFFinaliza.Button3Click(Sender: TObject);
begin
if Finalizado then
exit;


Try
    Application.CreateForm(TFAddProduto,FAddProduto);
    FAddProduto.Showmodal;
Finally
  FreeAndNil(faddproduto);
end;
end;

procedure TFFinaliza.Button4Click(Sender: TObject);
begin
if Finalizado then
exit;


if Banco.TB_Vendas_All.RecordCount = 0 then
exit;

Try
    Application.CreateForm(TFAddProduto,FAddProduto);
    Faddproduto.Editing := true;
    FAddProduto.CurrencyEdit1.value := Banco.TB_Vendas_AllValor_Total.Value;
    FAddProduto.Edit2.Text := Banco.TB_Vendas_AllDescri.Value;
    FAddProduto.Edit3.value := Banco.TB_Vendas_AllQtd.Value;
    FAddProduto.Edit4.value := Banco.TB_Vendas_AllValor_un.Value;
    FAddProduto.Showmodal;
Finally
  FreeAndNil(faddproduto);
end;


end;

procedure TFFinaliza.BitBtn1Click(Sender: TObject);
var
  Dif_Quant : Single;
  i : integer;
total_aux : Currency;
begin
if banco.TB_PedidoData_Hora.IsNull then
banco.TB_PedidoData_Hora.Value := now;


if banco.TB_Pedidosituacao.IsNull then
begin
MessageDlg('É necessário preencher o campo Situação',mtInformation,[mbok],0);
exit;
end;

if banco.TB_PedidoFatura.IsNull then
begin
MessageDlg('É necessário preencher o campo Fatura',mtInformation,[mbok],0);
exit;
end;

if banco.TB_PedidoParcelamento.IsNull then
begin
MessageDlg('É necessário preencher o campo Parcelamento',mtInformation,[mbok],0);
exit;
end;


//if LowerCase(Edit1.Text) <> LowerCase(Banco.TBClientesNome_Razao.Value)  then
if not banco.TBClientes.Locate(banco.TBClientesCodigo.FieldName,banco.TB_PedidoID_cliente.Value,[]) then
begin
  MessageDlg('Selecione um cliente',mtWarning,[mbOK],0);
  Exit;
end;


{if CurrencyEdit2.Value < 0 then
begin
if MessageDlg('Deseja continuar sem devolver R$ '+formatfloat('##,###,##0.00',CurrencyEdit4.Value)+' de troco?',mtWarning,[mbYes,mbNo],0) = mrNo then
Exit;
end;}

// Verificando faturamento
total_aux := 0;
for i := 0 to ListView1.Items.Count - 1 do
begin
  try
  StrToDate(ListView1.Items[i].Caption);
  except
  MessageDlg('Data incorreta na parcela '+IntToStr(i+1),mtError,[mbok],0);
  exit;
  end;

  try
  total_aux := total_aux + StrToFloat(ListView1.Items[i].SubItems[0]);
  except
  MessageDlg('Valor incorreto na parcela '+IntToStr(i+1),mtError,[mbok],0);
  exit;
  end;

  if StrToFloat(ListView1.Items[i].SubItems[0]) = 0 then
  begin
  MessageDlg('O valor da parcela '+IntToStr(i+1)+' é igual a zero',mtError,[mbok],0);
  exit;
  end;


end;



if total_aux <> CurrencyEdit3.Value then
begin
if MessageDlg('Foi encontrado uma diferença entre valores:'+#13+'Valor total Parcelado: '+FloatToStr(total_aux)+#13+'Total da venda: '+FloatToStr(CurrencyEdit3.Value)+#13+'Caso desejese continuar preesione OK',mtConfirmation,[mbok,mbcancel],0) = mrcancel then
exit;
end;

{...Faturamento...}

i := 0;

if DBLookupComboBox2.KeyValue > 1 then
if DBLookupComboBox2.Enabled then
begin
  if banco.TB_ClientesInfo.Locate(banco.TB_ClientesInfoID_Cliente.FieldName,banco.TBClientesCodigo.Value,[])then
  banco.TB_ClientesInfo.Edit
  else
  begin
  banco.TB_ClientesInfo.Insert;
  banco.TB_ClientesInfoID_Cliente.Value := banco.TBClientesCodigo.Value;
  banco.TB_ClientesInfoApagar.Value := 0;
  banco.TB_ClientesInfoPago.Value := 0;
  banco.TB_ClientesInfoUltimaCompra.Clear;
  end;

  if banco.TB_PedidoFatura.Value > 1 then
  banco.TB_ClientesInfoUltimaCompra.Value := now;

for i := 0 to ListView1.Items.Count - 1 do
begin
  Try
    banco.TB_Contas.Insert;
    banco.TB_ContasNPedido.Value := Pedido;
    banco.TB_ContasDataCreate.Value := date;
    banco.TB_ContasDataVencimento.Value := StrToDate(ListView1.Items[i].Caption);
    banco.TB_ContasValor.Value := StrToFloat(ListView1.Items[i].SubItems[0]);
    banco.TB_ContasPortador.Clear;
      if StrToDate(ListView1.Items[i].Caption) = Date then
      begin
        banco.TB_ContasPagada.Value := true;
        Banco.TB_ContasDataPagada.Value := now;
        banco.TB_ClientesInfoPago.Value := banco.TB_ClientesInfoPago.Value + banco.TB_ContasValor.Value; //Se ja pagou uma parcela
      end
      else
      begin
      banco.TB_ContasPagada.Value := false;
      banco.TB_ContasDataPagada.Clear;
      end;

    if ListView1.Items[i].SubItems[1] <> '' then
    if banco.TB_Portador.Locate(Banco.TB_PortadorDescricao.FieldName,ListView1.Items[i].SubItems[1],[] ) then
    banco.TB_ContasPortador.Value := banco.TB_PortadorCodigo.Value;


    banco.TB_ClientesInfoApagar.Value := banco.TB_ClientesInfoApagar.Value + banco.TB_ContasValor.Value; // adicionando ao total
    banco.TB_ContasDescricao.Value := 'Parcela '+IntToStr(i+i)+' da Venda '+IntToStr(Pedido);
    banco.TB_ContasID_Cliente.Value := Banco.TBClientesCodigo.Value;
    banco.TB_Contas.Post;

  Except
    on e :Exception do
    begin
    banco.Create_Erro(e.ClassName,e.Message);
    MessageDlg('Erro ao criar parcela '+IntToStr(i)+#13+e.Message,mtWarning,[mbok],0);
    banco.TB_Contas.Cancel;
    end;
  end;
end;
   Try
   banco.TB_ClientesInfo.Post;
   Except
   on e:exception do
   begin
   banco.Create_Erro(e.ClassName,e.Message);
   banco.TB_ClientesInfo.Cancel;
   MessageDlg('Erro ao atualizar informações do cliente'+#13+e.Message,mtError,[mbok],0);
   end;
  end;
end;  // finalliza parcelas



Try
Banco.TB_PedidoID_cliente.Value := Banco.TBClientesCodigo.Value;
Banco.TB_PedidoPreco.Value := RefreshStatus;
Banco.TB_PedidoTotal_Reg.Value := Banco.TB_Vendas_All.RecordCount;


Banco.TB_Pedido.Post;

if DBLookupComboBox2.KeyValue > 1 then //se o parcelamento for <> de "nenhum"
BaixaEstoque;  //da baixa no estoque


MessageDlg('Dados gravados com sucesso',mtInformation,[mbOK],0);
banco.ADOConnection1.CommitTrans;
except
  on e :exception do
  begin
  banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Não foi possível gravar os dados'+#13+e.Message,mtError,[mbOK],0);
 end;
end;

Banco.Refresh(Banco.TB_Pedido);
close;
end;

procedure TFFinaliza.Button5Click(Sender: TObject);
var
  i : Shortint;
begin

if Finalizado then
exit;


if Banco.TB_Vendas_All.RecordCount = 0 then
exit;

if MessageDlg('Deseja remover realmente remover o produto?'+#13+Banco.TB_Vendas_AllDescri.Value,mtWarning,[mbYes,mbNo],0) = mrno then
exit;

  for i := 0 to Banco.TB_Vendas_All.Fields.Count -1 do
  if not banco.TB_Vendas_All.Fields[i].Lookup then
  if banco.TB_Vendas_All.Fields[i] <> banco.TB_Vendas_AllCodigo then
  FFinaliza.WriteAuditoria(banco.TB_Vendas_AllCodigo.Value,Banco.TB_Vendas_AllID_mercadoria.Value,banco.TB_Vendas_All.Fields[i].FieldName,'',VarToStr(banco.TB_Vendas_All.Fields[i].OldValue),'3');


   try
   Banco.TB_Vendas_All.Delete;
   RefreshStatus;
   Except
   on e :exception do
   begin
   banco.Create_Erro(e.ClassName,e.Message);
   MessageDlg(e.Message,mtError,[mbok],0);
   end;
   end;
end;

procedure TFFinaliza.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if ((ssALT in Shift) and (key = vk_f4)) then
begin
BitBtn2Click(BitBtn2);
key := 0;
end;

if (key = vk_escape) then
if ThemeDBGrid2.Visible then
begin
ThemeDBGrid2.Visible := false;
Edit1.SetFocus;
end
else
begin
BitBtn2Click(BitBtn2);
key := 0;
end;

end;

procedure TFFinaliza.WMSysCommand(var Message: TWMSysCommand);
begin
if Message.CmdType = 61536 then
begin
Message.CmdType := 1;
BitBtn2Click(self);
end;

inherited;
end;

procedure TFFinaliza.DeletePedido;
var
  Cod : integer;
  TxtSQL : TStringList;
begin
Try
  TxtSQL := TStringList.Create;
  TxtSQL.Clear;
  TxtSQL.AddStrings(Banco.TB_Pedido.SQL);

cod := Banco.TB_PedidoID_Pedido.Value;

Banco.TB_Pedido.close;
Banco.TB_Pedido.SQL.Clear;
Banco.TB_Pedido.SQL.Add('DELETE FROM Venda_info');
Banco.TB_Pedido.SQL.Add('where '+banco.TB_PedidoID_Pedido.FieldName+' = '+IntToStr(cod));
Banco.TB_Pedido.ExecSQL;

Banco.TB_Pedido.SQL.Clear;
Banco.TB_Pedido.SQL := TxtSQL;
Banco.TB_Pedido.Open;

finally
FreeAndNil(TxtSQL);
end;

end;

procedure TFFinaliza.DBEdit1Exit(Sender: TObject);
begin
if DBEdit1.Text = '' then
banco.TB_PedidoDesconto.Value := 0;


end;

procedure TFFinaliza.ThemeDBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_delete then
Button5.Click;
end;

function TFFinaliza.VerficaCod(lista: TStrings; cod: integer): Boolean;
var
  i : integer;
begin
result :=false;

For i := 0 to lista.Count -1 do
if lista[i] = IntToStr(cod) then
begin
Result := true;
exit;
end;

end;

procedure TFFinaliza.CopiarTUdo1Click(Sender: TObject);
begin
DBMemo1.SelectAll;
DBMemo1.CopyToClipboard;

end;

procedure TFFinaliza.Limpar1Click(Sender: TObject);
begin
banco.TB_PedidoDescri.Clear;


end;

procedure TFFinaliza.Abrir1Click(Sender: TObject);
begin
if OpenDialog1.Execute then
try
DBMemo1.Lines.LoadFromFile(OpenDialog1.FileName);
except
on e: exception do
MessageDlg('Erro ao abrir arquivo'+#13+e.Message,mtError,[mbok],0);

end;
end;

procedure TFFinaliza.Salvar1Click(Sender: TObject);
begin
SaveDialog1.FileName := 'Descricao_Pedido_'+IntToStr(Pedido);


if SaveDialog1.Execute then
begin
if ExtractFileExt(SaveDialog1.FileName) = '' then
SaveDialog1.FileName := SaveDialog1.FileName + '.txt';

try
DBMemo1.Lines.SaveToFile(SaveDialog1.FileName);
except
on e: exception do
MessageDlg('Erro ao salvar o arquivo'+#13+e.Message,mtError,[mbok],0);
end;
end;
end;

procedure TFFinaliza.DBLookupComboBox3Click(Sender: TObject);
var
  Item: TListItem;
  Parcelas : integer;
  Dias : TDate;
  CalcParcela : Currency;
  ParcelasTotal : integer;
  aux : Currency;

  ListaAux : TStringList;
  i : integer;
begin
           Image2.Visible := true;

if banco.TB_PedidoParcelamento.IsNull then
exit;


try

ListaAux := TStringList.Create;
ListaAux.Clear;

  For i := 0 to ListView1.Items.Count -1 do
  ListaAux.Add(ListView1.Items[i].SubItems[1]);



Dias := date;

ListView1.Clear;

ParcelasTotal := banco.TB_ParcelamentoParcelas.Value;
if ParcelasTotal <= 0 then
parcelastotal := 1;

aux :=0;

CalcParcela := 0;
CalcParcela :=CurrencyEdit3.Value;
if CheckBox1.Checked then
CalcParcela := int(CalcParcela / ParcelasTotal)
else
CalcParcela := CalcParcela / ParcelasTotal;

if Banco.TB_ParcelamentoFormaPagamento.Value <> 1 then
For Parcelas := 1 to ParcelasTotal  do
begin
  Item := ListView1.Items.Add;

  if (Parcelas = 0) and (banco.TB_Parcelamentoentrada.Value) then
  dias := date
  else
  dias := IncDay(dias,banco.TB_ParcelamentoIntervaloDias.Value);

  item.Caption := FormatDateTime('DD/MM/YYYY',dias);

  if CheckBox1.Checked then
  begin
  item.SubItems.Add(FloatToStr(CalcParcela));
  aux := aux + CalcParcela;
  end
  else
  item.SubItems.Add(FloatToStr(CalcParcela));

  item.SubItems.Add('');
  
end;
  if CheckBox1.Checked then
  if ListView1.Items.Count >=1 then
   ListView1.Items[0].SubItems[0] := FloatToStr( StrToFloat(ListView1.Items[0].SubItems[0]) + (CurrencyEdit3.Value-aux));



for i := 0 to ListView1.Items.Count -1 do
if (ListaAux.Count -1) >= i then
ListView1.Items[i].SubItems[1] := ListaAux[i];

//MessageDlg('As Parcelas foram recalculadas',mtInformation,[mbok],0);

Finally
FreeAndNil(ListaAux);
end;
end;

procedure TFFinaliza.ListView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  l: TListItem;
  i: integer;
  w: integer;
begin
DBComboBox1.Parent := ListView1;

{if DBComboBox1.Visible then
DBComboBox1.Visible := false;}





 l := ListView1.GetItemAt( 3, Y );
 itemCell := -2;
 if l <> nil then
   begin
   w := 0;
   for i := 0 to ListView1.Columns.Count-1 do
     begin
     w := w + ListView1.Column[i].Width;
     if w >= X then
       begin
   //    DateTimePicker1.Left := w - ListView1.Columns[i].Width;


       if i = 0 then
         itemCell:=-1
       else
         itemCell:= i-1;


       DBComboBox1.Top := l.Top +1;
       break;
       end;
     end;
   end;
end;

procedure TFFinaliza.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
if DBLookupComboBox2.Enabled then
begin
  if Odd(item.index) then
    Listview1.Canvas.Brush.Color := banco.Browser_COlor
  else
    ListView1.Canvas.Brush.Color := clWhite;
end
else
try
  if Item.SubItems[2] = 's' then
    Listview1.Canvas.Brush.Color := Banco.Contas_Color_Pagada
  else
    if StrToDate(Item.Caption) < date then
    Listview1.Canvas.Brush.Color := Banco.Contas_Color_Atrasada
    else
  if Odd(item.index) then
    Listview1.Canvas.Brush.Color := banco.Browser_COlor
  else
    ListView1.Canvas.Brush.Color := clWhite;
except
    ListView1.Canvas.Brush.Color := clwhite;
end;

end;

procedure TFFinaliza.ListView1CustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
if DBLookupComboBox2.Enabled then
begin
  if Odd(item.index) then
    Listview1.Canvas.Brush.Color := banco.Browser_COlor
  else
    ListView1.Canvas.Brush.Color := clWhite;
end
else
try
  if Item.SubItems[2] = 's' then
    Listview1.Canvas.Brush.Color := Banco.Contas_Color_Pagada
  else
    if StrToDate(Item.Caption) < date then
    Listview1.Canvas.Brush.Color := Banco.Contas_Color_Atrasada
    else
  if Odd(item.index) then
    Listview1.Canvas.Brush.Color := banco.Browser_COlor
  else
    ListView1.Canvas.Brush.Color := clWhite;
except
    ListView1.Canvas.Brush.Color := clwhite;
end;

end;

procedure TFFinaliza.ListView1DblClick(Sender: TObject);
var
  NewItem : String;
    Total : Currency;
  Valor : Currency;
  i,parcela : integer;

begin
if not DBLookupComboBox2.Enabled then
exit;


if itemCell = -2 then
exit
else
if itemCell = -1 then
NewItem := ListView1.ItemFocused.Caption
else
NewItem := ListView1.ItemFocused.SubItems[itemcell];



if itemCell = -1 then
begin
  try
    Application.CreateForm(Tfcalendario,fcalendario);
      try
      Fcalendario.MonthCalendar1.Date := StrToDate(NewItem)
      except
      end;
    fcalendario.showmodal;
  finally
    NewItem := FormatDateTime('DD/MM/YYYY',Fcalendario.MonthCalendar1.date);
    if Fcalendario.ModalResult = mrok then
    if NewItem <> ListView1.ItemFocused.Caption then
    ListView1.Items[ListView1.ItemIndex].Caption := NewItem;

    FreeAndNil(fcalendario);

  end;
      exit;
end;

if itemCell = 0 then
if InputQuery('Editando Parcela','Valor da Parcela '+IntToStr(ListView1.ItemIndex+1),NewItem) then
begin
  try
    Total := CurrencyEdit3.Value - StrToFloat(NewItem)
  except
    MessageDlg('Valor incorreto',mtError,[mbok],0);
    exit;
  end;

  parcela := ListView1.ItemIndex;

  valor := Total / (ListView1.Items.Count);
  ListView1.ItemFocused.SubItems[0] := NewItem;
  
  For i := 0 to ListView1.Items.Count - 1 do
  begin
    if i <> parcela then
    ListView1.Items[i].SubItems[0] := FloatToStr(Valor);
  end;
end;


if itemCell = 1 then
begin
  DBComboBox1.Visible := true;
  DBComboBox1.Left := 0;

  for i := 0 to itemCell do
  DBComboBox1.Left := 1+ DBComboBox1.Left + ListView1.Column[i].Width;

  DBComboBox1.SetFocus;

  DBComboBox1.Width := ListView1.Column[itemCell+1].Width -1;



end;
end;


procedure TFFinaliza.ListView1Editing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
AllowEdit := false;

end;

procedure TFFinaliza.VerificaPagamento;
var
  i : integer;
  calcParcela : currency;
begin
CalcParcela := 0;
for i := 0 to ListView1.Items.Count - 1 do
CalcParcela := CalcParcela + StrToFloat(ListView1.Items[i].SubItems[0]);


CalcParcela := 0;
if not DBLookupComboBox2.Enabled then
begin
  for i := 0 to ListView1.Items.Count - 1 do
  if ListView1.Items[i].SubItems[2] = 's' then
  CalcParcela := CalcParcela + StrToFloat(ListView1.Items[i].SubItems[0]);
  CurrencyEdit1.Value := calcParcela;
  CurrencyEdit2.Value := CurrencyEdit3.Value - CalcParcela;
end;


end;

procedure TFFinaliza.DBComboBox1Exit(Sender: TObject);
var
  i : integer;
begin

DBComboBox1.Visible:=false;


if DBComboBox1.Text = '' then
begin
  ListView1.ItemFocused.SubItems[1] := '';
exit;
end;





For i := 0 to ListView1.Items.Count - 1 do
begin
  if ListView1.Items[i].SubItems[1] <> '' then
  begin
  ListView1.ItemFocused.SubItems[1] := DBComboBox1.KeyValue;
  exit;
  end;
end;

For i := 0 to ListView1.Items.Count - 1 do
ListView1.Items[i].SubItems[1] := DBComboBox1.KeyValue;

end;


procedure TFFinaliza.ShowInfoClient;
var
  FaltaPagar : currency;
begin
Label26.Visible := banco.Pedido_InfoCLiente;
Label27.Visible := banco.Pedido_InfoCLiente;
Label28.Visible := banco.Pedido_InfoCLiente;
Label29.Visible := banco.Pedido_InfoCLiente;
Label30.Visible := banco.Pedido_InfoCLiente;
Label31.Visible := banco.Pedido_InfoCLiente;
Label32.Visible := banco.Pedido_InfoCLiente;
Label33.Visible := banco.Pedido_InfoCLiente;
Label34.Visible := banco.Pedido_InfoCLiente;
Label38.Visible := banco.Pedido_InfoCLiente;
//Label39.Visible := banco.Pedido_InfoCLiente;
//Label40.Visible := banco.Pedido_InfoCLiente;
Label41.Visible := banco.Pedido_InfoCLiente;
Label42.Visible := banco.Pedido_InfoCLiente;


Splitter1.Visible := banco.Pedido_InfoCLiente;

if not banco.Pedido_InfoCLiente then
begin
SpeedButton2.Caption := '<<';
Panel5.Width := 15;

exit;
end;




SpeedButton2.Caption := '>>';
Panel5.Width := banco.Pedido_InfoCliente_Width;

Label27.Width := Panel5.Width -4;
Label28.Width := Label27.Width;
Label29.Width := Label27.Width;
Label30.Width := Label27.Width;
Label31.Width := Label27.Width;
Label32.Width := Label27.Width;
Label33.Width := Label27.Width;
Label34.Width := Label27.Width;
Label38.Width := Label27.Width;
//Label39.Width := Label27.Width;
//Label40.Width := Label27.Width;
Label41.Width := Label27.Width;
Label42.Width := Label27.Width;


Label27.Left := 4;
Label28.Left := Label27.Left;
Label29.Left := Label27.Left;
Label30.Left := Label27.Left;
Label31.Left := Label27.Left;
Label32.Left := Label27.Left;
Label33.Left := Label27.Left;
Label34.Left := Label27.Left;
Label38.Left := Label27.Left;
//Label39.Left := Label27.Left;
//Label40.Left := Label27.Left;
Label41.Left := Label27.Left;
Label42.Left := Label27.Left;


Label28.Caption := '';
Label29.Caption := '';
Label32.Caption := '';
Label34.Caption := '';
label28.Font.color := clBlack;
//Label39.Caption := '';
Label41.Caption := '';
Label38.Font.Color := clBlack;
//Label39.Font.Color := clBlack;
Label41.Font.Color := clBlack;
Label26.Font.Color := clred;




Panel5.Caption := '';

if banco.TB_PedidoID_cliente.IsNull then
exit;


if banco.TB_ClientesInfo.Locate(banco.TB_ClientesInfoID_Cliente.FieldName,banco.TB_PedidoID_cliente.Value,[]) then
begin
faltapagar := 0;
faltapagar := Banco.TB_ClientesInfoApagar.Value - banco.TB_ClientesInfoPago.Value;

if banco.TB_ClientesInfoUltimaCompra.IsNull then
begin
Label28.Caption:= 'Sem compras';
label28.Font.color := clInactiveCaption;
end
else
Label28.Caption:= FormatDateTime('DD/MM/YYYY',banco.TB_ClientesInfoUltimaCompra.Value);

Label29.Caption:= 'R$ '+FormatFloat(',0.00',banco.TB_ClientesInfoApagar.Value);
Label32.Caption:= 'R$ '+FormatFloat(',0.00',FaltaPagar);
Label34.Caption:= 'R$ '+FormatFloat(',0.00',banco.TB_ClientesInfoPago.Value);

if FaltaPagar > 0 then
Label32.Font.Color := banco.Contas_Color_Atrasada
else
if FaltaPagar = 0 then
Label32.font.Color := clInactiveCaption
else
Label32.font.Color := banco.Contas_Color_Pagada;


//Label39.Caption :='Contas Ok';
Label41.Caption := 'R$ 0,00';
Label41.Font.Color := banco.Contas_Color_Pagada;
//Label39.Font.Color := banco.Contas_Color_Pagada;
Label38.Font.Color := banco.Contas_Color_Pagada;

Label41.Caption := 'Wait a moment';
Label41.Caption := 'R$ '+FormatFloat(',0.00',banco.GetContasAtrasas(banco.TB_PedidoID_cliente.Value));
Label41.Font.Color := banco.Contas_Color_Atrasada;




{
if banco.TB_Cliente_Conta.Active then
if banco.TB_Cliente_Conta.RecordCount > 0 then
if banco.TB_Cliente_Conta.Locate(banco.TB_Cliente_ContaID_Cliente.FieldName,banco.TB_PedidoID_cliente.Value,[]) then
begin
Label39.Caption := FormatDateTime('DD/MM/YYYY',banco.TB_Cliente_ContaVencimento.Value);
Label41.Caption := 'R$ '+FormatFloat(',0.00',banco.TB_Cliente_ContaValorTotal.Value);
Label41.Font.Color := banco.Contas_Color_Atrasada;
Label39.Font.Color := banco.Contas_Color_Atrasada;
Label38.Font.Color := banco.Contas_Color_Atrasada;


end;

      }
end;

{Panel5.Caption := 'Cliente -->  '+Banco.TBClientesNome_Razao.Value+
                '  Ultima Compra '+FormatDateTime('DD/MM/YYYY',banco.TB_ClientesInfoUltimaCompra.Value)+
                '  Total de Compra R$ '+FormatFloat(',0.00',banco.TB_ClientesInfoApagar.Value) +
                '  Total Pago R$ '+FormatFloat(',0.00',banco.TB_ClientesInfoPago.Value)+' Falta Pagar R$ '+FormatFloat(',0.00',banco.TB_ClientesInfoApagar.Value - banco.TB_ClientesInfoPago.Value);



   }

end;

procedure TFFinaliza.SpeedButton2Click(Sender: TObject);
begin
banco.Pedido_InfoCLiente := not (banco.Pedido_InfoCLiente);
ShowInfoClient;

end;

procedure TFFinaliza.Splitter1Moved(Sender: TObject);
begin
banco.Pedido_InfoCliente_Width := Panel5.Width;

end;

procedure TFFinaliza.FormHide(Sender: TObject);
var
  i : Shortint;
begin
SaveColIndex(ThemeDBGrid3); // salva a coluna sem field
Banco.SaveColumns(ThemeDBGrid3);

//primeiro vamos remover a coluna sem field
For i := ThemeDBGrid3.Columns.Count - 1 downto 0 do
if ThemeDBGrid3.Columns[i].Field = nil then
ThemeDBGrid3.Columns.Delete(i);

For i := 0 to ThemeDBGrid3.Columns.Count - 1 do
if ThemeDBGrid3.Columns[i].Field <> nil then
ThemeDBGrid3.Columns[i].Field.Index := ThemeDBGrid3.Columns[i].Index;


banco.SaveIndexOf(banco.TB_Vendas_All);


SaveColClientes;
//Banco.TB_Pedido.Delete;
banco.pedido_ScreenHeigth := FFinaliza.Height;
banco.pedido_ScreenWidth := FFinaliza.Width;

try
Banco.Config.WriteBool('Ffinaliza','SomaDecimal',CheckBox1.Checked);
except
end;


end;

procedure TFFinaliza.FormClose(Sender: TObject; var Action: TCloseAction);
begin

if banco.TBClientes.SQL.Count > 1 then
begin
Banco.TBClientes.Close;
Banco.TBClientes.SQL.Clear;
Banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
Banco.TBClientes.Open;
end;

if banco.TBEstoque.SQL.Count > 1 then
begin
Banco.TBEstoque.Close;
Banco.TBEstoque.SQL.Clear;
Banco.TBEstoque.SQL.Add('Select * from Estoque');
Banco.TBEstoque.Open;
end;
end;

procedure TFFinaliza.DBLookupComboBox2Click(Sender: TObject);
begin

if not banco.TB_Parcelamento.Locate(Banco.TB_ParcelamentoFormaPagamento.FieldName,banco.TB_PedidoFatura.Value,[]) then
begin
banco.TB_PedidoParcelamento.Clear;
ListView1.clear;
end;



DBLookupComboBox3.Visible := not (banco.TB_PedidoFatura.IsNull);
Image2.Visible := DBLookupComboBox3.Visible;
label7.Visible := DBLookupComboBox3.Visible;



end;

procedure TFFinaliza.DBDateEdit1Click(Sender: TObject);
var
Data :Tdate;
begin
data := date;
Data:= banco.TB_PedidoData_Hora.Value;

MessageDlg('Informações do Pedido..:'+#13+
           'Data: '+FormatDateTime('dddd, dd',data)+' de '+FormatDateTime('mm',data)+' de '+FormatDateTime('YYYY',data)+#13+
           'Hora: '+FormatDateTime('hh:mm:ss',Banco.TB_PedidoData_Hora.Value),mtInformation,[mbok],0);

end;

procedure TFFinaliza.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Banco.OpenCNPJCPF(DBEdit3.Text);
end;

procedure TFFinaliza.FormResize(Sender: TObject);

begin
BitBtn1.Left := Width - BitBtn1.Width-75;
BitBtn2.Left := BitBtn1.Left-BitBtn2.Width - 7 ;

StatusBar1.Panels[0].Width := (StatusBar1.Width * 20) div 100;
StatusBar1.Panels[1].Width := BitBtn2.Left - StatusBar1.Panels[0].Width - 10;






end;

procedure TFFinaliza.Edit3Change(Sender: TObject);
begin
  Edit3.Text := FormatDateTime('DD/MM/YYYY hh:mm:ss',banco.TB_PedidoData_Hora.value);
  
end;

procedure TFFinaliza.Edit3ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
Handled := true;

end;

procedure TFFinaliza.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((ssCtrl in Shift) AND (Key = ord('c'))) then
  begin
  Edit3.SelectAll;
  Edit3.CopyToClipboard;
  end;

key := 0;

end;

procedure TFFinaliza.DBLookCidKeyPress(Sender: TObject; var Key: Char);
begin



if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
key:=#0;
exit;
end;


end;

procedure TFFinaliza.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
key:=#0;
exit;
end;


end;

procedure TFFinaliza.DBLookupComboBox2Enter(Sender: TObject);
begin
DBLookupComboBox3.Visible := false;
           Label7.Visible := false;
           Image2.Visible := false;

end;

procedure TFFinaliza.DBLookupComboBox2DropDown(Sender: TObject);
begin
Label7.Visible            := false;
DBLookupComboBox3.Visible := False;
image2.Visible            := false;
end;

procedure TFFinaliza.DBLookupComboBox2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_delete then
begin
DBLookupComboBox3.Visible := false;
          Label7.Visible := False;

end;
end;

procedure TFFinaliza.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if DBLookupComboBox2.Enabled then
DBLookupComboBox3Click(DBLookupComboBox3);

end;

procedure TFFinaliza.DBComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if Key = vk_delete then
begin
DBComboBox1.KeyValue := '';
Key := 0;
end;



end;

procedure TFFinaliza.DBLookupComboBox3DropDown(Sender: TObject);
begin
           Image2.Visible := false;
end;

procedure TFFinaliza.DBLookupComboBox3Exit(Sender: TObject);
begin
Image2.Visible := not (banco.TB_PedidoFatura.IsNull);

end;

procedure TFFinaliza.DBLookupComboBox3Enter(Sender: TObject);
begin

if banco.TB_Parcelamento.SQL.Count <>  4then
begin
  banco.TB_Parcelamento.SQL.Clear;
  banco.TB_Parcelamento.SQL.Add('Select * from tb_parcelamento');
  banco.TB_Parcelamento.SQL.Add('Where formaPagamento = '+IntToStr(banco.TB_PedidoFatura.Value));
  banco.TB_Parcelamento.SQL.Add('and ativo = true');
  banco.TB_Parcelamento.sql.Add('Order by '+banco.TB_ParcelamentoDescricao.FieldName);
  banco.TB_Parcelamento.open;

  Banco.TB_PedidoParcelamento.Clear;
  Label7.Visible := true;
  DBLookupComboBox3.Visible := true;
end
else
  if banco.TB_Parcelamento.SQL[2] <> ('Where formaPagamento = '+IntToStr(banco.TB_PedidoFatura.Value)) then
  begin
  banco.TB_Parcelamento.Close;
  banco.TB_Parcelamento.SQL.Clear;
  banco.TB_Parcelamento.SQL.Add('Select * from tb_parcelamento');
  banco.TB_Parcelamento.SQL.Add('Where formaPagamento = '+IntToStr(banco.TB_PedidoFatura.Value));
  banco.TB_Parcelamento.SQL.Add('and ativo = true');
  banco.TB_Parcelamento.sql.Add('Order by '+banco.TB_ParcelamentoDescricao.FieldName);
  banco.TB_Parcelamento.open;


  Label7.Visible := true;
  DBLookupComboBox3.Visible := true;

  end;


if banco.TB_PedidoParcelamento.IsNull = false then
  Image2.Visible := True;



end;

procedure TFFinaliza.Largura1Click(Sender: TObject);
var
  aux : string;
begin
aux := '0';
aux := IntToStr(Banco.Grid_Finaliza_Height);
if InputQuery('Editando Tabela','Informe a nova altura',aux) then
begin
  if not Banco.IsInt(aux) then
  MessageDlg('Altura incorreta',mtError,[mbok],0)
  else
    try
    if StrToInt(aux) < 20 then
    raise Exception.Create('O valor deve ser maior que "20"');

    banco.Grid_Finaliza_Height := StrToInt(aux);
    ThemeDBGrid2.Height := Banco.Grid_Finaliza_Height;
    
    Except
    MessageDlg('Altura incorreta',mtError,[mbok],0)
   end;
end;
end;







procedure TFFinaliza.OpesdaTabela1Click(Sender: TObject);
begin
IxibirTtulo1.Checked := banco.Grid_Finaliza_Title;

end;

procedure TFFinaliza.IxibirTtulo1Click(Sender: TObject);
begin
banco.Grid_Finaliza_Title := not (banco.Grid_Finaliza_Title);

 if Banco.Grid_Finaliza_Title then  ThemeDBGrid2.Options := ThemeDBGrid2.Options + [dgTitles]
 else                               ThemeDBGrid2.Options := ThemeDBGrid2.Options - [dgTitles];

end;

procedure TFFinaliza.Fonte1Click(Sender: TObject);
begin
Banco.FontDialog.Font := banco.font_grid[6];

if Banco.FontDialog.Execute then
begin

banco.Font_Grid[6] := banco.FontDialog.Font;
//Banco.Font_Grid[6].Style := [];
ThemeDBGrid2.Font   := Banco.Font_grid[6];
end;



end;

procedure TFFinaliza.Cor1Click(Sender: TObject);
begin
banco.ColorDialog.Color := Banco.Cor_Grid [6];

if banco.ColorDialog.Execute then
begin
Banco.Cor_Grid[6] := Banco.ColorDialog.Color;
ThemeDBGrid2.Refresh;
end;

end;

procedure TFFinaliza.ThemeDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  holdcolor : TColor;
begin
HoldColor := ThemeDBGrid2.Brush.Color;

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
  end
 else
  begin
   if Banco.Cor_Grid[6] <> clwhite then
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Cor_Grid[6]
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;
 end;

 (Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFFinaliza.Colunas1Click(Sender: TObject);
var
  A,B : Shortint;
  Add : Boolean;
begin
  Try
    Application.CreateForm(TFVisible,FVisible);

    for A := 0 to Banco.TBClientes.FieldCount -1 do
    if Banco.TBClientes.Fields[A].Tag = 0 then
    begin
      Add := false;
      for b := 0 to ThemeDBGrid2.Columns.Count - 1 do
      if ThemeDBGrid2.Columns[b].Title.Caption = banco.TBClientes.Fields[a].DisplayLabel then
      begin
      Add := true;
      FVisible.CheckListBox1.Checked[FVisible.CheckListBox1.Items.Add(Banco.TBClientes.Fields[a].DisplayLabel,)] := true;
      end;

    if not add then
    FVisible.CheckListBox1.Checked[FVisible.CheckListBox1.Items.Add(Banco.TBClientes.Fields[a].DisplayLabel,)] := false;
    end;




    banco.Clearimg;
    FVisible.ShowModal;
  Finally
    if FVisible.ModalResult = 1 then
    begin
      For A := low(banco.Grid_Widht) to high(banco.Grid_Widht) do
      begin
      banco.Grid_Widht[a] := 0;
      banco.Grid_Colluns[a] := '';
      end;

      B := 0;
      B := low(banco.Grid_Colluns);
      For A := 0 to FVisible.CheckListBox1.Items.Count -1 do
      if FVisible.CheckListBox1.Checked[a] then
      begin
       Banco.Grid_Colluns[b] := Banco.TBClientes.Fields[Banco.SearchField(Banco.TBClientes,FVisible.CheckListBox1.Items[a],false)].FieldName;
       inc(b);
      end;

      LoadColClientes;
      
     end;

   FreeAndNil(FVisible);
end;
end;


procedure TFFinaliza.LoadColClientes;
  Function FieldnameTotile(value : ShortString):ShortString;
  begin
  Result := '';
   if Assigned(banco.TBClientes.Fields.FindField(value)) then
   result := banco.TBClientes.Fields.FindField(value).DisplayLabel;
  end;
var
  i : Shortint;
  Coluna :TColumn;
begin
ThemeDBGrid2.Columns.Clear;

For i := 0 to high(banco.Grid_Colluns) do
if banco.Grid_Colluns[i] <> '' then
begin
 if FieldnameTotile(banco.grid_colluns[i]) <> '' then
 begin
    with ThemeDBGrid2.Columns.Add do
    begin
    FieldName := banco.grid_colluns[i];
    Width     := banco.Grid_Widht[i];
    Title.Caption     := FieldnameTotile(banco.grid_colluns[i]);
      if Width < 30 then     Width := 30;


  {Coluna := ThemeDBGrid2.Columns.Add;
  Coluna.FieldName := banco.grid_colluns[i];
  Coluna.Width     := banco.Grid_Widht[i];
  coluna.Title.Caption     := FieldnameTotile(banco.grid_colluns[i]);}
    end;

 end;
end;
end;



procedure TFFinaliza.saveColClientes;
var
  i : Shortint;
  Coluna :TColumn;
begin
For i := 0 to high(banco.Grid_Colluns) do
if i > (ThemeDBGrid2.Columns.Count-1)  then
Banco.Grid_Colluns[i] := ''
else
begin
  banco.Grid_Colluns[i] :=   ThemeDBGrid2.Columns[i].FieldName;
  banco.Grid_Widht[i] :=   ThemeDBGrid2.Columns[i].Width;
end;
end;






procedure TFFinaliza.Panel4Resize(Sender: TObject);
Var
  TamanhoMax : Cardinal;
begin
//Total Width = 637
DBEdit2.Width := (Panel4.Width * 20) div 100;

{TamanhoMax := 0;
if BttNew.Visible then TamanhoMax := TamanhoMax+ BttNew.Width + 2;
if BttEdit.Visible then TamanhoMax :=TamanhoMax+  BttEdit.Width + 2;
if BttHist.Visible then TamanhoMax := TamanhoMax+ BttHist.Width + 2;
}

Edit1.Width := Panel4.Width - Edit1.Left - (Espaco * 4) - Label10.Width - DBEdit2.Width;


Label10.Left := Edit1.Width + Edit1.Left + espaco;
DBEdit2.Left := Label10.Left + label10.Width + espaco;

DBEdit3.Width := (Panel4.Width * 30) div 100;
Image1.Left := DBEdit3.Width + DBEdit3.Left + Espaco;
DBEdit14.Width := DBEdit3.Width;
DBEdit21.Width := DBEdit3.Width;

DBEdit12.Width := (Panel4.Width * 15) div 100;
Label14.Left := DBEdit12.Left + DBEdit12.Width + Espaco;

ComboBox1.Left := Label14.Left + Label14.Width + Espaco;
DBLookupComboBox1.Left := ComboBox1.Left + ComboBox1.Width + Espaco;


DBLookTipolog.Width := (Panel4.Width * 20) div 100;
DBEdit6.Width := (Panel4.Width * 30) div 100;
DBEdit6.Left := DBLookTipolog.Left + DBLookTipolog.Width + Espaco;
Label36.Left := DBEdit6.Left + DBEdit6.Width + Espaco;
DBEdit7.Left := Label36.Left + Label36.Width + Espaco;

DBEdit9.Width := DBEdit6.Width + Espaco + DBLookTipolog.Width;
Label24.Left := DBEdit9.Left + DBEdit9.Width + Espaco;
DBEdit8.Left := label24.Left + Label24.Width + Espaco;
DBEdit8.Width := (DBEdit7.Width + DBEdit7.Left) - DBEdit8.Left;
DBLookupComboBox1.Width := (DBEdit7.Width + DBEdit7.Left) - DBLookupComboBox1.Left; {Cid}

TamanhoMax := (DBEdit7.Left + DBEdit7.Width) - DBLookTipolog.Left;
TamanhoMax := TamanhoMax - (7 * Espaco) - (DBEdit5.Width * 3)- Label21.Width - Label22.Width;


DBEdit16.Width := TamanhoMax div 3;
DBEdit18.Width := DBEdit16.Width;
DBEdit17.Width := DBEdit16.Width;
DBEdit19.Width := DBEdit16.Width;

Label21.Left  := DBEdit16.Left + DBEdit16.Width + Espaco;
DBEdit11.Left :=  Label21.Left +  Label21.Width + Espaco;
DBEdit18.Left := DBEdit11.Left + DBEdit11.Width + Espaco;
Label22.Left  := DBEdit18.Left + DBEdit18.Width + Espaco;
DBEdit10.Left :=  Label22.Left +  Label22.Width + Espaco;
DBEdit17.Left := DBEdit10.Left + DBEdit10.Width + Espaco;

{ShowMessage(IntToStr(TamanhoMax));
ShowMessage(IntToStr(DBEdit16.Width));}

DBEdit15.Width := (DBEdit18.Left + DBEdit18.Width) - DBEdit15.Left;

DBMemo2.Width := (DBEdit2.Left + DBEdit2.Width)  - DBMemo2.Left;
DBMemo2.Height := Panel4.Height - DBMemo2.top - (Espaco * 2);


if BttHist.Visible then
begin
Edit1.Width := Edit1.Width -1 - BttHist.Width;
BttHist.Left := Edit1.left +1 + Edit1.Width;
end;

if BttEdit.Visible then
begin
  Edit1.Width := Edit1.Width -1 - BttEdit.Width;
  BttEdit.Left := Edit1.left +1 + Edit1.Width;
end;

if BttNew.Visible then
begin
  Edit1.Width := Edit1.Width -1 - BttNew.Width;
  BttNew.Left := Edit1.left +1 + Edit1.Width;
end;


end;

procedure TFFinaliza.BttNewClick(Sender: TObject);
begin
if not Edit1.Enabled then
exit;

Try
Application.CreateForm(TFClientes_New,FClientes_New);
FClientes_New.ShowModal;
Finally

if FClientes_New.ModalResult = mrok then
begin
banco.TB_PedidoID_cliente.Value := Banco.TBClientesCodigo.Value;
Edit1.Text := banco.TBClientesNome_Razao.Value;

VisbileCliente(true);
ShowInfoClient;
end;

FreeAndNil(FClientes_New);
end;


end;

procedure TFFinaliza.BttEditClick(Sender: TObject);
begin
if Edit1.Text = '' then  exit;
if banco.TB_PedidoID_cliente.IsNull then exit;
if banco.TBClientes.RecordCount = 0 then exit;

Try
Application.CreateForm(TFClientes_New,FClientes_New);
FClientes_New.Editing := true;
FClientes_New.DBEdit1.Enabled := false;

FClientes_New.ShowModal;
Finally
if FClientes_New.ModalResult = mrok then
begin
Edit1.Text := banco.TBClientesNome_Razao.Value;
VisbileCliente(true);
end;

FreeandNil(FClientes_New);
end;
end;

procedure TFFinaliza.BttHistClick(Sender: TObject);
begin

if Edit1.Text = '' then  exit;
if banco.TB_PedidoID_cliente.IsNull then exit;
if banco.TBClientes.RecordCount = 0 then exit;

if MessageDlg('Deseja visualizar o histórico do cliente',mtInformation,[mbyes, mbno],0) = mryes then
banco.HistoricoCliente(Banco.TB_PedidoID_cliente.Value);


end;

procedure TFFinaliza.Panel1Resize(Sender: TObject);
begin
DBLookCid.Width := (Panel1.Width * 30) div 100;
DBLookupComboBox2.Width := DBLookCid.Width;
DBLookupComboBox3.Width := (Panel1.Width * 60) div 100;
Image2.Left := DBLookupComboBox3.Left + DBLookupComboBox3.Width + Espaco;


Edit3.Left := Panel1.Width - Edit3.Width - (Espaco * 3);
Label25.Left := Edit3.Left - Label25.Width - Espaco;

CurrencyEdit4.Left := Panel1.Width - CurrencyEdit4.Width - (Espaco * 3);
DBEdit1.Left := CurrencyEdit4.Left;
CurrencyEdit3.Left := CurrencyEdit4.Left;
CurrencyEdit2.Left := CurrencyEdit4.Left;
CurrencyEdit1.Left := CurrencyEdit4.Left;
Label8.Left := CurrencyEdit4.Left;
Label4.Left := CurrencyEdit4.Left;
Label2.Left := CurrencyEdit4.Left;
Label6.Left := CurrencyEdit4.Left;
Label5.Left := CurrencyEdit4.Left;

CheckBox1.Top := Panel1.Height - CheckBox1.Height - (Espaco * 2);
ListView1.Width := CurrencyEdit4.Left - (ListView1.Left * 2);
ListView1.Height := CheckBox1.Top - ListView1.Top - Espaco;


//listiview col width
// 0 = vencimento 30%
// 1 = valor      30%
// 2 = portador   40%
ListView1.Column[0].Width := (ListView1.Width-21) * 30 div 100;
ListView1.Column[1].Width := (ListView1.Width-21) * 30 div 100;
ListView1.Column[2].Width := (ListView1.Width-21) * 40 div 100;
end;

procedure TFFinaliza.Panel5Resize(Sender: TObject);
begin
label26.Width := Panel5.Width;
label38.Width := Panel5.Width;

end;

procedure TFFinaliza.ThemeDBGrid2DblClick(Sender: TObject);
begin
ThemeDBGrid2.Visible := false;
  if Banco.TBClientes.RecordCount > 0 then
  begin
    Edit1.Text := Banco.TBClientesNome_Razao.Value;
    banco.TB_PedidoID_cliente.Value := banco.TBClientesCodigo.Value;
    ShowInfoClient;
    
    if Banco.TB_PedidoComprador_Nome.Value = '' then
    Banco.TB_PedidoComprador_Nome.Value := Banco.TBClientesNome.Value;

    VisbileCliente(true);
    DBEdit2.SetFocus;
  end;
end;

procedure TFFinaliza.SaveColIndex(Grid: TThemeDBGrid);
var
  i : Shortint;
begin
FOr i := 0 to Grid.Columns.Count - 1 do
if Grid.Columns[i].Field = nil then
Banco.Config.WriteInteger('FFinaliza'+Grid.DataSource.DataSet.Name,Grid.Columns[i].FieldName, Grid.Columns[i].Index);
end;

procedure TFFinaliza.LoadColIndex(Grid: TThemeDBGrid);
var
  i : Shortint;
begin
For i := 0 to Grid.Columns.Count - 1 do
if Grid.Columns[i].Field = nil then
grid.Columns[i].Index := Banco.Config.ReadInteger('FFinaliza'+Grid.DataSource.DataSet.Name,Grid.Columns[i].FieldName, Grid.Columns.Count -1);




end;


procedure TFFinaliza.ThemeDBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Texto : ShortString;
begin



if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
begin
  (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
  (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
end
else
begin
 if Banco.Cor_Grid[6] <> clwhite then
 if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Cor_Grid[6];
 end;


(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect,DataCol,Column,State);

//Right = left + width;
//Botton= top + heigth;
Texto := 'Aguardando Finalizar';
(sender as TThemeDBGrid).Canvas.Font.Color := 16747776;

if banco.TB_Vendas_AllCancelado.Value then // item devolvido
begin
Texto := 'Item Devolvido';
  if banco.TB_Vendas_AllQuantiBaixa.Value = banco.TB_Vendas_AllQtd.Value then
  begin
    if banco.TB_Vendas_AllQtd.Value = 1 then  Texto := 'Item devolvido'
                                        else  Texto := 'Todos os items devolvidos';

  end
  else
  if banco.TB_Vendas_AllQtd.Value > banco.TB_Vendas_AllQuantiBaixa.Value then
  begin
          if banco.TB_Vendas_AllQuantiBaixa.Value = 1 then
          Texto := FormatFloat('#.##',banco.TB_Vendas_AllQuantiBaixa.Value)+' item devolvido'
          else
          Texto := FormatFloat('#.##',banco.TB_Vendas_AllQuantiBaixa.Value)+' items devolvidos';

  end
  else
   Texto := 'Devolução Inválida';

  (sender as TThemeDBGrid).Canvas.Font.Color := clRed;

end   //se cancelado = false, entao não foi devolvido
else
if banco.TB_Vendas_AllQuantiBaixa.Value = banco.TB_Vendas_AllQtd.Value then
begin
Texto := 'Item Ok';
(sender as TThemeDBGrid).Canvas.Font.Color := clGreen;
end;


if Column.fieldname = 'Situação' then
begin
(sender as TThemeDBGrid).Canvas.TextOut(
{x}rect.Left+3,
{y}rect.Top+ ( (Rect.Bottom - Rect.Top - (sender as TThemeDBGrid).Canvas.TextHeight(Texto)) div 2)
,Texto);
end;



end;

procedure TFFinaliza.Button1Click(Sender: TObject);
begin
if not Finalizado then
exit;

if Banco.TB_Vendas_All.RecordCount = 0 then
exit;

{Try
  if banco.TB_Vendas_AllCancelado.Value then
  begin
    if banco.TB_Vendas_AllQtd.Value - banco.TB_Vendas_AllQuantiBaixa.Value = 0 then
    exception.Create('Produto Devolvido');
  end
  else
    if banco.TB_Vendas_AllQuantiBaixa.Value = 0 then
    Exception.Create('Produto Devolvido');
Except
MessageDlg('O item não teve baixa, ou foi devolvido',mtInformation,[mbok],0);
exit;
end;}




try
  Application.CreateForm(TFAddProduto,FAddProduto);
  FAddProduto.Devolu:=true;
  FAddProduto.CurrencyEdit1.value := Banco.TB_Vendas_AllValor_Total.Value;
  FAddProduto.Edit2.Text := Banco.TB_Vendas_AllDescri.Value;
  FAddProduto.Edit3.value := Banco.TB_Vendas_AllQtd.Value;
  FAddProduto.Edit4.value := Banco.TB_Vendas_AllValor_un.Value;
  FAddProduto.Edit3.Enabled := false;



  if banco.TB_Vendas_AllCancelado.Value then
  FAddProduto.Edit1.Value := banco.TB_Vendas_AllQtd.Value - banco.TB_Vendas_AllQuantiBaixa.Value
  else
  FAddProduto.Edit1.Value := banco.TB_Vendas_AllQuantiBaixa.Value;

  FAddProduto.CurrencyEdit2.value := FAddProduto.Edit1.value;

  FAddProduto.Showmodal;
Finally
  FreeAndNil(FAddProduto);
end;




end;

procedure TFFinaliza.BaixaEstoque;
var
  Dif_Quant : Real;
begin
if banco.TB_Situacao.Locate(banco.TB_SituacaoCodigo.FieldName,banco.TB_Pedidosituacao.Value,[]) then
if banco.TB_SituacaoBaixaEstoque.Value then
begin
  banco.TB_Vendas_All.First;
  while not banco.TB_Vendas_All.Eof do
  begin
    if banco.TB_Vendas_AllQuantiBaixa.Value <> banco.TB_Vendas_AllQtd.Value then
    begin
     Dif_Quant := 0;
     Dif_Quant := banco.TB_Vendas_AllQtd.Value - Banco.TB_Vendas_AllQuantiBaixa.Value;
     Dif_Quant := Dif_Quant * -1; // trocar de sinal para tirar do estoque
      if banco.TBEstoque_Quant.Locate(banco.TBEstoque_QuantID_Merca.FieldName,banco.TB_Vendas_AllID_mercadoria.value,[]) then
      begin
      banco.TBEstoque_Quant.Edit;
      banco.TBEstoque_QuantQuant.Value := banco.TBEstoque_QuantQuant.Value + Dif_Quant;
      banco.TBEstoque_QuantLastDate.Value := now;
      banco.TBEstoque_Quant.Post;
      banco.TB_Vendas_All.Edit;
      banco.TB_Vendas_AllQuantiBaixa.Value := banco.TB_Vendas_AllQuantiBaixa.Value +(Dif_Quant * -1);
      banco.TB_Vendas_All.Post;
      end;
     // Inserindo ultima data de compra
     if banco.TB_ClientesInfoUltimaCompra.Value <> Date then
     begin
      if banco.TB_ClientesInfo.Locate(banco.TB_ClientesInfoID_Cliente.FieldName,banco.TB_PedidoID_cliente.Value,[]) then
       banco.TB_ClientesInfo.Edit
       else
       begin
       banco.TB_ClientesInfo.Insert;
       banco.TB_ClientesInfoID_Cliente.Value := banco.TB_PedidoID_cliente.Value;
       end;
      banco.TB_ClientesInfoUltimaCompra.Value := now;
      banco.TB_ClientesInfo.Post;
      end;
     //------------------------------------------
     end;
     banco.TB_Vendas_All.Next;
  end;
end;
end;

end.

