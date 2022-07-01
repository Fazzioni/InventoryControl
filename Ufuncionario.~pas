unit Ufuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ThemeDBGrid, DB,
  ADODB, Menus, ImgList;

type
  TFFuncionarios = class(TForm)
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
    Cargos1: TMenuItem;
    Editar1: TMenuItem;
    Pesquisar1: TMenuItem;
    N1: TMenuItem;
    Cor1: TMenuItem;
    Novo1: TMenuItem;
    Deletar1: TMenuItem;
    Editar2: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Colunas1: TMenuItem;
    Fonte1: TMenuItem;
    Listar1: TMenuItem;
    ImageList1: TImageList;
    N6: TMenuItem;
    Cartas1: TMenuItem;
    N5: TMenuItem;
    Selecionaralinhainteira1: TMenuItem;
    Timer1: TTimer;
    Logradouro1: TMenuItem;
    Sobre1: TMenuItem;
    Cartas2: TMenuItem;
    N4: TMenuItem;
    N1111: TMenuItem;
    N7: TMenuItem;
    Auditoria1: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Save;
    procedure FormHide(Sender: TObject);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Img1Click(Sender: TObject);
    procedure Img2Click(Sender: TObject);
    procedure Img7Click(Sender: TObject);
    procedure Img3Click(Sender: TObject);
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
    procedure Img5Click(Sender: TObject);
    procedure Cargos1Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure Img8Click(Sender: TObject);
    procedure Selecionaralinhainteira1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Logradouro1Click(Sender: TObject);
    procedure Img4Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure ThemeDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ThemeDBGrid1TitleClick(Column: TColumn);
    procedure CreateMenus;
    procedure Funcionrios1Click(Sender: TObject);
    procedure Cartas2Click(Sender: TObject);
    procedure MenuFavoritoClick(Sender: TObject);
    procedure N1111Click(Sender: TObject);
    procedure Auditoria1Click(Sender: TObject);
  private
    { Private declarations }
  public
     JaExec : Boolean;

    { Public declarations }
  end;

var
  FFuncionarios: TFFuncionarios;

implementation

uses UDados, UNewFuncionario, UCargo, Uvisible, UPesquisa, CheckLst,
  Ucarta, Ulogradouro, Ulista, Uprinciapl;

{$R *.dfm}
procedure TFFuncionarios.Save;
var
  i : integer;
begin

for i := 0 to Banco.TB_Funcionarios.Fields.Count - 1 do
begin
  Banco.Config.WriteInteger(banco.TB_Funcionarios.Name+'_Position',Banco.TB_Funcionarios.Fields[i].FieldName,  Banco.TB_Funcionarios.Fields[i].Index);
  Banco.Config.WriteBool   (banco.TB_Funcionarios.Name+'_Visible' ,Banco.TB_Funcionarios.Fields[i].FieldName,  Banco.TB_Funcionarios.Fields[i].Visible);
end;

end;


procedure TFFuncionarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
close;

end;

procedure TFFuncionarios.FormShow(Sender: TObject);
var
  i : integer;
begin
JaExec := false;

ThemeDBGrid1.Font := banco.font_grid[1];


banco.ImgForm := FFuncionarios;
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


For i := 0 to Banco.TB_Funcionarios.Fields.Count -1 do
if Banco.TB_Funcionarios.Fields[i].Tag =1 then
Banco.TB_Funcionarios.Fields[i].Visible := false;


if Banco.TBMunicipio.State in [dsInactive] then
Banco.TBMunicipio.Open;


if Banco.TBLogra.State in [dsInactive] then
banco.TBLogra.Open;


if Banco.TB_Setor.State in [dsInactive] then
banco.TB_Setor.Open;

if Banco.TB_Funcionarios.State in [dsInactive] then
banco.TB_Funcionarios.Open;



Banco.LoadColumns(ThemeDBGrid1);

Banco.TB_FuncionariosTel_Res.EditMask := '!0000 0000;0;';
Banco.TB_FuncionariosTel_Cel.EditMask := '!0000 0000;0;';
banco.TB_FuncionariosCep.EditMask     := '00000\ 000;0;';




 Funcionrios1Click(Funcionrios1); //create sub menu

 Banco.TB_Funcionarios.Filtered := false;
 banco.TB_Funcionarios.Filter := 'codigo <> 0';
 Banco.TB_Funcionarios.Filtered := true;

