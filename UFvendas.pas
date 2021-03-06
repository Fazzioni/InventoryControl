unit UFvendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, Buttons, ComCtrls, DB, DBClient,Math;

type
  TFvendas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    ListView1: TListView;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    ComboBox2: TComboBox;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    MaskEdit4: TMaskEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    Function RefreshStatus:Extended;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Function  ReturnNumber(value:String):Integer;
    procedure BitBtn3Click(Sender: TObject);
    procedure ListView1Editing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure BitBtn4Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
  private


    { Private clarations }
  public
    Cancel : Boolean;
    Lista : Byte;

   Tabela : byte;

    Pedido : Cardinal;
    { Public declarations }
  end;

var
  Fvendas: TFvendas;

implementation

uses  UAddCliente, UDados, UAddProduto, UCliente_Info, Uprinciapl;

{$R *.dfm}

procedure TFvendas.FormCreate(Sender: TObject);
begin
Banco.TBClientes.Open;


  Lista := 0;
  Try
    Cancel := false;

  Application.CreateForm(TFAddCliente,FAddCliente);
  FAddCliente.ShowModal;


  Finally
  FreeAndNil(FAddCliente);
end;
end;

procedure TFvendas.FormShow(Sender: TObject);
begin
case Length(MaskEdit4.Text) of
11: begin
    MaskEdit4.EditMask := '!000.000.000-00;0;';
    Label3.Caption := 'CPF';

    if ComboBox1.ItemIndex = -1 then
    ComboBox1.ItemIndex :=0;

    end;

14: begin
    MaskEdit4.EditMask := '!00.000.000/0000-00;0;';
    Label3.Caption := 'CNPJ';
    if ComboBox1.ItemIndex = -1 then
    ComboBox1.ItemIndex :=1;
   end;
end;
end;




procedure TFvendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = VK_F4) then
begin
Key := 0;
Abort;
end;
end;

procedure TFvendas.BitBtn2Click(Sender: TObject);
begin

close;
end;

procedure TFvendas.BitBtn1Click(Sender: TObject);
begin
if ComboBox1.ItemIndex = -1 then
begin
  MessageDlg('Insira um tipo de venda v?lido',mtError,[mbOK],0);
  ComboBox1.SetFocus;
  Abort;
end;


if Label3.Caption = 'CPF' then
begin
if ComboBox1.ItemIndex <> 0 then
If MessageDlg('Voc? selecionou a lista 2 e o cliente usa CPF, tem certeza que deseja continuar?',mtWarning,[mbYes,mbCancel],0) = mrcancel then
begin
ComboBox1.SetFocus;
Abort;
end;

end
else
if Label3.Caption = 'CNPJ' then
  if ComboBox1.ItemIndex <> 1 then
  If MessageDlg('Voc? selecionou a lista 1 e o cliente usa CNPJ, tem certeza que deseja continuar?',mtWarning,[mbYes,mbCancel],0) = mrcancel then
  begin
  ComboBox1.SetFocus;
  Abort;
  end;





ComboBox1.Enabled := false;
//ComboBox2.Enabled := false;
BitBtn1.Visible := false;
BitBtn2.Visible := false;
BitBtn3.Visible := true;
BitBtn4.Visible := true;
BitBtn5.Visible := true;
BitBtn6.Visible := true;
Panel2.Visible  := true;
ListView1.Visible := true;

 Tabela := ComboBox1.ItemIndex;
 
  RefreshStatus;
end;

procedure TFvendas.BitBtn6Click(Sender: TObject);
Const
  Alfabeto = '0123456789';
var
  S : ShortString;
  i : byte;
begin
Randomize;
s := '';

For i := 0 to 2 do
s := s + Alfabeto[RandomRange(1,10)];

if s = InputBox('Cancelando registro',S,'') then
begin
close;
MessageDlg('Registro cancelado com sucesso',mtInformation,[mbOK],0);
end;
end;

Function TFvendas.RefreshStatus:Extended;
var
  i : integer;
begin
result:=0;

For i := 0 to ListView1.Items.Count -1 do
Result  := Result + StrToFloat(ListView1.Items[i].SubItems[4]);


StatusBar1.Panels[2].Text := 'Pre?o R$ ' + formatfloat('##,###,##0.00',Result); //FloatToStr(Preco);
StatusBar1.Panels[1].Text := 'Registros '+IntToStr(ListView1.Items.Count);
end;

procedure TFvendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    IF TFAddProduto <> nil then
    FreeAndNil(FAddProduto);




