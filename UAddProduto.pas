unit UAddProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ThemeDBGrid, Buttons, Mask, ToolEdit,
  CurrEdit, ComCtrls, DBCtrls, DB, ADODB, Menus;

type
  TFAddProduto = class(TForm)
    ThemeDBGrid1: TThemeDBGrid;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label5: TLabel;
    Edit4: TCurrencyEdit;
    Edit3: TCurrencyEdit;
    TB_Estoque: TADOQuery;
    TB_EstoqueCodigo: TAutoIncField;
    TB_EstoqueDescricao: TWideStringField;
    TB_EstoqueUn: TIntegerField;
    TB_EstoqueValor: TBCDField;
    TB_EstoqueQuantidade: TFloatField;
    TB_Estoqueun_virtual: TStringField;
    Estoque_Source: TDataSource;
    PopupMenu2: TPopupMenu;
    OpesdaTabela1: TMenuItem;
    Fonte1: TMenuItem;
    Colunas1: TMenuItem;
    Cor1: TMenuItem;
    N2: TMenuItem;
    IxibirTtulo1: TMenuItem;
    CurrencyEdit2: TCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TCurrencyEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure ThemeDBGrid1Exit(Sender: TObject);
    procedure ThemeDBGrid1KeyPress(Sender: TObject; var Key: Char);
    Procedure Calcula;
    procedure Edit3Change(Sender: TObject);
    procedure CurrencyEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure IxibirTtulo1Click(Sender: TObject);
    procedure OpesdaTabela1Click(Sender: TObject);
    procedure Colunas1Click(Sender: TObject);
    procedure TB_EstoqueAfterOpen(DataSet: TDataSet);
    procedure TB_EstoqueBeforeClose(DataSet: TDataSet);
    procedure Fonte1Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ThemeDBGrid1DblClick(Sender: TObject);
    procedure DevolveClick(Sender: TObject);
    procedure CurrencyEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    Editing : Boolean;
    Devolu  : Boolean;
    Grid_Title : Boolean;
    { Public declarations }
  end;

var
  FAddProduto: TFAddProduto;

implementation

uses UDados, UFvendas, Ufinaliza, IniFiles, Uvisible;

{$R *.dfm}

procedure TFAddProduto.Calcula;
begin
 if Edit3.value = 0 then
 begin
 CurrencyEdit1.Value := 0;
 exit;
 end;

if not (TB_Estoque.State in [dsinactive]) then
if  tb_estoque.RecordCount = 0 then
  CurrencyEdit1.Value := 0;


Try
 CurrencyEdit1.Value := Edit3.value * Edit4.value ;
Except
 CurrencyEdit1.Value := 0;
end;

end;

procedure TFAddProduto.BitBtn2Click(Sender: TObject);
begin
close;

end;

procedure TFAddProduto.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
Abort;
end;
end;

procedure TFAddProduto.BitBtn1Click(Sender: TObject);
var
  i : Shortint;
