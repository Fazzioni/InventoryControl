unit Uemissor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ThemeDBGrid, Mask;

type
  TFEC = class(TForm)
    ListView1: TListView;
    Label1: TLabel;
    Panel2: TPanel;
    Button1: TButton;
    ThemeDBGrid1: TThemeDBGrid;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    StatusBar1: TStatusBar;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ThemeDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ListView1Editing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    Function RefreshStatus:Extended;
    procedure ListView1DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEC: TFEC;

implementation

uses UAddProduto, UDados, UFcliente_New, UCliente_Info, Ufinaliza;

{$R *.dfm}

procedure TFEC.Button1Click(Sender: TObject);
begin
Try
    Application.CreateForm(TFAddProduto,FAddProduto);
    FAddProduto.Showmodal;
Finally
  FreeAndNil(faddproduto);
end;
end;

procedure TFEC.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
var
  i : integer;
begin
if (key = #13 ) then
begin

   Try
    i := StrToInt(Edit1.Text);
    Banco.TBClientes.Close;
    Banco.TBClientes.SQL.Clear;
    Banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
    Banco.TBClientes.SQL.Add('Where codigo = '+IntToStr(i));
    Banco.TBClientes.Open;
    


    if Banco.TBClientes.RecordCount > 0 then
    begin
      Edit1.Text := Banco.TBClientesNome_Razao.Value;
      Button1.SetFocus;
      exit;
    end;

   Except
    i := -1;
   end;



ThemeDBGrid1.Visible := true;
ThemeDBGrid1.SetFocus;

if Edit1.Text = '' then
begin
Banco.TBClientes.Close;
Banco.TBClientes.SQL.Clear;
Banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
Banco.TBClientes.open;
end
else
begin
Banco.TBClientes.Close;
Banco.TBClientes.SQL.Clear;
Banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
Banco.TBClientes.SQL.Add('Where nome_razao like '+chr(39)+Edit1.Text+'%'+chr(39));
Banco.TBClientes.Open;
end;
end;

end;

procedure TFEC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Banco.TBClientes.Close;
Banco.TBClientes.SQL.Clear;
Banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
Banco.TBClientes.Open;

Banco.TBEstoque.Close;
Banco.TBEstoque.SQL.Clear;
Banco.TBEstoque.SQL.Add('Select * from Estoque');

end;

procedure TFEC.ThemeDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
begin
ThemeDBGrid1.Visible := false;
  if Banco.TBClientes.RecordCount > 0 then
  begin
    Edit1.Text := Banco.TBClientesNome_Razao.Value;
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
      ThemeDBGrid1.Visible := false;
      Application.CreateForm(TFInfo_Cliente,FInfo_Cliente);
      FInfo_Cliente.Print;
    Finally
    FreeAndNil(FInfo_Cliente);
    end;

end;


procedure TFEC.ListView1Editing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
AllowEdit := false;
end;

procedure TFEC.Button2Click(Sender: TObject);
begin
if ListView1.ItemIndex = -1 then
exit;

Try
    Application.CreateForm(TFAddProduto,FAddProduto);
    Faddproduto.Editing := true;
    FAddProduto.Edit2.Text := ListView1.Selected.SubItems[2];
    FAddProduto.Edit3.value := StrToFloat(ListView1.Selected.SubItems[1]);
    FAddProduto.Edit4.value := StrToFloat(ListView1.Selected.SubItems[3]);
    FAddProduto.CurrencyEdit1.Value := StrToFloat(ListView1.Selected.SubItems[4]);

    FAddProduto.Showmodal;
Finally
  FreeAndNil(faddproduto);
end;
end;

procedure TFEC.Button3Click(Sender: TObject);
begin
if ListView1.Items.Count > 0 then
if MessageDlg('Deseja remover o registro'+#13+ListView1.Selected.SubItems[2],mtInformation,[mbYes,mbNo],0) = mryes then
begin
  ListView1.DeleteSelected;
  RefreshStatus;
end;
end;

Function TFEC.RefreshStatus:Extended;
var
  i : integer;
begin
result:=0;

For i := 0 to ListView1.Items.Count -1 do
Result  := Result + StrToFloat(ListView1.Items[i].SubItems[4]);


StatusBar1.Panels[2].Text := 'Preço R$ ' + formatfloat('##,###,##0.00',Result); //FloatToStr(Preco);
StatusBar1.Panels[1].Text := 'Registros '+IntToStr(ListView1.Items.Count);
end;

procedure TFEC.ListView1DblClick(Sender: TObject);
begin
Button2Click(sender);
end;

procedure TFEC.Button4Click(Sender: TObject);
begin
if MessageDlg('Deseja cancelar o Pedido?',mtWarning, [mbYes,mbNo],0) = mryes then
close;

end;

procedure TFEC.Button5Click(Sender: TObject);
begin
if (Edit1.Text = '') or (LowerCase(Banco.TBClientesNome_Razao.Value) <> LowerCase(Edit1.Text)) then
begin
MessageDlg('Selecione um cliente',mtError,[mbOK],0);
Edit1.SetFocus;
exit;
end;


if ListView1.Items.Count = 0 then
exit;

Try
  Application.CreateForm(Tffinaliza,Ffinaliza);
  visible := false;
  FFinaliza.Editing := false;
  FFinaliza.ShowModal;
Finally
  FreeAndNil(Ffinaliza);
end;
end;

end.