end;

procedure TFFuncionarios.FormHide(Sender: TObject);
begin
banco.Last_Grid_Select[1] := Banco.TB_FuncionariosCdigo.Value;


Save;
Banco.SaveColumns(ThemeDBGrid1);


if banco.TB_Funcionarios.SQL.Text <> banco.Sql_Tb_Funcio_Default then
begin
Banco.TB_Funcionarios.close;
banco.TB_Funcionarios.SQL.Clear;
Banco.TB_Funcionarios.SQL.Add(banco.Sql_Tb_Funcio_Default)
end;



end;

procedure TFFuncionarios.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin

if not JaExec then
if not banco.Config_GRID_Foco[1] then
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





(Sender as TThemeDBGrid).Canvas.Pen.Color := Banco.Cor_Grid[1];

HoldColor := ThemeDBGrid1.Brush.Color;


 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin

   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   if ((Sender as TThemeDBGrid).Font.Color = clblack) or ((sender as TThemeDBGrid).font.color = clWindowText) then
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite
   else
   (Sender as TThemeDBGrid).Canvas.Font.Color := (Sender as TThemeDBGrid).Font.Color;

  end
 else
  begin
   if Banco.Cor_Grid[1] <> clwhite then
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Cor_Grid[1]
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;

 end;


if banco.TB_FuncionariosAtivo.Value = false then
begin
(Sender as TThemeDBGrid).Canvas.Font.Style := (Sender as TThemeDBGrid).Canvas.Font.Style + [fsItalic];
(Sender as TThemeDBGrid).Canvas.Font.Color  := clGray;
end
else
(Sender as TThemeDBGrid).Canvas.Font.Style := (Sender as TThemeDBGrid).Canvas.Font.Style - [fsItalic];



(Sender as TThemeDBGrid).DefaultDrawColumnCell(rect, DataCol, Column, State);



if banco.TB_Funcionarios.RecordCount > 0 then
if banco.TB_FuncionariosAtivo.Value = false then
begin
(Sender as TThemeDBGrid).Canvas.Pen.Color   := clGray;
(Sender as TThemeDBGrid).Canvas.Pen.Width := 1;
(Sender as TThemeDBGrid).Canvas.MoveTo(Rect.Left, Rect.Top +((Rect.Bottom - Rect.Top) div 2));
(Sender as TThemeDBGrid).Canvas.LineTo(Rect.Right, Rect.Top +((Rect.Bottom - Rect.Top) div 2));
end;



end;

procedure TFFuncionarios.Img1Click(Sender: TObject);
begin
if not Banco.User_Novo then banco.NotPermissao;

Try
  Application.CreateForm(TNew_Funcionario,New_Funcionario);
  New_Funcionario.Editing := false;
  Banco.Clearimg;
  New_Funcionario.ShowModal;
Finally
  FreeAndNil(New_Funcionario);
end;
end;

procedure TFFuncionarios.Img2Click(Sender: TObject);
begin
if not Banco.User_Editar then banco.NotPermissao;

if Banco.TB_Funcionarios.RecordCount = 0 then
exit;



Try
  Application.CreateForm(TNew_Funcionario,New_Funcionario);
  New_Funcionario.Editing := true;
  Banco.Clearimg;
  New_Funcionario.ShowModal;
Finally
  Banco.TB_FuncionariosFotos.Index := Banco.TB_FuncionariosCidadeVirtual.Index;
  Banco.TB_FuncionariosCidadeVirtual.Index := Banco.TB_FuncionariosFotos.Index;
  FreeAndNil(New_Funcionario);
end;
end;

procedure TFFuncionarios.Img7Click(Sender: TObject);
var
  i : integer;