begin

  if TB_Estoque.State in [dsinactive] then
  TB_Estoque.Open;

  if tb_estoque.RecordCount = 0 then exit;

  if Editing = false then
  if LowerCase(Edit2.Text) <> LowerCase(tb_estoqueDescricao.Value) then
  begin
    MessageDlg('Produto não encontrado',mtError,[mbOK],0);
    Edit2.SetFocus;
    exit;
  end;

    if Edit3.Value <= 0 then
    begin
      MessageDlg('A Quantidade, não pode ser menor ou igual a zero',mtError,[mbOK],0);
      Edit3.SetFocus;
      Abort;
    end;

    Try
      StrToFloat(Edit3.Text);
    Except
       MessageDlg('Insira uma quantidade válida',mtError,[mbOK],0);
      Edit3.SetFocus;
      Abort;
    end;

    If Edit4.Value <= 0 then
    begin
      MessageDlg('Valor unitário, não pode ser menor ou igual a zero',mtError,[mbOK],0);
      Edit4.SetFocus;
      Abort;
    end;

    If CurrencyEdit1.Value <= 0 then
    begin
      MessageDlg('O Preço Total  unitário, não pode ser menor ou igual a zero',mtError,[mbOK],0);
      Calcula;
      CurrencyEdit1.SetFocus;
      Abort;
    end;


    if not Editing  then
    begin
    Banco.TB_Vendas_All.Insert;
    Banco.TB_Vendas_AllID_mercadoria.Value := tb_estoqueCodigo.Value;
    Banco.TB_Vendas_AllID_Pedido.Value := FFinaliza.Pedido;
    end
    else
    banco.TB_Vendas_All.Edit;

    Banco.TB_Vendas_AllQtd.Value := Edit3.value;
    Banco.TB_Vendas_AllValor_un.Value := Edit4.value;
    Banco.TB_Vendas_AllValor_Total.Value :=  CurrencyEdit1.value;


    Edit2.Text := '';

    Edit3.Value := 1;
    Edit4.Value := 0;

    {tb_estoque.close;
    tb_estoque.SQL.Clear;
    tb_estoque.SQL.Add('Select * from Estoque');
    tb_estoque.open;}

    if FFinaliza.Editing then //se está editando o pedido
    begin
        if Editing then //se está editando o registro
        begin
           For i := 0 to Banco.TB_Vendas_All.Fields.Count - 1 do
           if not Banco.TB_Vendas_All.Fields[i].Lookup then
           if banco.TB_Vendas_All.Fields[i].OldValue <> banco.TB_Vendas_All.Fields[i].Value then
           FFinaliza.WriteAuditoria(banco.TB_Vendas_AllCodigo.Value,Banco.TB_Vendas_AllID_mercadoria.Value,banco.TB_Vendas_All.Fields[i].FieldName,VarToStr(banco.TB_Vendas_All.Fields[i].Value),VarToStr(banco.TB_Vendas_All.Fields[i].OldValue),'2');
        end
        else
        begin
           For i := 0 to Banco.TB_Vendas_All.Fields.Count - 1 do
           if not Banco.TB_Vendas_All.Fields[i].Lookup then
           if banco.TB_Vendas_All.Fields[i] <> banco.TB_Vendas_AllID_Pedido then
           if banco.TB_Vendas_All.Fields[i].OldValue <> banco.TB_Vendas_All.Fields[i].Value then
           FFinaliza.WriteAuditoria(0,Banco.TB_Vendas_AllID_mercadoria.Value,banco.TB_Vendas_All.Fields[i].FieldName,VarToStr(banco.TB_Vendas_All.Fields[i].Value),VarToStr(banco.TB_Vendas_All.Fields[i].OldValue),'1');
        end;
    end;

    banco.TB_Vendas_All.Post;
    Banco.TB_Vendas_All.Refresh;
    FFinaliza.RefreshStatus;
    Edit2.Enabled := true;

    if Editing then
    begin
    MessageDlg('Produto editado',mtInformation,[mbOK],0);


    close;
    end
    else
    begin
      Edit2.SetFocus;
    end;

 end;



procedure TFAddProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = VK_escape) then
begin
close;
Key := 0;
exit;
end;
end;

procedure TFAddProduto.Edit2KeyPress(Sender: TObject; var Key: Char);
var
  i : integer;
begin
Edit3.Value := 1;
Edit4.Value := 0;
CurrencyEdit1.Value :=0;