end;

function TFvendas.ReturnNumber(value: String): Integer;
var
  i : Byte;
begin


For i := 1 to Length(value) do
if value[i] = '.' then
begin
Result := StrToInt(copy(value,1,i-1));
exit;
end;


end;

procedure TFvendas.BitBtn3Click(Sender: TObject);
begin
    IF FAddProduto = nil then
    Application.CreateForm(TFAddProduto,FAddProduto);

    FAddProduto.Show;

end;

procedure TFvendas.ListView1Editing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
AllowEdit := false;
end;

procedure TFvendas.BitBtn4Click(Sender: TObject);
begin

if ListView1.Items.Count > 0 then
ListView1.DeleteSelected;

RefreshStatus;
end;

procedure TFvendas.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Odd(item.index) then
    Listview1.Canvas.Brush.Color := clBtnFace//Segunda Linha
  else
    ListView1.Canvas.Brush.Color := clWhite;//Primeira Linha
end;

procedure TFvendas.BitBtn5Click(Sender: TObject);
var
  lista_Fin : TStringList;
  i : Integer;
begin
  if ListView1.Items.Count = 0 then
  exit;

    if MessageDlg('Deseja finalizar o pedido?', mtWarning,[mbYes,mbCancel],0) = mrcancel then
    Exit;


TRY

  Banco.TB_Pedido.Open;
  Banco.TB_Pedido.Insert;

//  Banco.TB_PedidoID_cliente.Value := Banco.TBClientesCodigo.Value;
// Banco.TB_PedidoTipo_Table.Value := ComboBox1.ItemIndex;
  Banco.TB_PedidoData_Hora.Value := now;
  Banco.TB_PedidoTotal_Reg.Value := ListView1.Items.Count;


 // Banco.TB_PedidoNome_Cliente.value := edit2.text;

  Banco.TB_PedidoPreco.Value :=RefreshStatus;
  Banco.TB_PedidoDescri.Value := ComboBox2.Text;
  Banco.TB_Pedido.Post;



  Pedido := Banco.TB_PedidoID_Pedido.Value;

  Banco.TB_Pedido.close;




  Banco.TB_Vendas_All.Open;

  For i := 0 to ListView1.Items.Count -1 do
  begin
      Banco.TB_Vendas_All.Insert;
      Banco.TB_Vendas_AllID_mercadoria.Value := StrToInt(ListView1.Items[i].caption);
      Banco.TB_Vendas_AllQtd.Value           := StrToInt(ListView1.Items[i].SubItems[1]);
      Banco.TB_Vendas_AllID_Pedido.Value     := Pedido;
  //   Banco.TB_Vendas_AllTipo.Value          := Lista;
      Banco.TB_Vendas_All.Post;
 end;

 Banco.TB_Vendas_All.Close;

// SAVE XML
 lista_Fin := TStringList.Create;
 lista_Fin.Clear;

 lista_Fin.Add('[Pedido_Info]');
 lista_Fin.Add('User_Cod='+Edit1.Text);
 lista_Fin.Add('User_Name='+Edit2.Text);
 lista_Fin.Add('List='+IntToStr(ComboBox1.ItemIndex+1));
 lista_Fin.Add('Desc='+ComboBox2.Text);
 lista_Fin.Add('Data='+DateToStr(Date));
 lista_Fin.Add('Registro='+IntToStr(ListView1.Items.Count));



  Banco.ClientDataSet1.CreateDataSet;
  Banco.ClientDataSet1.Open;
  For i := 0 to ListView1.Items.Count -1 do
  begin

    Banco.ClientDataSet1.Insert;

 {   ClientDataSet1Codigo.Value := StrToInt(ListView1.Items[i].Caption);
    ClientDataSet1Qtd.Value :=    StrToInt(ListView1.Items[i].SubItems[1]);
    ClientDataSet1Unidade.Value := (ListView1.Items[i].SubItems[2]);
    ClientDataSet1Descricao.Value :=(ListView1.Items[i].SubItems[3]);
    ClientDataSet1PrecoUnit.Value := StrToFloat(ListView1.Items[i].SubItems[4]);
    ClientDataSet1Total.Value :=    StrToFloat(ListView1.Items[i].SubItems[5]);
  }


    Banco.ClientDataSet1Cod.Value := StrToInt(ListView1.Items[i].Caption);
    Banco.ClientDataSet1Qtd.Value := StrToInt(ListView1.Items[i].SubItems[1]);

    Banco.ClientDataSet1.Post;

  end;

