unit UFestoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, ToolEdit, CurrEdit,
  ExtCtrls, ThemeDBGrid, Inifiles,db, DBCtrls
  ,TypInfo, ImgList, Menus
  ;

type
  TFEstoque = class(TForm)
    ThemeDBGrid1: TThemeDBGrid;
    Img1: TImage;
    Img2: TImage;
    Img3: TImage;
    Img4: TImage;
    Img5: TImage;
    Img6: TImage;
    Img7: TImage;
    Img8: TImage;
    Image1: TImage;
    MainMenu1: TMainMenu;
    Funcionrios1: TMenuItem;
    Editar2: TMenuItem;
    Deletar1: TMenuItem;
    Novo1: TMenuItem;
    N2: TMenuItem;
    UNmedida: TMenuItem;
    N6: TMenuItem;
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
    Timer1: TTimer;
    Sobre1: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    Procedure Save;
    Function  ProcuraField(FieldName:ShortString):cardinal;
    procedure FormHide(Sender: TObject);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Img1Click(Sender: TObject);
    procedure Img2Click(Sender: TObject);
    procedure Img5Click(Sender: TObject);
    procedure Img7Click(Sender: TObject);
    procedure Img3Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img4Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure Img8Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure Selecionaralinhainteira1Click(Sender: TObject);
    procedure UNmedidaClick(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure ThemeDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Funcionrios1Click(Sender: TObject);
    Function  VirgulaToPonto(value:Extended):Extended;
    procedure ThemeDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
   JaExec : Boolean;
    { Public declarations }
  end;

var
  FEstoque: TFEstoque;



implementation

uses UEstoque_New, UDados, Uvisible, StdConvs, Math, UPesquisa, Umedida,
  Uprinciapl;

{$R *.dfm}


procedure TFEstoque.Img7Click(Sender: TObject);
var
  i : integer;
begin
  Try
    Application.CreateForm(TFVisible,FVisible);

    for i := 0 to Banco.TBEstoque.FieldCount -1 do
    if Banco.TBEstoque.Fields[i].Tag = 0 then
    FVisible.CheckListBox1.Checked[FVisible.CheckListBox1.Items.Add(Banco.TBEstoque.Fields[i].DisplayLabel,)] := Banco.TBEstoque.Fields[i].Visible;
  banco.clearimg;

    FVisible.ShowModal;
  Finally
    if FVisible.ModalResult = 1 then
    begin
     for i := 0 to FVisible.CheckListBox1.Items.Count -1 do
     Banco.TBEstoque.Fields[Banco.SearchField(Banco.TBEstoque,FVisible.CheckListBox1.Items[i],false)].Visible := FVisible.CheckListBox1.Checked[i];

     save;

     end;

   FreeAndNil(FVisible);
end;
end;

procedure TFEstoque.Img3Click(Sender: TObject);
begin
try
  Application.CreateForm(TFPesquisa,FPesquisa);
  FPesquisa.Table := Banco.TBEstoque;
  //FPesquisa.ComboBox1.Items.Add('Ativo');
  banco.clearimg;
  FPesquisa.ShowModal;
Finally
FreeAndNil(FPesquisa);
end;
end;

procedure TFEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = VK_escape) then
begin
close;
Key := 0;
exit;
end;
end;

procedure TFEstoque.FormShow(Sender: TObject);
var
  i : integer;
begin
JaExec := false;
ThemeDBGrid1.Font := banco.font_grid[3];


banco.ImgForm := FEstoque;
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



For i := 0 to Banco.TBEstoque.Fields.Count -1 do
if Banco.TBEstoque.Fields[i].Tag =1 then
Banco.TBEstoque.Fields[i].Visible := false;

if Banco.TBEstUn.State in [dsInactive] then
Banco.TBEstUn.Open;

if Banco.TBEstoque.State in [dsInactive] then
Banco.TBEstoque.Open;

Banco.LoadColumns(ThemeDBGrid1);



end;

procedure TFEstoque.Save;
var
  i : integer;
