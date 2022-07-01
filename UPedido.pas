unit UPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask,   Grids, DBGrids, ThemeDBGrid, ComCtrls,DateUtils,
  ExtCtrls,db, inifiles, Menus,ShellAPI,Printers;

type
  TFPedido = class(TForm)
    ThemeDBGrid1: TThemeDBGrid;
    Image1: TImage;
    Img1: TImage;
    Img2: TImage;
    Img3: TImage;
    Img4: TImage;
    Img5: TImage;
    Img6: TImage;
    Img7: TImage;
    Img8: TImage;
    MainMenu1: TMainMenu;
    Situacao1: TMenuItem;
    Pedidos1: TMenuItem;
    Novo1: TMenuItem;
    Editar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Exibir1: TMenuItem;
    Pesquisar1: TMenuItem;
    N2: TMenuItem;
    Fonte1: TMenuItem;
    N01: TMenuItem;
    Colunas1: TMenuItem;
    N3: TMenuItem;
    Listar1: TMenuItem;
    SelecrionarLinha1: TMenuItem;
    N4: TMenuItem;
    HistricodoCliente1: TMenuItem;
    Timer1: TTimer;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure ThemeDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ThemeDBGrid2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);

    procedure FormShow(Sender: TObject);
    procedure Save;
    procedure FormHide(Sender: TObject);
    procedure Img1Click(Sender: TObject);
    procedure Img2Click(Sender: TObject);
    procedure Img5Click(Sender: TObject);
    procedure Img7Click(Sender: TObject);
    procedure Img3Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Situacao1Click(Sender: TObject);
    procedure Img4Click(Sender: TObject);
    procedure ThemeDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Img6Click(Sender: TObject);
    procedure HistricodoCliente1Click(Sender: TObject);
    procedure Img8Click(Sender: TObject);
    procedure SelecrionarLinha1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Exibir1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure ThemeDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    savecol : Boolean;
     JaExec : Boolean;

    { Public declarations }
  end;

var
  FPedido: TFPedido;

implementation

uses UDados, Uemissor, Ufinaliza, Uvisible, Usituacao, UPesquisa, Math,
  ppCtrls, Uprinciapl;

{$R *.dfm}

procedure TFPedido.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
Abort;
//exit;
end;
if not (Key in['0'..'9',Chr(8)]) then
begin
Key:= #0;
Abort;
end;
end;


procedure TFPedido.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
Abort;
//exit;
end;
end;

procedure TFPedido.ThemeDBGrid2KeyPress(Sender: TObject; var Key: Char);
var
  Total : Currency;