If not DirectoryExists(Banco.App_Dir + 'Pedidos') then
CreateDir(Banco.App_Dir + 'Pedidos');


if  DirectoryExists(Banco.App_Dir + 'Pedidos') then
begin
Banco.ClientDataSet1.SaveToFile(Banco.App_Dir +'Pedidos\'+  IntToStr(Pedido) +'.xml',dfXML);
lista_Fin.Add('File_Name='+Banco.App_Dir +'Pedidos\'+  IntToStr(Pedido) +'.xml');
lista_Fin.SaveToFile(Banco.App_Dir +'Pedidos\'+  IntToStr(Pedido) +'.ini');
end
else
begin
Banco.ClientDataSet1.SaveToFile(Banco.App_Dir + IntToStr(Pedido) +'.xml',dfXML);
Lista_Fin.Add('File_Name='+Banco.App_Dir + IntToStr(Pedido) +'.xml');
lista_Fin.SaveToFile(Banco.App_Dir + IntToStr(Pedido) +'.ini');
end;
  FreeAndNil(lista_Fin);


  MessageDlg('Pedido Finalizado com sucesso'+#13+'N? '+IntToStr(Pedido),mtInformation,[mbOK],0);
  Banco.ClientDataSet1.Active := false;


  if FPrincipal.Option_Pedido = 1 then
  begin
    if MessageDlg('Voc? deseja visualizar o pedido '+IntToStr(Pedido)+'?',mtInformation,[mbYes, mbNo],0) = mryes then
    Banco.Imprime_Pedido(Pedido);
  end
  else
   if FPrincipal.Option_Pedido = 2 then
    Banco.Imprime_Pedido(Pedido);

  close;
Except
 On e: exception do
 begin
  Banco.Create_Erro(e.ClassName,e.Message);

  MessageDlg('N?o foi poss?vel finalizar o pedido, salvo na pasta PEDIDOS COM ERRO',mtError, [mbOK],0);

  IF lista_Fin = nil then
  lista_Fin.Create;

  lista_Fin.Clear;
  lista_Fin.Add('[Pedido_Info]');
  lista_Fin.Add('User_Cod='+Edit1.Text);
  lista_Fin.Add('User_Name='+Edit2.Text);
  lista_Fin.Add('CNPJ='+MaskEdit4.Text);
  lista_Fin.Add('List='+IntToStr(ComboBox1.ItemIndex+1));
  lista_Fin.Add('Desc='+ComboBox2.Text);
  lista_Fin.Add('ERRO='+e.message);

 Banco.ClientDataSet1.Active := false;


    if not DirectoryExists(Banco.App_Dir + 'Pedidos Com Erro\') then
    CreateDir(Banco.App_Dir + 'Pedidos com Erro\');

  For i := 0 to ListView1.Items.Count -1 do
  lista_Fin.Add(ListView1.Items[i].Caption+';'+ListView1.Items[i].SubItems[1]);

  lista_Fin.SaveToFile(Banco.App_Dir + 'Pediso com Erro\'+Edit1.Text+'_'+FormatDateTime('HH.MM.SS',Time)+'_'+FormatDateTime('DD.MM.YY',date));
  

  FreeAndNil(lista_Fin);
end;
end;

end;

procedure TFvendas.SpeedButton1Click(Sender: TObject);
begin
  Try
  Application.CreateForm(TFInfo_Cliente,FInfo_Cliente);
  FInfo_Cliente.Print;
  Finally
  FreeAndNil(FInfo_Cliente);
  end;
end;

procedure TFvendas.ListView1DblClick(Sender: TObject);
var
Qtd : ShortString;
begin
if ListView1.Items.Count = 0 then exit;


QTD := ListView1.Selected.SubItems[1];

QTD := InputBox('Insira quantidade',ListView1.Selected.SubItems[2],qtd);

Try
  StrToInt(Qtd);

Except
  MessageDlg('Quantidade inv?lida',mtError,[mbOK],0);
  Abort;
end;

  iF StrToInt(Qtd) <= 0 then
  begin
  MessageDlg('A Quantidade deve ser maior que ZERO',mtError,[mbOK],0);
  Abort;
  end;


   If QTD <> ListView1.Selected.SubItems[1] then
   begin
    ListView1.Selected.SubItems[1] := QTD;
    ListView1.Selected.SubItems[4] := FloatToStr( StrToFloat(Qtd) * StrToFloat(ListView1.Selected.SubItems[3]) );
   end;
  RefreshStatus;


end;

end.
