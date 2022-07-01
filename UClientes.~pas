unit UClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ThemeDBGrid,Inifiles, ExtCtrls,
  DB, ImgList, Menus,ADODB, SHELLAPI;

type
  TFclientes = class(TForm)
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
    Funcionrios1: TMenuItem;
    Editar2: TMenuItem;
    Deletar1: TMenuItem;
    Novo1: TMenuItem;
    N2: TMenuItem;
    Logradouro1: TMenuItem;
    Cartas1: TMenuItem;
    Editar1: TMenuItem;
    Pesquisar1: TMenuItem;
    N1: TMenuItem;
    Cor1: TMenuItem;
    Fonte1: TMenuItem;
    N3: TMenuItem;
    Colunas1: TMenuItem;
    N5: TMenuItem;
    Listar1: TMenuItem;
    Selecionaralinhainteira1: TMenuItem;
    ImageList1: TImageList;
    Sobre1: TMenuItem;
    Edit1: TEdit;
    Reltorios1: TMenuItem;
    N6: TMenuItem;
    Histrico1: TMenuItem;
    Cofigurao1: TMenuItem;
    N7: TMenuItem;
    CurvaABC1: TMenuItem;
    Timer1: TTimer;
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Save;
    procedure FormHide(Sender: TObject);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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
    procedure Img8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img1Click(Sender: TObject);
    procedure Img2Click(Sender: TObject);
    procedure Img5Click(Sender: TObject);
    procedure Img6Click(Sender: TObject);
    procedure Img7Click(Sender: TObject);
    procedure Img3Click(Sender: TObject);
    procedure Logradouro1Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure Img8Click(Sender: TObject);
    procedure Img4Click(Sender: TObject);
    procedure Selecionaralinhainteira1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure EncaminharEmail1Click(Sender: TObject);
    procedure ThemeDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Para1Click(Sender: TObject);
    procedure Cofigurao1Click(Sender: TObject);
    procedure MenuFavoritoClick(Sender: TObject);
    Procedure CreateMenus;
    procedure CurvaABC1Click(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ThemeDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
          JaExec : Boolean;
      { Public declarations }
  end;

var
  Fclientes: TFclientes;

implementation

uses UFcliente_New, UDados, UCliente_Info, Uvisible, UPesquisa, StrUtils,
  Math, Ulogradouro, Ucarta, Uprinciapl, UAbcCliente;

{$R *.dfm}

procedure TFclientes.Save;
var
  i : integer;
begin

for i := 0 to Banco.TBClientes.Fields.Count - 1 do
begin
  Banco.Config.WriteInteger(Banco.TBClientes.Name+'_Position',Banco.TBClientes.Fields[i].FieldName,  Banco.TBClientes.Fields[i].Index);
  Banco.Config.WriteBool   (Banco.TBClientes.Name+'_Visible' ,Banco.TBClientes.Fields[i].FieldName,  Banco.TBClientes.Fields[i].Visible);
end;


end;

procedure TFclientes.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
abort;
end;

if not (Key in['0'..'9',Chr(8)]) then
begin
Key:= #0;
Abort;
exit;
end;

end;

procedure TFclientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = VK_escape) then
begin
close;
Key := 0;
exit;
end;
end;


procedure TFclientes.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
banco.SearchReg(Banco.TBClientes,Edit1.Text);
key := #0;
end;



end;

procedure TFclientes.FormShow(Sender: TObject);
var
  i : integer;
begin
JaExec := false;
ThemeDBGrid1.Font := banco.font_grid[4];


banco.ImgForm := Fclientes;
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

For i := 0 to Banco.TBClientes.Fields.Count -1 do
if Banco.TBClientes.Fields[i].Tag =1 then
Banco.TBClientes.Fields[i].Visible := false;


if Banco.TBMunicipio.State in [dsInactive] then
Banco.TBMunicipio.Open;

if Banco.TBClientes.State in [dsInactive] then
banco.TBClientes.Open;

if Banco.TB_Carta_Favorito.State in [dsInactive] then
Banco.TB_Carta_Favorito.Open;


Banco.LoadColumns(ThemeDBGrid1);

banco.TBClientesCep.EditMask := '00000\ 000;0;';

{banco.TBClientesCep.EditMask     := '00000\ 000;0;';
Banco.TBClientesTel_Res.EditMask := '!0000 0000;0;';
Banco.TBClientesTel_Come.EditMask:= '!0000 0000;0;';
Banco.TBClientesTel_Cel.EditMask := '!0000 0000;0;';
Banco.TBClientesTel_Res.EditMask := '!0000 0000;0;';
Banco.TBClientesTel_Fax.EditMask := '!0000 0000;0;';}
//Banco.TBClientesCPF.EditMask     := '!00.000.000/0000-00;0;';