if (key = #13 ) then
begin
key := #0;

    tb_estoque.Close;
    tb_estoque.SQL.Clear;
    tb_estoque.SQL.Add('Select * from Estoque');
    tb_estoque.SQL.Add('where ativo = true');

if Banco.IsInt(Edit2.Text) then
Try
  tb_estoque.Open;
  if tb_estoque.Locate(tb_estoqueCodigo.FieldName,  StrToInt(Edit2.Text),[]) then

    if tb_estoque.RecordCount > 0 then
    begin
    Edit2.Text := tb_estoqueDescricao.Value;
    Edit3.value := 1;
    Edit4.value := tb_estoqueValor.Value;
    Edit3.SetFocus;
    Calcula;
    exit;
    end;
Except
end;

ThemeDBGrid1.Visible := true;
ThemeDBGrid1.SetFocus;

if Edit2.Text <> '' then
tb_estoque.SQL.Add('and descricao like '+chr(39)+Edit2.Text+'%'+chr(39));



tb_estoque.Open

end;
end;

procedure TFAddProduto.ThemeDBGrid1Exit(Sender: TObject);
begin
ThemeDBGrid1.Visible := false;
end;

procedure TFAddProduto.ThemeDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
begin
ThemeDBGrid1.Visible := false;
    if tb_estoque.RecordCount > 0 then
    begin
      Edit2.Text := tb_estoqueDescricao.Value;
      Edit3.value := 1;
      Edit4.value := tb_estoqueValor.Value;
      Edit3.SetFocus;
      Calcula;
  end
  else
    Edit2.SetFocus;
end
else
    if tb_estoque.RecordCount = 0 then
    Edit2.SetFocus;
end;


procedure TFAddProduto.Edit3Change(Sender: TObject);
begin
Calcula;
end;

procedure TFAddProduto.CurrencyEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
Abort;
end;
end;

procedure TFAddProduto.FormCreate(Sender: TObject);
begin
Editing := false;
Devolu := false;
Grid_Title := true;
try
Width := banco.Config.ReadInteger('Form_AddProduto','Width',Width);
Height := banco.Config.ReadInteger('Form_AddProduto','Height',Height);
Grid_Title := banco.Config.ReadBool('Form_AddProduto','Grid_Title',Grid_Title);
 if Grid_Title then  ThemeDBGrid1.Options := ThemeDBGrid1.Options + [dgTitles]
 else                ThemeDBGrid1.Options := ThemeDBGrid1.Options - [dgTitles];
 
except
end;



 end;

procedure TFAddProduto.FormShow(Sender: TObject);
const
  Larg = 7;
begin

if Devolu then
begin
Edit2.Enabled := false;
Caption := 'Devolucao de item';
BitBtn1.Caption := 'Aplicar';
BitBtn2.Caption := 'Cancelar';
BitBtn1.OnClick := DevolveClick;

Label6.Top := Edit3.Top + Larg + Edit3.Height+ Larg;
CurrencyEdit2.Top := Label6.Top + Label6.Height  ;

Label5.Top := CurrencyEdit2.Top + Larg + CurrencyEdit2.Height+ Larg;
Edit4.Top := Label5.Top + Label5.Height +2;

Label4.Top := Edit4.Top + Larg + Edit4.Height+ Larg;
CurrencyEdit1.Top := Label4.Top + Label4.Height+2 ;

Label6.Visible := true;
CurrencyEdit2.Visible := true;

Edit1.Visible := true;
Label7.Visible := true;


Edit4.OnChange := CurrencyEdit2.OnChange;

end
else
if Editing then
begin
Edit2.Enabled := false;
Caption := 'Editando produto';
BitBtn1.Caption := 'Editar';
BitBtn2.Caption := 'Cancelar';
end
else
begin
Banco.LoadIndexOf(TB_Estoque);
ThemeDBGrid1.Font := banco.font_grid[10];
end;




end;

procedure TFAddProduto.FormResize(Sender: TObject);
Const
  Largura = 16;
begin
  Edit3.Left := ClientWidth - Largura - CurrencyEdit1.Width;
  Edit4.Left := Edit3.Left;
  CurrencyEdit1.Left := Edit3.Left;
  CurrencyEdit2.Left := Edit3.Left;

  Label3.Left := Edit3.Left;
  Label4.Left := Edit3.Left;
  Label5.Left := Edit3.Left;
  Label6.Left := Edit3.Left;

  Edit2.Width := Edit3.Left - Edit2.Left- 10;
  ThemeDBGrid1.Width := Edit2.Width;

  BitBtn1.Left := ClientWidth - Largura - BitBtn1.Width;
  BitBtn2.Left := BitBtn1.Left - 10 - BitBtn2.Width;
  BitBtn1.Top  := ClientHeight - Largura - BitBtn1.Height;
  BitBtn2.Top  := BitBtn1.Top;

  ThemeDBGrid1.Height := BitBtn1.Top - ThemeDBGrid1.Top - Largura;

  Edit1.Left := ClientWidth - Largura - Edit1.Width;
  Label7.Left := Edit1.Left;


if Devolu then
Edit3.Width :=CurrencyEdit1.Width - Edit1.Width - 3;


end;

procedure TFAddProduto.FormHide(Sender: TObject);
begin
banco.Config.WriteInteger('Form_AddProduto','Width',Width);
banco.Config.WriteInteger('Form_AddProduto','Height',Height);
banco.Config.WriteBool('Form_AddProduto','Grid_Title',Grid_Title);
banco.SaveIndexOf(TB_Estoque);
end;

procedure TFAddProduto.IxibirTtulo1Click(Sender: TObject);
begin
  Grid_Title := not(Grid_Title);
  
 if Grid_Title then  ThemeDBGrid1.Options := ThemeDBGrid1.Options + [dgTitles]
 else                               ThemeDBGrid1.Options := ThemeDBGrid1.Options - [dgTitles];


end;

procedure TFAddProduto.OpesdaTabela1Click(Sender: TObject);
begin
IxibirTtulo1.Checked := Grid_Title;


end;

procedure TFAddProduto.Colunas1Click(Sender: TObject);
var
  i : integer;
begin
  Try
    Application.CreateForm(TFVisible,FVisible);

    for i := 0 to TB_Estoque.FieldCount -1 do
    if TB_Estoque.Fields[i].Tag = 0 then
    FVisible.CheckListBox1.Checked[FVisible.CheckListBox1.Items.Add(TB_Estoque.Fields[i].DisplayLabel,)] := TB_Estoque.Fields[i].Visible;

    FVisible.ShowModal;
  Finally
    if FVisible.ModalResult = 1 then
    begin
     for i := 0 to FVisible.CheckListBox1.Items.Count -1 do
     TB_Estoque.Fields[Banco.SearchField(TB_Estoque,FVisible.CheckListBox1.Items[i],false)].Visible := FVisible.CheckListBox1.Checked[i];

     Banco.SaveIndexOf(TB_Estoque);

     end;

   FreeAndNil(FVisible);
end;
end;

procedure TFAddProduto.TB_EstoqueAfterOpen(DataSet: TDataSet);
begin
banco.LoadColumns(ThemeDBGrid1);

end;

procedure TFAddProduto.TB_EstoqueBeforeClose(DataSet: TDataSet);
begin
banco.SaveColumns(ThemeDBGrid1);
end;

procedure TFAddProduto.Fonte1Click(Sender: TObject);
begin
Banco.FontDialog.Font := banco.font_grid[10];

if Banco.FontDialog.Execute then
begin
banco.Font_Grid[10] := banco.FontDialog.Font;
Banco.Font_Grid[10].Style := [];
ThemeDBGrid1.Font := banco.FontDialog.Font;
end;

end;

procedure TFAddProduto.Cor1Click(Sender: TObject);
begin
banco.ColorDialog.Color := Banco.Cor_Grid [10];

if banco.ColorDialog.Execute then
begin
Banco.Cor_Grid[10] := Banco.ColorDialog.Color;
ThemeDBGrid1.Refresh;
end;

end;

procedure TFAddProduto.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  HoldColor : TColor;
begin

HoldColor := ThemeDBGrid1.Brush.Color;

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
  end
 else
  begin
if Banco.Cor_Grid[10] <> clwhite then
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Cor_Grid[10]
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;
 end;

(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TFAddProduto.ThemeDBGrid1DblClick(Sender: TObject);
begin
ThemeDBGrid1.Visible := false;
    if tb_estoque.RecordCount > 0 then
    begin
      Edit2.Text := tb_estoqueDescricao.Value;
      Edit3.value := 1;
      Edit4.value := tb_estoqueValor.Value;
      Edit3.SetFocus;
      Calcula;
    end;
end;


procedure TFAddProduto.DevolveClick(Sender: TObject);
var
  NewBaixa : Real;
begin
NewBaixa := 0;
NewBaixa := CurrencyEdit2.Value;

if NewBaixa <= 0 then
begin
MessageDlg(' A quantidade não pode ser igual ou menor que zero',mtError,[mbok],0);
exit;
end;

if NewBaixa > Edit1.Value then
begin
MessageDlg('A quantidade deve ser menor ou igual que a quantidade enviada',mtError,[mbok],0);
exit;
end;

try
  banco.TB_Vendas_All.Edit;
    if banco.TB_Vendas_AllCancelado.Value then
    banco.TB_Vendas_AllQuantiBaixa.Value :=  banco.TB_Vendas_AllQuantiBaixa.Value + NewBaixa
    else
    banco.TB_Vendas_AllQuantiBaixa.Value := NewBaixa;


  banco.TB_Vendas_AllCancelado.Value := true;
  banco.TB_Vendas_AllValor_un.Value := Edit4.Value;
  banco.TB_Vendas_AllValor_Total.Value := CurrencyEdit1.Value;
  


banco.TB_Vendas_All.Post;
MessageDlg('Devolução efetuada com sucesso',mtInformation,[mbok],0);
close;
Except
on e :exception do
  begin
  MessageDlg(e.Message,mtError,[mbok],0);
  banco.Create_Erro(e.ClassName,e.Message);

  if banco.TB_Vendas_All.State in [dsedit] then
  banco.TB_Vendas_All.Cancel;
  
  end;
end;




//devolucao = total - baixa
//se eu tenho 10 e devolve 3 entao minha baixa= 7


end;

procedure TFAddProduto.CurrencyEdit2Change(Sender: TObject);
var
  NewQtd : Real;
begin
Try
  NewQtd := Edit1.Value - CurrencyEdit2.Value;

  if CurrencyEdit2.Value = 0 then
  CurrencyEdit1.Value := Edit1.Value * Edit4.Value
  else
  if NewQtd < 0 then
  CurrencyEdit1.Value := 0
  else
  CurrencyEdit1.Value := NewQtd * Edit4.value ;


Except
 CurrencyEdit1.Value := 0;
end;

end;

end.