begin
if key = #8 then
begin
  Total := 0;
  Banco.TB_Pedido.First;
  While not Banco.TB_Pedido.Eof do
  begin
    Total := Total + Banco.TB_PedidoPreco.Value;
    Banco.TB_Pedido.Next;
  end;
  MessageBox(0,pchar('Informações dos registros filtrados:'+#13+'Total de registros: '+IntToStr(Banco.TB_Pedido.RecordCount)+#13+'R$ '+formatfloat('##,###,##0.00',Total)),'Informação',0);

end;
end;

procedure TFPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = VK_escape) then
begin
close;
Key := 0;
exit;
end;
end;

procedure TFPedido.ThemeDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Begin

if not JaExec then
if not banco.Config_GRID_Foco[2] then
begin
showScrollBar((Sender as TThemeDBGrid).Handle,SB_HORZ,false);
(Sender as TThemeDBGrid).Options := (Sender as TThemeDBGrid).Options + [dgRowSelect];
JaExec := true;
end
else
begin
JaExec := true;
ShowScrollBar((Sender as TThemeDBGrid).Handle,SB_HORZ,true);
(Sender as TThemeDBGrid).Options := (Sender as TThemeDBGrid).Options - [dgRowSelect];
end;


   if not banco.TB_PedidoColor.IsNull then
   (Sender as TThemeDBGrid).Canvas.Font.Color := Banco.TB_PedidoColor.Value;

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
  if ColorToRGB((sender as TThemeDBGrid).Canvas.Font.Color) < 100 then
   (sender as TThemeDBGrid).Canvas.Font.Color := clwhite;

   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
  end
  else
  begin
    if not banco.TB_PedidoColorBrush.IsNull then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.TB_PedidoColorBrush.Value;
  end;

   (Sender as TThemeDBGrid).DefaultDrawColumnCell(rect,DataCol,Column,State);

end;





procedure TFPedido.Save;
var
  i : integer;
begin

for i := 0 to Banco.TB_Pedido.Fields.Count - 1 do
begin
  Banco.Config.WriteInteger(banco.TB_Pedido.Name+'_Position',Banco.TB_Pedido.Fields[i].FieldName,  Banco.TB_Pedido.Fields[i].Index);
  Banco.Config.WriteBool   (banco.TB_Pedido.Name+'_Visible' ,Banco.TB_Pedido.Fields[i].FieldName,  Banco.TB_Pedido.Fields[i].Visible);
end;

end;


procedure TFPedido.FormShow(Sender: TObject);
var
  i : integer;
begin
savecol := FALSE;
BANCO.TB_Pedido.Close;

JaExec := false;
ThemeDBGrid1.Font := banco.font_grid[2];


banco.ImgForm := FPedido;
banco.Img[1] := Img1.ComponentIndex;
banco.Img[2] := Img2.ComponentIndex;
banco.Img[3] := Img3.ComponentIndex;
banco.Img[4] := Img4.ComponentIndex;
banco.Img[5] := Img5.ComponentIndex;
banco.Img[6] := Img6.ComponentIndex;
banco.Img[7] := Img7.ComponentIndex;
banco.Img[8] := Img8.ComponentIndex;
banco.Img[9] := -1;
banco.calcpos;

Color := Image1.Canvas.Pixels[2,2];





For i := 0 to Banco.TB_Pedido.Fields.Count -1 do
if Banco.TB_Pedido.Fields[i].Tag =1 then
Banco.TB_Pedido.Fields[i].Visible := false;

Banco.TB_Pedido.close;
Banco.TB_Pedido.SQL.Clear;
Banco.TB_Pedido.SQL.Add(banco.Sql_Tb_Pedido_Default);

if Banco.TBMunicipio.State in [dsInactive]         then Banco.TBMunicipio.Open;
if Banco.TB_FormaPagamento.State in [dsInactive]   then Banco.TB_FormaPagamento.Open;
if Banco.TBLogra.State in [dsInactive]             then Banco.TBLogra.Open;
if Banco.TB_Situacao.State in [dsInactive]         then Banco.TB_Situacao.Open;
if Banco.TBClientes.State in [dsInactive]          then Banco.TBClientes.Open;
if Banco.TB_Pedido.State in [dsInactive]           then Banco.TB_Pedido.Open;
if Banco.TB_Parcelamento_Lista.State in[dsInactive]then Banco.TB_Parcelamento_Lista.Open;


Banco.LoadColumns(ThemeDBGrid1);

{if banco.TBClientes.SQL.Count > 1 then
begin
Banco.TBClientes.close;
Banco.TBClientes.SQL.Clear;
Banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
banco.TBClientes.Open;
end
else
if Banco.TBClientes.State in [dsInactive]
then Banco.TBClientes.Open;}

savecol := TRUE;
end;


procedure TFPedido.FormHide(Sender: TObject);
begin
try
banco.Last_Grid_Select[2] := Banco.TB_PedidoID_Pedido.Value;
except
end;

Banco.SaveColumns(ThemeDBGrid1);

save;

if banco.TBClientes.SQL.Count > 1 then
begin
Banco.TBClientes.close;
Banco.TBClientes.SQL.Clear;
Banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
end;


end;

procedure TFPedido.Img1Click(Sender: TObject);
begin
if not banco.Ped_Novo then banco.NotPermissao;

if Banco.TBClientes.RecordCount = 0 then
begin
  MessageDlg('Por faovr, Registre um cliente',mtError,[mbOK],0);
  exit;
end;

if Banco.TB_Situacao.RecordCount = 0 then
begin
  MessageDlg('Por faovr, Registre uma Situação',mtError,[mbOK],0);
  exit;
end;

Try
   Application.CreateForm(TFFinaliza,FFinaliza);
   if banco.TB_Pedido.RecordCount > 0 then
   FFinaliza.TempCOd := banco.TB_Pedido.Bookmark;
   FFinaliza.ShowModal;
Finally
  FreeAndNil(FFinaliza);
end;
end;

procedure TFPedido.Img2Click(Sender: TObject);
begin
if not banco.Ped_Editar then banco.NotPermissao;


if Banco.TB_Pedido.RecordCount = 0 then
exit;


Try
  Application.CreateForm(Tffinaliza,Ffinaliza);
  Ffinaliza.editing := true;
  FFinaliza.ShowModal;
Finally
  FreeAndNil(Ffinaliza);
end;
end;

procedure TFPedido.Img5Click(Sender: TObject);
begin
if not banco.Ped_Excluir then banco.NotPermissao;

if Banco.TB_Pedido.RecordCount = 0 then
exit;

if MessageDlg('Deseja realmente excluir o registro '+IntToStr(Banco.TB_PedidoID_Pedido.Value)+'?',mtWarning,[mbYes,mbNo],0) = mryes then

  banco.ExecSQLTB.Close;
  banco.ExecSQLTB.Fields.Clear;
  banco.ExecSQLTB.SQL.Clear;
  Banco.ExecSQLTB.SQL.Add('select codigo FROM tb_contas');
  Banco.ExecSQLTB.SQL.Add('where npedido = '+IntToStr(banco.TB_PedidoID_Pedido.Value));
  try
  banco.ExecSQLTB.Open;
  if banco.ExecSQLTB.RecordCount <> 0 then
  begin
  MessageDlg('O pedido possui contas, não é possível excluir',mtError,[mbok],0);
  banco.ExecSQLTB.Close;
  exit;
  end;
  banco.ExecSQLTB.Close;
  except
    MessageDlg('Erro ao verificar registro no modulo contas',mtError, [mbok],0 );
    exit;
  end;
Try
  Banco.ADOConnection1.BeginTrans;

  banco.ExecSQLTB.Close;
  banco.ExecSQLTB.SQL.Clear;
  Banco.ExecSQLTB.SQL.Add('DELETE FROM VENDA_ALL');
  Banco.ExecSQLTB.SQL.Add('where ID_Pedido = '+IntToStr(banco.TB_PedidoID_Pedido.Value));
  Banco.ExecSQLTB.ExecSQL;

  banco.ExecSQLTB.Close;
  banco.ExecSQLTB.SQL.Clear;
  Banco.ExecSQLTB.SQL.Add('DELETE FROM tb_contas');
  Banco.ExecSQLTB.SQL.Add('where npedido = '+IntToStr(banco.TB_PedidoID_Pedido.Value));
  Banco.ExecSQLTB.ExecSQL;


  banco.ExecSQLTB.Close;
  banco.ExecSQLTB.SQL.Clear;
  Banco.ExecSQLTB.SQL.Add('DELETE FROM Venda_info');
  Banco.ExecSQLTB.SQL.Add('where id_pedido = '+IntToStr(banco.TB_PedidoID_Pedido.Value));
  banco.ExecSQLTB.ExecSQL;

  MessageDlg('Registro excluido',mtInformation,[mbOK],0);
  Banco.ADOConnection1.CommitTrans;

Except
  on e :Exception do
  begin
  banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg(e.Message,mtError,[mbOK],0);
  banco.ADOConnection1.RollbackTrans;
  end;
  end;
  banco.TB_Pedido.Close;
  banco.TB_Pedido.Open;
end;


procedure TFPedido.Img7Click(Sender: TObject);
var
  i : integer;
begin
  Try
    Application.CreateForm(TFVisible,FVisible);

    for i := 0 to Banco.TB_Pedido.FieldCount -1 do
    if Banco.TB_Pedido.Fields[i].Tag = 0 then
    FVisible.CheckListBox1.Checked[FVisible.CheckListBox1.Items.Add(Banco.TB_Pedido.Fields[i].DisplayLabel,)] := Banco.TB_Pedido.Fields[i].Visible;


    FVisible.ShowModal;
  Finally
    if FVisible.ModalResult = 1 then
    begin
     for i := 0 to FVisible.CheckListBox1.Items.Count -1 do
     Banco.TB_Pedido.Fields[Banco.SearchField(Banco.TB_Pedido,FVisible.CheckListBox1.Items[i],false)].Visible := FVisible.CheckListBox1.Checked[i];

     save;

     end;

   FreeAndNil(FVisible);
end;
end;


procedure TFPedido.Img3Click(Sender: TObject);
begin
try
  Application.CreateForm(TFPesquisa,FPesquisa);
  FPesquisa.Table := Banco.TB_Pedido;

  FPesquisa.ShowModal;
Finally
 FreeAndNil(FPesquisa);
end;
end;

procedure TFPedido.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Banco.Image1Move(x,y);
end;

procedure TFPedido.Situacao1Click(Sender: TObject);
begin
if not banco.Ped_Alter_Sit then banco.NotPermissao;


Try
   Application.CreateForm(TFSituacao,FSituacao);
   FSituacao.ShowModal;
Finally
Banco.Refresh(Banco.TB_Pedido);
    FreeAndNil(FSituacao);
end;
end;

procedure TFPedido.Img4Click(Sender: TObject);
begin
banco.ListaQuery(Banco.TB_Pedido,'Relátorio de Pedidos',Banco.TB_Pedidonome_razao.Index);

end;

procedure TFPedido.ThemeDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_delete then
Img5Click(Img5);

end;

procedure TFPedido.Img6Click(Sender: TObject);
begin
banco.GeraDav;

end;

procedure TFPedido.HistricodoCliente1Click(Sender: TObject);
begin
if not banco.Cli_Vis_Hist then banco.NotPermissao;



if banco.TB_Pedido.RecordCount = 0 then
exit;

banco.HistoricoCliente(banco.TB_PedidoID_cliente.Value);

end;

procedure TFPedido.Img8Click(Sender: TObject);
begin
Banco.FontDialog.Font := banco.font_grid[2];

if Banco.FontDialog.Execute then
begin
banco.Img8_Visible;

banco.Font_Grid[2] := banco.FontDialog.Font;
Banco.Font_Grid[2].Style := [];
ThemeDBGrid1.Font := banco.FontDialog.Font;
end;

end;

procedure TFPedido.SelecrionarLinha1Click(Sender: TObject);
begin
Banco.Config_GRID_Foco[2] := not(banco.config_grid_foco[2]);
FPrincipal.Img3Click(FPrincipal.Img3);


end;

procedure TFPedido.Timer1Timer(Sender: TObject);
begin
banco.TB_Pedido.Locate(Banco.TB_PedidoID_Pedido.FieldName,Banco.Last_Grid_Select[2],[]);
(sender as TTimer).Enabled := false;

end;

procedure TFPedido.Exibir1Click(Sender: TObject);
begin
if banco.Config_GRID_Foco[2] then
SelecrionarLinha1.Caption := '&Selecionar Linha'
else
SelecrionarLinha1.Caption := '&Selecionar Coluna';

end;

procedure TFPedido.Pedidos1Click(Sender: TObject);
begin
  Novo1.Enabled := banco.Ped_Novo;
  Editar1.Enabled := banco.Ped_Editar;
  Excluir1.Enabled := banco.Ped_Excluir;
  Situacao1.Enabled := banco.Ped_Alter_Sit;
  HistricodoCliente1.Enabled :=   banco.Cli_Vis_Hist;

end;

procedure TFPedido.ThemeDBGrid1TitleClick(Column: TColumn);
begin
Banco.OrdenaGrid(Column);
end;

end.