Funcionrios1Click(Funcionrios1);//menu click


end;

procedure TFclientes.FormHide(Sender: TObject);
begin
banco.Last_Grid_Select[4] := Banco.TBClientesCodigo.Value;
Banco.SaveColumns(ThemeDBGrid1) ;

Save;

if banco.TBClientes.SQL.Count > 1 then
begin
banco.TBClientes.close;
Banco.TBClientes.SQL.Clear;
banco.TBClientes.SQL.Add('Select * from Cliente_Cadastro');
end;

//CreateMenus;
end;

procedure TFclientes.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin

if not JaExec then
if not banco.Config_GRID_Foco[4] then
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


HoldColor := ThemeDBGrid1.Brush.Color;

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin

   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;

  end
 else
  begin
   if Banco.Cor_Grid[4] <> clwhite then
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Cor_Grid[4]
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;

 end;

if banco.TBClientesAtivo.Value = false then
begin
(Sender as TThemeDBGrid).Canvas.Font.Style := (Sender as TThemeDBGrid).Canvas.Font.Style + [fsItalic];
(Sender as TThemeDBGrid).Canvas.Font.Color  := clGray;
end
else
(Sender as TThemeDBGrid).Canvas.Font.Style := (Sender as TThemeDBGrid).Canvas.Font.Style - [fsItalic];