begin
for i := 0 to Banco.TBEstoque.Fields.Count - 1 do
begin
  Banco.Config.WriteInteger(Banco.TBEstoque.Name+'_Position',Banco.TBEstoque.Fields[i].FieldName,  Banco.TBEstoque.Fields[i].Index);
  Banco.Config.WriteBool   (Banco.TBEstoque.Name+'_Visible' ,Banco.TBEstoque.Fields[i].FieldName,  Banco.TBEstoque.Fields[i].Visible);
end;



end;


function TFEstoque.ProcuraField(FieldName:ShortString): cardinal;
begin
result:=0;

For Result := 0 to Banco.TBEstoque.FieldCount-1 do
if Banco.TBEstoque.Fields[Result].FieldName = FieldName then
exit;

end;

procedure TFEstoque.FormHide(Sender: TObject);
begin
banco.Last_Grid_Select[3] := Banco.TBEstoqueCodigo.Value;

Banco.SaveColumns(ThemeDBGrid1);
Save;

if banco.TBEstoque.SQL.Count > 1 then
begin
Banco.TBEstoque.Close;
banco.TBEstoque.SQL.Clear;
Banco.TBEstoque.SQL.Add('Select * from Estoque');

end;

end;

procedure TFEstoque.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin

if not JaExec then
if not banco.Config_GRID_Foco[3] then
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
if Banco.Cor_Grid[3] <> clwhite then
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Cor_Grid[3]
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;

 end;

if banco.TBEstoqueAtivo.Value = false then
begin
(Sender as TThemeDBGrid).Canvas.Font.Style := (Sender as TThemeDBGrid).Canvas.Font.Style + [fsItalic];
(Sender as TThemeDBGrid).Canvas.Font.Color  := clGray;
end
else
(Sender as TThemeDBGrid).Canvas.Font.Style := (Sender as TThemeDBGrid).Canvas.Font.Style - [fsItalic];