begin
  Try
    Application.CreateForm(TFVisible,FVisible);

    for i := 0 to Banco.TB_Funcionarios.FieldCount -1 do
    if Banco.TB_Funcionarios.Fields[i].Tag = 0 then
    FVisible.CheckListBox1.Checked[FVisible.CheckListBox1.Items.Add(Banco.TB_Funcionarios.Fields[i].DisplayLabel,)] := Banco.TB_Funcionarios.Fields[i].Visible;

      Banco.Clearimg;
    FVisible.ShowModal;
  Finally
    if FVisible.ModalResult = 1 then
    begin
     for i := 0 to FVisible.CheckListBox1.Items.Count -1 do
     Banco.TB_Funcionarios.Fields[Banco.SearchField(Banco.TB_Funcionarios,FVisible.CheckListBox1.Items[i],false)].Visible := FVisible.CheckListBox1.Checked[i];

     save;

     end;

   FreeAndNil(FVisible);
end;
end;

procedure TFFuncionarios.Img3Click(Sender: TObject);
begin
try
  Application.CreateForm(TFPesquisa,FPesquisa);
  FPesquisa.Table := Banco.TB_Funcionarios;
//  FPesquisa.ComboBox1.Items.Add('Ativo');
  Banco.Clearimg;
  FPesquisa.ShowModal;
Finally
  FreeAndNil(FPesquisa);
end;
end;


procedure TFFuncionarios.Image1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
banco.Image1Move(x,y);
end;

procedure TFFuncionarios.Img1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
banco.Img1_Visible;
end;

procedure TFFuncionarios.Img2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
banco.Img2_Visible;
end;

procedure TFFuncionarios.Img3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
banco.Img3_Visible;
end;

procedure TFFuncionarios.Img4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
banco.Img4_Visible;
end;

procedure TFFuncionarios.Img5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
banco.Img5_Visible;
end;

procedure TFFuncionarios.Img6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
banco.Img6_Visible;
end;

procedure TFFuncionarios.Img7MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
banco.Img7_Visible;
end;

procedure TFFuncionarios.Img8MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
banco.Img8_Visible;
end;

procedure TFFuncionarios.Img5Click(Sender: TObject);
begin
if not Banco.User_Excluir then banco.NotPermissao;

if banco.TB_Funcionarios.RecordCount = 0 then
exit;

banco.Clearimg;
if MessageDlg('Deseja excluir o funcionário '+banco.TB_FuncionariosNome.Value+'?',mtWarning,[mbyes,mbno],0) = mrno then
exit;



try
banco.TB_Funcionarios.Delete;
MessageDlg('Funcionário excluido com sucesso',mtInformation,[mbok],0);