(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

if banco.TBClientes.RecordCount > 0 then
if banco.TBClientesAtivo.Value = false then
begin
(Sender as TThemeDBGrid).Canvas.Pen.Color   := clGray;
(Sender as TThemeDBGrid).Canvas.Pen.Width := 1;
(Sender as TThemeDBGrid).Canvas.MoveTo(Rect.Left, Rect.Top +((Rect.Bottom - Rect.Top) div 2));
(Sender as TThemeDBGrid).Canvas.LineTo(Rect.Right, Rect.Top +((Rect.Bottom - Rect.Top) div 2));
end;



end;

procedure TFclientes.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
banco.Image1Move(x,y);

end;

procedure TFclientes.Img1MouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
banco.Img1_Visible;

end;

procedure TFclientes.Img2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img2_Visible;

end;

procedure TFclientes.Img3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img3_Visible;

end;

procedure TFclientes.Img4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img4_Visible;

end;

procedure TFclientes.Img5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img5_Visible;

end;

procedure TFclientes.Img6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img6_Visible;

end;

procedure TFclientes.Img7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img7_Visible;

end;

procedure TFclientes.Img8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img8_Visible;

end;

procedure TFclientes.Img1Click(Sender: TObject);
var
  Verifica :Boolean;
begin
verifica := false;
if not banco.Cli_Novo then banco.NotPermissao;

Try


Application.CreateForm(TFClientes_New,FClientes_New);
FClientes_New.Editing := false;
banco.Clearimg;
FClientes_New.ShowModal;
Finally
if FClientes_New.ModalResult = mrok then
Verifica := true;

freeandnil(fclientes_new);
end;

if Verifica then
Img1Click(Img1);

end;

procedure TFclientes.Img2Click(Sender: TObject);
begin
if not banco.Cli_Editar then banco.NotPermissao;


if Banco.TBClientes.RecordCount = 0 then
begin
Img2Click(sender);
exit;
end;

Try
Application.CreateForm(TFClientes_New,FClientes_New);
FClientes_New.Editing := true;
banco.Clearimg;
FClientes_New.ShowModal;
Finally
freeandnil(fclientes_new);
end;
end;

procedure TFclientes.Img5Click(Sender: TObject);
begin
if not banco.Cli_Excluir then banco.NotPermissao;


if Banco.TBClientes.RecordCount = 0 then
exit;

banco.Clearimg;


If MessageDlg('Você realmente deseja excluir o cadastro? Cliente'+#13+Banco.TBClientesNome_Razao.Value,mtWarning,[mbYes,mbNo],0) = mrno then
exit;

Try
  Banco.TBClientes.Delete;
  MessageDlg('Cliente excluido com sucesso',mtInformation,[mbOK],0);
Except
  on e: Exception do
  begin   
    if pos ('Clientes_Compra',e.message) <> 0 then
    begin
    MessageDlg('Não foi possível excluir o Cliente. Para excluir é necessário remover o pedido vinculado',mtError,[mbok],0);
    exit;
    end;

   MessageDlg('Não foi possível excluir o cliente, mensagem original'+#13+e.Message,mtError,[mbok],0);
   Banco.Create_Erro(e.ClassName,e.Message+#13+#13+#13+'EXCLUINDO CLIENTE TABELA TBCLIENTE');
  end;
end;



end;

procedure TFclientes.Img6Click(Sender: TObject);
begin
  Try
  Application.CreateForm(TFInfo_Cliente,FInfo_Cliente);
  banco.Clearimg;
  FInfo_Cliente.Print;
  Finally
  FreeAndNil(FInfo_Cliente);
  end;
end;

procedure TFclientes.Img7Click(Sender: TObject);
var
  i : integer;
begin
  Try
    Application.CreateForm(TFVisible,FVisible);

    for i := 0 to Banco.TBClientes.FieldCount -1 do
    if Banco.TBClientes.Fields[i].Tag = 0 then
    FVisible.CheckListBox1.Checked[FVisible.CheckListBox1.Items.Add(Banco.TBClientes.Fields[i].DisplayLabel,)] := Banco.TBClientes.Fields[i].Visible;

    banco.Clearimg;
    FVisible.ShowModal;
  Finally
    if FVisible.ModalResult = 1 then
    begin
     for i := 0 to FVisible.CheckListBox1.Items.Count -1 do
     Banco.TBClientes.Fields[Banco.SearchField(Banco.TBClientes,FVisible.CheckListBox1.Items[i],false)].Visible := FVisible.CheckListBox1.Checked[i];

     save;

     end;

   FreeAndNil(FVisible);
end;
end;

procedure TFclientes.Img3Click(Sender: TObject);
begin
try
  Application.CreateForm(TFPesquisa,FPesquisa);
  FPesquisa.Table := Banco.TBClientes;
//  FPesquisa.ComboBox1.Items.Add('Ativo');
  banco.Clearimg;
  FPesquisa.ShowModal;
Finally
FreeAndNil(FPesquisa);
end;

end;

procedure TFclientes.Logradouro1Click(Sender: TObject);
begin
if not banco.Cli_Alter_Logr then banco.NotPermissao;

try
   Application.CreateForm(TFlogradouro,Flogradouro);
   Flogradouro.ShowModal;
finally
  FreeAndNil(Flogradouro);
end;
end;

procedure TFclientes.Cor1Click(Sender: TObject);
begin
banco.ColorDialog.Color := Banco.Cor_Grid [4];

if banco.ColorDialog.Execute then
begin
Banco.Cor_Grid[4] := Banco.ColorDialog.Color;
ThemeDBGrid1.Refresh;
end;

end;

procedure TFclientes.Img8Click(Sender: TObject);
begin
Banco.FontDialog.Font := banco.font_grid[5];

if Banco.FontDialog.Execute then
begin
banco.Img8_Visible;

banco.Font_Grid[5] := banco.FontDialog.Font;
Banco.Font_Grid[5].Style := [];
ThemeDBGrid1.Font := banco.FontDialog.Font;
end;

end;

procedure TFclientes.Img4Click(Sender: TObject);
begin
banco.ListaQuery(Banco.TBClientes,'Relátorio de Clientes',Banco.TBClientesNome_Razao.Index);
end;

procedure TFclientes.Selecionaralinhainteira1Click(Sender: TObject);
begin

Banco.Config_GRID_Foco[4] := not(banco.config_grid_foco[4]);
FPrincipal.Img1Click(FPrincipal.Img1);

end;

procedure TFclientes.Editar1Click(Sender: TObject);
var
  AuxBitmap : TBitmap;
begin
if banco.Config_GRID_Foco[4] then
Selecionaralinhainteira1.Caption := '&Selecionar Linha'
else
Selecionaralinhainteira1.Caption := '&Selecionar Coluna';



Try
  AuxBitmap := TBitmap.Create;
  AuxBitmap.Width := 16;
  AuxBitmap.Height := 16;
  AuxBitmap.Canvas.Brush.Color := banco.cor_grid[4];
  AuxBitmap.Canvas.Pen.Color := AuxBitmap.Canvas.Brush.Color;
  AuxBitmap.Canvas.Rectangle(0,0,AuxBitmap.Width,AuxBitmap.Height);
  if ImageList1.Count = 0 then
  Cor1.ImageIndex := ImageList1.Add(AuxBitmap,AuxBitmap)
  else
  ImageList1.Replace(Cor1.ImageIndex,AuxBitmap,AuxBitmap);


finally
  FreeAndNil(AuxBitmap);
end;

end;

procedure TFclientes.Sobre1Click(Sender: TObject);
begin
FPrincipal.SobreClick(sender);
end;

procedure TFclientes.Funcionrios1Click(Sender: TObject);
begin
Reltorios1.Enabled := banco.Cli_Relatorio;
Cartas1.Enabled := Banco.Cli_Mala_Direta;
Logradouro1.Enabled := banco.Cli_Alter_Logr;

   Novo1.Enabled := banco.Cli_Novo;
 Editar2.Enabled := banco.Cli_Editar;
Deletar1.Enabled := banco.Cli_Excluir;



{if banco.TBClientes.RecordCount = 0 then
EncaminharEmail1.Enabled := false
else
EncaminharEmail1.Enabled := true;}


if Banco.Cli_Mala_Direta then
begin
if banco.TB_Carta.SQL.Text = 'Select * From cartas'+#13+'Where modulo =2 ' then
  begin
    if (Banco.TB_Carta.State in [dsInactive]) then       Banco.TB_Carta.Open;
  end
  else
  begin
  if not (Banco.TB_Carta.State in [dsInactive]) then   Banco.TB_Carta.close;
    banco.TB_Carta.SQL.Clear;
    banco.TB_Carta.SQL.Add('Select * From cartas');
    banco.TB_Carta.SQL.Add('Where modulo =2 ');
    Banco.TB_Carta.Open;
  end;
CreateMenus;
end;

end;

procedure TFclientes.EncaminharEmail1Click(Sender: TObject);
begin
{if banco.TBClientesEmail.Value <> '' then
para1.Enabled := true
else
para1.Enabled := false;

Para1.Caption := 'Para '+banco.TBClientesNome_Razao.Value;
 }

end;

procedure TFclientes.ThemeDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_delete then
Img5Click(Img5);

end;



procedure TFclientes.Para1Click(Sender: TObject);
var
  comando : string;

begin
  comando:='mailto:'+quotedstr(banco.TBClientesEmail.Value) +  '?subject='+('Assunto')+  ';attachment='+quotedstr('c:\123.bmp') +';';
  ShellExecute(0, nil, PChar(Comando), nil, nil,SW_SHOWNORMAL);


end;

procedure TFclientes.Cofigurao1Click(Sender: TObject);
begin
if not banco.Cli_Mala_Direta then banco.NotPermissao;

try
Application.CreateForm(TFcarta,Fcarta);
Fcarta.DataSet_LIsta := Banco.TBClientes;
Fcarta.ShowModal;
finally
FreeAndNil(Fcarta);
CreateMenus;
end;


end;

procedure TFclientes.MenuFavoritoClick(Sender: TObject);
begin
  if not banco.TB_Carta.Locate(banco.TB_CartaCodigo.FieldName,(sender as TMenuItem).Tag,[]) then
  exit;

try
  Application.CreateForm(TFcarta,Fcarta);
  Fcarta.DataSet_LIsta := Banco.TBClientes;
  Fcarta.Button5Click(Fcarta.Button3);
Finally
  FreeAndNil(Fcarta);
end;

end;

procedure TFclientes.CreateMenus;
var
  MenuNew :TMenuItem;
  i : Smallint;
begin

For i := Cartas1.ComponentCount - 1 Downto 0 do
begin
if (Cartas1.Components[i] <> Cofigurao1) then
if (Cartas1.Components[i] <> n7) then
Cartas1.Components[i].Free;
end;


Banco.TB_Carta_Favorito.First;
while not banco.TB_Carta_Favorito.Eof do
begin
if not banco.TB_Carta_FavoritoDescricao.IsNull then
if banco.TB_Carta_FavoritoFavorito.Value then
begin
  MenuNew := TMenuItem.Create(Cartas1);
  MenuNew.caption := banco.TB_Carta_FavoritoDescricao.Value;
  MenuNew.Tag := banco.TB_Carta_FavoritoCodigo.Value;

  if banco.TB_Carta_FavoritoHotKey.IsNull then   menunew.ShortCut := 0
  else        menunew.ShortCut := banco.TB_Carta_FavoritoHotKey.Value;

  MenuNew.OnClick := MenuFavoritoClick;

  Cartas1.Add(MenuNew);
end;

banco.TB_Carta_Favorito.Next;
end;

end;

procedure TFclientes.CurvaABC1Click(Sender: TObject);
begin
Try
  Application.CreateForm(TFABCCliente,FABCCliente);
  FABCCliente.ShowModal;
finally
  FreeAndNil(FABCCliente);
end;
end;

procedure TFclientes.Histrico1Click(Sender: TObject);
begin
if banco.TBClientes.RecordCount = 0 then
exit;

banco.HistoricoCliente(banco.TBClientesCodigo.Value);

end;

procedure TFclientes.Timer1Timer(Sender: TObject);
begin
//banco.TBClientes.Bookmark := Banco.Last_Grid_Select[4];
(Sender as TTimer).Enabled:= false;
banco.TBClientes.Locate(Banco.TBClientesCodigo.FieldName,Banco.last_Grid_Select[4],[]);


end;

procedure TFclientes.ThemeDBGrid1TitleClick(Column: TColumn);
begin
Banco.OrdenaGrid(Column);
end;

end.