(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

if banco.TBEstoque.RecordCount > 0 then
if banco.TBEstoqueAtivo.Value = false then
begin
(Sender as TThemeDBGrid).Canvas.Pen.Color   := clGray;
(Sender as TThemeDBGrid).Canvas.Pen.Width := 1;
(Sender as TThemeDBGrid).Canvas.MoveTo(Rect.Left, Rect.Top +((Rect.Bottom - Rect.Top) div 2));
(Sender as TThemeDBGrid).Canvas.LineTo(Rect.Right, Rect.Top +((Rect.Bottom - Rect.Top) div 2));
end;
end;


procedure TFEstoque.Img1Click(Sender: TObject);
begin
if not banco.Est_Novo then banco.NotPermissao;

Try
Application.CreateForm(TFEstoque_New,FEstoque_New);
banco.clearimg;
FEstoque_New.showmodal;
Finally
FreeAndNil(FEstoque_New);
end;
end;

procedure TFEstoque.Img2Click(Sender: TObject);
begin
if not banco.Est_Editar then banco.NotPermissao;


if Banco.TBEstoque.RecordCount = 0 then
exit;

Try
Application.CreateForm(TFEstoque_New,FEstoque_New);
FEstoque_New.Editing := true;
banco.clearimg;
FEstoque_New.showmodal;
Finally
FreeAndNil(FEstoque_New);
end;
end;

procedure TFEstoque.Img5Click(Sender: TObject);
begin
if not banco.Est_Excluir then banco.NotPermissao;



if Banco.TBEstoque.RecordCount = 0 then
exit;


banco.clearimg;

if MessageDlg('Você realmente deseja excluir o produto?'+#13+Banco.TBEstoqueDescricao.Value,mtWarning,[mbYes,mbNo],0) = mrno then
exit;

if banco.TB_Vendas_All.SQL.Count > 1 then
begin
  if not (banco.TB_Vendas_All.State in [dsinactive])  then
  Banco.TB_Vendas_All.Close;

  banco.TB_Vendas_All.SQL.Clear;
  Banco.TB_Vendas_All.SQL.Add('Select * from VENDA_ALL');
end;

if (banco.TB_Vendas_All.State in [dsinactive])  then
Banco.TB_Vendas_All.Open;

if Banco.TB_Vendas_All.Locate(Banco.TB_Vendas_AllID_mercadoria.FieldName,Banco.TBEstoqueCodigo.Value,[]) then
begin
MessageDlg('O regitro não pode ser excluido porque está relacionado',mtError,[mbOK],0);
exit;
end
else
Try
  Banco.TBEstoque.Delete;
  MessageDlg('Produto excluido com sucesso',mtInformation,[mbOK],0);
Except
  on e: Exception do
  begin
   MessageDlg('Não foi possível excluir o produto, mensagem original'+#13+e.Message,mtError,[mbok],0);
   Banco.Create_Erro(e.ClassName,e.Message+#13+#13+#13+'EXCLUINDO PRODUTO TABELA TBEstoque');
  end;
end;

  end;


procedure TFEstoque.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Image1Move(x,y);
end;

procedure TFEstoque.Img4Click(Sender: TObject);
begin
banco.ListaQuery(Banco.TBEstoque,'Relátorio de Estoque',banco.TBEstoqueDescricao.Index);
end;

procedure TFEstoque.Cor1Click(Sender: TObject);
begin
banco.ColorDialog.Color := Banco.Cor_Grid [3];

if banco.ColorDialog.Execute then
begin
Banco.Cor_Grid[3] := Banco.ColorDialog.Color;
ThemeDBGrid1.Refresh;
end;
end;

procedure TFEstoque.Img8Click(Sender: TObject);
begin
Banco.FontDialog.Font := banco.font_grid[3];

if Banco.FontDialog.Execute then
begin
banco.Img8_Visible;

banco.Font_Grid[3] := banco.FontDialog.Font;
Banco.Font_Grid[3].Style := [];
ThemeDBGrid1.Font := banco.FontDialog.Font;
end;
end;

procedure TFEstoque.Timer1Timer(Sender: TObject);
begin
(Sender as TTimer).Enabled:= false;
banco.TBEstoque.Locate(Banco.TBEstoqueCodigo.FieldName,Banco.last_Grid_Select[3],[]);
end;


procedure TFEstoque.Editar1Click(Sender: TObject);
var
  AuxBitmap : TBitmap;
begin
if banco.Config_GRID_Foco[3] then
Selecionaralinhainteira1.Caption := 'Selecionar Linha'
else
Selecionaralinhainteira1.Caption := 'Selecionar Coluna';

Try
  AuxBitmap := TBitmap.Create;
  AuxBitmap.Width := 16;
  AuxBitmap.Height := 16;
  AuxBitmap.Canvas.Brush.Color := banco.cor_grid[3];
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

procedure TFEstoque.Selecionaralinhainteira1Click(Sender: TObject);
begin
Banco.Config_GRID_Foco[3] := not(banco.config_grid_foco[3]);

FPrincipal.Img2Click(FPrincipal.Img2);

end;



procedure TFEstoque.UNmedidaClick(Sender: TObject);
begin
if not banco.Est_Alter_Un then banco.NotPermissao;

try
  Application.CreateForm(TFMedida,FMedida);
  FMedida.ShowModal;
except
  FreeAndNil(FMedida);
end;

end;

procedure TFEstoque.Sobre1Click(Sender: TObject);
begin
FPrincipal.SobreClick(sender);
end;

procedure TFEstoque.ThemeDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_delete then
Img5Click(Img5);

end;

procedure TFEstoque.Funcionrios1Click(Sender: TObject);
begin

Editar2.Enabled := Banco.Est_Editar;
Novo1.Enabled := Banco.Est_Novo;
Deletar1.Enabled := Banco.Est_Excluir;
UNmedida.Enabled := Banco.Est_Alter_Un;


end;

function TFEstoque.VirgulaToPonto(value: Extended): Extended;
var
  Posi : Smallint;
begin

Result := value;
Posi := pos(',',FloatToStr(value));
if posi <> 0 then
Result := StrToFloat( copy(FloatToStr(value),1,Posi-1)+'.'+copy(FloatToStr(value),posi,length(FloatToStr(Result))) );

end;

procedure TFEstoque.ThemeDBGrid1TitleClick(Column: TColumn);
begin
Banco.OrdenaGrid(Column);
end;

end.