except
on e : exception do
begin
banco.Create_Erro(e.ClassName,e.Message);
MessageDlg('Não foi possível excluir o funcionário, mensagem original'+#13+e.message,mtError,[mbOK],0);
end;
end;

end;

procedure TFFuncionarios.Cargos1Click(Sender: TObject);
begin
if not Banco.User_Alter_Setor then banco.NotPermissao;


Try
  Application.CreateForm(TFCargo,FCargo);
  FCargo.ShowModal;
Finally
  FreeAndNil(FCargo);
end;
end;


procedure TFFuncionarios.Cor1Click(Sender: TObject);
begin
banco.ColorDialog.Color := Banco.Cor_Grid [1];

if banco.ColorDialog.Execute then
begin
Banco.Cor_Grid[1] := Banco.ColorDialog.Color;
ThemeDBGrid1.Refresh;
end;



end;



procedure TFFuncionarios.Editar1Click(Sender: TObject);
var
  AuxBitmap : TBitmap;
begin
Auditoria1.Enabled := banco.User_Visu_Auditoria;

if banco.Config_GRID_Foco[1] then
Selecionaralinhainteira1.Caption := 'Selecionar Linha'
else
Selecionaralinhainteira1.Caption := 'Selecionar Coluna';



Try
  AuxBitmap := TBitmap.Create;
  AuxBitmap.Width := 16;
  AuxBitmap.Height := 16;
  AuxBitmap.Canvas.Brush.Color := banco.cor_grid[1];
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

procedure TFFuncionarios.Img8Click(Sender: TObject);
begin
Banco.FontDialog.Font := banco.font_grid[1];

if Banco.FontDialog.Execute then
begin
banco.Img8_Visible;

banco.Font_Grid[1] := banco.FontDialog.Font;
Banco.Font_Grid[1].Style := [];
ThemeDBGrid1.Font := banco.FontDialog.Font;
end;
end;

procedure TFFuncionarios.Cartas2Click(Sender: TObject);
begin
if not Banco.User_Visu_Auditoria then banco.NotPermissao;

try
Application.CreateForm(TFcarta,Fcarta);
Fcarta.DataSet_LIsta := Banco.TBClientes;
Fcarta.ShowModal;
finally
FreeAndNil(Fcarta);
CreateMenus;
end;

end;



procedure TFFuncionarios.Selecionaralinhainteira1Click(Sender: TObject);
begin
Banco.Config_GRID_Foco[1] := not(banco.config_grid_foco[1]);
FPrincipal.Funcionrios1Click(FPrincipal.Funcionrios1);


end;



procedure TFFuncionarios.Timer1Timer(Sender: TObject);
begin


//banco.TB_Funcionarios.Bookmark := Banco.Last_Grid_Select[1];


(Sender as TTimer).Enabled:= false;
banco.TB_Funcionarios.Locate(Banco.TB_FuncionariosCdigo.FieldName,Banco.last_Grid_Select[1],[]);


end;

procedure TFFuncionarios.Logradouro1Click(Sender: TObject);
begin
if not Banco.Cli_Alter_Logr then banco.NotPermissao;


try
   Application.CreateForm(TFlogradouro,Flogradouro);
   Flogradouro.ShowModal;
finally
  FreeAndNil(Flogradouro);
end;

end;

procedure TFFuncionarios.Img4Click(Sender: TObject);
begin
banco.ListaQuery(Banco.TB_Funcionarios,'Relátorio de Funcionários',Banco.TB_FuncionariosNome.Index);

end;

procedure TFFuncionarios.Sobre1Click(Sender: TObject);
begin
FPrincipal.SobreClick(sender);
end;

procedure TFFuncionarios.ThemeDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_delete then
Img5Click(Img5);

end;

procedure TFFuncionarios.ThemeDBGrid1TitleClick(Column: TColumn);
begin
Banco.OrdenaGrid(Column);
end;

procedure TFFuncionarios.CreateMenus;
var
  MenuNew :TMenuItem;
  i : Smallint;
begin

For i := Cartas1.ComponentCount - 1 Downto 0 do
begin
if (Cartas1.Components[i] <> Cartas2) then
if (Cartas1.Components[i] <> n4) then
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

procedure TFFuncionarios.Funcionrios1Click(Sender: TObject);
begin
Cartas1.Enabled := Banco.User_MalaDireta;
Logradouro1.Enabled := banco.Cli_Alter_Logr;
   Novo1.Enabled := banco.User_Novo;
 Editar2.Enabled := banco.User_Editar;
Deletar1.Enabled := banco.User_Excluir;
Cargos1.Enabled := banco.User_Alter_Setor;



  if banco.TB_Carta.SQL.Text = 'Select * From cartas'+#13+'Where modulo =1 ' then
  begin
    if (Banco.TB_Carta.State in [dsInactive]) then       Banco.TB_Carta.Open;
  end
  else
  begin
  if not (Banco.TB_Carta.State in [dsInactive]) then   Banco.TB_Carta.close;
    banco.TB_Carta.SQL.Clear;
    banco.TB_Carta.SQL.Add('Select * From cartas');
    banco.TB_Carta.SQL.Add('Where modulo =1 ');
    Banco.TB_Carta.Open;
  end;
  CreateMenus;

  
end;

procedure TFFuncionarios.MenuFavoritoClick(Sender: TObject);
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

procedure TFFuncionarios.N1111Click(Sender: TObject);
begin



banco.ppImage1.Picture := banco.Empresa_Imagem;
banco.Rp_funcionarios.Print;

end;

procedure TFFuncionarios.Auditoria1Click(Sender: TObject);
begin
if not Banco.User_Visu_Auditoria then banco.NotPermissao;

FPrincipal.OpenAuditoria;

end;

end.
